From: Vincent Bruyninckx <Bruyninckx@fyma.ucl.ac.be>
Date: Thu, 10 Sep 1998 17:55:15 +0000
Subject: CS4237B configuration
Message-Id: <marc-linux-sound-90545155423230@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

(also posted on comp.os.linux.setup)

Hi ! I'm the proud owner of an IBM ThinkPad 380XD running Linux Red Hat
5.1, with a CS4237B sound chip. This distribution uses the module
versions of the OSS/Free sound drivers. Of these, cs4232.o should work,
but it doesn't really : mpg123, for instance, loops the beginning of a
file forever (I mean until Ctrl-C ;-) ). Sounds like an IRQ problem, hm
? The trouble is that onboard audio seems to be PnP in this machine; the

only parameter set (address, IRQ, DMA channels) I could find and put
into conf.modules was the one given by the Win95 device manager. Could
it be that the chip uses different IRQs for Win95 (PnP compliant) and
Linux (fortunately not -- except if you have PnP hardware !) ?
If so (or not, after all), can I do something else than try all possible

IRQ/DMA combinations ?

Thanks in advance,

Vince
