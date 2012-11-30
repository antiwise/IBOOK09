import be.devine.cp3.extensions.TLFSprite;

import flashx.textLayout.formats.BlockProgression;

import starling.utils.Color;

// Flat list of sample calls to creating TLFSprite instances and adding to a parent DisplayObjectContainer

// default TextLayoutFormat settings using static factory creation
var tlfSprite:TLFSprite = TLFSprite.fromPlainText("Hello World");
tlfSprite.border = true;
tlfSprite.x = 10;
tlfSprite.y = 10;
addChild(tlfSprite);

tlfSprite = TLFSprite.fromPlainText("This is some larger\nline broken text");
tlfSprite.border = true;
// post specify individual TextLayoutFormat style properties individually
tlfSprite.setStyle("fontSize", 32);
tlfSprite.setStyle("color", Color.RED);
tlfSprite.x = 50;
tlfSprite.y = 25;
addChild(tlfSprite);

tlfSprite = TLFSprite.fromPlainText("This is some larger line flow text");
tlfSprite.border = true;
tlfSprite.setStyle("fontSize", 24);
tlfSprite.setStyle("color", Color.RED);
// forces truncation showing ellipses as default truncation indicator
tlfSprite.compositionWidth = 170;
tlfSprite.compositionHeight = 60;
tlfSprite.x = 350;
tlfSprite.y = 25;
addChild(tlfSprite);

// text layout framework supports some very simple HTML style markup
tlfSprite = TLFSprite.fromHTML("<p>Some <b>preformatted</b> <font size=28 color=0x00ff00>text with</font><br> some <i>simple</i> HTML markup.");
tlfSprite.border = true;
tlfSprite.x = 10;
tlfSprite.y = 110;
addChild(tlfSprite);

tlfSprite = TLFSprite.fromPlainText("Here we might want to limit the width this text should display, auto flowing");
tlfSprite.border = true;
// Force a limit on width to trigger line breaking
tlfSprite.compositionWidth = 150;
tlfSprite.x = 10;
tlfSprite.y = 180;
addChild(tlfSprite);

// You can also use an XML markup tagging system from the text layout framework itself
// that allows basic paragraph and span elements using named TextLayoutFormat properties as attributes
tlfSprite = TLFSprite.fromTextLayout("<TextFlow xmlns='http://ns.adobe.com/textLayout/2008'>" +
	"<p><span fontSize='16'>Hello, World.</span></p><p><span color='0x0000FF' fontSize='18'>Some simple TLF markup</span></p></TextFlow>");
tlfSprite.border = true;
tlfSprite.x = 300;
tlfSprite.y = 100;
addChild(tlfSprite);

// explicitly set multiple TextLayoutFormat properties at beginning and pass with creation
var textLayoutFormat:TextLayoutFormat = new TextLayoutFormat();
textLayoutFormat.paragraphStartIndent = 15;
textLayoutFormat.paragraphSpaceBefore = 15;
textLayoutFormat.paragraphEndIndent = 15;
textLayoutFormat.paragraphSpaceAfter = 15;
textLayoutFormat.textIndent = 20;
textLayoutFormat.color = 0x336633;
textLayoutFormat.fontFamily = "Arial, Helvetica, _sans";
textLayoutFormat.fontSize = 16;
textLayoutFormat.kerning = Kerning.ON;
textLayoutFormat.lineHeight = "100%";
tlfSprite = TLFSprite.fromPlainText("This example formats a paragraph with 15 pixel margins, a 20 pixel first " +
	"line indent. It uses the " +
	"Arial font (with alternate device fonts), sets the size to 16 pixels, the color to green, " +
	" turns on kerning, \n \t and sets leading (lineHeight) to 100%.", textLayoutFormat);
tlfSprite.border = true;
tlfSprite.compositionWidth = 450;
tlfSprite.x = 230;
tlfSprite.y = 150;
addChild(tlfSprite);

// Define east asian ideographic layout and formatting
// along with enforced composition height limit
textLayoutFormat = new TextLayoutFormat();
// define Japanese text in a string of Unicode characters
var jaText:String = String.fromCharCode(
	0x30AF, 0x30ED, 0x30B9, 0x30D7, 0x30E9, 0x30C3, 0x30C8, 0x30D5, 
	0x30A9, 0x30FC, 0x30E0, 0x4E0A, 0x3067, 0x518D, 0x751F, 0x53EF, 
	0x80FD, 0x306A) + 
	"Flash Video" +
	String.fromCharCode(
		0x3092, 0x914D, 0x4FE1, 0x3001, 0x653F, 0x5E9C, 0x6700, 0x65B0, 
		0x60C5, 0x5831, 0x3092, 0x3088, 0x308A, 0x591A, 0x304F, 0x306E, 
		0x56FD, 0x6C11, 0x306B, 0x9AD8, 0x54C1, 0x8CEA, 0x306A, 0x753B, 
		0x50CF, 0x3067, 0x7C21, 0x5358, 0x304B, 0x3064, 0x30EA, 0x30A2, 
		0x30EB, 0x30BF, 0x30A4, 0x30E0, 0x306B, 0x63D0, 0x4F9B, 0x3059, 
		0x308B, 0x3053, 0x3068, 0x304C, 0x53EF, 0x80FD, 0x306B, 0x306A, 
		0x308A, 0x307e, 0x3057, 0x305F, 0x3002);
textLayoutFormat.locale = "ja";
if (Capabilities.os.search("Mac OS") > -1) 
	textLayoutFormat.fontFamily = String.fromCharCode(0x5C0F, 0x585A, 0x660E, 0x671D) + " Pro R"; // "Kozuka Mincho Pro R"
else 
	textLayoutFormat.fontFamily = "Kozuka Mincho Pro R";
// specify right-to-left block progression, east Asian justification, and top vertical alignment
textLayoutFormat.blockProgression = BlockProgression.RL;
textLayoutFormat.justificationRule = JustificationRule.EAST_ASIAN;
textLayoutFormat.verticalAlign = VerticalAlign.TOP;
textLayoutFormat.fontSize = 18;	
tlfSprite = TLFSprite.fromPlainText(jaText, textLayoutFormat);
tlfSprite.border = true;
tlfSprite.compositionHeight = 250;
tlfSprite.x = 30;
tlfSprite.y = 250;
addChild(tlfSprite);

// Arabic right-to-left language support
textLayoutFormat = new TextLayoutFormat();
textLayoutFormat.fontFamily = "Arial";
textLayoutFormat.fontSize = 24;
textLayoutFormat.paragraphSpaceBefore = 2;
textLayoutFormat.paragraphSpaceAfter = 2;
textLayoutFormat.paddingBottom = textLayoutFormat.paddingTop = 
	textLayoutFormat.paddingLeft = textLayoutFormat.paddingRight = 5;
textLayoutFormat.direction = Direction.RTL;
textLayoutFormat.blockProgression = BlockProgression.TB;
tlfSprite = TLFSprite.fromPlainText("وثيقة إثبات صلة القرابة مصدقة من سفارة دولة الإمارات – إذا لم يكن اسم المكفول مدرجاً في جواز سفر", textLayoutFormat);
tlfSprite.border = true;
tlfSprite.compositionWidth = 350;
tlfSprite.x = 220;
tlfSprite.y = 250;
addChild(tlfSprite);


// If you feel like it, you can also just build up your text layout framework
// TextFlow elements by hand
// create TextFlow, ParagraphElement, and SpanElement objects
var textFlow:TextFlow = new TextFlow();
var p:ParagraphElement = new ParagraphElement();
var span1:SpanElement = new SpanElement();
var span2:SpanElement = new SpanElement();
textLayoutFormat = new TextLayoutFormat();
textLayoutFormat.color = 0x333333;
textLayoutFormat.textAlpha = 0.9;
textLayoutFormat.fontSize = 20;            
textLayoutFormat.fontFamily = "Times Roman";
// add text to the span, the span to the paragraph, and the paragraph to the text flow.
textFlow.format = textLayoutFormat; 
span1.text = "This content was built by combining raw text flow elements together."
p.addChild( span1);
span2.text = "This is a second span in the paragraph."
span2.backgroundColor = 0xFF0000;
span2.backgroundAlpha = 0.6;
p.addChild( span2);
textFlow.addChild(p);

tlfSprite = new TLFSprite(textFlow, textLayoutFormat);
tlfSprite.border = true;
tlfSprite.compositionWidth = 350;
tlfSprite.x = 220;
tlfSprite.y = 360;
addChild(tlfSprite);