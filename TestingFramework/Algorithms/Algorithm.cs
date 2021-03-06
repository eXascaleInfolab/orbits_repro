using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using TestingFramework.Testing;

namespace TestingFramework.Algorithms
{
    public abstract class Algorithm
    {
        // constructor
        protected Algorithm(ref bool init)
        {
            if (init)
            {
                throw new Exception("Second instance per algorithm is not allowed");
            }
            init = true;
            
            CheckInitValues();
        }

        private void CheckInitValues()
        {
            if (SubFolderDataIn == "" || SubFolderDataIn == "." || SubFolderDataIn == "/" || SubFolderDataIn == "./"
                || SubFolderDataOut == "" || SubFolderDataOut == "." || SubFolderDataOut == "/" || SubFolderDataOut == "./"
                || SubFolderDataIn == SubFolderDataOut)
            {
                throw new ApplicationException($"Wrong hardcoded paths for {AlgCode}, DataIn/Out can't be the same folder as EnvPath or each other.");
            }

            if (!EnvPath.EndsWith("/") || !SubFolderDataIn.EndsWith("/") || !SubFolderDataOut.EndsWith("/"))
            {
                throw new ApplicationException("Violation of folder name convention. Folder names should have a trailing forward slash.");
            }
        }
        
        // Fields
        public abstract string AlgCode { get; }
        
        protected abstract string _EnvPath { get; }
        protected string EnvPath => _EnvPath.Replace("~", Environment.GetFolderPath(Environment.SpecialFolder.Personal));
        
        protected abstract string SubFolderDataIn { get; }
        protected abstract string SubFolderDataOut { get; }
        
        public virtual bool IsPlottable => true;
        public virtual bool IsMulticolumn => true;
        public virtual bool IsStreaming => false;
        public virtual bool IsBlackout => true;

        // virtual functions
        public virtual string[] EnumerateInputFiles(string dataCode, int tcase)
        {
            return new[] { $"{dataCode}_m{tcase}.txt" };
        }

        public virtual string[] EnumerateOutputFiles(int tcase)
        {
            return new[] { $"{AlgCode}{tcase}.txt" };
        }

        public abstract IEnumerable<SubAlgorithm> EnumerateSubAlgorithms();

        public abstract IEnumerable<SubAlgorithm> EnumerateSubAlgorithms(int tcase);
        
        // Abstract functions
        protected abstract void PrecisionExperiment(ExperimentType et, ExperimentScenario es, DataDescription data, int tcase);
        protected abstract void RuntimeExperiment(ExperimentType et, ExperimentScenario es, DataDescription data, int tcase);

        public abstract void GenerateData(string sourceFile, string code, int tcase, (int, int, int)[] missingBlocks,
            (int, int) rowRange, (int, int) columnRange);
        
        // Concrete functions, work regardless of algorithm
        public void WriteDataIn(string sourceFolder, params string[] files)
        {
            foreach (var file in files)
            {
                string src = sourceFolder + file;
                string dest = EnvPath + SubFolderDataIn + file;
                
                if (File.Exists(dest))
                {
                    File.Delete(dest);
                }
                
                File.Copy(src, dest);
            }
        }
        
        public void CollectResults(Experiment ex, string destFolder, ValueTuple<int, int> size, params string[] files)
        {
            switch (ex)
            {
                case Experiment.Precision:
                    foreach (var file in files)
                    {
                        string src = EnvPath + SubFolderDataOut + file;
                        string dest = destFolder + file;

                        if (File.Exists(dest))
                        {
                            File.Delete(dest);
                        }
                        
                        if (!File.Exists(src))
                        {
                            double bigval = 10000.0;
                            File.AppendAllLines(src,
                                Enumerable.Repeat(Enumerable.Repeat(bigval.ToString(), size.Item2).StringJoin(), size.Item1).ToArray()
                            );
                        }

                        File.Copy(src, dest);
                    }
                    break;
                
                case Experiment.Runtime:
                    foreach (var file in files)
                    {
                        string src = EnvPath + SubFolderDataOut + file;
                        string dest = destFolder + file;

                        if (File.Exists(dest))
                        {
                            File.Delete(dest);
                        }
                        
                        if (!File.Exists(src))
                        {
                            File.AppendAllText(src, "-1000000"); // -1 sec
                        }

                        File.Copy(src, dest);
                    }
                    break;
            }
        }
        
        public void DataCleanUp()
        {
            string[] filesIn = Directory.GetFiles(EnvPath + SubFolderDataIn);
            string[] filesOut = Directory.GetFiles(EnvPath + SubFolderDataOut);
            
            filesIn.Where(x => !x.EndsWith(".gitkeep")).ForEach(File.Delete);
            filesOut.Where(x => !x.EndsWith(".gitkeep")).ForEach(File.Delete);
        }
        
        public void RunExperiment(Experiment ex, ExperimentType et, ExperimentScenario es,
            DataDescription data, int tcase)
        {
            switch (ex)
            {
                case Experiment.Precision:
                    PrecisionExperiment(et, es, data, tcase);
                    break;

                case Experiment.Runtime:
                    RuntimeExperiment(et, es, data, tcase);
                    break;
                
                default:
                    throw new ArgumentException("Provided arguments don't make for a valid experiment");
            }
        }

        protected Process TemplateProcess()
        {
            return new Process
            {
                StartInfo =
                {
                    WorkingDirectory = EnvPath,
                    CreateNoWindow = true,
                    WindowStyle = ProcessWindowStyle.Hidden,
                    UseShellExecute = false
                }
            };
        }

        protected void Run(Process proc)
        {
            proc.Start();
            proc.WaitForExit();
            
            if (proc.ExitCode != 0)
            {
                string errText =
                    $"[WARNING] {AlgCode} returned code {proc.ExitCode} on exit.{Environment.NewLine}" +
                    $"CLI args: {proc.StartInfo.Arguments}";
                
                Console.WriteLine(errText);
                Utils.DelayedWarnings.Enqueue(errText);
            }
        }
    }

    [ImmutableObject(true)]
    public class SubAlgorithm
    {
        public readonly string Code;
        public readonly string CaseCode;
        public readonly string Style;

        public SubAlgorithm(string code, string caseCode, string style)
        {
            Code = code;
            CaseCode = caseCode;
            Style = style;
        }
    }
}