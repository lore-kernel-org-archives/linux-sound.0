Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2820ED;
	Thu,  5 Mar 2026 02:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772679047; cv=none; b=rUAWae/HVLtYPdRiYh5qatyvSYPy9qqEzVTROUfr8u+VuoFRJ052p4Tl7ya9RsWleGozc7fIWmMMzvAoH8gok66wJxwz+l/Pxa58Bz/8RS6yK7C7R+eMtycTwBZXZI4Tsogy0HdadPVvF6AiHdN3dtGLHpG0G7AUD8e2RqqLc6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772679047; c=relaxed/simple;
	bh=aNgN7aNG/PL4lKB530NyvDCGzTpOgA5GT6D+JVDpeeA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BiDqXSpZT7EhrFwgFsidDJjZdyexgwIsgcSoP6nUL4bB08ypLNcwg9XciUMGT4lQLPlizWhOqYyIo5c+F3nyVBQML0iFLqUZJVTUEj51xYJrPXj0TNZFEgg4Zp/1KDTT4Caxca5TbeWl6DCtjRTT7uqB9ya7ap7lmX02sqjY06o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 17fd1be0183e11f1a21c59e7364eecb8-20260305
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED, SA_UNFAMILIAR
	SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	UD_TRUSTED, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_C_CI, GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d197bb7d-7f93-47c3-8115-675f55f359ec,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-25
X-CID-INFO: VERSION:1.3.11,REQID:d197bb7d-7f93-47c3-8115-675f55f359ec,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:d7a3ab64d2f4556f72953df785e2d91a,BulkI
	D:260305105040VVPRMN9N,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 17fd1be0183e11f1a21c59e7364eecb8-20260305
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 932941648; Thu, 05 Mar 2026 10:50:39 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone
Date: Thu,  5 Mar 2026 10:49:58 +0800
Message-Id: <20260305024958.49026-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BIOS of this machine has set 0x19 to mic, which needs to be set
to headphone pin in order to work properly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220814
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc662.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index 5073165d1f3c..e5c75f27fca2 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -313,6 +313,7 @@ enum {
 	ALC897_FIXUP_HEADSET_MIC_PIN2,
 	ALC897_FIXUP_UNIS_H3C_X500S,
 	ALC897_FIXUP_HEADSET_MIC_PIN3,
+	ALC897_FIXUP_H610M_HP_PIN,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -766,6 +767,13 @@ static const struct hda_fixup alc662_fixups[] = {
 			{ }
 		},
 	},
+	[ALC897_FIXUP_H610M_HP_PIN] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x0321403f }, /* HP out */
+			{ }
+		},
+	},
 };
 
 static const struct hda_quirk alc662_fixup_tbl[] = {
@@ -816,6 +824,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x105b, 0x0cd6, "Foxconn", ALC662_FIXUP_ASUS_MODE2),
 	SND_PCI_QUIRK(0x144d, 0xc051, "Samsung R720", ALC662_FIXUP_IDEAPAD),
 	SND_PCI_QUIRK(0x14cd, 0x5003, "USI", ALC662_FIXUP_USI_HEADSET_MODE),
+	SND_PCI_QUIRK(0x1458, 0xa194, "H610M H V2 DDR4", ALC897_FIXUP_H610M_HP_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC662_FIXUP_LENOVO_MULTI_CODECS),
 	SND_PCI_QUIRK(0x17aa, 0x1057, "Lenovo P360", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x1064, "Lenovo P3 Tower", ALC897_FIXUP_HEADSET_MIC_PIN),
-- 
2.25.1

