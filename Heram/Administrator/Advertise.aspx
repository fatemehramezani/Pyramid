<%@ Page Title="تبلیغات" Language="C#" MasterPageFile="~/App_MasterPage/PanelMasterPage.master" AutoEventWireup="true" CodeFile="Advertise.aspx.cs" Inherits="Admin_Advertise" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../App_Themes/Default/css/Site.css" rel="stylesheet" />
    <script src="../App_Themes/Default/js/jelly/min.js"></script>
    <script src="../App_Themes/Default/js/file-upload.js"></script>
    <link href="../App_Themes/Default/css/blue.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" runat="Server">
    از طریق این صفحه می توانید اطلاعات تبلیغات ثبت شده را مدیریت نمایید.
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    تبلیغ 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script lang="jv" type="text/javascript">
        function SelectItem(sender, e) {
            e.IsValid = (e.Value != '0');
        }
    </script>
    <asp:MultiView runat="server" ID="AdvertiseMultiView" ActiveViewIndex="0">

        <asp:View runat="server" ID="ShowView">
            <asp:ImageButton ID="NewImageButton" runat="server" OnClick="NewImageButton_Click" SkinID="PanelAddImageButton" />
            <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                SkinID="PanelSearchImageButton" />
            <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click"
                OnClientClick="return false;" SkinID="PanelClearImageButton" />
            <br />

            <asp:Label ID="TitleLabel" runat="server" Text="عنوان:" SkinID="Caption"></asp:Label>
            <asp:TextBox ID="TitleTextBox" runat="server" SkinID="TextBox"></asp:TextBox>
            <br />
            <asp:Label ID="SizePageLabel" runat="server" Text="سايز صفحه:" SkinID="Caption"></asp:Label>
            <asp:DropDownList ID="PageSizeDropDownList" runat="server" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                <Items>
                    <asp:ListItem Selected="true" Value="5" Text="[پیش فرض]" />
                    <asp:ListItem Value="5" Text="5 رکورد" />
                    <asp:ListItem Value="10" Text="10 رکورد" />
                    <asp:ListItem Value="15" Text="15 رکورد" />
                    <asp:ListItem Value="20" Text="20 رکورد" />
                </Items>
            </asp:DropDownList>
            <br />
            <asp:GridView ID="AdvertiseGridView" runat="server" AutoGenerateColumns="False"
                DataKeyNames="Id" DataSourceID="AdvertiseEntityDataSource" HorizontalAlign="Right"
                OnSelectedIndexChanged="AdvertiseGridView_SelectedIndexChanged" PageSize="20" Width="90%" AllowSorting="True" AllowPaging="True">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="PanelSelectImageButton" /></ItemTemplate>
                        <ItemStyle Width="25px" />
                    </asp:TemplateField>

                    <asp:BoundField DataField="Id" Visible="False" />
                    <asp:TemplateField HeaderText="تصویر">
                        <ItemTemplate>
                            <div class="jadval_pezeshkan_container_photos">
                                <%--<asp:Image ID="Picture" runat="server" Width="81px" Height="81px" ImageUrl='<%# "Handler.ashx?DoctorId=" + Eval("Id")  %>' />--%>
                                <img src='<%# "../Files/Advertise/" + Eval("ImageUrl")  %>' onerror="this.onerror=null; this.src='../App_Themes/Default/images/noImage.gif';" alt="AdvertiseImage" width="81" height="81">
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title">
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="EditView" runat="server">
            <asp:FormView ID="AdvertiseFormView" runat="server" Width="90%" DataSourceID="AdvertiseEntityDataSource"
                DataKeyNames="Id" DefaultMode="Insert" OnItemDeleted="AdvertiseFormView_ItemDeleted"
                OnItemCommand="AdvertiseFormView_ItemCommand">
                <EditItemTemplate>
                    <asp:Label ID="TitleLabel" runat="server" Text="نام:" SkinID="Caption"></asp:Label>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' MaxLength="500" />
                    <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <br />
                    <div class="field">
                        <label class="file-upload">
                            <span>
                                <strong>انتخاب تصویر</strong>
                            </span>
                            <asp:FileUpload ID="ImageFileUpload" runat="server" />
                        </label>
                    </div>
                    <div class="form_input_section" style="height: 20px">
                        <asp:CheckBox ID="ImageCheckBox" runat="server" Text="تغییر تصویر" TextAlign="Left" />
                    </div>

                    <br></br>
                    <asp:Label ID="LinkLabel" runat="server" Text="وب سایت:" SkinID="Caption"></asp:Label>
                    <asp:TextBox ID="LinkTextBox" runat="server" Text='<%# Bind("Link") %>' MaxLength="500" />
                    <br />

                    <div style="float: left; padding: 10px;">
                        <asp:Button ID="DeleteImageButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="حذف" OnClientClick="if (!confirm('آيا از حذف مطمئن هستيد؟')) return false;" />
                        <asp:Button ID="UpdateImageButton" runat="server" CommandName="Update" Text="ويرايش"
                            ValidationGroup="Update" OnClientClick="if (!confirm('آيا از اعمال تغييرات مطمئن هستيد؟')) return false;" />
                        <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel" Text="انصراف" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="TitleLabel" runat="server" Text="نام:" SkinID="Caption"></asp:Label>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' MaxLength="500" />
                    <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    <br />
                    <div class="field">
                        <label class="file-upload">
                            <span>
                                <strong>انتخاب تصویر</strong>
                            </span>
                            <asp:FileUpload ID="ImageFileUpload" runat="server" />
                        </label>
                    </div>
                    <div class="form_input_section" style="height: 20px">
                        <asp:CheckBox ID="ImageCheckBox" runat="server" Text="تغییر تصویر" TextAlign="Left" />
                    </div>

                    <br></br>
                    <asp:Label ID="LinkLabel" runat="server" Text="وب سایت:" SkinID="Caption"></asp:Label>
                    <asp:TextBox ID="LinkTextBox" runat="server" Text='<%# Bind("Link") %>' MaxLength="500" />
                    <br />
                    <div style="float: left; padding: 10px;">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ايجاد"
                            ValidationGroup="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="انصراف" />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:EntityDataSource ID="AdvertiseEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities" EntitySetName="Advertises"
        EnableUpdate="True"
        EnableDelete="True"
        EnableInsert="True"
        OnDeleted="AdvertiseEntityDataSource_Command"
        OnInserted="AdvertiseEntityDataSource_Command"
        OnUpdated="AdvertiseEntityDataSource_Command"
        AutoGenerateOrderByClause="True"
        Where="(@Title is null || it.Title LIKE '%' + @Title + '%')"
        OnInserting="AdvertiseEntityDataSource_InsertingPicture" OnUpdating="AdvertiseEntityDataSource_InsertingPicture" EnableFlattening="False">
        <WhereParameters>
            <asp:ControlParameter ControlID="TitleTextBox" Name="Title" Type="String" />
        </WhereParameters>
        <OrderByParameters>
            <asp:ControlParameter ControlID="AdvertiseGridView" Name="OrderBy" PropertyName="SortExpression"
                Type="String" />
        </OrderByParameters>
    </asp:EntityDataSource>
</asp:Content>


