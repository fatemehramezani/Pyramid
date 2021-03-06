using System;

namespace Handler
{
    public class ExceptionHandler
    {
        private string parameterName;
        private string parameterTitle;
        private Exception exception;
        private ExceptionType exceptionType;
        private string pageUrl;

        public string PageUrl
        {
            get { return pageUrl; }
            set { pageUrl = value; }
        }

        public string ParameterName
        {
            get { return parameterName; }
            set { parameterName = value; }
        }

        public string ParameterTitle
        {
            get { return parameterTitle; }
            set { parameterTitle = value; }
        }

        public ExceptionType ExceptionType
        {
            get { return exceptionType; }
            set { exceptionType = value; }
        }

        public Exception Exception
        {
            get { return exception; }
            set { exception = value; }
        }

        public ExceptionHandler()
        {
        }

        public ExceptionHandler(Exception _Exception)
        {
            this.exception = _Exception;
            this.exceptionType = ExceptionType.UnHandeled;
        }

        public ExceptionHandler(string _ParameterName, string _ParameterTitle, ExceptionType _ExceptionType)
        {
            this.parameterName = _ParameterName;
            this.parameterTitle = _ParameterTitle;
            this.exceptionType = _ExceptionType;
        }

        public ExceptionHandler(Exception _Exception, string _PageUrl)
        {
            this.exception = _Exception;
            this.pageUrl = _PageUrl;
            this.exceptionType = ExceptionType.PageUrl;
        }
    }
}

public enum ExceptionType
    {
        NullArgumant,
        IntFormat,
        ShortFormat,
        LongFormat,
        StringFortmat,
        PageUrl,
        UnHandeled,
        DateFormat
    }
