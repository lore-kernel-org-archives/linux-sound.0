From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Sun, 06 Feb 2000 16:52:05 +0000
Subject: PnP support
Message-Id: <marc-linux-sound-94986272808065@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


 I started adding PnP support for Soundblaster compatible
 soundcards.. i.e. the cards that works with the sb driver.

 Latest additions include CMI8330 and SoundBlaster AWE64 PnP.

 If you have any sb PnP card which is still not supported, please
 mail me the output of the following command(s):

 isapnpdump
 cat /proc/isapnp




-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/
