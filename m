From: Britton <fsblk@aurora.alaska.edu>
Date: Wed, 10 Feb 1999 07:11:38 +0000
Subject: mpeg2 support in kernel?
Message-Id: <marc-linux-sound-91863075621412@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I see the following snipet of code in the O'Reilly Linux Multimedia Guide:

if (formats & AFMT_MPEG) {
  printf("  MPEG 2");
  (deffmt = AFMT_MPEG) ? printf(" (default)\n") : printf("\n");
}

Is there something you can compile into the kernel that will let the "dsp"
produce mpeg 2 encoded stuff?  If so I'd love to know about it.

__
GNU GPL: "The Source will be with you... always."

Britton Kerin
