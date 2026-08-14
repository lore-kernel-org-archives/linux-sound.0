Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0EB45A28C;
	Fri, 14 Aug 2026 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786712395; cv=none; b=h77F6EJGhFjmGMFFjWluqyNarIFIu+DkiDRmVw3IiRTGIZOlrMAvfYO+N0pgnBBxpJt/dWpZYyR/Bedt07O+clTR/C34i4+Z5xlyLaqz7/Ta3xUyxqLDtEWQ9eGdOCS0hI/7+CADayHNWLSaSV5VBD5bLzmyBLvxJ2H+9AvnXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786712395; c=relaxed/simple;
	bh=sfAGHn/MFE6KTST+VnsKKaUjgA9SHLE0jGWPsMH9WB0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=buNDXDbpY7d3IRQsAY82/qEXU0C+pNQ9gWTlsgcFxa9uZTccF/izJR1OrQMEEX9OI0Ih8VHEGGK3ViTkvcc5fUO+k4KqVMaxC/WB66qUqUbJwxhL7UHFRS+vZp5m+jnCVEemE6NFhBxqiape61lFHNCFumI0bvAKp5EVpZG5bI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 03d4eb7697e011f1aa26b74ffac11d73-20260814
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:238e42eb-4db8-4ab3-a6fd-6de3427a6446,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:91bbeb8708c2443583687754ecaede23,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:5|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 03d4eb7697e011f1aa26b74ffac11d73-20260814
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1407745638; Fri, 14 Aug 2026 20:59:41 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Fix Lenovo Yoga Slim 7 14AKP10 quirk ordering
Date: Fri, 14 Aug 2026 20:59:37 +0800
Message-Id: <20260814125937.788663-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Slim 7 14AKP10 has a PCI SSID of 17aa:38b4 but a codec SSID of
17aa:391a. The current quirk table contains a PCI quirk for 17aa:38b4
(for the Legion Slim 7 16IRH8) which matches first, so the codec-specific
quirk for 17aa:391a is never applied.

This results in the wrong fixup being used (CS35L41_I2C_2 instead of the
correct bass speaker fixup), leaving the internal speakers misconfigured
or silent.

Move the 17aa:391a entry to a position before the 17aa:38b4 entry and
change it from SND_PCI_QUIRK to HDA_CODEC_QUIRK, because it should match
on the codec subsystem ID rather than the PCI SSID.

With this change, the correct ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN is
applied, restoring speaker output and auto-mute functionality.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221298
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3f0e276fc606..6e14fccbf585 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8094,6 +8094,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38d2, "Lenovo Yoga 9 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38d3, "Yoga S990-16 Pro IMH YC Dual", ALC287_FIXUP_TAS2781_I2C),
+	HDA_CODEC_QUIRK(0x17aa, 0x391a, "Lenovo Yoga Slim 7 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38d4, "Yoga S990-16 Pro IMH VECO Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38d5, "Yoga S990-16 Pro IMH YC Quad", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38d6, "Yoga S990-16 Pro IMH VECO Quad", ALC287_FIXUP_TAS2781_I2C),
@@ -8116,7 +8117,6 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3911, "Lenovo Yoga Pro 7 14IAH10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
-	SND_PCI_QUIRK(0x17aa, 0x391a, "Lenovo Yoga Slim 7 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3929, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
-- 
2.25.1

