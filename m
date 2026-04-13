Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E7216F288;
	Mon, 13 Apr 2026 01:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776043155; cv=none; b=ffUEX7/TNfYD2pFPDc2t6pLyEKQQCDc1n/fgbJQZv1vZrCXOJXsAoCVD+l/yB/LLOSx4Cy+Go14zpqEXr4DxwgBVyZtopLRq2c6cFbvMOiCKj1CxDlrWBCj5kIdQtmtLVaQKI9XGU6olUGs2yv7GbG92AwTAnZbqai86z8OddUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776043155; c=relaxed/simple;
	bh=P8XAwHdPKyvF5/kJTfyXtgp5L/cVMJoWeQbTBk2icAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BEfi6BCpKxaFAi/9eso+tXyAueC9Z05tH/NAPrOci94MKRDlFgP0cCsls7/nzomJ2CJINkOIY8De4dBw2lpumpSIKA+s4rhhYJ+k3CDE/xBZcmWGHGw7H4FZ+NokqsQJGiFVx2fThIAUT6YlhwkSh9OdDHsRx0olfTVXtFBnRkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c01adb9e36d611f1aa26b74ffac11d73-20260413
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0e100685-d78b-4f41-b700-62c376f61ee9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:43706cff18176c97e144eea486b0b7f1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c01adb9e36d611f1aa26b74ffac11d73-20260413
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 389368009; Mon, 13 Apr 2026 09:18:59 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	dzidmail <dzidmail@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre x360 14-ea
Date: Mon, 13 Apr 2026 09:18:54 +0800
Message-Id: <20260413011854.96520-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Spectre x360 Convertible 14-ea0xxx (2021 model or so)
doesn't make produce sound,The Bang & Olufsen speaker amplifier
is not enabled.

Root causing:
The PCI subsystem ID is 103c:0000 (HP left it unset), while the codec
subsystem ID is 103c:885b. The vendor-wide catch-all
SND_PCI_QUIRK_VENDOR(0x103c, "HP", ALC269_FIXUP_HP_MUTE_LED) matches
103c:0000 before the codec SSID fallback is reached, so
ALC245_FIXUP_HP_X360_AMP never applies.

So add the quirk in alc269_fixup_tbl.

Reported-by: dzidmail <dzidmail@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221341
Signed-off-by: songxiebing <songxiebing@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6d6ad6e84dc4..37241a72b5af 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6938,6 +6938,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884c, "HP EliteBook 840 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
+	HDA_CODEC_QUIRK(0x103c, 0x885b, "HP Spectre x360 14-ea", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x103c, 0x8862, "HP ProBook 445 G8 Notebook PC", ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x8863, "HP ProBook 445 G8 Notebook PC", ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x886d, "HP ZBook Fury 17.3 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.25.1

