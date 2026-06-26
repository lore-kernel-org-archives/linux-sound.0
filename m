Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4991B3E51F0
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462585; cv=none; b=HJetqusQpGoy95jVPW4vkkk5XUjII+7t/UAwda4qJZ9ReYCN4njxQlZECEvJMEv0gUjwmNolt3e4YLGIt+TBVYY1UgCOZC6N0Oy3QD0UOq4ZgLWXrX3aWLn3soK7jHZ5PmYf549DjlrouJHDml+Gz9lj1N9uyNnk7P+PZ2U1P8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462585; c=relaxed/simple;
	bh=r6ED3DAlYX0oBhJXKiJu8nOAGzsgJwl2CDA7zeJMdkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdujWCJwcKTaU6PlPhYl/ljy0N86UjHwBwMjN72KHnpEP0IXuNdcKUUqz1YEJRssqciTFzBGYhO4CUA/I5RZbSb6JcUUioBaggXg60F5FITRSu1+ViozH6A69GdRFdve9fVimKQYetQkIIHFHMWYXLYira+4bxOj+RtOhrI6rgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=del5WfDR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="del5WfDR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so316340b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782462583; x=1783067383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUAyMW6jsnMMGihQJytM2d9QsUcNRXojRPIgbvjHmgc=;
        b=del5WfDRI6oK8684/+Kz3temb/vDjFm7BIPjpK8MXhWouHVxzaSSaOOpSTvDTkgmL3
         +WjyKyF+j5IBW+5rdvDn/4RVBiJIRolAh6mRWh9yzLkSUq3LicvTzAhhe5xCP+5wtIEL
         ta9TOiwemgenJ2VTj0xhNRjRu5uicxMxCZAX49ap9af5xw4z9p8ag28FXJdBGLLaTDeT
         sxCRL7fnvUcnpWrjaXlPy/ZuNinNu2lT0tEeeYEAidAUvrhLsIQdsGjVqHyu4+/1dBXB
         KXOq/r2bq+/Mz3sCkZhqzZfnhGeLPUbiN7vKo0RAnUIffT2krp2GW9yedHqxhm7zf0DK
         JdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462583; x=1783067383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUAyMW6jsnMMGihQJytM2d9QsUcNRXojRPIgbvjHmgc=;
        b=gjhSbwWFXzqSrDovY/Rwk5zq3zOdeUKWa8CoeaNcYG553dE7AYhiNL/iO5zg6Na5HE
         LZxhyJUoVeC5nKvGo5RA8PfU9IZ/L8GTAjPovlc1b7FTUZqVALIHdpPBUb7FO9LiE10M
         G1c+AZWXkY31XMgzSLTX3muOzR+hLboSBg+/nsEUbZEkAKKZcEDOo3C80QzRD7lLhMjk
         JaBryRo1Cttx6jwTIkESkgBGY6rOAuRDnFMHfWyRMlqw48TmGgcEjcRCLhC79zZ55vTu
         ziExbaH8TNu/pFnqV0fz+2p/29rE1a76/qrjQ2nnp6clhnFU3RG0XVm5Ga6EuOgDzp8Y
         SwwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpP5MNN3eNvmVQKmBL819VUZlYw+j8hjXm/kfE1eVmcbclQR05W/TiHUFS6BBSFEl6yk1SHc9ZndAJOGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40ypD9DEvPyrsR8jT4rNKXA9ZXgAc4wAqNHmuMB1JrXMf1NMS
	toth+GK68gF4ocgOrpoVvpGitQ6YujkYuVY7XAtvsD84TaSMmsx7EgvW
X-Gm-Gg: AfdE7cmllNRnbcqAAtavhTpIo7BY+L+35U8pmph3PM7ZvanKc3wEmrk9Dd2U61B/uuR
	eaiijhyS7HdLSp5nbhi/3t9UZ+FRQyFFuFDaWagRfkKtuQIxD1gRT71es5Vsw1LjCdyZ4B+9a4D
	wJfIiMcIUy++t00L+BRygGZynXxFpixh99oe6oTbFzudQFigMXQp9Xq5m86pF5kBMTUFx1S4jiT
	PXk4BqlXyJ5j/lDtDyKyPjMOqvSGBjlAhd/dvHmJvJkVJGgzjAb9+WUPXIb/owE55rJqVoI1PN6
	oGuAvcUeG8k9CfN3ZzPukvLRULMKfjciK268qyeHVKRsijLCrUO+213zJuDT5TMliNhltRcBoFl
	cOJshStb34rGuOMsHEzDmb2JI13cNHHFKncfopN/hbIbGcV+G7t2EBFa8wKI8PuEDS+XPKb3QFh
	qTpsmUg7M688AZl01cWziqWxLsvpK7m5Z0kyf0pHo8Q2AZHFA=
X-Received: by 2002:a05:6a00:a204:b0:839:12a7:70f7 with SMTP id d2e1a72fcca58-845b3ae021emr6080310b3a.31.1782462583446;
        Fri, 26 Jun 2026 01:29:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d234esm6708789b3a.29.2026.06.26.01.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:29:43 -0700 (PDT)
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
Subject: [PATCH v4 4/5] ASoC: Intel: atom: Use guard() for locking
Date: Fri, 26 Jun 2026 15:29:03 +0700
Message-ID: <20260626082904.32344-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626082904.32344-1-phucduc.bui@gmail.com>
References: <20260626082904.32344-1-phucduc.bui@gmail.com>
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

Changes in v4:
 - Add cleanup.h include where needed.

 sound/soc/intel/atom/sst-atom-controls.c     | 29 ++++++--------------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 25 ++++++-----------
 sound/soc/intel/atom/sst/sst_ipc.c           |  5 ++--
 sound/soc/intel/atom/sst/sst_pvt.c           |  9 +++---
 4 files changed, 23 insertions(+), 45 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 3629ceaaac17..701369349fb6 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -14,6 +14,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
@@ -73,14 +74,10 @@ static int sst_fill_and_send_cmd(struct sst_data *drv,
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
@@ -167,7 +164,7 @@ static int sst_slot_get(struct snd_kcontrol *kcontrol,
 	unsigned int val, mux;
 	u8 *map = is_tx ? sst_ssp_rx_map : sst_ssp_tx_map;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	val = 1 << ctl_no;
 	/* search which slot/channel has this bit set - there should be only one */
 	for (mux = e->max; mux > 0;  mux--)
@@ -175,7 +172,6 @@ static int sst_slot_get(struct snd_kcontrol *kcontrol,
 			break;
 
 	ucontrol->value.enumerated.item[0] = mux;
-	mutex_unlock(&drv->lock);
 
 	dev_dbg(c->dev, "%s - %s map = %#x\n",
 			is_tx ? "tx channel" : "rx slot",
@@ -235,7 +231,7 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 	if (mux > e->max - 1)
 		return -EINVAL;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 	/* first clear all registers of this bit */
 	for (i = 0; i < e->max; i++)
 		map[i] &= ~val;
@@ -244,7 +240,6 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 		/* kctl set to 'none' and we reset the bits so send IPC */
 		ret = sst_check_and_send_slot_map(drv, kcontrol);
 
-		mutex_unlock(&drv->lock);
 		return ret;
 	}
 
@@ -258,7 +253,6 @@ static int sst_slot_put(struct snd_kcontrol *kcontrol,
 
 	ret = sst_check_and_send_slot_map(drv, kcontrol);
 
-	mutex_unlock(&drv->lock);
 	return ret;
 }
 
@@ -354,13 +348,12 @@ static int sst_algo_control_set(struct snd_kcontrol *kcontrol,
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
@@ -368,7 +361,6 @@ static int sst_algo_control_set(struct snd_kcontrol *kcontrol,
 	/*if pipe is enabled, need to send the algo params from here*/
 	if (bc->w && bc->w->power)
 		ret = sst_send_algo_cmd(drv, bc);
-	mutex_unlock(&drv->lock);
 
 	return ret;
 }
@@ -475,7 +467,7 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 	struct sst_gain_mixer_control *mc = (void *)kcontrol->private_value;
 	struct sst_gain_value *gv = mc->gain_val;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 
 	switch (mc->type) {
 	case SST_GAIN_TLV:
@@ -497,7 +489,6 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 		break;
 
 	default:
-		mutex_unlock(&drv->lock);
 		dev_err(cmpnt->dev, "Invalid Input- gain type:%d\n",
 				mc->type);
 		return -EINVAL;
@@ -506,7 +497,6 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 	if (mc->w && mc->w->power)
 		ret = sst_send_gain_cmd(drv, gv, mc->task_id,
 			mc->pipe_id | mc->instance_id, mc->module_id, 0);
-	mutex_unlock(&drv->lock);
 
 	return ret;
 }
@@ -521,10 +511,9 @@ static int sst_send_pipe_module_params(struct snd_soc_dapm_widget *w,
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
index 67506a718158..c757e4dcd7cf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -33,7 +33,7 @@ int sst_register_dsp(struct sst_device *dev)
 		return -EINVAL;
 	if (!try_module_get(dev->dev->driver->owner))
 		return -ENODEV;
-	mutex_lock(&sst_lock);
+	guard(mutex)(&sst_lock);
 	if (sst) {
 		dev_err(dev->dev, "we already have a device %s\n", sst->name);
 		module_put(dev->dev->driver->owner);
@@ -42,7 +42,7 @@ int sst_register_dsp(struct sst_device *dev)
 	}
 	dev_dbg(dev->dev, "registering device %s\n", dev->name);
 	sst = dev;
-	mutex_unlock(&sst_lock);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(sst_register_dsp);
@@ -54,17 +54,15 @@ int sst_unregister_dsp(struct sst_device *dev)
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
@@ -104,21 +102,14 @@ static int sst_media_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
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
index 0d5e71e8a5b5..6c19ab63aa4f 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -11,6 +11,7 @@
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
+#include <linux/cleanup.h>
 #include <linux/pci.h>
 #include <linux/firmware.h>
 #include <linux/sched.h>
@@ -180,9 +181,8 @@ void intel_sst_clear_intr_mrfld(struct intel_sst_drv *sst_drv_ctx)
 	union interrupt_reg_mrfld isr;
 	union interrupt_reg_mrfld imr;
 	union ipc_header_mrfld clear_ipc;
-	unsigned long irq_flags;
 
-	spin_lock_irqsave(&sst_drv_ctx->ipc_spin_lock, irq_flags);
+	guard(spinlock_irqsave)(&sst_drv_ctx->ipc_spin_lock);
 	imr.full = sst_shim_read64(sst_drv_ctx->shim, SST_IMRX);
 	isr.full = sst_shim_read64(sst_drv_ctx->shim, SST_ISRX);
 
@@ -200,7 +200,6 @@ void intel_sst_clear_intr_mrfld(struct intel_sst_drv *sst_drv_ctx)
 	/* un mask busy interrupt */
 	imr.part.busy_interrupt = 0;
 	sst_shim_write64(sst_drv_ctx->shim, SST_IMRX, imr.full);
-	spin_unlock_irqrestore(&sst_drv_ctx->ipc_spin_lock, irq_flags);
 }
 
 
diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index 67b1ab14239f..0b0cfd70efbc 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -11,6 +11,7 @@
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
+#include <linux/cleanup.h>
 #include <linux/kobject.h>
 #include <linux/pci.h>
 #include <linux/fs.h>
@@ -64,9 +65,8 @@ u64 sst_shim_read64(void __iomem *addr, int offset)
 void sst_set_fw_state_locked(
 		struct intel_sst_drv *sst_drv_ctx, int sst_state)
 {
-	mutex_lock(&sst_drv_ctx->sst_lock);
+	guard(mutex)(&sst_drv_ctx->sst_lock);
 	sst_drv_ctx->sst_state = sst_state;
-	mutex_unlock(&sst_drv_ctx->sst_lock);
 }
 
 /*
@@ -302,18 +302,17 @@ int sst_assign_pvt_id(struct intel_sst_drv *drv)
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

