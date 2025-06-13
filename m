Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE6E2727F7
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803494; cv=none; b=RTNwsxbMgvSifv6wPOf1XOEvl7+/VMrXv1T0InRjVEPm7xDfGGVB1x3eTFIQtJLqrZsGv+GMrGqy8H2NP5/7R5PsPGghf3NtSqOZb614jsH6GpxbjeoUn3668i38ntASiJFaXPWok0UksVWUaFPRS1VgBeqr3tttWR41K2tYxFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803494; c=relaxed/simple;
	bh=f7FxhpRUtUIGGFoGKILNoTB8pDoWHpEnwcICkPuljlw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qBSkgeIY0DBUI+E+9/8DkpBbFtFVRIQ0Y9tQauwlStEpRVP6W5QV4prVJiX7owGXmsbpgdk8fb03UMX0T1C93d69lsC+s9HEoTF6GJY0crLSuFRHbxlcFcGE0jZBgqh1xScy7lSwrNVpxcqDyqYa1M62UsrUwg/u3o7+shgFR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c7b29e0e483011f0b29709d653e92f7d-20250613
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, CIE_UNKNOWN, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU, ABX_MISS_RDNS
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:5ec73827-5a1b-4d02-974f-9e472043e9d6,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:18,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:28
X-CID-INFO: VERSION:1.1.45,REQID:5ec73827-5a1b-4d02-974f-9e472043e9d6,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:18,FILE:0,BULK:0,RULE:Release_HamU,ACTION
	:release,TS:28
X-CID-META: VersionHash:6493067,CLOUDID:572a1130b895e28e08a796ce3e08b149,BulkI
	D:2506131631229W3ZE9UI,BulkQuantity:0,Recheck:0,SF:16|19|23|38|43|66|74|78
	|102,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_USA,TF_CID_SPAM_FSD
X-UUID: c7b29e0e483011f0b29709d653e92f7d-20250613
X-User: zhangyongzhen@kylinos.cn
Received: from localhost.localdomain [(114.246.237.253)] by mailgw.kylinos.cn
	(envelope-from <zhangyongzhen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 925452158; Fri, 13 Jun 2025 16:31:19 +0800
From: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Subject: [PATCH] ALSA: hda/conexant: Add resume function
Date: Fri, 13 Jun 2025 16:30:44 +0800
Message-Id: <20250613083044.125916-1-zhangyongzhen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During S3 sleep state, if headphones are unplugged, we need to re-report
their status during the wake phase to ensure proper headphone presence
detection after system resume.

Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
---
 sound/pci/hda/patch_conexant.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 34874039ad45..c77629378879 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -264,6 +264,13 @@ static int cx_auto_suspend(struct hda_codec *codec)
 	return 0;
 }
 
+static int cx_auto_resume(struct hda_codec *codec)
+{
+	cx_auto_init(codec);
+	snd_hda_jack_report_sync(codec);
+	return 0;
+}
+
 static const struct hda_codec_ops cx_auto_patch_ops = {
 	.build_controls = snd_hda_gen_build_controls,
 	.build_pcms = snd_hda_gen_build_pcms,
@@ -271,6 +278,7 @@ static const struct hda_codec_ops cx_auto_patch_ops = {
 	.free = cx_auto_free,
 	.unsol_event = snd_hda_jack_unsol_event,
 	.suspend = cx_auto_suspend,
+	.resume = cx_auto_resume,
 	.check_power_status = snd_hda_gen_check_power_status,
 };
 
-- 
2.25.1

