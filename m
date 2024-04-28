Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72E55E49
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297051; cv=none; b=dEIXbpgdMoWR/eXt0dCUetKZs7vJVm8K+NfOPdnT90dUTQdCG/pYlwM9utwnnqBvAlkEjaG+GComOKaCHOC6JPwAmCxK87rPaSLT7deA3wTCRnuun94rBNVIPoxNZlfoZ5fL1l5Nz0P6ohMCgEUeunc1RhXhiGnrmm6puUw2d1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297051; c=relaxed/simple;
	bh=nColKKzV0soArb61v4X9w8QJe/4erO6BS6uJMMwIgVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2E/EvY79naCuyADq1fxBl/hsh8akdOtRMFtNiX5zQFlR/iN/P9Kvkl0V9LChvIvsDX2YC5jBTVQAq4LOmKHfmZbUfXcH1NyWYlxfhcka4Df39w8qerrtZq4EeQTi3JRrXCjqNE6z8GPGwckplemcswxLGbs/Sbg7qZtNA9co6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=heL7XUy1; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="heL7XUy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297038; x=1714901838;
	i=oswald.buddenhagen@gmx.de;
	bh=1ZmXywRbewDSRLH05bIq+ZhQEmKuuatpJW1xITotxsU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=heL7XUy18u2vxlALHoNeHuwm3Wv8TzSJgx03BZgiiHa0itdpbFN8FoGbqeQBoWIq
	 DA+lAGvv9HArQCuelVSUfcjOeqhbDCS3wUUzg+IY6IeKDzxpUo/cz2icv91GbJM04
	 O2Qr4TCFQ5n2Dtn8hL+nAT6yG3NuKyD8OXWYVXXYKEJayuoRu566MnbW8ORbW/Ed7
	 Y43GDsfsZpKIxTi1h2qhiY7ZUxIjwnWj2T3+UpSvGc7wDwJVQiPCOnuCSmZIPNGNl
	 Hir4HrZjXG9d5t6SvosmaCR0u92nXV+qDzUcmE0ee+eOX2x8eWouJ3aDQqk7IErxa
	 99pcEIKRoZtDlzrQ2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UV8-1s0T0O1k5S-001EiD; Sun, 28
 Apr 2024 11:37:18 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yD-Q8q-00; Sun, 28 Apr 2024 11:37:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 1/4] ALSA: emu10k1: simplify E-MU card FPGA reset sequence
Date: Sun, 28 Apr 2024 11:37:14 +0200
Message-ID: <20240428093717.3198716-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
References: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OuQjrX5K2N8DLhb8mOnm6Iqb8oP3FcAHLr/wFIhznIbkTA4OOGF
 gUouPeTJzzNeG6CqoiK31oDe6QezT8MRgCdDVDSDek4vQd0jZ1oHhio3CQ5g+WTrcX6QS6p
 Rdz1BMvCB5SbatSnh95eIV5dk9LSyxo0+AwPYZXM3Rsgc18kDEiSDb4j67L/6QG7tLBTR24
 9LpFt3aEkfflHBey82S6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BRFh0FJCGo4=;GF2rffgEF6i0eLqHxWeRZsEcpw2
 EW/SUGb0dlF0Tii9CC8f8N4U6V/ZCaM47iIHyUXDV/oU6nd9P1T/qgBKZrgDssp4uBhR4kTuP
 W07YnuWEtfAAWJvac7o2ZAsj5u7ueNjBP9fRx6f3OHQwG42hw4aR0mdQzT/NBdat1j/YPDTG/
 bSeNvHaqxhTk0NLjVq1/HD5NzORH3UstqYPTdGa03tftsEihv2uqUoqESKQxJreJ4/egSg85f
 tSrtXwq03WMbicFg9PsR+5taUePs7Ki3EgiuwycdTOt65gbJrgwzltSww0bxFKR67PPFhKteR
 /d2ba/sF+/6K5ia6rQV0UYUbl947w5Q4xe+0C5y8QPqshHRViIiUlX3gcKus8XZrDaSmZ5bqO
 OmCSSwcXehaqL67PWKE4nGMoQESQy8+hcDme0aYiKeEy9AnQYdyzeiRUEbssyoU3nHgPyVJej
 f6FjU3pDOoODKeoxELPCf6tji2R2HaAKY8BWCZNPj5UQ+bAShJdAWgGoM+RhD3LL/If9JiPZT
 /nHIYrwr2OGkuXPQ4F/MH64O3BJB6xibrVAxJH6FC3mnI8bUeSuhyEwTWpok0GN19R8AR8e5X
 hiPb12cLY1nEEpFUGyHShES77N+Vypu25NrkkNGfLPmcogtLKuLo9UX+i4qMBCWg6A2Aq9d/p
 0iiEz2a1gl7U4CJSf98e3gV2eaWWGhqljZSSnPOfc1qAwDez1CCFVQuXeKi5Wu5NTfbizmkws
 xPItnU85lnTC4aAjkJHNbFTjWQbf/CvBWbeasUVL7zHQ299fyZYxjCOje/lWx4Dcn/LSYBoAW
 4wcJD0fGWq2dlQpplRnKzm/RKSHkC/gx65EYuBYZQcjmg=

Firstly, it is pointless to explicitly disable the power to the dock
prior to resetting the FPGA, as the latter will do the former anyway.

Secondly, it doesn't make much sense to check whether the FPGA is
already programmed. It's much simpler to just presume it is, and issue
the self-reset command. If it isn't, the effect isn't worse than the
checks themselves. As a side effect, we lose the info if the reset
fails, but there is no plausible way how that could happen unless the
card burns out while operating, and in that case we'll detect a firmware
upload failure a bit later anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index 8ccc0178360c..353dd3b61c61 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -864,28 +864,9 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1=
 *emu)
=20
 	snd_emu1010_fpga_lock(emu);
=20
-	/* Disable 48Volt power to Audio Dock */
-	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
-
-	/* ID, should read & 0x7f =3D 0x55. (Bit 7 is the IRQ bit) */
-	snd_emu1010_fpga_read(emu, EMU_HANA_ID, &reg);
-	dev_dbg(emu->card->dev, "reg1 =3D 0x%x\n", reg);
-	if ((reg & 0x3f) =3D=3D 0x15) {
-		/* FPGA netlist already present so clear it */
-		/* Return to programming mode */
-
-		snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG, EMU_HANA_FPGA_CONFIG_H=
ANA);
-	}
-	snd_emu1010_fpga_read(emu, EMU_HANA_ID, &reg);
-	dev_dbg(emu->card->dev, "reg2 =3D 0x%x\n", reg);
-	if ((reg & 0x3f) =3D=3D 0x15) {
-		/* FPGA failed to return to programming mode */
-		dev_info(emu->card->dev,
-			 "emu1010: FPGA failed to return to programming mode\n");
-		return -ENODEV;
-	}
-	dev_info(emu->card->dev, "emu1010: EMU_HANA_ID =3D 0x%x\n", reg);
-
+	dev_info(emu->card->dev, "emu1010: Loading Hana Firmware\n");
+	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
+			       EMU_HANA_FPGA_CONFIG_HANA);
 	err =3D snd_emu1010_load_firmware(emu, 0, &emu->firmware);
 	if (err < 0) {
 		dev_info(emu->card->dev, "emu1010: Loading Firmware failed\n");
--=20
2.44.0.701.g2cf7baacf3.dirty

