<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="Administrator_Content" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="padding: 20px;">
        <h3>ایجاد تصویر جدید</h3>
        <asp:FileUpload ID="MaxPicFileUpload" runat="server" Width="95%" />
        <asp:RequiredFieldValidator ID="MaxRequiredFieldValidator" runat="server" ErrorMessage="*"
            ControlToValidate="MaxPicFileUpload"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="MaxFileCustomValidator" runat="server" ControlToValidate="MaxPicFileUpload"
            ErrorMessage="اندازه تصویر باید کوچکتر از 400 کیلو بایت باشد" OnServerValidate="MaxFileCustomValidator_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
        <asp:CustomValidator ID="TypeCustomValidator" runat="server" ControlToValidate="MaxPicFileUpload"
            ErrorMessage="باید تصویر انتخاب شود" ClientValidationFunction="ValidateFileUpload"></asp:CustomValidator>
        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد" OnClick="InsertButton_Click" />
    </div>
    <div>
        <h3>مدیریت تصاویر شومینه</h3>
        <asp:MultiView ID="ImageMultiView" runat="server">
            <asp:View ID="NoFileView" runat="server">
                <p>
                    تصویری در مسیر فایل های شومینه وجود ندارد
                </p>
            </asp:View>
            <asp:View ID="FileView" runat="server">
                <div style="overflow: auto; width: 600px; border: 1px gray solid; padding: 10px; margin: 0px auto;">
                    <asp:Table ID="ImageTable" runat="server">
                    </asp:Table>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
    </asp:Content>
