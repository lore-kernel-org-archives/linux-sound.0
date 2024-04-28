Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B654F8A
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297047; cv=none; b=qI4oRIRwyQbPFZo6f3qhew+IncZjJqC36iIrB6koifeiTLVz8pEZA0PUhlxTWrH5SPDdftZDXRIWP4F/8iwwaxuTVuhXT73l7T6K+Ug4GocHZ+GDcclH8BtlUX12eXlHHNba4BelXZJT1K0YH2wOp/8AJAMlU0YEQJQHqnbOZnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297047; c=relaxed/simple;
	bh=SE0SXUkxnDZd817aCrCKn0NTuKBcuIO2/NfZcCFhkzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bDeYF0rFsn06goAKR5XWWzRWdGY+GDn3IeWReByDSWE03U4dPO4/JxtsCePbAPtd52gaRRTSlmakXGKLNErElg/z6TuFMzRFTluIvJo/XWRZsvwiZuY/18uCg77XezeSmt1krMdxTU8K4BC4q5Wrcg46yf6lz9DciBTE/o9Ljkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=Um8lCkwP; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="Um8lCkwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297037; x=1714901837;
	i=oswald.buddenhagen@gmx.de;
	bh=BMzvz6wnwe8VER5NTkYyoyOodsE+w5l22zH97WlkjAM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Um8lCkwP73IxrW1pzRs4yCWxTRJVUpE+1jScYk7DEgdQsTxknoD3g0TtkODhhCEf
	 +yd+n/T05kxZyu33FAEKf71ruwZi4dsm0G1sxE2dnHGLkdZ8JSbvJHDxSU4l4uOYT
	 I+kFpjkxoJL3VUE5hOfWY0g1q0fAdKOLY1Hx11nXa+BJ/ItIBHoamJHCaar9dtUWg
	 isorfh2UaqxvSrGgIc/+A3W77Q81/v1SeUnbyQ7WmDuPws2J/sFEX+Cv58kYusPcR
	 qr4qGm+XJ3AMTLZInBbSZJS3O8SuCdQwqjVh0ep6+CmGhJbKb/JrdaDA8s3xqOBr8
	 ZnBTpte0uJcXuBicnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42jQ-1s10yD12CO-001miQ; Sun, 28
 Apr 2024 11:37:17 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yC-Q82-00; Sun, 28 Apr 2024 11:37:16 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 5/6] ALSA: emu10k1: fix E-MU dock initialization
Date: Sun, 28 Apr 2024 11:37:15 +0200
Message-ID: <20240428093716.3198666-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
References: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PyCsN2p4JowsAYCgZEAaV78xgeKUzBsTjtywsqyWJjxPgy6pL5I
 Rfw4Yue5BICFjbTDu9Uhh8nJyADZ7Hq0EHi46e3fsb9z1sXz1iLWwuOI8ZkdRIgpfYWIf/u
 ZPK4A6TOJPMHyabON7oOBUeStJYnRjHDw5aYLI+nWCo0zM79/Zw9a8VsrEykmIN+Oc+8W09
 /al4Pm+PXwBGH2nFUiMrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tutk/opZKLs=;PZfqIKePWNz/OXpPqIlRDRGSmzL
 P2tHriXBY9CSKcxFl3Gns+h2jrQRD/HyA8rqYhk4n8NS3pIQDDvc6vBFWjYkbApIuCivw7twI
 A/O91ZEBWSoM7hE+NjR6vgOsW5Yi0s3Z1QdeuEzRywf5BwWcb8QuEqtOzT7GkCaRAEAqhuthz
 csr9MI75r+ow3U76FmlKX2gKS3K59NN/mSSUtG4ue8mSC4ZoYb8rv5CvY7BGgxGUUqRqASqDT
 PwlZsGrw4wer6xJh9FOMLj7LZ6QyzIJQOzXtpLwaJzcCf2f33kYzcaoUol//N0NLJ70VdK3yb
 TST4iqpqJTv9B4zKkZVpVp7YgoPjfstSsQg6yKzQzj1OO3MoXbGRgGB3Fzc6M1BgjHDjjlq+q
 bSEasr1xOvyn7EUGiaFgA4JBbtW5EjwQ/PL6FsWphke0B4vOPD4kIDUlhlNu0gofVFZdEYP7j
 oz4Uo82Z7X0zigS8afRvqhmvn4llYqMCl2KYVJp4RLNAMKjaLETJbNS/L7OnkWMgY5WmmEXK/
 RYX6EcKuI6s3/dIvPNYljWOFmaZh4VZsgho8oRPEwk2W2MLSdAMDghsKLhSqZMMoB7FpEq5Od
 ST8RKRAXAeTPbrJyWEOjDORrN/JzpT/f+PhVxjlSffN1SaEndnGc3nPsG2CNg/myCpLc40Qg1
 AMLIM6T+4E9XYVAOwbq+qD/OQ78nvjL+G2iImHQsqv7KqgP3QYQ8lFHFErj/gahGTOuXn/JNt
 EpcZgF8lS6CLUROPPY0TdDxlkutvpLyccBZUlIqqfZNbHvhP4SrNpYSvGh5mK5mKIo/ermlXv
 41cp25+JoQGVR+M61ancpJMHku9V2CdKVjCjPjnTwaNU8=

A side effect of making the dock monitoring interrupt-driven was that
we'd be very quick to program a freshly connected dock. However, for
unclear reasons, the dock does not work when we do that - despite the
FPGA netlist upload going just fine. We work around this by adding a
delay before programming the dock; for safety, the value is several
times as much as was determined empirically.

Note that a badly timed dock hot-plug would have triggered the problem
even before the referenced commit - but now it would happen 100% instead
of about 3% of the time, thus making it impossible to work around by
re-plugging.

Fixes: fbb64eedf5a3 ("ALSA: emu10k1: make E-MU dock monitoring interrupt-dr=
iven")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218584
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index 1a2905e8672b..8ccc0178360c 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -737,6 +737,12 @@ static void snd_emu1010_load_dock_firmware(struct snd_=
emu10k1 *emu)
 	u32 tmp, tmp2;
 	int err;
=20
+	// The docking events clearly arrive prematurely - while the
+	// Dock's FPGA seems to be successfully programmed, the Dock
+	// fails to initialize subsequently if we don't give it some
+	// time to "warm up" here.
+	msleep(200);
+
 	dev_info(emu->card->dev, "emu1010: Loading Audio Dock Firmware\n");
 	/* Return to Audio Dock programming mode */
 	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
--=20
2.44.0.701.g2cf7baacf3.dirty

