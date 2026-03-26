Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5520334B192
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 02:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774492274; cv=none; b=jAc+CyPXWfv2EyNnvA1SrRiwZ8Bv/croB+/NDbWqIUvGdFdXiyCbzSaI6mKXGsKBTwpLGsSeuHNYIXlXDkTMlA7TtqjbV3P3zHu6elyWGjIy73p8BEOmXw12eIY3oR4MrhiOsFnPR/v2fyirpC+fR006lqdjzhUDlc7vQ45l6u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774492274; c=relaxed/simple;
	bh=jQfNAZzZ4dda+HzpCv0yCuQI7I25AxD4tAt/W/mftOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gKqnKkterbReTIRJntDepvECHSujVI+1Y/FAt/dFitnNt+0kcJMvEp1Wndrw7pREFXt61ef36u2btBLOtg3EO9SbL1pFQQkTj+soLnXJys9vraMxtq7DVZTRoDJ7YXfEgXSCmeQWVBYv6bXW+zzUH57mPl1D3oAJOtE3u8pjY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLlVGEJQ; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLlVGEJQ"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12776bebe9fso971882c88.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 19:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774492272; x=1775097072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBcJSzFuctU+GfEBiYZvWLtMmVeo006YejPME9qEv9c=;
        b=cLlVGEJQaDqEna6V66S6gjHvuerZfPes7FPEfzX+hWVG1SUD2/ixCFxXR2cZHxBcNG
         9kxUM9pw2lDBaSIbXNWJrQZkywe3OkXNBYlzx1puDpks+xTreldg7mBP0iLYFbpzyCsF
         kiXhJqjzBsYVxPEfPA+qf3/VJTaTKgqCB0hR+2fzCxXL8vJIGoW/HMuygFbyJucVlnxy
         Y2OZG+EyMHS+knvJ8DdN0ooAvcBdJ88QaVp656VFAdvV7OZWGKSfziZ5bBu7w9e16BDE
         t5/ZKg//zdBf9koa0w7aoYVch5LMHh7hBRSKO9FrwQBsePkg72+dlqZQbfFbFkbyTQVC
         bUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774492272; x=1775097072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBcJSzFuctU+GfEBiYZvWLtMmVeo006YejPME9qEv9c=;
        b=Dze8u8LPgTVbY3avW/JD3XC5MovKnILpCtRVXkXDqrCaIRJvUgDjCNPLLBWBF/A5nQ
         KHEhWeSGJc7p5xkC1AJLpD98HE1CgopzRyb+BOL9cHdLjE0hLkxCLJhmKe+nSMhvk0qi
         16ddni6gsVDXC0oNwRNQiUwuhpAZb5XTeadNXBRyBfEXrtcZQN9IWXNt2dNyPg341zCK
         CAuHdN2cVWXtlxEggjxKwWYyU/14bMHXKojzgSWlo7EafM5FSpwfArC4g373NpitLlK6
         VJ+dIawNUR6f4Mks3+7M7Z6HuMqDeumNQtot3rnZgQA3G+HKLOIdVFoxhotG65wSR6M4
         T3zw==
X-Gm-Message-State: AOJu0Yw9FhxW7g/NLhmvxY2s4ol+j2IyCyjqu15NZwnqW++5B6s+pt1J
	YiJCH9A98Ve9jzv2R5sm1myYNbJhTscnXqpFIeKEyozcNtmj9qfvwrSjN8uTAKkE
X-Gm-Gg: ATEYQzz6qM+0gQFL+tK5VFHszFznEolJmoaaergCg2PJnQAF9DPCyIEA5ky/TA2YI4M
	Led6+Va4yE30Fo5eaZJOejRyAHUkDGu6c3IAcfTKU0b4lgGOiLyjNaDM9y1hvnCdeU1h554pQn1
	z0lp/o+k6rkwXO8ws9pVwNUJUqzBB/z9fqHx3Z69btW6B13JWlSOHT5ODi1YbjLKt6tyHgP9odE
	3KeXWUNT4PPWlGmPPabZDKlbO6h8bU+IEC8v+egRBq6B9Zu8ifF/8Uf8ZlbwYLEB7O1waSD6ryr
	KbYSzBITo0G0cE1UPiO0gmE4T+oz6NASiNd2E7VGlfw+eb5GNNaXvgxVvkm5a5U4ZkN/bUfQXDu
	tbSPx4TZKXFehYNkfEwM3qtlcey0TULlD+ilhbFSx0TAyFa4rtDqRTXOBwJv68jZBzf3SHnTzuM
	adRdyJaAS7mYPnC+hzbX85v2+okuBxdLDNo+gzNOlff88ufzS6axXSpag=
X-Received: by 2002:a05:7022:ec86:b0:119:e569:f277 with SMTP id a92af1059eb24-12a96eeafbfmr3092480c88.32.1774492271674;
        Wed, 25 Mar 2026 19:31:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5beb2sm2181796c88.1.2026.03.25.19.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:31:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	sound-open-firmware@alsa-project.org (moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] ASoC: SOF: topology: use kzalloc_flex
Date: Wed, 25 Mar 2026 19:30:53 -0700
Message-ID: <20260326023053.53493-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using a flexible array member.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/sof/sof-audio.h |  2 +-
 sound/soc/sof/topology.c  | 14 ++------------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 80b11625915d..138e5fcc2dd0 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -411,11 +411,11 @@ struct snd_sof_dai_link {
 	struct snd_sof_tuple *tuples;
 	int num_tuples;
 	struct snd_soc_dai_link *link;
-	struct snd_soc_tplg_hw_config *hw_configs;
 	int num_hw_configs;
 	int default_hw_cfg_id;
 	int type;
 	struct list_head list;
+	struct snd_soc_tplg_hw_config hw_configs[] __counted_by(num_hw_configs);
 };
 
 /* ASoC SOF DAPM widget */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 63d637db7053..413003e86f6c 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1908,18 +1908,12 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 		return -EINVAL;
 	}
 
-	slink = kzalloc_obj(*slink);
+	slink = kzalloc_flex(*slink, hw_configs, le32_to_cpu(cfg->num_hw_configs));
 	if (!slink)
 		return -ENOMEM;
 
 	slink->num_hw_configs = le32_to_cpu(cfg->num_hw_configs);
-	slink->hw_configs = kmemdup_array(cfg->hw_config,
-					  slink->num_hw_configs, sizeof(*slink->hw_configs),
-					  GFP_KERNEL);
-	if (!slink->hw_configs) {
-		kfree(slink);
-		return -ENOMEM;
-	}
+	memcpy(slink->hw_configs, cfg->hw_config, le32_to_cpu(cfg->num_hw_configs) * sizeof(*slink->hw_configs));
 
 	slink->default_hw_cfg_id = le32_to_cpu(cfg->default_hw_config_id);
 	slink->link = link;
@@ -1932,7 +1926,6 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 			       private->array, le32_to_cpu(private->size));
 	if (ret < 0) {
 		dev_err(scomp->dev, "Failed tp parse common DAI link tokens\n");
-		kfree(slink->hw_configs);
 		kfree(slink);
 		return ret;
 	}
@@ -2003,7 +1996,6 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 	/* allocate memory for tuples array */
 	slink->tuples = kzalloc_objs(*slink->tuples, num_tuples);
 	if (!slink->tuples) {
-		kfree(slink->hw_configs);
 		kfree(slink);
 		return -ENOMEM;
 	}
@@ -2061,7 +2053,6 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 
 err:
 	kfree(slink->tuples);
-	kfree(slink->hw_configs);
 	kfree(slink);
 
 	return ret;
@@ -2078,7 +2069,6 @@ static int sof_link_unload(struct snd_soc_component *scomp, struct snd_soc_dobj
 
 	kfree(slink->tuples);
 	list_del(&slink->list);
-	kfree(slink->hw_configs);
 	kfree(slink);
 	dobj->private = NULL;
 
-- 
2.53.0

