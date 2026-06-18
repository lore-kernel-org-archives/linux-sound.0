Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9A3EFFDB
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780850; cv=none; b=JdBzl5GKqGey5Zyxs1CpQxYJX7yBNHV3Krm4IQ9/tM3YxcZVAW77PwsiHGAoZn1G56hWW9gqSO4Kuf2tjcIO4aB5oxR1a3I3OkiKsBPUD0TINH8jOWlcKDi0RBmEOlY9nhbAaaOeaq8jAkUcqfAp5ycUUCVmlXS3QVVkTUz9+nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780850; c=relaxed/simple;
	bh=5KlzwEdbAuS7Fci58MEpfCxMq/7LN3Sf7AeTYyk2Mgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNBYRoiF+qyl9eeThwaazFKVx5RmgaaMJn30eGI5vKOe1EY3MYZ0pM95KqcKsCWqny+16oUGz8z7ElfO5iEzCPThgCC6QbWDQNPd2a70RfLXESwLmyrRo4YiAcq4SyAy5ATKsS77XVJTjX7QRsgtQ2wuHVZQzl7o/sFyM+9oebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0RkxWf9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0RkxWf9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6d4851142so9065015ad.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780849; x=1782385649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMdkUYKjonl/N+cCxaZ7FCNP+F258YD+JL2IKsJVIso=;
        b=s0RkxWf93GPSt3oUQcf4RWnXswz5IaVLfqlCGfsJDek3OyS39B3GGgOVNcnWw0smzo
         Wc2Sp4kGADDwsh+Fe28kWJxnboicFFk3viAXcc1c1/QbfypuXhO1uBWuf4Way45Fu+VP
         8MHff7aIzQkT3UnYNWBSH8St1DtMZQ4Zm47741ZK6sY35SiC4/2YbHwM8EyHIgbJWO7b
         kmsdG9p9Bktkw43q29wNXgzzi2ISUWy7iaghg6hVaI7lJkx0BQwaH8KTjT3Zp+CBRFUv
         XfEQeDG1pcaVYRveAUYcgUEjjGXBj5n/Mx8D5ToK/2e+JbjMVE3UmV01O17NVwTlVoQQ
         HO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780849; x=1782385649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMdkUYKjonl/N+cCxaZ7FCNP+F258YD+JL2IKsJVIso=;
        b=B4JjKhNyMN1f7B31RJKWmHzxVpxwnLiQsQNtNnBY4ZwXE5Fz2/5PWI23kckl7TkLFv
         Ba0aZXD5mw7xZc2++Uuj5nhrda9a1uuhpwPHhODg8RwPiU6np+lMvs289LYk8YRytMWu
         n71M32jHQgy7Q/eCK63d/MDXi6D/bxlEm8+3aOnmLGKRUBQfqo6MJohKAu640gLvjq9E
         rnq5ltDcM1qLhxsOKlhqzotspA+S/+clH4WXHy2NHvZSKQbQdovK0LNdNGG30P/UCebJ
         7LZJjHm6C+M/YvXbGgwNAUdcmQEEJZZFkC6nmVP5GC0xawKa0cVhvzHMBnJV5RfdyVBh
         Zw/g==
X-Forwarded-Encrypted: i=1; AFNElJ88/nLuEYOBdty+3fexvjWmOwKamSlM9U+2y0hQY2qEVOCeffW9wqDk0dPOTjBnC+4M5vRswWFs539MWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymtoKRnFgBOVBN0NDfXDjTzuvfAMrimtvj3HuUpM3wI+44fOm+
	++PUTzuESJA5cwGK0H3bQEnar3T2dLlGGlzCl2mRUOfgFmp3AYnen1zM
X-Gm-Gg: AfdE7cl7zvWEKWVU09jASfwltGhYdN0eHi6KufkG+DNBcC4wwMEeHO+mDNZLj0s9GRo
	JQoTA+8vvgdjcWNHo9M6XuOMyIkGm2/V999K2jgKQZLNA0esyyOCSkq1aXLcK9SQTQgsZ93fFxg
	+H/HuofeJtWKkVnXuNUBBrnlhi6JXYT4ML4n+hJp72fVn1R18Cyv9IY+N/5LSEpdmloPo5TbetY
	jIFt6yDkbqFIGTeZdyz6X7iSECuqj1xFp2VHk3KM0XjTlxvBlfePlmu7pbpwxlAyHxJPfp1tr4A
	B8XMxYoq6uGLNuqInzQBrQCNWaATdlWrYqOSVb5KhH7lmgRaAaCkLEhaaRSjb2HrkOSJxMluHeo
	PvUS89EqTKu+clb24YMLOPspLz9Yz2kiQA+BUIcF2lc85ytR5k8yonoAiMhazqMY/3zHzhID16m
	/7SaplyndNhp4ovlQ6Z1M/j+P9cL+V3hef0TEpgY3Rw+EFjNg=
X-Received: by 2002:a17:902:e84b:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c6de66740amr31457225ad.14.1781780848308;
        Thu, 18 Jun 2026 04:07:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a1878426sm77828025ad.64.2026.06.18.04.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:07:28 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: Intel: atom: Use guard() for locking
Date: Thu, 18 Jun 2026 18:06:48 +0700
Message-ID: <20260618110649.227062-5-phucduc.bui@gmail.com>
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

Clean up the code using guard() for spin & mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-atom-controls.c     | 28 ++++++--------------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 25 ++++++-----------
 sound/soc/intel/atom/sst/sst_ipc.c           |  4 +--
 sound/soc/intel/atom/sst/sst_pvt.c           |  8 +++---
 4 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 60fe1453d047..7d54af5286a7 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -73,14 +73,10 @@ static int sst_fill_and_send_cmd(struct sst_data *drv,
 				 u8 ipc_msg, u8 block, u8 task_id, u8 pipe_id,
 				 void *cmd_data, u16 len)
 {
-	int ret;
+	guard(mutex)(&drv->lock);
 
-	mutex_lock(&drv->lock);
-	ret = sst_fill_and_send_cmd_unlocked(drv, ipc_msg, block,
-					task_id, pipe_id, cmd_data, len);
-	mutex_unlock(&drv->lock);
-
-	return ret;
+	return sst_fill_and_send_cmd_unlocked(drv, ipc_msg, block,
+					      task_id, pipe_id, cmd_data, len);
 }
 
 /*
@@ -167,7 +163,7 @@ static int sst_slot_get(struct snd_kcontrol *kcontrol,
 	unsigned int val, mux;
 	u8 *map = is_tx ? sst_ssp_rx_map : sst_ssp_tx_map;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	val = 1 << ctl_no;
 	/* search which slot/channel has this bit set - there should be only one */
 	for (mux = e->max; mux > 0;  mux--)
@@ -175,7 +171,6 @@ static int sst_slot_get(struct snd_kcontrol *kcontrol,
 			break;
 
 	ucontrol->value.enumerated.item[0] = mux;
-	mutex_unlock(&drv->lock);
 
 	dev_dbg(c->dev, "%s - %s map = %#x\n",
 			is_tx ? "tx channel" : "rx slot",
@@ -235,7 +230,7 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 	if (mux > e->max - 1)
 		return -EINVAL;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	/* first clear all registers of this bit */
 	for (i = 0; i < e->max; i++)
 		map[i] &= ~val;
@@ -244,7 +239,6 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 		/* kctl set to 'none' and we reset the bits so send IPC */
 		ret = sst_check_and_send_slot_map(drv, kcontrol);
 
-		mutex_unlock(&drv->lock);
 		return ret;
 	}
 
@@ -258,7 +252,6 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 
 	ret = sst_check_and_send_slot_map(drv, kcontrol);
 
-	mutex_unlock(&drv->lock);
 	return ret;
 }
 
@@ -354,13 +347,12 @@ static int sst_algo_control_set(struct snd_kcontrol *kcontrol,
 	struct sst_algo_control *bc = (void *)kcontrol->private_value;
 
 	dev_dbg(cmpnt->dev, "control_name=%s\n", kcontrol->id.name);
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	switch (bc->type) {
 	case SST_ALGO_PARAMS:
 		memcpy(bc->params, ucontrol->value.bytes.data, bc->max);
 		break;
 	default:
-		mutex_unlock(&drv->lock);
 		dev_err(cmpnt->dev, "Invalid Input- algo type:%d\n",
 				bc->type);
 		return -EINVAL;
@@ -368,7 +360,6 @@ static int sst_algo_control_set(struct snd_kcontrol *kcontrol,
 	/*if pipe is enabled, need to send the algo params from here*/
 	if (bc->w && bc->w->power)
 		ret = sst_send_algo_cmd(drv, bc);
-	mutex_unlock(&drv->lock);
 
 	return ret;
 }
@@ -475,7 +466,7 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 	struct sst_gain_mixer_control *mc = (void *)kcontrol->private_value;
 	struct sst_gain_value *gv = mc->gain_val;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 
 	switch (mc->type) {
 	case SST_GAIN_TLV:
@@ -497,7 +488,6 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 		break;
 
 	default:
-		mutex_unlock(&drv->lock);
 		dev_err(cmpnt->dev, "Invalid Input- gain type:%d\n",
 				mc->type);
 		return -EINVAL;
@@ -506,7 +496,6 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 	if (mc->w && mc->w->power)
 		ret = sst_send_gain_cmd(drv, gv, mc->task_id,
 			mc->pipe_id | mc->instance_id, mc->module_id, 0);
-	mutex_unlock(&drv->lock);
 
 	return ret;
 }
@@ -521,10 +510,9 @@ static int sst_send_pipe_module_params(struct snd_soc_dapm_widget *w,
 	struct sst_data *drv = snd_soc_component_get_drvdata(c);
 	struct sst_ids *ids = w->priv;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	sst_find_and_send_pipe_algo(drv, w->name, ids);
 	sst_set_pipe_gain(ids, drv, 0);
-	mutex_unlock(&drv->lock);
 
 	return 0;
 }
diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index ce2814e206e1..f9df5694f049 100644
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
diff --git a/sound/soc/intel/atom/sst/sst_ipc.c b/sound/soc/intel/atom/sst/sst_ipc.c
index 0d5e71e8a5b5..6daebbcdaddb 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -180,9 +180,8 @@ void intel_sst_clear_intr_mrfld(struct intel_sst_drv *sst_drv_ctx)
 	union interrupt_reg_mrfld isr;
 	union interrupt_reg_mrfld imr;
 	union ipc_header_mrfld clear_ipc;
-	unsigned long irq_flags;
 
-	spin_lock_irqsave(&sst_drv_ctx->ipc_spin_lock, irq_flags);
+	guard(spinlock_irqsave)(&sst_drv_ctx->ipc_spin_lock);
 	imr.full = sst_shim_read64(sst_drv_ctx->shim, SST_IMRX);
 	isr.full = sst_shim_read64(sst_drv_ctx->shim, SST_ISRX);
 
@@ -200,7 +199,6 @@ void intel_sst_clear_intr_mrfld(struct intel_sst_drv *sst_drv_ctx)
 	/* un mask busy interrupt */
 	imr.part.busy_interrupt = 0;
 	sst_shim_write64(sst_drv_ctx->shim, SST_IMRX, imr.full);
-	spin_unlock_irqrestore(&sst_drv_ctx->ipc_spin_lock, irq_flags);
 }
 
 
diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index 67b1ab14239f..c872a5958f1d 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -64,9 +64,8 @@ u64 sst_shim_read64(void __iomem *addr, int offset)
 void sst_set_fw_state_locked(
 		struct intel_sst_drv *sst_drv_ctx, int sst_state)
 {
-	mutex_lock(&sst_drv_ctx->sst_lock);
+	guard(mutex)(&sst_drv_ctx->sst_lock);
 	sst_drv_ctx->sst_state = sst_state;
-	mutex_unlock(&sst_drv_ctx->sst_lock);
 }
 
 /*
@@ -302,18 +301,17 @@ int sst_assign_pvt_id(struct intel_sst_drv *drv)
 {
 	int local;
 
-	spin_lock(&drv->block_lock);
+	guard(spinlock)(&drv->block_lock);
 	/* find first zero index from lsb */
 	local = ffz(drv->pvt_id);
 	dev_dbg(drv->dev, "pvt_id assigned --> %d\n", local);
 	if (local >= SST_MAX_BLOCKS){
-		spin_unlock(&drv->block_lock);
 		dev_err(drv->dev, "PVT _ID error: no free id blocks ");
 		return -EINVAL;
 	}
 	/* toggle the index */
 	change_bit(local, &drv->pvt_id);
-	spin_unlock(&drv->block_lock);
+
 	return local;
 }
 
-- 
2.43.0

