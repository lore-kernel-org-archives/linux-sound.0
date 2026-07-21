Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BCB40800D;
	Tue, 21 Jul 2026 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633754; cv=none; b=nnBildHYu6M4Eg0efgudJxfi3/82lND5so6SvcjlZaQjD+7/R1qmwyro9y9WKyDjM5W6Wmkh2d1pQDcTpWTeJGdquFcvFB1UFevk0t250WIy8qG5YO70G8WyPIdVxtb31oPwSo9rumArL5MMXj47ALj5fJ1wcsALnPEa6sRZM3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633754; c=relaxed/simple;
	bh=ATB0sWcVEawkwzm0zg9YB6vMMzeurDCgGdu7k9rNUQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UsLTDF3J5VLodpOYb+7Uiqx9yELglB27PGfZb5Lt7qIdySke+2uKm5c/pHUA/FN/Es8qfQdwQ15USn8rD7fK8Pga74UiTjk+XeBl0pBnviuWUzsNwvlmCW8SADhlzbG4vUneKGFXeRB1FKyJjSeyK3mjiOzae1WtqjSlEpoMAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4f52e60284f811f1aa26b74ffac11d73-20260721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:25f3a381-0162-43df-98f0-c01ab188f565,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:3e987cc924fb9d33ae8a543ff41e3ff8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4f52e60284f811f1aa26b74ffac11d73-20260721
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1990987693; Tue, 21 Jul 2026 19:35:44 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 1/2] ALSA: hda/realtek: Add quirk for HP Pavilion All-in-One 27-ca1xxx
Date: Tue, 21 Jul 2026 19:35:38 +0800
Message-Id: <20260721113539.317561-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This HP All-in-One desktop (model 27-ca1xxx) uses an ALC274 codec
and has no sound from either the internal speakers or the headphone
jack. The audio output requires a combination of a specific verb
setup and GPIO configuration to become functional. Additionally,
the power_save feature must be disabled; otherwise, audible clicks
or pops occur during power state transitions.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220694
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 35 +++++++++++++++++++++++++++++++
 sound/hda/controllers/intel.c     |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d2c546b81f40..4589b748b0a3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3866,6 +3866,16 @@ static void alc288_fixup_surface_swap_dacs(struct hda_codec *codec,
 	spec->gen.preferred_dacs = preferred_pairs;
 }
 
+static void alc274_fixup_hp_89e9_amp(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_INIT) {
+		/* need to toggle GPIO to enable the amp */
+		snd_hda_codec_set_gpio(codec, 0x03, 0x03, 0x03, 0);
+		msleep(100);
+		snd_hda_codec_set_gpio(codec, 0x03, 0x03, 0x00, 0);
+	}
+}
 enum {
 	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
@@ -4217,6 +4227,8 @@ enum {
 	ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX,
 	ALC287_FIXUP_ACER_MICMUTE_LED,
 	ALC236_FIXUP_DELL_HP_POP_NOISE,
+	ALC274_FIXUP_HP_89E9_GPIO,
+	ALC274_FIXUP_HP_VERBS,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6866,6 +6878,28 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_invalidate_dacs,
 	},
+	[ALC274_FIXUP_HP_89E9_GPIO] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc274_fixup_hp_89e9_amp,
+	},
+	[ALC274_FIXUP_HP_VERBS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0b },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x7778 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x10 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xc580 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x5757 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x62 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xa007 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x6b },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0060 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC274_FIXUP_HP_89E9_GPIO,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -7238,6 +7272,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a50, "HP Victus 15-fa0xxx (MB 8A50)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8a6b, "HP Pavilion All-in-One Desktop 27-ca1xxx", ALC274_FIXUP_HP_VERBS),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 192f5c044b7a..9a5c61f43011 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2314,6 +2314,8 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x1028, 0x0962, "Dell ALC3271", 0),
 	/* https://bugzilla.kernel.org/show_bug.cgi?id=220210 */
 	SND_PCI_QUIRK(0x17aa, 0x5079, "Lenovo Thinkpad E15", 0),
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=220694 */
+	SND_PCI_QUIRK(0x103c, 0x8a6b, "HP 89E9", 0),
 	{}
 };
 
-- 
2.25.1

