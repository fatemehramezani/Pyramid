using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;

public class Email
{
    private string file;
    private string subject;
    private string toemail;
    private string body;

    public Email(string subject, string file, string email,string body)
    {
        this.subject = subject;
        this.toemail = email;
        this.file = file;
        this.body = body;
    }
    public bool Send(string fromEmail, string smtpServer, string userName, string password)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(new System.Net.Mail.MailAddress(toemail));
            mailMessage.From = new System.Net.Mail.MailAddress(fromEmail);
            if (!string.IsNullOrEmpty(file))
            {
                Attachment attachment = new Attachment(file);
                mailMessage.Attachments.Add(attachment);
            }
            mailMessage.Sender = new System.Net.Mail.MailAddress(fromEmail, "Concerteater.com");
            mailMessage.Subject = subject;
            mailMessage.Body = body;
            mailMessage.IsBodyHtml = true;
            mailMessage.Priority = System.Net.Mail.MailPriority.High; 
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = smtpServer;
            smtpClient.Port = 587;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.Credentials = new NetworkCredential(userName, password);
            smtpClient.Send(mailMessage);
            mailMessage.Dispose();
            return true;
        }
        catch
        {
            return false;
        }
        return false;
    }
}