From: Paolo Rossi <lupo@aitek.it>
Date: Mon, 05 Jun 2000 07:36:28 +0000
Subject: C-Media 8x38 driver for kernel 2.4
Message-Id: <marc-linux-sound-96019100230870@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

During this weekend I've tested my patched driver on the following
kernel versions:
2.3.99pre6
2.4.0-test1
2.4.0-test1-ac7

It seems to work fine (module and resident). This driver is a patched
version of 3.21 released by C-Media on May 23, 2000. I've also included 
the experimental S/PDIF in/out support by Jan Niehusman.
Download the driver (+Config.in +patch-against-2.4.0-test1 +ver_linux)
at http://web.tiscalinet.it/luvassu/cmpci/cmpci-20000604.tar.gz.

Bye.

-lupo
