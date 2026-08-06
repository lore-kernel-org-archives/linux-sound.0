Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85E223DFF;
	Thu,  6 Aug 2026 05:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995123; cv=none; b=dx2y7boU6zEXapePYR3VW/IBpbJ2d31UPvbS2TJpsn5lhhk9UjYxf/XbQpSZTonGx4vt36SG3lhcmnKAD0ckp0u6pIn7hgaxcGtuPX6fcn6LuGUrWLbyCUUNYJW3ADi/AXl6ZzNUMgJAfZapT416xmGvpZJ3BSEm0rgC1NRXo3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995123; c=relaxed/simple;
	bh=1i+55kAyhKgLSEQ5H+VsbBVg6RR+VTmlbWxqHzkbVgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kPbIRpmJxZyb7DnbssBGG5JoGG/ZOoWZzDMA8oGk2TMiasXCi/QTCOmP8VVa1CnorpuWEQ1ZBxpZfWxDJ4UikhiR+UYTqocOqzswVoaO5FF1QC3do75WptaDHY1vPBzosMd94RHadOdWWppqwI5/wosp2z3FuIO5XMLR9LQSlq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fd3aa5f8915911f1aa26b74ffac11d73-20260806
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1743be21-6719-4c28-8b2f-9e20a874609a,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:9e4b965bf9e6badc09e63252ba03ab32,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd3aa5f8915911f1aa26b74ffac11d73-20260806
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1387842955; Thu, 06 Aug 2026 13:45:11 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 1/2] ALSA: hda/realtek: Merge duplicate quirk entries for ASUS Strix G615
Date: Thu,  6 Aug 2026 13:45:04 +0800
Message-Id: <20260806054505.43717-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS Strix G615 series (subsystem IDs 0x1043:0x1204 and 0x1043:0x1214)
currently have duplicate quirk entries: one using HDA_CODEC_QUIRK with
ALC287_FIXUP_TAS2781_I2C, and another using SND_PCI_QUIRK with
ALC287_FIXUP_TXNW2781_I2C_ASUS.

Since these entries cover the same machines, the duplicate entries are
redundant and may cause confusion. The correct fixup for these models
should be ALC287_FIXUP_TXNW2781_I2C_ASUS, as the TAS2781 fixup was
likely a mistake.

Merge the two entries into a single SND_PCI_QUIRK entry with the
correct fixup, removing the redundant HDA_CODEC_QUIRK entries.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7877127e0e4..774148acb8fa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7597,10 +7597,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x115d, "Asus 1015E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x1194, "ASUS UM3406KA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x11c0, "ASUS X556UR", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
-	HDA_CODEC_QUIRK(0x1043, 0x1204, "ASUS Strix G16 G615JMR", ALC287_FIXUP_TXNW2781_I2C_ASUS),
-	SND_PCI_QUIRK(0x1043, 0x1204, "ASUS Strix G615JHR_JMR_JPR", ALC287_FIXUP_TAS2781_I2C),
-	HDA_CODEC_QUIRK(0x1043, 0x1214, "ASUS ROG Strix G615LP", ALC287_FIXUP_TXNW2781_I2C_ASUS),
-	SND_PCI_QUIRK(0x1043, 0x1214, "ASUS Strix G615LH_LM_LP", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x1204, "ASUS Strix G615JHR_JMR_JPR", ALC287_FIXUP_TXNW2781_I2C_ASUS),
+	SND_PCI_QUIRK(0x1043, 0x1214, "ASUS Strix G615LH_LM_LP", ALC287_FIXUP_TXNW2781_I2C_ASUS),
 	SND_PCI_QUIRK(0x1043, 0x125e, "ASUS Q524UQK", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1271, "ASUS X430UN", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1290, "ASUS X441SA", ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE),
-- 
2.25.1

