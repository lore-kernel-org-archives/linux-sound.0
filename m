Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C4335555;
	Sat, 18 Jul 2026 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784362203; cv=none; b=XTgXW3a2LdnjF+Fig0MVTYzFGTT85+8zSdip2NDex32p1TKWQzGBDVh73LoH/naRz7G++Z/OVxLlOC4zzRw6iCqPrBRyOqBTtVkALl4e0apSM+Vd94odMqE/km/Ij0e8NsLoy3LHK8a/7m7wcXYff/PFv8S4mg5thSGwU/fFy7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784362203; c=relaxed/simple;
	bh=I7Sx7M1Js1gDMOVipD9nqNcBgGN3K5R8UIvJrc1uAjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KVihqjOxDUG6CPPa9lczaz24oObqQB+i1a7+pjJh696fDwmNmqjiD9OaRrJGEfQEcLXMnap2jeL9fHJtB4Unvc+GImfQB0z+0WMKdtBrlNZEWQOQnnorl3W0vfn9YqoBgQx6hMh+dN8Y8eP4BeABWJrhQLi5iCgPD4VJ4o26FXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0ea30d50828011f1aa26b74ffac11d73-20260718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:20bfbe2d-e3a9-4c0e-8aac-e26e924021ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:8816909360e5e325ceae0e4cffc078a6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0ea30d50828011f1aa26b74ffac11d73-20260718
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1238389204; Sat, 18 Jul 2026 16:09:53 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA
Date: Sat, 18 Jul 2026 16:09:49 +0800
Message-Id: <20260718080949.157230-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk for the Asus Vivobook Pro 15 M6500RE fixing the
issue where the internal microphone was not detected.

https://bugzilla.kernel.org/show_bug.cgi?id=220806
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 6f2d6ef570d2..ec94596a56a8 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -829,6 +829,14 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "PM1403CDA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6500RE_M6500RE"),
+		}
+	},
+
 	{}
 };
 
-- 
2.25.1

