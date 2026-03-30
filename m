Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7262E8B71;
	Mon, 30 Mar 2026 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864309; cv=none; b=NyJEiObWri8p4APoliuR1u/DZ8qRE8bwaCkAxXEK5AHVCUWJgvrsX1dpq/zxoarwjCk1Be1svfLg89AoQKr54YsbZP2HOinE7iE0qL1BhoD472atlLqvItxyBznnuFA2Fstrh8MctBdehGo1Q4Ooa0wOzG2Zf8n6aapDD6lFRpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864309; c=relaxed/simple;
	bh=iIliA15MShhewm2/AUKDwsyKYs00ZuVT8m2/CSC9Mss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LwRmU0Q5HzYB01MmmoVa8YAvYVEGSBZYQq7c8Vk1yM92ytqBKxyfuN8+cX7yPbtHkBEUbL4hSdVbsblratDHZT54XRNKfoAFL1vQP+Jj1eqI3Qx0qextKePYM6qdCbbnPFJs62QWd7E4wIs2plulrAw1gcIdEKIOEqtjon1taQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0c86779a2c1e11f1aa26b74ffac11d73-20260330
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, UD_TRUSTED, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_C_CI, GTI_FG_IT, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8e62aff7-e49a-4865-bea0-9051f3c6d598,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:8e62aff7-e49a-4865-bea0-9051f3c6d598,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:66b1ef55e6d4ee7a03bae13cf4543b86,BulkI
	D:260330175139DZQARIAQ,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,
	QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
	,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0c86779a2c1e11f1aa26b74ffac11d73-20260330
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1464621584; Mon, 30 Mar 2026 17:51:39 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: perex@perex.cz,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 16X OLED M7601RM
Date: Mon, 30 Mar 2026 17:51:33 +0800
Message-Id: <20260330095133.81786-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk for the ASUS Vivobook Pro 16X OLED M7601RM fixing the
issue where the internal microphone was not detected.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221288
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index ac920263af9e..ef70e86ef403 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -752,6 +752,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Thin A15 B7VE"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M7601RM"),
+		}
+	},
 	{}
 };
 
-- 
2.25.1

