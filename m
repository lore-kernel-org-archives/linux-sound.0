From: Richard Verwayen <richard_verwayen@web.de>
Date: Fri, 14 Sep 2001 06:25:17 +0000
Subject: Errors Compiling Kernel 2.4.9 with support for ESSSolo1
Message-Id: <marc-linux-sound-100044871328714@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I got errors when saying "make modules_install"!
I wanted to insert it as a module and also tried to build it into the 
kernel.
When I call modules_install, an error occured.

depmod : *** Unresolved symbols in 
/lib/modules/2.4.9/kernel/drivers/sound/esssolo1.o
depmod :        gameport_unregister_port_Rsmp_b8ce4307
depmod :        gameport_register_port_Rsmp_f891976c

I am using an ACER Travelmate, Celeron, Redhat 7.1.

If you need further information, please send an email to me

Thanks, Richard

