From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Sat, 25 Mar 2000 23:41:06 +0000
Subject: sb_dsp_detect
Message-Id: <marc-linux-sound-95405563817088@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


 That's the prototype of the func in subj:

int sb_dsp_detect(struct address_info *hw_config, int pci, int pciio)

the two pci parameter, AFAIK, are not used
by anyone. Since i'm going to change that prototype
to fix a bug, i can get them off while i'm there.

The related pci code seems unused to me..
 should i leave it there?

Any comment?

-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/
