From: "Dmitriy Netchitailo" <dmitriyn@carrier.kiev.ua>
Date: Thu, 24 Feb 2000 17:21:26 +0000
Subject: HELP !!! - MF1000a sound card
Message-Id: <marc-linux-sound-95142791903595@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I use Open Linux 2.2.5 from Caldera.
I'm trying to setup my sound card (MF1000a Avance Logic) like this:
# insmod soundcore
# insmod soundlow
# insmod sound
# insmod uart401
# insmod sb io=0x220 irq=5 dma=1

...and see the message "Device or resource is busy"

What's wrong? Please help me.
Thanks.
Dmitriy Netchitailo.
dmitriyn@carrier.kiev.ua
