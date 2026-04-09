Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F035838A;
	Thu,  9 Apr 2026 02:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775702442; cv=none; b=OTOuFhAYf/ByO5e/X5J+AYYONgH+gXsEBsHwUI/uKH3L1bnbnXZ6GabLOM4SqX8QSkXv77snSxDOaSDEujWNPiRTYUjVCgVbHazPUmk8QIZgSzfKLQ7vph3dzPwtPgB8VnCXiAMxdDHu8UblaakU/JeKh2t7ryxE3o8WxyWm900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775702442; c=relaxed/simple;
	bh=90dD2T0iu83Wbg8fN4a81otBBGwumvB7PC1KNasIbcg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YBGdsRLs3Q+gvHbYbDJc9lYm0AQ5DGJ9hGKZrfcsaQ0AMkDG4VX70DJuYggdA/kmerqmFumMbmYQJNdqf0N1gqX6nLrSoCYD+j27nLtNflp6sos1ssgX/j1Iq2s+0EkY5EHfd74H9B75jchw0UIE3vLmv7NiiGNlWveCzkWsY4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7b19ca3033bd11f1aa26b74ffac11d73-20260409
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, UD_TRUSTED
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:54353511-f302-4893-a5f4-03b932fe8135,IP:10,
	URL:0,TC:0,Content:-25,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,A
	CTION:release,TS:-20
X-CID-INFO: VERSION:1.3.12,REQID:54353511-f302-4893-a5f4-03b932fe8135,IP:10,UR
	L:0,TC:0,Content:-25,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-20
X-CID-META: VersionHash:e7bac3a,CLOUDID:9788e6c6876a897cb2e160684ab20525,BulkI
	D:2604091040340MKBRAEJ,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|898
	,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7b19ca3033bd11f1aa26b74ffac11d73-20260409
X-User: zhangheng@kylinos.cn
Received: from thinksys.. [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 789120191; Thu, 09 Apr 2026 10:40:33 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
Date: Thu,  9 Apr 2026 10:40:28 +0800
Message-Id: <20260409024028.1297587-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSL Unity BF24B all-in-one PC uses a Realtek ALC662 rev3 audio
codec and requires the correct GPIO configuration to enable sound
output from both the speakers and the headphone.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221258
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc662.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index 5073165d1f3c..3abe41c7315c 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -255,6 +255,25 @@ static void alc_fixup_headset_mode_alc668(struct hda_codec *codec,
 	alc_fixup_headset_mode(codec, fix, action);
 }
 
+static void alc662_fixup_csl_amp(struct hda_codec *codec,
+				 const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->gpio_mask |= 0x03;
+		spec->gpio_dir |= 0x03;
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		/* need to toggle GPIO to enable the amp */
+		alc_update_gpio_data(codec, 0x03, true);
+		msleep(100);
+		alc_update_gpio_data(codec, 0x03, false);
+		break;
+	}
+}
+
 enum {
 	ALC662_FIXUP_ASPIRE,
 	ALC662_FIXUP_LED_GPIO1,
@@ -313,6 +332,7 @@ enum {
 	ALC897_FIXUP_HEADSET_MIC_PIN2,
 	ALC897_FIXUP_UNIS_H3C_X500S,
 	ALC897_FIXUP_HEADSET_MIC_PIN3,
+	ALC662_FIXUP_CSL_GPIO,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -766,11 +786,16 @@ static const struct hda_fixup alc662_fixups[] = {
 			{ }
 		},
 	},
+	[ALC662_FIXUP_CSL_GPIO] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc662_fixup_csl_amp,
+	},
 };
 
 static const struct hda_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1019, 0x9087, "ECS", ALC662_FIXUP_ASUS_MODE2),
 	SND_PCI_QUIRK(0x1019, 0x9859, "JP-IK LEAP W502", ALC897_FIXUP_HEADSET_MIC_PIN3),
+	SND_PCI_QUIRK(0x1022, 0xc950, "CSL Unity BF24B", ALC662_FIXUP_CSL_GPIO),
 	SND_PCI_QUIRK(0x1025, 0x022f, "Acer Aspire One", ALC662_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x0241, "Packard Bell DOTS", ALC662_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x0308, "Acer Aspire 8942G", ALC662_FIXUP_ASPIRE),
-- 
2.34.1

