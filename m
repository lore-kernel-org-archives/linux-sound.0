From: "Rus V. Brushkoff" <rus@Chernomor.Odessa.UA>
Date: Sat, 25 Aug 2001 15:05:46 +0000
Subject: Maybe a emu10k1 memory leak
Message-Id: <marc-linux-sound-99875245012588@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


	Hi.

 Try to insmod/rmmod emu10k1 (forever script for ex.) and whatch 'free'
report. After some time you may got '__alloc_pages: 1-order allocation
failed' kernel message.


		Rus

