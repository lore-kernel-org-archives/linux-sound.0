From: Rolf Fokkens <FokkensR@vertis.nl>
Date: Fri, 19 Nov 1999 11:50:43 +0000
Subject: RE: ESS1938/ESS1941 etc
Message-Id: <marc-linux-sound-94301828331968@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi Dirk,

This is a PCI chip. The ess support in the Soundblaster driver only
focuses on ISA chips. There might be a driver now....

btw. I Cc'd this to the linux-sound mailing list.

Rolf

-----Original Message-----
From: Dirk Laurie [mailto:dirk@calvyn.puk.ac.za]
Sent: Friday, November 19, 1999 12:17 PM
To: fokkensr@vertis.nl
Subject: ESS1938/ESS1941 etc


Dag Rolf:

I recently acquired a notebook which has (aacording to the
documentation of its NT driver) an ESS 1938/1941/... AudioSound
card.  This is not recognized by ess_sb in the 2.2.5 kernel,
and if I manually choose ESS1868 from the sndconfig menu, the
sound daemon fails to start with "Device or resource busy".

Is there a more recent version of the driver that I might try?

Dirk Laurie
