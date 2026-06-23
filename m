Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3E3D333F
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212288; cv=none; b=Hfjsmsl6suYG67Z52n22F/QsF2pqR7Yi8gmc72YPMnGyk3cVNb9igjcjpacHFTeaQ0MHf7tyNI4HfSMliXk+yQc5f5R1IPDY76/NyosanVY5pw9YI1Id0cn+N1eOfFPuXZoBky49/+jkABZscVd7vJ+QIsdfedFJr+myptDGOIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212288; c=relaxed/simple;
	bh=1fU1m7A2RzrLttLWKqmPcaoHZ0uQCzG4IEWSfEhpfDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxlEog+airAVy4A1NohNfQvEkm5mbadu0FWGe6dmEL+g5oJ0JvAKcUQDEaWN/19PtJxtaL9q0BYCfIMWh59GAq5Y5IweJxjlMsyteaQ+7UOy2vlLZG/mjAWmGp3EmFOlIK+C95ggX6UW+9ROZDxxyAy/HA9mmk33kil9D2pmZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxHUCWJ9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxHUCWJ9"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-845438a46d4so3000974b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212286; x=1782817086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSkBkGIh7R9LORMPNoKCbTLto2z7mKI2SBmtDS/VM3o=;
        b=lxHUCWJ9Vku8gR15hCHpGisWoXTP6goy5ac08ic6BXGlpD88Cc247rJQyx6soV42Iv
         jgWurkQHBwthHjDSTZifblgZa0pxC9f6ypHPV9M++rlRizIeKvW0nQOXck/WQDWY4wzb
         PRo8FHtRlknOyMn04g9Ff+6Q7O8nBZJlPnb7/kHZKyCl3GpojtTWNqz63SJEyNJifXZB
         R0pCmff0i1E9QSq/NUh3p3ufcry8qh+HOVzu51ZA3NIpzf89AG5nhBqlwPq00SA0meKH
         anUVIXOzHVWMX9FIM7fq9y2H3lEMYS3Z48Wq2XAMOQfCAx4+rytBNCmcxlT5RDaPUw/m
         KJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212286; x=1782817086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSkBkGIh7R9LORMPNoKCbTLto2z7mKI2SBmtDS/VM3o=;
        b=UK4DpIVTT4L8SGSxh67GHdV29y+kZKnVPz1OlPCpnDhx+3esOF9lC3ixVxOv/8gA85
         rWPqV5HPl4PxKbr9EoMPydsgGm4+ujarMaJKaRFyHNmREVdb10oZmfDsSsiYV1OnUYOm
         okTShgqTEiIvr39yLiHJMi3XKE4lB7BZmNVQj6981ua+SJQ4vIY85RgZI5bF4AUsqh2D
         wIJUHQmtaGpCDdlo491kr/nL/wkFbZkH0G/Md4LUhf9CubId9FQNEV3q83n1dimi29I1
         jL49DCdzdRGfnjMPV5eYSFJMGI0odgEHhGndRp7pDFcLwDIM4NAUc5XExg6oLg0+V9Ba
         fmVA==
X-Forwarded-Encrypted: i=1; AFNElJ/H6fzQfXhX1HpxkeHGlATJx1Kg4neBGHTyRJM8GHjHSxRt4XQtpmNkRosi5SVIPrLcYu5QUVvBjWIvuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj6GNL0brJvSqMaeOloZQ9JezboPf6ZllHO8Q7HmYY2bDaLTXV
	1NMQ3OYFpUm5M4VsOIwCPKe7fRq73zYGoydB1ZsZysVGPLSr/vAN6ell
X-Gm-Gg: AfdE7ckeiFltaLebfvJE/VQjqSng4r1k6FtSTi0rkmaGBMri3g5z9R+FHJwG6vcsHXx
	a8xb4yU7xRERFR8HPkddZ6WIKDUZVF7uRoD3k4r70R6uE+FaagO9g+Jg7SLMQLGpMOaSDJdIuRJ
	U2ZGykXr83yRExUE01OWAXKNp53JeUjJEz8rTJLP/h7xS64zx8l69XB7liktGWF3Bpu5UIqZO3D
	QQK8vyTNf+fzjUIMj5A+zKSzanaPpaJpxZ14jA7DmeUiwqCc6d/GuvPWZSLXGj34yM54lgTvQTY
	pIeef4WIOJxC2FmMNbESROEOMe94q5ZicwFWraN6sDNdmsuDIyV/ORLzH7Cl1z05i8SGGWDXYEY
	R653CQBq3DCvAvRDhKmSdBJ6qRIh1xmHsdFTkTAPZTinwEDUdOARo7GXjsvtmFtUxZcQEmRBqIi
	bMELebgDUAYfWROAyaWObClEu9mI1TOTb6zk9PCffNt+SZszY=
X-Received: by 2002:a05:6a00:2a03:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-845970eb55bmr2494556b3a.21.1782212285994;
        Tue, 23 Jun 2026 03:58:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d68130sm12343868b3a.10.2026.06.23.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:58:05 -0700 (PDT)
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
Subject: [PATCH v3 5/5] ASoC: Intel: atom: Use guard() for locking
Date: Tue, 23 Jun 2026 17:57:21 +0700
Message-ID: <20260623105721.25865-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623105721.25865-1-phucduc.bui@gmail.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-atom-controls.c     | 28 ++++++--------------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 25 ++++++-----------
 sound/soc/intel/atom/sst/sst_ipc.c           |  4 +--
 sound/soc/intel/atom/sst/sst_pvt.c           |  8 +++---
 4 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 6f3a0646f6a0..56e64bacb292 100644
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
index f679258a030e..8275ad6d3126 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -32,7 +32,7 @@ int sst_register_dsp(struct sst_device *dev)
 		return -EINVAL;
 	if (!try_module_get(dev->dev->driver->owner))
 		return -ENODEV;
-	mutex_lock(&sst_lock);
+	guard(mutex)(&sst_lock);
 	if (sst) {
 		dev_err(dev->dev, "we already have a device %s\n", sst->name);
 		module_put(dev->dev->driver->owner);
@@ -41,7 +41,7 @@ int sst_register_dsp(struct sst_device *dev)
 	}
 	dev_dbg(dev->dev, "registering device %s\n", dev->name);
 	sst = dev;
-	mutex_unlock(&sst_lock);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(sst_register_dsp);
@@ -53,17 +53,15 @@ int sst_unregister_dsp(struct sst_device *dev)
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
@@ -103,21 +101,14 @@ static int sst_media_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
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
-
-	spin_lock_irqsave(&stream->status_lock, flags);
-	state = stream->stream_status;
-	spin_unlock_irqrestore(&stream->status_lock, flags);
-	return state;
+	guard(spinlock_irqsave)(&stream->status_lock);
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

