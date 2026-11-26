Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686916;
	b=DlCg6n8pLvdErxStwhIXBI9YIMexk38tou75LMGZWU3K/Yboy/UXFNdiLAYbnBRQPT5x
	 RE1hUWQEfIaCypsKgTkH704mTpiNUpbfvdIvmLyh3a0Dwg6gOAa2M/WLhKehF6xRV8mC5
	 JGVCXfbReGcdxooHxc/OJjM0+uLBl03L/H9b2Y3gFOTRxOgXqq+ztQqCmii4o2D2lPp13
	 Kssk7h59ez0UYFxYQsefHdS+E6VpxN39gjkTW9uw5jj55OlgwPmu0QmEPP8gTz6G/ulB6
	 s3PAj8TtLgRlNXgYNT3/uHP7cmsQqX9ACrMNkyuaCsqSRGvYHXc/KCtKIKM21gDnHhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686916;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/OEyTMCovgqBPEWFhNHogwKOonGrCtBiqR8NpYfRMdo=;
	b=ztmepI4gR/fpE7vBahnTi7VkzNwsAe/YyYoTWqBRp2W1BeoDeBiTSvWVi0UjIpFB7mtV
	 NbP0pEGqkr+90gqxOf8jJWlLqitThMiyWruSBdXHLB8kGlUqkEKIFnHGr757eCXSeTV9Z
	 QSUuQKQAxFLOQgc0vXSo2plVUTpJLFSWuCB8DS2gefRB43SdRB9zTPrjTWKQTxol1hJ0Q
	 WyiEzuqDm5zQn7agPewQEI4S66+XgwBkpKMvs5p4hntZg4srbWGqBBOOQrcATtmFEI3sp
	 BIdsTubaXvKxPDCzUSxzkavWReGZIQulAI+QyxBTvCw4bTSy/YnvKsZnbLGumHcNB3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF6606A32E;
	Thu, 26 Nov 2026 09:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BF6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 75c5f45ae97f11f19a56ed5b684f684d-20261126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8b1403e3-ea85-455f-af42-6449f7675028,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:da0a6ff5f0934499b3419666d96728ce,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75c5f45ae97f11f19a56ed5b684f684d-20261126
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1582135308; Thu, 26 Nov 2026 17:55:07 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [RESEND PATCH] ASoC: amd: yc: Add DMI quirk for Acer Nitro AN515-46
Date: Thu, 26 Nov 2026 17:54:46 +0800
Message-Id: <20261126095446.889320-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI match entry so the ACP6x sound card is selected on the
Acer Nitro AN515-46.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222239
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7ab48e3629be..667a49a1c642 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -661,6 +661,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFA16-41"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-46"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.25.1
