Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AFC3EFFDB
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780842; cv=none; b=Lk999fTtEqxem/5hK9RlqBiXGjPmbRjKA9EiUEJd5K1mL46x2FI5cSBTUiz46wMtGlF1cV6c++DarwojSmD507iLX2wBRFmwL5KvJv973EDWdRPP1pC9OIKr8dpETN8F9IURlKhHea1CCOrVQ/C2gVgJJMUNo0Pu1kmbNyvxmRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780842; c=relaxed/simple;
	bh=pKr3AYdU8CnyimxDI+6+m/7Iq1f7qmLh28rEgagfxEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJ24t8IqxsOtbp6Dwgw3NVFUhLE2u3bl2gfnwJHjHaze3SAs54CQ8x2zlcPqo7Nmumw9hDzK6AtJcofqU2QaQmzTWm6ns0jhT6/DNXEZt8QZuF0yeZomPuPsz3CquDA3+9J3rPLXMjWH6PNNLWoMtCXXArGSeneZ2IFOZ1SuoKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpqN7tSl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpqN7tSl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf22d29dabso5147725ad.2
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780840; x=1782385640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6MEcBFn1olrju24gIPdkb7TZ2qi41I337ZcWJqGq3g=;
        b=TpqN7tSlUEYSv5Y9uyGfIFRJjxrJ1par7XKJ602fnMeX0GwreluKV2iV4beW6lm+bx
         wNLxhJ4k/mNCONxCQdVkWNQc7xgaum38iignVKDotnOqsGtEgDbgd1bNArg30YyaxCOS
         M19bAde/uSf09A39ECWZfK577cL3KpDJzSCEiGLLENgTMTr0KrUgSgNpyZZIP6DHRcfA
         LHoNy1Ru+EcgrBv4HZl9T8czvbU0u0iybwfPnu0RfBlrO5aE+2jLp/0rcbIXdTehdT/v
         QG7e5fuI350dHIcR5SFcuFqrmHy5Hg+nqMiR0pmE/ISirf25aWI1ER/KDNc0N7QJhYL3
         O4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780840; x=1782385640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q6MEcBFn1olrju24gIPdkb7TZ2qi41I337ZcWJqGq3g=;
        b=h95uGSPMLrteXrgGPVnjAuxorUN+xQTmRsf9Ia3xyzYkFmDR3AZtxftXjgvwWRD+rW
         tkUjxaVcEby/XP4J57BbFZm7RNE9RRUgnR3iqz2VX6Zfcpw/VZX+5k3WzqDBrLrF3/Bj
         asjbq0BsDeLsxeKLJzZv20fuW4HkO44H8v4Uq0GRjV046iC9Ry70WJrYLFejfKQiDI48
         P/2t1R+LcGGUfQkGVxuMNJ+DHtvK+YHGRjttBG/Pd06fZ1VxX0kHOsKlyzUjFzyW//7u
         3LZ+wWh46s+soj9Z2aHP6F4w0GKXuACdKz1uUhXZTlBuSg2PBcgb1DhJaqSurV2ZXxKx
         zCiA==
X-Forwarded-Encrypted: i=1; AFNElJ+c5XU58XwAuUgSB82LnHvWdSWsb0SjaWt9mUgoZ2Oz/jVx6omBHSjAtfJfreV2z2KjRBCTs1rCiZqjpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxosQ5XorPyQLTM7XhKaaAsOaVEk0gu2+6EiPDl92y3imlg8gp0
	kXEdtvk65WzA7gdYogmnO0h5ElADGP5wfrH+8uVUw1mlIOz/aKXJpJCM
X-Gm-Gg: AfdE7cnNykZMhfCFp+fWZXGdOYRHENvRD1eW6Q58gThGfaE62kgz16Ek22gFczVww25
	z3yhxIO1mppINWL8/n3CR1HW/QAKVvSLKIO04baKzbie8AWvuaevXQOxJLXFuY8D1mTmK1l8L2G
	jjll7EidGUouITB61XC29toV4X+a56y/ztzHsNRWw16hMxhIY8dqp5BQNqYjJMgshZlu7yPPIKu
	FJN/6eEY7pvsBt85NxjynBRYAJT2nnW7p4qYzGpiX56iSJpDesuZc+5Gm642yA1WvtVoePmFu1o
	3aMb5mr8QwyPgmzmJmm7akh+NdK3Vgj0ekRUZSq8FOBEwIebz5woeyVH33ZMU6l9GXUgHVhmbVT
	XEJbP4OcqaicnMYSZttMliPo9oZstYTsGp/Gbn2knuuwby74wQj6J9KGAco7pFAGaD2ZvP15kMI
	XtOCvczhvhNvK4QJICH51+3bxOOORIUiUuMP6gR9P/wrhM6ONmfPMiUPqnUA==
X-Received: by 2002:a17:903:1a0b:b0:2c2:8659:da43 with SMTP id d9443c01a7336-2c6f340c798mr31266875ad.4.1781780840301;
        Thu, 18 Jun 2026 04:07:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a1878426sm77828025ad.64.2026.06.18.04.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:07:19 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ASoC: Intel: atom: Use scoped_guard() for scoped locking
Date: Thu, 18 Jun 2026 18:06:47 +0700
Message-ID: <20260618110649.227062-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110649.227062-1-phucduc.bui@gmail.com>
References: <20260618110649.227062-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert mutex-protected sections to scoped_guard() helpers and
simplify cleanup paths. Also use __free(kfree) for the temporary
stream pointer in sst_media_open().

No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-atom-controls.c     | 36 ++++++++++----------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 26 ++++++--------
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 3629ceaaac17..60fe1453d047 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -761,27 +761,27 @@ int sst_handle_vb_timer(struct snd_soc_dai *dai, bool enable)
 			return ret;
 	}
 
-	mutex_lock(&drv->lock);
-	if (enable)
-		timer_usage++;
-	else
-		timer_usage--;
-
-	/*
-	 * Send the command only if this call is the first enable or last
-	 * disable
-	 */
-	if ((enable && (timer_usage == 1)) ||
-	    (!enable && (timer_usage == 0))) {
-		ret = sst_fill_and_send_cmd_unlocked(drv, SST_IPC_IA_CMD,
-				SST_FLAG_BLOCKED, SST_TASK_SBA, 0, &cmd,
-				sizeof(cmd.header) + cmd.header.length);
-		if (ret && enable) {
+	scoped_guard(mutex, &drv->lock) {
+		if (enable)
+			timer_usage++;
+		else
 			timer_usage--;
-			enable  = false;
+
+		/*
+		 * Send the command only if this call is the first enable or last
+		 * disable
+		 */
+		if ((enable && (timer_usage == 1)) ||
+		    (!enable && (timer_usage == 0))) {
+			ret = sst_fill_and_send_cmd_unlocked(drv, SST_IPC_IA_CMD,
+					SST_FLAG_BLOCKED, SST_TASK_SBA, 0, &cmd,
+					sizeof(cmd.header) + cmd.header.length);
+			if (ret && enable) {
+				timer_usage--;
+				enable  = false;
+			}
 		}
 	}
-	mutex_unlock(&drv->lock);
 
 	if (!enable)
 		sst->ops->power(sst->dev, false);
diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index f074af2499c8..ce2814e206e1 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -304,7 +304,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 {
 	int ret_val = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct sst_runtime_stream *stream;
+	struct sst_runtime_stream *stream __free(kfree) = NULL;
 
 	stream = kzalloc_obj(*stream);
 	if (!stream)
@@ -312,15 +312,14 @@ static int sst_media_open(struct snd_pcm_substream *substream,
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
 
@@ -330,7 +329,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	ret_val = power_up_sst(stream);
 	if (ret_val < 0)
-		goto out_power_up;
+		return ret_val;
 
 	/*
 	 * Make sure the period to be multiple of 1ms to align the
@@ -347,13 +346,10 @@ static int sst_media_open(struct snd_pcm_substream *substream,
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

