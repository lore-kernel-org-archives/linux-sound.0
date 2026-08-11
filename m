Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7571A3BBFAB;
	Tue, 11 Aug 2026 02:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416564; cv=none; b=bzhYTdfIL79ZL5Djnk4qLGMEuO49R+LA4iR8oxrKV4oouI80GBg2UGBh1gR50F+sz1sTANBS53yXm6pidxnKfeHZAaY5UGYIPXRrwbxT8pP3OWwKffw3VvrFn99es/sw0LAfu96hSLlzl1N4EmlFHimdqWZGm3bxf8pnwm84EvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416564; c=relaxed/simple;
	bh=PnNv/gOnWc2WlUbRrmmIk53FNgvNPfgzz1CxiE7zH5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uIM7kVN+nnYu6uxvDg7hwYdYP6Q+QK3+PYss0al5Fd71b/J0MZ2hkuArUmLvWmXBwpvxuFBbzlUbZxVdW3VTWVAjKnququsWne61wg8e8a5yIXB7JvUDeOeFVDaZId4wLA1gTEzZtdL4Y0oBv3vkUHjzgtpLuxXEzv9zdWJ7FVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 39c0c6aa952f11f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6c60f037-e311-4ada-904c-cef8964c4aae,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:3132210c2266bcc9273565d02e4aff1f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 39c0c6aa952f11f1aa26b74ffac11d73-20260811
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 514904410; Tue, 11 Aug 2026 10:49:09 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/4] ALSA: hda/realtek: Add quirk for Acer Predator PH16-71
Date: Tue, 11 Aug 2026 10:49:00 +0800
Message-Id: <20260811024902.134457-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260811024902.134457-1-zhangheng@kylinos.cn>
References: <20260811024902.134457-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Predator PH16-71 (subsystem 0x1025:0x166c) with Realtek ALC245
codec has a non-functional headset microphone. Adding the
ALC2XX_FIXUP_HEADSET_MIC quirk resolves the issue.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221641
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index da9c816b8c4f..445b0ed4ca43 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7064,6 +7064,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x161f, "Acer S40-54", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
-- 
2.25.1

