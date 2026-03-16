Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA1232395;
	Mon, 16 Mar 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648153; cv=none; b=Xo0eLHslo/k/L81GMUqdL16P8otzYX0vaolj1QoqoXECj7vjLRYAzDEsoekFvVb2CO0MkDLPj7rOYTqa0qauQqKOFPFibnOllTB3cNdd55VbQ92UpgyBfbY4sSFUm04+FvB65ojU51bCCMqyOEZ0C28l1Ph33P1kUKeEzHiY6IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648153; c=relaxed/simple;
	bh=m/H1z3hjb+OvFjkCkoHwmC3Viw5xrSq9bGqRZLXnR9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VPCf8C0u4UKDDSfxOpT364a9y+IqsaTRqHTLq/USAWMMHTv44VkuOZCe2N8pHlIJsujgDijetdzDhtjjvEnI7bxhTUhDNhr4AOLObw1JbVMAq2T9y8GH+E8GqHOBBgGO3xlJGeYMrKnJXsFLsoolBnDm6XbHyjuKoBTHQHbIgm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 76c83ef6210e11f1a21c59e7364eecb8-20260316
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, UD_TRUSTED
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI
	GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:26cac922-550c-4db9-9108-1c7b42b47c1e,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-20
X-CID-INFO: VERSION:1.3.11,REQID:26cac922-550c-4db9-9108-1c7b42b47c1e,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-20
X-CID-META: VersionHash:89c9d04,CLOUDID:8412b2a970ca7d05bce8e8111dd02e3d,BulkI
	D:260316160223Z3WF38RQ,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|898
	,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 76c83ef6210e11f1a21c59e7364eecb8-20260316
X-User: zhangheng@kylinos.cn
Received: from thinksys.. [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1836535267; Mon, 16 Mar 2026 16:02:23 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: talhah.peerbhai@gmail.com,
	guspatagonico@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF
Date: Mon, 16 Mar 2026 16:02:18 +0800
Message-Id: <20260316080218.2931304-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk for the Thin A15 B7VF fixing the issue where
the internal microphone was not detected.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220833
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1c73d2123b5a..fdc9586bd020 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -724,6 +724,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "PM1503CDA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Thin A15 B7VE"),
+		}
+	},
 	{}
 };
 
-- 
2.34.1

