Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803BE2D63E8;
	Mon, 26 Jan 2026 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413020; cv=none; b=DBx5qYfWMEYfouBVPAGLcUPhlBp54XVS+aOjJ1WU7P9SLVxpY3eE/YCn52YOpC+cVNKf8hvToizvO3kB271z6RIN67GN6S4pOMm/lIFTsxB17CK3oMECEB9xNzrFLZEhby9zPFedEIRM3yWKWxY83asBmEDEb94quzh9jaF8Wvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413020; c=relaxed/simple;
	bh=jzjLqmbQ7E3dbGxt0ikuDYdYk6mmtic2ctz/t6iXnf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ml1bBXEy+1u5iAsrBrLSfLAokX6zpR2yK0Q7Kwps5u8Hpfu4wmgvXvoeUc6FBwlCoZhcMunlbrRAR0Fy1Sk/N+My3mWr7Ig/pHlm71ktHsgxAw2doaG/h3JPZjoGwIFjNPF3H64aRrL29FOFHA3H3k34WkFbuS2gCP1KpgrTDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c5d2da16fa8911f0b0f03b4cfa9209d1-20260126
X-CID-CACHE: Type:Local,Time:202601261535+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:50f925c4-8818-4d9b-b4e2-0356810efec6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:6607cb87d84f17b03d9198c7a920df83,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c5d2da16fa8911f0b0f03b4cfa9209d1-20260126
X-User: zhangheng@kylinos.cn
Received: from kylin-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 922231525; Mon, 26 Jan 2026 15:36:48 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	edip@medip.dev
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/2] ALSA: hda/realtek: Add quirk for Inspur S14-G1
Date: Mon, 26 Jan 2026 15:36:44 +0800
Message-ID: <20260126073644.3898484-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inspur S14-G1 is equipped with ALC256.
Enable "power saving mode" and Enable "headset jack mode".

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 928204df0ee3..e430b523d23c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7426,6 +7426,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x2039, 0x0001, "Inspur S14-G1", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
-- 
2.47.1

