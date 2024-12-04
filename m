Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5291AC448
	for <linux-sound@vger.kernel.org>; Wed,  4 Dec 2024 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733305193; cv=none; b=rF2Of1uiwtgpWPIMYWJ+eisTq+02n48llA3fMCZXVGcSAuU/jfbLLtTnwQZFQ6s7F11e5SZo9wMMMEWMmUutR0ThqCE1218c+SrHBM3ixZllX1b52qXyh+K43oidf0TE4knI3nd8fvQaBFIPdc1ek1oqTe0lVWtervSZC6FbVSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733305193; c=relaxed/simple;
	bh=Dm16XVVEigJwf7RyR+5cJtOa6A2HDAbSRh1JQdhsGqI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pehSq2j2x34yFUqd+12QYCc0aBgIJGylyKOTM8OuDx1dxZjQn2whVVKR5m7RArS0ync9WJPtWbnBhcyFEBwvHf1MrgjPNHJPKNO+ixF7OSND1nyinR0DwuaYMWfU7inLy7yCJJyYD63yTs3AfwURNS4s4Saix2923W/UKMDOZok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: aefcfab0b22311efa216b1d71e6e1362-20241204
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:56927f85-b9e8-4e62-bcc9-f2133bdb509c,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.38,REQID:56927f85-b9e8-4e62-bcc9-f2133bdb509c,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:f782ea7772729237b0d2d7bcee8cfdde,BulkI
	D:2412041739416CL3I22D,BulkQuantity:0,Recheck:0,SF:19|24|38|44|66|72|102,T
	C:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: aefcfab0b22311efa216b1d71e6e1362-20241204
X-User: zhangyongzhen@kylinos.cn
Received: from zyz-t480.. [(223.70.160.239)] by mailgw.kylinos.cn
	(envelope-from <zhangyongzhen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1914892917; Wed, 04 Dec 2024 17:39:40 +0800
From: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: kailang@realtek.com,
	Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Remove needless comment lines
Date: Wed,  4 Dec 2024 17:39:28 +0800
Message-Id: <20241204093928.15988-1-zhangyongzhen@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-/*
- */
-

Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4ba9e647250b..b73b1a51a23d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -890,9 +890,6 @@ static void alc_ssid_check(struct hda_codec *codec, const hda_nid_t *ports)
 	}
 }
 
-/*
- */
-
 static void alc_fixup_inv_dmic(struct hda_codec *codec,
 			       const struct hda_fixup *fix, int action)
 {
-- 
2.34.1

