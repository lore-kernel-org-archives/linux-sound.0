Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01EA223DFF;
	Thu,  6 Aug 2026 05:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995129; cv=none; b=IkIeVQX2IZqKLRuIq1axWp46ESd07kQb+hYwiTM6HQRu5HVwJwz5Idu4OmLLmdbMATDzGvsnAELKhZTNsxVLw5dY3AgqbaNy//tGMCb8rLmIJWHY8fCoeVW1vCZpo7v+Hhbf6VWNVM/zYZWio1A3qkjsohbYwqhbS+W86OnKIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995129; c=relaxed/simple;
	bh=yDToM9y6i6hlQzoIuEQifYdRV8+bW9mONCzuC88L3eo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MFSXS0RCnsygLCoRjeCCEG6e9gLY35q/uVqCVimiKpjQrGrAxtKL/EjALK90H3/wPHAkgmydSGBeoc+wf7ic7MdNuaYe57xKpKltpuYO0YjWekI+3/vH+P9dxe6GDYr+baIfQUSn7RHM9/t7vRt2aSgVIkYfl743RLNOnzrz0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: febf4500915911f1aa26b74ffac11d73-20260806
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:da0bc538-7585-4e7f-a43f-002fcebe1795,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:ffb091623c1389d8fdfd2fc92e62e774,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: febf4500915911f1aa26b74ffac11d73-20260806
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1730286744; Thu, 06 Aug 2026 13:45:13 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/2] ALSA: hda/realtek: Merge duplicate quirk entries for ASUS UM6702RA/RC
Date: Thu,  6 Aug 2026 13:45:05 +0800
Message-Id: <20260806054505.43717-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806054505.43717-1-zhangheng@kylinos.cn>
References: <20260806054505.43717-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS UM6702RA/RC (subsystem 0x1043:0x1ee2) currently has two
duplicate quirk entries: one using HDA_CODEC_QUIRK with
ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1, and another using
SND_PCI_QUIRK with ALC287_FIXUP_CS35L41_I2C_2.

Since these entries cover the same machine, the duplicate is redundant
and should be merged. The correct fixup to keep is
ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1, as it additionally addresses
the issue where the volume cannot be adjusted properly.

Merge the two entries into a single SND_PCI_QUIRK entry with the
appropriate fixup.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 774148acb8fa..04aa974d5869 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7698,8 +7698,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e93, "ASUS ExpertBook B9403CVAR", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1eb3, "ASUS Ally RC72LA", ALC287_FIXUP_ASUS_ALLY_X),
 	SND_PCI_QUIRK(0x1043, 0x1ed3, "ASUS HN7306W", ALC287_FIXUP_CS35L41_I2C_2),
-	HDA_CODEC_QUIRK(0x1043, 0x1ee2, "ASUS UM6702RA/RC", ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1),
-	SND_PCI_QUIRK(0x1043, 0x1ee2, "ASUS UM6702RA/RC", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x1ee2, "ASUS UM6702RA/RC", ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1c52, "ASUS Zephyrus G15 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.25.1

