Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA2393DC8
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 23:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778800828; cv=none; b=p0HMxhPPYXJiz4yikKVfyWPNQSAImJJYgBJNtfaAoY9D+FSAsSwyBzbgW1StL214YazQwinwKN+yv2VEpthg7NniKFpnSwCoGzrnRQoWOCyrefp0x0xdySpXI9AGaGY7cGgKS88PPBhsmzQVhnUnRZe+mz9yKVyRN5l2dsgQGhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778800828; c=relaxed/simple;
	bh=lyut248ohL8lMiQjhMEr4em5gqDx1XiavnPgwudBiiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUTQVyZ3mfio8a/2H7oU7U6HzQ5c7qAQXNQkMqLKgT0buigZgoOnfci5jT4vEY3qA7+qYMugC30cPL55ErRIuXnWhfL/b2V7EmcnMSBll1TlhU/pxGqXcB3RhBNPqZoaRvxdZV39TfrPiZsuuDdtcDx8laDZp+ZNsLrv/WXEDt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOMtaX+r; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOMtaX+r"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso6207051a91.2
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 16:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778800825; x=1779405625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFgRqIfPnwsr89P7tCB0q0/8N2KZaaQUIqXtzxlp1YE=;
        b=LOMtaX+r99GzxbZkXZDATIWSr95WSwIL7uerQ+rHs/pehMd0TYHK5K1TgAc+MgyRvh
         /5W1any1YdnlQi/ZLIS1exo4ajbLgUqrxwTYZbnA5XyRTjitwc8IzAlDvmTyADTdOxRM
         8HLuH8HNBF1xP6WJlfav8z1OoJB+bM6bA1tf9wpSnhnvzMUUIkvQpOyPDsUyJH8x09Ah
         DNlVIS0eUpA04Zmq8cNeab2yPIZrKcROJU5D+JNKGPR66dBNbr/JshO5H3/kS4DyohlB
         4FEHDKA/PWe1Q8DYcMEsLYCg7bFdpTfyRsYl36JaPdq9yumamGGof5N3Hjla4rR735KL
         V8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778800825; x=1779405625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFgRqIfPnwsr89P7tCB0q0/8N2KZaaQUIqXtzxlp1YE=;
        b=Vdyp81dL4q/BPIieIXfXZYJSRlLIwiz+iY8sAoARz+9/5iDl/tMLRLDO7rGh1OpfaA
         s0Jxox83ekyaPch4m4Yq4WlAv5IXefX78xGuuQSKhtab2tsFkGybtYCo2++ES+ubtTdS
         /+qXDRgJZ3RNX2klXbBF+wj3NvItHp/EV+DXtIaOwQxp+a5M+doLjOdcKuJpZT96u8+K
         3Sp9IVQ5dpvhlwXRVBVjiUwyDDkAmDJeSB0GDBYHLG/oZiNbNCL+7JtnovMh0f5G4nbz
         Hy00tBFQRoIz5ngktiz426MhqOWrrS0O5xk2l5+om+A9lXrxm5ebU64TOf3xrcIIlR41
         yVBw==
X-Gm-Message-State: AOJu0YyXuhYNrQAEEz42UoRnGlzA/eoT+yyxHviybQyblN6M4MJ4OBDE
	AU/5OPmLXQczg8pGdz7vEVQjhc6v/qU+MReMoSkCyn7hNKphOFjMzPUWDddjjg==
X-Gm-Gg: Acq92OEGMrtn0sZTixWal/kO7MMZ24arXfLOWTbFllPnRRBxvdXT9l7gmZCeDWCwc7l
	B+O7BflEwIxK/1mJhOhCPZQm3wVHjniFapsrSD+x4V0MVSWVSCQw+9KjVkZ7eO252dRd81jx8Hm
	jHk2s2ysKuiMtoEEdedo+xnOt+HCtmOTg5auRx9DuQBttElUXwhWs715MPdxCL2rZyAlqhYOqpj
	RVyC5kHo/M5yOdj2r3r7PC9HsXdaFPoB4mAFvCc2xtlHSJKPoPGu6e6WX8/h2dHTTaxv7JVbhBU
	TAGXPwhejml70quyTh8yAXgOhqOfNzIv6Ymt47A9D3kVQzpVEn9UX6KMJLFiXfbRwqpTzZfeAEl
	hdu7b7Xdm5wPqLjbKCLg8rYNJbh4q4gLvZOAy6EDamdHbtjRRJWklPB5Qc7WZ25AxHV/W0Plj6B
	p51AXtwztTYSbZS9QqyYFIU9r+mcmLrES6maXZyllAT41kXxhynuW4EYPD2N44pxTvgm2eSiL51
	CY6niOIB0yYC3Qc65RdPeMbQsGiQjCSrVjXJO6BqA6Llg==
X-Received: by 2002:a17:90b:48ca:b0:359:d54:846f with SMTP id 98e67ed59e1d1-369519c103emr1358006a91.7.1778800825008;
        Thu, 14 May 2026 16:20:25 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951434f55sm721589a91.9.2026.05.14.16.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 16:20:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] ASoC: pcm6240: Use flexible array for config blocks
Date: Thu, 14 May 2026 16:20:07 -0700
Message-ID: <20260514232007.13260-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the per-config block pointer table in the config allocation
instead of allocating it separately.

This ties the table to the config object lifetime and removes the
extra allocation and free path.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/codecs/pcm6240.c | 36 +++++++++++++++---------------------
 sound/soc/codecs/pcm6240.h |  2 +-
 2 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 78b21fbfad50..667596fc1781 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -1230,15 +1230,11 @@ static struct pcmdevice_config_info *pcmdevice_add_config(void *ctxt,
 	int *status)
 {
 	struct pcmdevice_priv *pcm_dev = (struct pcmdevice_priv *)ctxt;
-	struct pcmdevice_config_info *cfg_info;
+	struct pcmdevice_config_info *cfg_info = NULL;
 	struct pcmdevice_block_data **bk_da;
+	char cfg_name[64] = {};
 	unsigned int config_offset = 0, i;
-
-	cfg_info = kzalloc_obj(struct pcmdevice_config_info);
-	if (!cfg_info) {
-		*status = -ENOMEM;
-		goto out;
-	}
+	unsigned int nblocks;
 
 	if (pcm_dev->regbin.fw_hdr.binary_version_num >= 0x105) {
 		if (config_offset + 64 > (int)config_size) {
@@ -1247,7 +1243,7 @@ static struct pcmdevice_config_info *pcmdevice_add_config(void *ctxt,
 				"%s: cfg_name out of boundary\n", __func__);
 			goto out;
 		}
-		memcpy(cfg_info->cfg_name, &config_data[config_offset], 64);
+		memcpy(cfg_name, &config_data[config_offset], 64);
 		config_offset += 64;
 	}
 
@@ -1257,16 +1253,17 @@ static struct pcmdevice_config_info *pcmdevice_add_config(void *ctxt,
 			__func__);
 		goto out;
 	}
-	cfg_info->nblocks =
-		get_unaligned_be32(&config_data[config_offset]);
+	nblocks = get_unaligned_be32(&config_data[config_offset]);
 	config_offset += 4;
 
-	bk_da = cfg_info->blk_data = kzalloc_objs(struct pcmdevice_block_data *,
-						  cfg_info->nblocks);
-	if (!bk_da) {
+	cfg_info = kzalloc_flex(*cfg_info, blk_data, nblocks);
+	if (!cfg_info) {
 		*status = -ENOMEM;
 		goto out;
 	}
+	cfg_info->nblocks = nblocks;
+	memcpy(cfg_info->cfg_name, cfg_name, sizeof(cfg_info->cfg_name));
+	bk_da = cfg_info->blk_data;
 	cfg_info->real_nblocks = 0;
 	for (i = 0; i < cfg_info->nblocks; i++) {
 		if (config_offset + 12 > config_size) {
@@ -1449,14 +1446,11 @@ static void pcmdevice_config_info_remove(void *ctxt)
 	for (i = 0; i < regbin->ncfgs; i++) {
 		if (!cfg_info[i])
 			continue;
-		if (cfg_info[i]->blk_data) {
-			for (j = 0; j < (int)cfg_info[i]->real_nblocks; j++) {
-				if (!cfg_info[i]->blk_data[j])
-					continue;
-				kfree(cfg_info[i]->blk_data[j]->regdata);
-				kfree(cfg_info[i]->blk_data[j]);
-			}
-			kfree(cfg_info[i]->blk_data);
+		for (j = 0; j < (int)cfg_info[i]->real_nblocks; j++) {
+			if (!cfg_info[i]->blk_data[j])
+				continue;
+			kfree(cfg_info[i]->blk_data[j]->regdata);
+			kfree(cfg_info[i]->blk_data[j]);
 		}
 		kfree(cfg_info[i]);
 	}
diff --git a/sound/soc/codecs/pcm6240.h b/sound/soc/codecs/pcm6240.h
index 2d8f9e798139..e27afd33910c 100644
--- a/sound/soc/codecs/pcm6240.h
+++ b/sound/soc/codecs/pcm6240.h
@@ -199,7 +199,7 @@ struct pcmdevice_config_info {
 	unsigned int nblocks;
 	unsigned int real_nblocks;
 	unsigned char active_dev;
-	struct pcmdevice_block_data **blk_data;
+	struct pcmdevice_block_data *blk_data[] __counted_by(nblocks);
 };
 
 struct pcmdevice_regbin {
-- 
2.54.0

