Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6304935676C
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541213; cv=none; b=FwVcRBcHVPYf2v5Wz7Ier+cy4rl+3Mihkc6atNwSKhMknPF+wrAvcmPGTSs/VSU/hGXTecajJIoR4ZJJgB48VRCJPfYzz3ZIrc1Dzp6eSceoRW4ucYs2j/dVw8S+SgEybzFeBtgfj2IlDFNDXC9tH0bziio297mKVZsL56BxqAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541213; c=relaxed/simple;
	bh=lyut248ohL8lMiQjhMEr4em5gqDx1XiavnPgwudBiiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6vyFG2NcKG3bJWqm8H8zDkUTwzosW2GurhEgZtunssGepo4C4NXhVJizm/M/zodno+TzDsgvP0WmGFvRqqau0u9mgUvo7nI5naqAh6VgrJi8/xQAfrj6GPyYMf7Ds1wtWWiIf0oYoN6fWs7XVq2EcdONgtOkMQJ/mKlmZMWRfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRrwrcnK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRrwrcnK"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-366070f71adso4341917a91.2
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 16:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778541211; x=1779146011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFgRqIfPnwsr89P7tCB0q0/8N2KZaaQUIqXtzxlp1YE=;
        b=WRrwrcnKO3PCPK/MKwI7Ku0rHvDItL7Mdtv0aHQi1Zn2UFIc/aUX3zGsr6G6qePixX
         3hPio+d5cVPjYhh5UskHCbUdMEXUeg5x1qT6msMzeFOl7HIJEHCVjmD1FBeJFBrMJw/X
         6+JMtHf7ltkUMt4NQhQ0fyEF2UG/OvnH2uQ9NmG9qTwMHpjPkRx5DlJSHEwuAQqJ5axF
         5nzusuddMw1E4OwgXZzQtyWjLxbGUm3+MtfhJ77jAeiULkucvnDscZYFvAq7Mz56rLMF
         eO5EyEdwRfckgsFyupL+LzEzNYYVnty1ViAe0yEX50GVymAtoNMOg6uIEV3GnXl1ys87
         DlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778541211; x=1779146011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFgRqIfPnwsr89P7tCB0q0/8N2KZaaQUIqXtzxlp1YE=;
        b=n1Q7hCzclZy0iACCGOhn7CuFY4fP7W+RLn3qUyyqi08WuMIZDC9avnZSCp9I/8xHCT
         u4Uo+w5A4xi4qw6Mq0Z4G3rXeI11zX3xv+QGF6Tl5Sfev8bwpLyDKMc2gMR00ceTmFE7
         DYZhFivsN+sQtOIyijjoTa4NkafQoMOR003zcM+5gCq/WLOyA7LPMYnAyt5lOm5ltEL6
         ybcgVmePDmzIEGDivZpc0HJBnKYWBbtxIdaHpU2mM7+hiCkIMdvsPvnpAQ8VDqGPtug5
         9Ooc/eUf9iHeZWSVtpZt92KxO2nTdoGD+dSMIOVW4aQqN51TjXzZZbdpDeWS6LAOWz77
         ZkJg==
X-Gm-Message-State: AOJu0YzjVlVlA3qg38gPJpkNF5DoN1I5X8oZSzV7deduuCt24pGVulbY
	MZItWQMiPr9lNC4ToWHr4x1b4bIvNKJ29yxqII9a6l5yoRjbufOlNYWsbBFMqtKP
X-Gm-Gg: Acq92OFhRdpuO1g9fMUKhJGtoPzB7CXYnS7HdwSnyvB0Y/IMsdcwcpL/XV88MO5J1uH
	YK0/9iu+eNNfmQKkr38308poUt4Chj3h1XO/xjiNgAHeb4sfaVoDPTYjnUuPoCvDAH8yXmccaxY
	IvQOleqqccYaOI82/hOW07mZx1Rqf4N1U16ZwPuxjz8sFQFdMTjUgALTKv8i7YvnFvfqaYd8w/D
	7nXvcxFoJHHW3XIL3n99WAJKC8RyGkm85qn6xe8Sg10VNVvaIbJ0rEJJpSD0RzterIJbuP6kG7d
	AqO7B3G+TFmX6t4b/FqunP53KLbwTtJYl0LLlzE6DT7++5wQmKFOsvIVRniokxbfnB5wuAG5fIq
	fhnvtgiBJnL5gmih41FaX3wF4ylgyNd0wYfX1hIvRIL+Qf8c1EaNh/ywrOM7kJuzKNzCIYDzXdV
	MSN0kJ1/xIsuxPg2InxCDFFQPtfF7BVptLqsY+2TZ7VVIVRsfTc3nh3up357ityxnIRDQ232HG2
	Uo82IWIXSsxbwrXDRlg+4GEbOdtku3yttFa0km2kinWSA==
X-Received: by 2002:a17:90b:578d:b0:35f:b5df:450 with SMTP id 98e67ed59e1d1-365ac2807f0mr26507247a91.19.1778541211167;
        Mon, 11 May 2026 16:13:31 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623f7bcsm8839486a91.4.2026.05.11.16.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 16:13:30 -0700 (PDT)
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
Date: Mon, 11 May 2026 16:13:13 -0700
Message-ID: <20260511231313.31929-1-rosenp@gmail.com>
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

