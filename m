Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0504424D69;
	Thu, 23 Jul 2026 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799412; cv=none; b=JRgdgEJ/R7zC5i5ZHQ/kh8cmlIr+NBBGVugmbBukuSVbHP47+Lzihb7F3FsOywjK5AEJrfapGqaMBrmgn5q1EnqMs2+rz+fo8vqlzmEjLaKmlaHKS1UDczK8TiwRyOnVrnY/hnyhLbEK4vkXOS+es0ia/t9TUtDqk1SsWYQxQQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799412; c=relaxed/simple;
	bh=ZcKT4QnEKNnpbxAigl4lgcfpEFZSBaRXdAiBRk0GlQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BuW7GP6bR/XqVjgZ5K/Uf4N1H6/boqgb5q3vczfDwcDePAEDMjwBxnfst+q7mCDLJW2srt07AzlSv/4K9lIdKEdZMwOSdpHfPYXKR0qX40cD8nBG8Joi3pkk4+DUsmLGPO1lUjP9e/C4uph2rHtY1XE780vLI8MsA4dRZZ2R6R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0457c036867a11f1aa26b74ffac11d73-20260723
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a666bb7f-1b75-4f34-988f-1d38aa103593,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:406675e379f91fe3e4b492016caa41b9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0457c036867a11f1aa26b74ffac11d73-20260723
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 864088137; Thu, 23 Jul 2026 17:36:44 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] ASoC: Intel: avs: da7219: Remove redundant DAI link name allocation
Date: Thu, 23 Jul 2026 17:36:39 +0800
Message-Id: <20260723093639.2364360-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

avs_create_dai_link() assigns dl->name twice; the first devm_kasprintf()
is immediately overwritten by the TDM-aware name. Drop the redundant
first assignment.

Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 sound/soc/intel/avs/boards/da7219.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 2b17abcbd2bc..6cc8a6618fa1 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -175,7 +175,6 @@ static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
-- 
2.25.1

