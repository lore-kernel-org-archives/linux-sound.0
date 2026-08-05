Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB923F8EC4;
	Wed,  5 Aug 2026 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921377; cv=none; b=J+/BpOJxuWTW+/F3NKtgEaGxinuZBDHXrDjsY/8VowQ6P6abRTUUjs2UjRapS+pkq4hqHHLbPfvnKOHD1xaE+/72klJavqlgp56jxxa47mZFcoOPjxsiYrehbxF+NiZ8Jx4QWrIILJ/kHcvv+DF49pM94JfGfazI12rvXpAE078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921377; c=relaxed/simple;
	bh=FO816XFhJkWdyLvRGiHG5HoboLqEjmu7cOhQ2uLwAZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TXdpvKfyNbPAroHqXeUS9P7oDi1ZanNL8yaM8MQBFh8ptM+4sv1spFIZ6bcP3+bthH2+g0Ud1h4M3ccFVzaPMRFZtJqtWl9f2A5nAACufm4ZHSQT/w9eliytpopXXK2gBh1QUTbuBuzQ+Q8IN5S+Zcw8Za+x4dYQmTNj0FO84+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 48c3a72e90ae11f1aa26b74ffac11d73-20260805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b44c3f03-d1cf-43f7-9f29-ac32a5d5b39e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:a09fbae14922d3dd0de6d3c448f58778,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48c3a72e90ae11f1aa26b74ffac11d73-20260805
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1921803342; Wed, 05 Aug 2026 17:16:04 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 1/2] ASoC: amd: yc: Add DMI quirk for Xiaomi RedmiBook 16 2025
Date: Wed,  5 Aug 2026 17:15:59 +0800
Message-Id: <20260805091600.318018-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk for the Xiaomi RedmiBook 16 2025 (AMD) fixing the
issue where the internal microphone was not detected.

Link: https://github.com/thesofproject/linux/issues/5860
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 8b6119931a4d..68253def9c82 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -850,7 +850,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6500RE_M6500RE"),
 		}
 	},
-
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "XIAOMI"),
+			DMI_MATCH(DMI_BOARD_NAME, "TM2423"),
+		}
+	},
 	{}
 };
 
-- 
2.25.1

