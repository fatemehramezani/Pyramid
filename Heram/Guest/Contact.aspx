<%@ Page Title="تماس با ما" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Guest_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MetaTagContentPlaceHolder" runat="Server">
        <meta name="keywords" content="باربکیو،باربیکیو،باربیکیو برقی،باربیکیو گازی،باربیکیو ذغالی،باربکیو برقی،باربکیو گازی،باربکیو ذغالی،باربیکیو چیست،باربکیو چیست،منقل،منقل کبابی،قیمت باربیکیو گازی،قیمت باربیکیو ذغالی،قیمت باربیکیو برقی،انواع باربیکیو،گریل،کبابپز،کباب پز">
        <meta name="description" content="فروش و طراحی انواع باربکیو، باربیکیو، گریل، کباب پز، منقل گازی، ذغالی، برقی، مدرن و شیک به قیمت مناسب،فروش شومینه،سازه فلزی،هوشمندسازی منازل،خانه هوشمند">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    تماس با ما
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container clearfix">
        <div class="sixteen columns  m-bot-35">
            <div class="content-container-white">
                <!-- Google Maps -->
                <section class="google-map-container">

                    <div id="googlemaps" class="google-map"></div>

                    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
                    <script src="js/jquery.gmap.min.js"></script>

                    <script type="text/javascript">
                        jQuery('#googlemaps').gMap({
                            maptype: 'ROADMAP',
                            scrollwheel: false,
                            zoom: 16,
                            markers: [
                                {
                                    address: 'Level 13, 2 Elizabeth St, Melbourne Victoria 3000 Australia', // Your Adress Here
                                    html: '',
                                    popup: false,
                                }
                            ],
                        });
						</script>
                </section>
                <!-- Google Maps / End -->
                <div class="contant-container-caption">
                    شرکت <span class="bold">هرم سرخ خاورمیانه</span>
                </div>
            </div>
        </div>
    </div>

    <!-- CONTACT FORM-->
    <div class="container clearfix">
        <!-- SIDEBAR -->
        <div class="four columns  m-bot-25">
            <div class="caption-container m-bot-20">
                <div class="caption-text-container">اطلاعات تماس</div>
                <div class="content-container-white caption-bg clearfix"></div>
            </div>
            <div class="">
                <ul class="contact-list">
                    <li class="contact-loc content-container-white right-text">هرم سرخ خاورمیانه-تهران-اشرفی اصفهانی-مجمتع تجاری هامون بلوک سی واحد 102
						</li>
                    <li class="contact-phone content-container-white">(123) 456-7890<br>
                        (123) 987-6540
						</li>
                    <li class="contact-mail content-container-white">
                        <a href="#">email@fincom.com</a>
                    </li>
                </ul>
            </div>
        </div>
        <!--   CONTACT -->
        <div class="twelve columns  m-bot-35">
            <div class="caption-container m-bot-20">
                <div class="caption-text-container">ارسال پیام</div>
                <div class="content-container-white caption-bg clearfix"></div>
            </div>


            <div class="contact-form-container">
                <form action="send.html" id="contact-form" method="post" class="clearfix">
                    <fieldset class="field-1-3 left">
                        <label>Name</label>
                        <input type="text" name="name" id="Myname" onblur="if(this.value=='')this.value='Your name...';" onfocus="if(this.value=='Your name...')this.value='';" value="Your name..." class="text requiredField m-bot-20">
                    </fieldset>
                    <fieldset class="field-1-3 left">
                        <label>Email</label>
                        <input type="text" name="email" id="myemail" onblur="if(this.value=='')this.value='Your email...';" onfocus="if(this.value=='Your email...')this.value='';" value="Your email..." class="text requiredField email m-bot-20">
                    </fieldset>
                    <fieldset class="field-1-3 left">
                        <label>Subject</label>
                        <input type="text" name="subject" id="mySubject" onblur="if(this.value=='')this.value='Subject...';" onfocus="if(this.value=='Subject...')this.value='';" value="Subject..." class="text requiredField subject m-bot-20">
                    </fieldset>
                    <fieldset class="field-1-1 left">
                        <label>Message</label>
                        <textarea name="message" id="Mymessage" rows="5" cols="30" class="text requiredField" onblur="if(this.value=='')this.value='Your message...';" onfocus="if(this.value=='Your message...')this.value='';">Your message...</textarea>
                    </fieldset>
                    <fieldset class="right">
                        <input name="Mysubmitted" id="Mysubmitted" value="ارسال" class="button medium" type="submit">
                    </fieldset>
                </form>
            </div>
        </div>
    </div>


</asp:Content>

