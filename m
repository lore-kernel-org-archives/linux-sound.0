Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C7335F60D;
	Sun, 15 Mar 2026 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773591507; cv=none; b=MaqBdpvWpXVnYytmUnbB6dn7TS8D7+bSZpaEXQaKdu3NwRT8kSWczPCPrYGiw7FA78RurNXPAvgtH1gGahjXmHDBphCwoNtJWzghCUcAJ+DmsinF1zGXC0R+y6w6xufoGYijycUKzOZg326IDq7sbcZt4PKmNDe70VroWR0twDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773591507; c=relaxed/simple;
	bh=rVc/b2/or6BomeiZHrvKmhk3xNuspjgQamIULMbe2Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJh0zHPvga68mjc7Ip4c6GCuqucoJUQakg4zz+Htb1J0nBGAUTDAjZavh/AcecTLQ8jk3iRFkXq8t20X+QYbCEGtGwbXCcWGfU0cbQDo7UGLPzJCU5XTkwyoFJi/GTR6yUN+pwlix1KeXIKiuUZJQ4wm7F3s5niMztAL/GSJxGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=pF7pT1vp; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="pF7pT1vp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1DF2285EDB;
	Sun, 15 Mar 2026 17:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1773591030; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=HW+LQf5TCQIF0qpaJjKQngGcqiIqPr3V0PsX3Xg8mak=;
	b=pF7pT1vp9I3YlSHnfJQkMXozY+wrzoAIwwp6/xCIieCR2fK01IhyI+nSYfe6KACac+RjH1
	sLMRX2QOFNs7cWeaX6h2WZaekGZcXvGf0g8Ud8qnNiRhpu8MoEpEVP8XM6tSpykdE4Rv5j
	2IO0/ClOQMNoULfEDUBbOtbkRNtRN4ln3hmcS0souXG6hg1vxMXlFQiSa/peP2F86+n8hK
	MAS3D1wfZ5NRBfTcpQdPxF4EDCpNOFUpD/ZEr73PzYd1qkQyi7JjmudFL/2IoDigBaLXP4
	OWo+dKfQAOehVoFDYkguJI2uAKpQ6rT1pvdKfdwFFIlpEGLt8lExsHlVSmBXWg==
From: Eric Naim <dnaim@cachyos.org>
To: Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Use ALC287_FIXUP_TXNW2781_I2C for ASUS Strix Gxx5
Date: Mon, 16 Mar 2026 00:09:38 +0800
Message-ID: <20260315160939.191265-1-dnaim@cachyos.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These drivers were incorrectly using the ALC287_FIXUP_TAS2781_I2C quirk
leading to errors:

[ 18.765990] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
[ 18.768153] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
[ 18.768476] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
[ 18.768899] Serial bus multi instantiate pseudo device driver TXNW2781:00: Instantiated 3 I2C devices.

Use the correct ALC287_FIXUP_TXNW2781_I2C quirk to fix this and restore
speaker audio on affected devices.

Fixes: 1e9c708dc3ae ("ALSA: hda/tas2781: Add new quirk for Lenovo, ASUS, Dell projects")
Closes: https://lore.kernel.org/CACB9z7kjs8rhLstEc8fV29BCTb5dd881JwGozoKdO5cwCb=YwQ@mail.gmail.com
Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

Hi maintainers,

I'm changing the quirks for a lot of devices here, and the devices that I know are affected are only
PID 3f20 and 3ef0. I hope someone can confirm that all these devices are using the same amplifier,
and if not, I can send a v2 with only the confirmed affected devices.

Thanks.

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index c1791b136620..98d29f4cc81b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6999,12 +6999,12 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x3e00, "ASUS G814FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x3e20, "ASUS G814PH/PM/PP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x3e30, "ASUS TP3607SA", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3ee0, "ASUS Strix G815_JHR_JMR_JPR", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3ef0, "ASUS Strix G635LR_LW_LX", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3f00, "ASUS Strix G815LH_LM_LP", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3f10, "ASUS Strix G835LR_LW_LX", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3f20, "ASUS Strix G615LR_LW", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x3f30, "ASUS Strix G815LR_LW", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3ee0, "ASUS Strix G815_JHR_JMR_JPR", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3ef0, "ASUS Strix G635LR_LW_LX", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3f00, "ASUS Strix G815LH_LM_LP", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3f10, "ASUS Strix G835LR_LW_LX", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3f20, "ASUS Strix G615LR_LW", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x3f30, "ASUS Strix G815LR_LW", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x1043, 0x3fd0, "ASUS B3605CVA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x3ff0, "ASUS B5405CVA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
-- 
2.53.0

