Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612E38C
	for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943676; cv=none; b=puJ8elRfUCQ1Ts6FsIs8BZtJycCxRKI3DlcJLLbJm27mOU2MzsTf7x4Oys5wMjMOrfoqOGXsRSihiSvAZRLsnFfSw9rdLiBmmRg1/srZ2cWgz/TYNViEF+pBvo/sXKB+heDZgjWQs/3tDmflIe/7ad0lkmel/wsUf5XPopsyl3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943676; c=relaxed/simple;
	bh=ybvJacK0hS7Ibfte41zQGhPNZDLCZ3eZDMs69nd4lJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZqWYitmcwyPg/gnzrDjLVRrWZ6wLm7ePdEUk19zO/yIyeqamD8hGeZh5LnsdjfT4wMpXzCkO0C84Ct7YQNcvihmQr3mVcl4GvRE+5T/sYPhn9ufTdCR9jDGf1d9tU1INHJMm50ZrfTcrcHyGrxKArli9/PVTbfgZrF2PwRXEMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 927f68aac10a11efa216b1d71e6e1362-20241223
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF
	CIE_UNKNOWN, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:37a044a6-968e-4b9d-abd6-48185b1ae983,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.1.41,REQID:37a044a6-968e-4b9d-abd6-48185b1ae983,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:6dc6a47,CLOUDID:e02388394fafd6136a21daf95707cb39,BulkI
	D:241223164744D3YJIZ0R,BulkQuantity:0,Recheck:0,SF:19|23|43|66|72|74|78|81
	|82|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 927f68aac10a11efa216b1d71e6e1362-20241223
X-User: zhangyongzhen@kylinos.cn
Received: from localhost.localdomain [(124.64.16.39)] by mailgw.kylinos.cn
	(envelope-from <zhangyongzhen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1294006913; Mon, 23 Dec 2024 16:47:42 +0800
From: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
To: tiwai@suse.de
Cc: kailang@realtek.com,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	zhangyongzhen@kylinos.cn
Subject: [PATCH v2] ALSA: hda/realtek: Add a comment for alc_fixup_inv_dmic()
Date: Mon, 23 Dec 2024 16:47:26 +0800
Message-Id: <20241223084726.146805-1-zhangyongzhen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87plm7wzp7.wl-tiwai@suse.de>
References: <87plm7wzp7.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alc_fixup_inv_dmic() has an empty comment line above it,
add a comment here.

Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 61ba5dc35b8b..46e542581809 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -890,9 +890,7 @@ static void alc_ssid_check(struct hda_codec *codec, const hda_nid_t *ports)
 	}
 }
 
-/*
- */
-
+/* inverted digital-mic */
 static void alc_fixup_inv_dmic(struct hda_codec *codec,
 			       const struct hda_fixup *fix, int action)
 {
-- 
2.25.1

