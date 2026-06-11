Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642FF3F44EE
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179239; cv=none; b=pnXwEQvnGaWdFNa5ipef0WEHBbbRaqmgEImep8/9NGqYz0bZDnfDoJXtKLL3XHwNa6q85uHAYASXeDzCqgkCYtgPbEggcX7BIHMNTmAo+7rmxGCia8SP/E+zPaYMTsd0eT/Tq6qbjYEt1oPWFa+UDgc9zN5Z7xBf/nlAG234Wu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179239; c=relaxed/simple;
	bh=KOzGxnY9BuHYqQLMmgvxFVDbCShW/rX+pxfhkf+OFrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0UFN7Tox0XHyJuR9f1ypfzP3Gxl4c+uZImwCg/p637YgYhye83OwfwXjE64dFlK5zU8tVz/zoppEurijQ8V50lE8uPuLSP7LTnGaXGSP/F3aEj6epLBls9w3z9lQTnc68dhcDaXKUjFSFEUiHHeQQ+mbwIwIclyeHm6q2st8wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvOBiBfF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvOBiBfF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so513697a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179238; x=1781784038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmt4xRAGBzohOMBssTAL2xJoIzokuUutc/sEsRjXxzE=;
        b=qvOBiBfFLHm0IA1zZiMGZq0EKBTmPOZtWd2BFQyHkfAQ+FsroflfsOEIVFcfdvQQUl
         HHzXDLlqUWtOroGU99pDlpdd7U2Ra5pkgYljpUVDjGBysUlDnYr9wwA/0m8k7+B9n7bG
         8WKNLoP8mTUeswTx3V9mh9sWMgYX1rN4x2GfXXFIcYk96AjEBGFVZyyzcXM/xnY/HPrV
         1mkv59FwTo8ZgjZuPbaxCqDdF03PTJRVaOzvxIwvMYftFaFzMy4pBcLEsZV32x/x3Rdn
         khQoQA9kULK/Hk7vHOn2sEN/R82ZxLLm9rJLmBNQGFp2aPPIdzIIyfpTKcjKcquxT6oQ
         oUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179238; x=1781784038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmt4xRAGBzohOMBssTAL2xJoIzokuUutc/sEsRjXxzE=;
        b=U2gDGmIT2NC0S9714c6/yrcyLl/yZaq+Gzgh99Oyc7OXRFyUOgSsPkytaahjDyvSEE
         34FSkaLeBw+vtkkhg75dLNnnR962kFFot3TfFw5FQfYZH6PcPF6DbXdcskDUPhShHcJ1
         iZaCGmAr/OL6RgLGffw8yi4jtIeOB/OWdVc2mL2C8N4P9X+4L9LAuJXs2LNRQ8VpBOqj
         V3n89Qr9GbVvjQpuHSaPLaeUMU5vkMku0gEeWJiv+Cb/wJWhzuKObrI7Lr6NVFClwZIk
         nA/qXmVQ2JnJaIlTnStxsPjy/n4nuHFMZdD/3lFgD8fE+R3pZLA3E1SAScUczYaT4yjP
         P5JA==
X-Forwarded-Encrypted: i=1; AFNElJ8qYo9GydMq/l47wtXtUJW3lr9EC9r1bVp1vjEU+3PxGE3GAC9+Q6Sh5CjGI20K1RY5jnR2mzYIc/Hn0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1nIUFseJUMMIrgH0p/c19CzMrkGGvqZbwk/v4ACzmyY94AKp
	hZSiRdA+wCDhbXqVZQWEunKUpGMUT/685TNXs4VAX1duAbfFFt/7d8WD
X-Gm-Gg: Acq92OHZRKOmwT/lTHgJhGrVu7HMwam2Km4PGcw/OD5CrWcGN+2Z/lzw8eSO3lvdgRz
	H/BpOomrvg7//SwpBZFqi+UteQQSg+6ph2zLf1D3mCK2vdIcvZzL5EvE5lM3Iyhwpu+7ZW8qiiB
	zDl5nyJ+qK/GFepsxkg0Mqniv/Z5mXpKFf3Z6jGez5Rm5vEcC6BG5Kxjah2+EJU0dCQu9rstubB
	er5+9Xsq46nm/TWRnJ3QtMHSDe4u/f7ddjazHJknKFeykomMzjrpKoNrxjR932HCJpm7yxvUjoB
	gQbmhgmYZE7NpVqyFiTruHUi1O6Zq6U7xAi4QieTnKc5Cza8SdSSavhE0voc5ZR55uA35OUKAYM
	+Rx/uBVeZ62lmZEhNc10uAk6iPERSPD2tNlY0ZWLHXAF9JQAnNxKbbUuQNehZIB9IEzLOJz/bat
	D8V32fTFwq0KJzr62aHkWNVsJYSF2f6l3E2mirb4DSqxskvuz7DkccWYvM9lrmoUuBZWbGZyZiB
	+GRZfs=
X-Received: by 2002:a17:90b:3a4c:b0:369:742a:4259 with SMTP id 98e67ed59e1d1-377dfaad4cdmr2158488a91.0.1781179237411;
        Thu, 11 Jun 2026 05:00:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 19/20] ASoC: Intel: atom: sst-mfld-platform-pcm: Use guard() for mutex & spin locks
Date: Thu, 11 Jun 2026 18:59:00 +0700
Message-ID: <20260611115901.80438-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert mutex and spinlock protected sections to guard()/scoped_guard()
helpers and simplify the cleanup paths. Also use __free(kfree) for the
temporary stream pointer in sst_media_open().
This is purely a code refactoring with no intended functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 51 ++++++++------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index f074af2499c8..f9df5694f049 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -32,16 +32,15 @@ int sst_register_dsp(struct sst_device *dev)
 		return -EINVAL;
 	if (!try_module_get(dev->dev->driver->owner))
 		return -ENODEV;
-	mutex_lock(&sst_lock);
+	guard(mutex)(&sst_lock);
 	if (sst) {
 		dev_err(dev->dev, "we already have a device %s\n", sst->name);
 		module_put(dev->dev->driver->owner);
-		mutex_unlock(&sst_lock);
 		return -EEXIST;
 	}
 	dev_dbg(dev->dev, "registering device %s\n", dev->name);
 	sst = dev;
-	mutex_unlock(&sst_lock);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(sst_register_dsp);
@@ -53,17 +52,15 @@ int sst_unregister_dsp(struct sst_device *dev)
 	if (dev != sst)
 		return -EINVAL;
 
-	mutex_lock(&sst_lock);
+	guard(mutex)(&sst_lock);
 
-	if (!sst) {
-		mutex_unlock(&sst_lock);
+	if (!sst)
 		return -EIO;
-	}
 
 	module_put(sst->dev->driver->owner);
 	dev_dbg(dev->dev, "unreg %s\n", sst->name);
 	sst = NULL;
-	mutex_unlock(&sst_lock);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(sst_unregister_dsp);
@@ -103,21 +100,15 @@ static int sst_media_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 void sst_set_stream_status(struct sst_runtime_stream *stream,
 					int state)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&stream->status_lock, flags);
+	guard(spinlock_irqsave)(&stream->status_lock);
 	stream->stream_status = state;
-	spin_unlock_irqrestore(&stream->status_lock, flags);
 }
 
 static inline int sst_get_stream_status(struct sst_runtime_stream *stream)
 {
-	int state;
-	unsigned long flags;
+	guard(spinlock_irqsave)(&stream->status_lock);
 
-	spin_lock_irqsave(&stream->status_lock, flags);
-	state = stream->stream_status;
-	spin_unlock_irqrestore(&stream->status_lock, flags);
-	return state;
+	return stream->stream_status;
 }
 
 static void sst_fill_alloc_params(struct snd_pcm_substream *substream,
@@ -304,7 +295,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 {
 	int ret_val = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct sst_runtime_stream *stream;
+	struct sst_runtime_stream *stream __free(kfree) = NULL;
 
 	stream = kzalloc_obj(*stream);
 	if (!stream)
@@ -312,15 +303,14 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 	spin_lock_init(&stream->status_lock);
 
 	/* get the sst ops */
-	mutex_lock(&sst_lock);
-	if (!sst ||
-	    !try_module_get(sst->dev->driver->owner)) {
-		dev_err(dai->dev, "no device available to run\n");
-		ret_val = -ENODEV;
-		goto out_ops;
+	scoped_guard(mutex, &sst_lock) {
+		if (!sst ||
+		    !try_module_get(sst->dev->driver->owner)) {
+			dev_err(dai->dev, "no device available to run\n");
+			return -ENODEV;
+		}
+		stream->ops = sst->ops;
 	}
-	stream->ops = sst->ops;
-	mutex_unlock(&sst_lock);
 
 	stream->stream_info.str_id = 0;
 
@@ -330,7 +320,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	ret_val = power_up_sst(stream);
 	if (ret_val < 0)
-		goto out_power_up;
+		return ret_val;
 
 	/*
 	 * Make sure the period to be multiple of 1ms to align the
@@ -347,13 +337,10 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 	snd_pcm_hw_constraint_step(substream->runtime, 0,
 			   SNDRV_PCM_HW_PARAM_PERIODS, 2);
 
+	stream = NULL;
+
 	return snd_pcm_hw_constraint_integer(runtime,
 			 SNDRV_PCM_HW_PARAM_PERIODS);
-out_ops:
-	mutex_unlock(&sst_lock);
-out_power_up:
-	kfree(stream);
-	return ret_val;
 }
 
 static void sst_media_close(struct snd_pcm_substream *substream,
-- 
2.43.0

