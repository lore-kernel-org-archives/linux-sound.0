Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF71A680F;
	Tue, 31 Mar 2026 01:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920956; cv=none; b=Ke4nEbi18x19oH3BUA+C1m76Mbr2AG0+Z+2rW0omAcBxJbJDBOxGeBiEqoSUU1xztZs9/8w/SpFdu/8clSQegI8sxLuSzWDukyR8fQduUWsZXRpvQc27vVHDLr4cSN+O8a9zUA+4pkngxBCtxpp+MHLIlSLIf32Tl2jpP5aPlCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920956; c=relaxed/simple;
	bh=UijrwaUBEWe51KIGlTs1FFXQUA0ke3l7QrLj2tToCts=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BlEKaeVmwq7l4NZmjwqILxuR93As98eLha1dTASUptu5jBwv/CtBuy7yZub3x58bHH4o74md/nEaJT7mC7EJWfYGp01IYiPeAuVFvv+p7XK2FdOAyhorZvuG+RctSLbJelTWV5cWoUObog0OCXAs6bzouHizKtXVY2idBsb2nnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ed5e40e42ca111f1aa26b74ffac11d73-20260331
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, UD_TRUSTED, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_C_CI, GTI_FG_IT, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:39a13cbb-9b73-41ed-93f9-57bce8efbcc8,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:39a13cbb-9b73-41ed-93f9-57bce8efbcc8,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:e6608f66c834537bc0f8471fa081b13c,BulkI
	D:260331093542FJLY6U9A,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,
	QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
	,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed5e40e42ca111f1aa26b74ffac11d73-20260331
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1094710344; Tue, 31 Mar 2026 09:35:40 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/realtek: add quirk for HP Laptop 15-fc0xxx
Date: Tue, 31 Mar 2026 09:35:36 +0800
Message-Id: <20260331013536.13778-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the HP Laptop 15-fc0xxx with ALC236, the built-in mic 0x12 was
not set up, making it unusable; after adding it, it now works properly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221233
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6787e54fcfe6..8ebc765e4934 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4123,6 +4123,7 @@ enum {
 	ALC245_FIXUP_BASS_HP_DAC,
 	ALC245_FIXUP_ACER_MICMUTE_LED,
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
+	ALC236_FIXUP_HP_DMIC,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6658,6 +6659,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.v.func = alc245_fixup_hp_mute_led_coefbit,
 		.chained = true,
 		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
+	},
+	[ALC236_FIXUP_HP_DMIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x12, 0x90a60160 }, /* use as internal mic */
+			{ }
+		},
 	}
 };
 
@@ -7152,6 +7160,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8da1, "HP 16 Clipper OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8da7, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8da8, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8dc9, "HP Laptop 15-fc0xxx", ALC236_FIXUP_HP_DMIC),
 	SND_PCI_QUIRK(0x103c, 0x8dd4, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO_BIND_DACS),
 	SND_PCI_QUIRK(0x103c, 0x8dd7, "HP Laptop 15-fd0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
-- 
2.25.1

