From: "Nicholas Waltham" <nwaltham@email.com>
Date: Wed, 17 Mar 1999 21:33:53 +0000
Subject: Trouble with ESS 1888 on Compaq 3060 /Kernel 2.0.36 and 2.2.3
Message-Id: <marc-linux-sound-92172492401284@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Heres my experience with the ESS 1888. I have a Compaq Presario 3060. I can
set up the BIOS to use IRQ 7 for the printer and IRQ 5 for the ESS. If I boot
Windows 98, it runs just fine, and Windows 98 tells me thats where it is - on
IRQ 5.

Now if I try and configure ESS 1888 as a SB under Linux 2.0.36 or 2.2.3 if I
tell it to use IRQ 5, the driver gives an error immediately and says the IRQ
test failed. Now if I for example give IRQ 7, it loads fine, and works for a
while and then dies, with a DMA timout message. I have played with this for a
while - I have noticed that I can tell the sb driver to load using a number of
different interrupts and it works in the way you describe. But it never works
if I give it the interrupt it really is.

Best Regards,
Nick
