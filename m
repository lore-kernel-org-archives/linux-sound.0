From: Balaguru Nallathambi <bala@ats.com>
Date: Thu, 21 Jan 1999 19:24:23 +0000
Subject: kernel 2.1.132, ppp 2.3.* and soundBlaster PCI128
Message-Id: <marc-linux-sound-91696329906841@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I downloaded kernel 2.1.132 to have support for the SoundBlaster PCI128.
I got the soundcard working, but the PPP does not work.

The only difference I notice with the previous kernel I had (2.0.34) is that
the ppp version has changed ( 2.0.34 came with ppp2.2.0 and 2.1.132 with 
ppp2.3.? ).

THe pppd sends confReq packet and the ISP sends back a confRej. This happens
for some time and pppd gives up atlast.

Have anyone else noticed the same problem. Is there a patch for this.
Or is it a version mismatch between the ISP and my machine at home.
If so, is it possible to have the new kernel with the old version of PPP
and how. 


Thanks,
-)Bala.
