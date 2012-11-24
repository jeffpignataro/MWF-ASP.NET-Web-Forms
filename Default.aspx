<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MWF_ASP.NET_Web_Forms.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">

	<div class="menu-full menu-detailed menu-padded">
		<h1 class="light menu-first">Sample Menu</h1>
		<ol>
			<li><a href="#">Menu Item 1</a></li>
			<li><a href="#">Menu Item 2</a></li>
			<li><a href="#">Menu Item 3</a></li>
		</ol>
	</div>
	
	<div class="content-full content-padded">
		<h1 class="content-first light">Content Block Example</h1>
		<div>
			<p>Sample Content Block Paragraph</p>
			<p>Sample Content Block Paragraph</p>
		</div>
		<p class="content-last">Sample Content Block Paragraph</p>
	</div>
	
	<a href="#" class="button">Sample Button</a>
	
	<div class="button">
		<a href="#">Left Sample Button</a>
		<a href="#">Right Sample Button</a>
	</div>
	
	<a href="#" id="button-top">Sample Top Button</a>
	
    <div class="inner-form">
		<h1>Form Title</h1>
		
		<label>
			<span>Sample Text Input Label</span>
			<input type="text" name="text-input" required="required" placeholder="Sample Placeholder Text" />
			<span class="invalid">Input error message</span>
		</label>
		
		<label>
			<span>Sample Textarea Label</span>
			<textarea name="textarea-input"></textarea>
		</label>
		
		<label>
			<span>Sample Checkbox Label</span>
			<div class="option">
				<label>
					<input type="checkbox" value="1" name="checkbox-input" />
					One
				</label>
				<label>
					<input type="checkbox" value="2" name="checkbox-input" />
					Two
				</label>
				<label>
					<input type="checkbox" value="3" name="checkbox-input" />
					Three
				</label>
			</div>
		</label>
		
		<label>
			<span>Sample Radio Label</span>
			<div class="option">
				<label>
					<input type="radio" value="1" name="radio-input" />
					One
				</label>
				<label>
					<input type="radio" value="2" name="radio-input" />
					Two
				</label>
				<label>
					<input type="radio" value="3" name="radio-input" />
					Three
				</label>
			</div>
		</label>
		
		<label>
			<span>Sample Select Label</span>
			<select name="select-input">
				<option value="1">One</option>
				<option value="2">Two</option>
				<option value="3">Three</option>
			</select>
		</label>
		
		<label>
			<span>Sample Label</span>
			<input type="text" name="text-input" placeholder="Sample Placeholder Text" />
		</label>
		
		<input class="primary" type="submit" value="Button Text" />
    </div>
	
	<div class="message alert">Alert Message</div>
	<div class="message confirm">Confirm Message</div>
	<div class="message error">Error Message</div>
	<div class="message info">Info Message</div>

</asp:Content>