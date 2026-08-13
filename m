Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF38320A14;
	Thu, 13 Aug 2026 01:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786584413; cv=none; b=LpmdNkWsupF3UlNcuYrW+VuAtx+N7dmNREP9zFD+zVZmYLpE981W9iEgN7ww6QO8W+gtk8YUqjKxLA32iH1MrqDPJwKYNCztQ3zEYClFDvS52wmQfDbpPhHFRZXM1jOcotpDMYpiHuuyUWQTFSrjiw9vxTMB+wKEYGAuF5G3R10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786584413; c=relaxed/simple;
	bh=5zqD4XuvfSF/gEvZ9r5hPpUWn71DkmRmDqaDBMG5mNg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=onFVyk87A0vyt1LXUxI4s6q17lRqHjzu+u5Mb1DioqSdKYA7mYphy+tQO2KywfGgM2F7xyRUpoaHXO/DcAttMdHZsxp12wH58jNN1CaT9RvPGZnaQ/r2ESb0KzX3pW+jy5/c4GYu2yJ2YFcLYk+bU4am1VJ0vbYO4zzUbLDTdGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 097c624696b611f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:eaf2f5e8-bba7-401e-b916-1c1b67c6f1e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e7bac3a,CLOUDID:b1139707313e583df1c968270473ec60,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|865|898,TC:nil,Content:0|15|
	50,EDM:1|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 097c624696b611f1aa26b74ffac11d73-20260813
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 447849590; Thu, 13 Aug 2026 09:26:41 +0800
From: yaolu@kylinos.cn
To: ckeepax@opensource.cirrus.com,
	mstrozek@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Lu Yao <yaolu@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] ASoC: SDCA: Add stub for sdca_fdl_free_state()
Date: Thu, 13 Aug 2026 09:26:36 +0800
Message-Id: <20260813012636.29735-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Yao <yaolu@kylinos.cn>

Commit 0880082c27b6 ("ASoC: SDCA: Remove devm from primary IRQ
cleanup") added a call to sdca_fdl_free_state() in sdca_interrupts.c,
but only declared it in the CONFIG_SND_SOC_SDCA_FDL enabled section of
sdca_fdl.h. Building SDCA IRQ support without FDL support therefore
fails with:

  sound/soc/sdca/sdca_interrupts.c:471:56: error: 'sdca_fdl_free_state' undeclared (first use in this function); did you mean 'sdca_jack_free_state'?

Fixes: 0880082c27b6 ("ASoC: SDCA: Remove devm from primary IRQ cleanup")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
Reported-by: k2ci <kernel-bot@kylinos.cn>
---
 include/sound/sdca_fdl.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index dc33927b82bd..bc3600cdd2ec 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -83,6 +83,10 @@ static inline int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	return 0;
 }
 
+static inline void sdca_fdl_free_state(struct sdca_interrupt *interrupt)
+{
+}
+
 static inline int sdca_fdl_process(struct sdca_interrupt *interrupt)
 {
 	return 0;
-- 
2.25.1

