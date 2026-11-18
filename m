Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973165;
	b=5Ai/DzPv9gHHB9mAEAQAHMeci8UDqRQNZtLcLha5MH2TsjlaoBC0PillA7mYUvFotY4C
	 Y+dea8JEk0RMUiZDI6Imc/rYBoEqOHavfiGyPM4A0+fRhiFueU8jVyz7lEd6qfeIXtKz0
	 77l5pC3kHinYmDgR9fdvshx4NSzkZoNOMc8uc92GtT1Rhq9foEVaVj2HrnybqjHePjAP0
	 O/jqyCDrGFDGWjfSYGJ+LvPqnD5o1vcZNE9sAkZCDhhruRYcfVBukW9J+Rgle2feMCntj
	 vaSl6qZJBo8xNK4MPNQaMm+2jTfcViWjIaTDUGKIu//lm4MqFBcRp5kM8NDESd5dkTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973165;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G+Q0oexvA4OtmTgbI2JLfoeKpQiUk1oidhqVEvS6n+w=;
	b=uFtrptAXSQObm4rUfI+9ImItFOABzf0AMWYxPoaJ22JI37Hjd4Sc8m85kEfAymcPFG0P
	 etg6HxSxCeKUDFcP5rZSufMDu1f41ydI1AaJDo6ki/yBFFg7Jy2KYPDT4RQOlt5bhYbSW
	 UPXm3FwjdKbeR1RICHN8CN5gLHLioVCT4CBZ2QE3Sr1ABn/aDeJtrEOcB/DUZhSctulH9
	 Vabk6H+uWJSwk2cU3kcFKpgrb3QzqVDFOzA+IlH8WghBiGuEzbDhy79wreLaVyiPCdN+6
	 bCNmnv0T6kJxdAaPzr/Ti55RvApJaCEs57yIAxPw5gFPaX5E4deSxSWOypfu4mOtMow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918B606A31C;
	Wed, 18 Nov 2026 03:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6918B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a15b470ce30111f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:50100b26-705a-485a-b7e3-b5f93d340fa6,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:01b83a0e41673e744f41f965bb8f36c1,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a15b470ce30111f19a56ed5b684f684d-20261118
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 539928937; Wed, 18 Nov 2026 11:39:16 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Shredrum <alex0plays007@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix quiet speakers on HP 250 G6
Date: Wed, 18 Nov 2026 11:39:01 +0800
Message-Id: <20261118033901.322505-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP 250 G6 (ALC3227, subsystem 103c:832e) has much quieter internal
speakers than on Windows. The Windows driver writes coef 0x6d = 0x0900
and four EQ coefficients framed by 0x22 writes, while Linux leaves the
high nibble of 0x6d at its hardware default (0xe900) and never writes
the EQ coefficients. Add a fixup to apply the same coefficients on init.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222283
Tested-by: Shredrum <alex0plays007@gmail.com>
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2c541c6..35090f6 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2688,6 +2688,23 @@ static void asus_tx300_automute(struct hda_codec *codec)
 		spec->gen.mute_bits |= (1ULL << 0x14);
 }
 
+static void alc282_fixup_hp_250g6(struct hda_codec *codec,
+				  const struct hda_fixup *fix, int action)
+{
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	alc_write_coef_idx(codec, 0x6d, 0x0900);
+
+	/* filter block: disable, load coefficients, re-enable */
+	alc_write_coef_idx(codec, 0x22, 0x400a);
+	alc_write_coef_idx(codec, 0x24, 0x1ec4);
+	alc_write_coef_idx(codec, 0x39, 0x1ea9);
+	alc_write_coef_idx(codec, 0x44, 0x1f61);
+	alc_write_coef_idx(codec, 0x4f, 0x1fb0);
+	alc_write_coef_idx(codec, 0x22, 0xe04a);
+}
+
 static void alc282_fixup_asus_tx300(struct hda_codec *codec,
 				    const struct hda_fixup *fix, int action)
 {
@@ -4232,6 +4249,7 @@ enum {
 	ALC269VB_FIXUP_ORDISSIMO_EVE2,
 	ALC283_FIXUP_CHROME_BOOK,
 	ALC283_FIXUP_SENSE_COMBO_JACK,
+	ALC282_FIXUP_HP_250G6_EQ,
 	ALC282_FIXUP_ASUS_TX300,
 	ALC283_FIXUP_INT_MIC,
 	ALC290_FIXUP_MONO_SPEAKERS,
@@ -5199,6 +5217,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC283_FIXUP_CHROME_BOOK,
 	},
+	[ALC282_FIXUP_HP_250G6_EQ] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc282_fixup_hp_250g6,
+	},
 	[ALC282_FIXUP_ASUS_TX300] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc282_fixup_asus_tx300,
@@ -7723,6 +7745,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x827f, "HP x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x82bf, "HP G3 mini", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x82c0, "HP G3 mini premium", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x103c, 0x832e, "HP 250 G6", ALC282_FIXUP_HP_250G6_EQ),
 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x841c, "HP Pavilion 15-CK0xx", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	HDA_CODEC_QUIRK(0x103c, 0x8486, "HP Pavilion x360", ALC295_FIXUP_HP_PAVILION_X360),
-- 
2.25.1

