Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB993459AD3
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125731; cv=none; b=um9treLZ0SjOlcxBbKg49ZPFgpJlGK//dzxRaf+XvlPYKPPRvqtZliDPtYtlcml2eg89cFKEde/7RQBoCTezEn1ZSY9nQ6mOldqKZUP9uLl8AukBIEuAM/Vqj8VsOsFf7bc0HwctN2A/xKWEx2VH1un1w85PREaQK8hwS+Lf51k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125731; c=relaxed/simple;
	bh=QN8kP45lewWABrmM7AtjnoLBnLfNgvhwa1P1BtqZGpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+uULfQ5OIh2B4XqnySXa/kp7dhNMPGzlMbZq2hwPRBzAEwASf5Mu2f5i+fDy0Pvmh6G88E113ni3nGRp/W8zrs6ZJVu/ovH9XoPIAmp2YpAsRQw6KdxRWHjdlIC0CAIvO5wuPhTnFiJQFR9eIAgQsJ4aL3nIeO1rWQrE1+T/cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2wXuZsW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2wXuZsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125717; x=1820661717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QN8kP45lewWABrmM7AtjnoLBnLfNgvhwa1P1BtqZGpg=;
  b=d2wXuZsWV5pxbzH6rh5dTg/HOMBxpw0FiFQq2GU1uqPjRIHk48eo/hNK
   WouCxonZ4Q8xXSxRkaS0j1EloGKJPIQFttnkDeNU4TGbGigHQPTI1DSSh
   A9OBa6WMae0xx9E4nWyQJn+ccZTjvl54bNNsymLs1D7bE7E55MuoRnA92
   mx4oxY9MetJS+WQJ2xq2SoIygzf9x5tTVXL93xd4PLKPWtP3c7QtPGTMR
   sWR0VZMghjFWwVjTKeQo4TEKxvOjTSRst9EWmavwqn8IQ8hzIcsvqASDg
   DFxpM5v+DN0z+7neI6PUDHZr35JgALDSfK4NRVfPmUBsVu+11Ycs2MBrW
   w==;
X-CSE-ConnectionGUID: ItWqoLLBQCWljzdXvHWmWw==
X-CSE-MsgGUID: CMe5e6P7RYaik65EW9swaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749886"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:54 -0700
X-CSE-ConnectionGUID: CUJ4xmpjTE2SHyHVXnfVsg==
X-CSE-MsgGUID: ArKprFsqRRuwOVGUrattBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213260"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v3 03/26] ALSA: compress: stop active streams on disconnect
Date: Fri, 11 Sep 2026 14:21:29 +0300
Message-ID: <20260911112152.28528-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track open compressed streams per device so disconnect can stop
active streams and wake waiters before snd_unregister_device().

This aligns compressed stream teardown with PCM disconnect behavior
and prevents active userspace streams from running into unregister
races.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/compress_driver.h |  2 ++
 sound/core/compress_offload.c   | 49 +++++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 9e3d801e45ec..84f51edc3f9d 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -188,6 +188,7 @@ struct snd_compr_ops {
  * @card: sound card pointer
  * @direction: Playback or capture direction
  * @lock: device lock
+ * @open_list: list of open compress files
  * @device: device id
  * @use_pause_in_draining: allow pause in draining, true when set
  */
@@ -199,6 +200,7 @@ struct snd_compr {
 	struct snd_card *card;
 	unsigned int direction;
 	struct mutex lock;
+	struct list_head open_list;
 	int device;
 	bool use_pause_in_draining;
 #ifdef CONFIG_SND_VERBOSE_PROCFS
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 7b720603a9a8..89435e4394ef 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -42,6 +42,7 @@
 #endif
 
 struct snd_compr_file {
+	struct list_head list;
 	unsigned long caps;
 	struct snd_compr_stream stream;
 };
@@ -124,6 +125,7 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		ret = -ENOMEM;
 		goto __error;
 	}
+	INIT_LIST_HEAD(&data->list);
 
 	INIT_DELAYED_WORK(&data->stream.error_work, error_delayed_work);
 
@@ -143,8 +145,11 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 #endif
 	data->stream.runtime = runtime;
 	f->private_data = (void *)data;
-	scoped_guard(mutex, &compr->lock)
+	scoped_guard(mutex, &compr->lock) {
 		ret = compr->ops->open(&data->stream);
+		if (!ret)
+			list_add_tail(&data->list, &compr->open_list);
+	}
 
 __error:
 	if (ret) {
@@ -161,17 +166,23 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 {
 	struct snd_compr_file *data = f->private_data;
 	struct snd_compr_runtime *runtime = data->stream.runtime;
+	struct snd_compr *compr = data->stream.device;
 
 	cancel_delayed_work_sync(&data->stream.error_work);
 
-	switch (runtime->state) {
-	case SNDRV_PCM_STATE_RUNNING:
-	case SNDRV_PCM_STATE_DRAINING:
-	case SNDRV_PCM_STATE_PAUSED:
-		data->stream.ops->trigger(&data->stream, SNDRV_PCM_TRIGGER_STOP);
-		break;
-	default:
-		break;
+	scoped_guard(mutex, &compr->lock) {
+		if (!list_empty(&data->list))
+			list_del_init(&data->list);
+
+		switch (runtime->state) {
+		case SNDRV_PCM_STATE_RUNNING:
+		case SNDRV_PCM_STATE_DRAINING:
+		case SNDRV_PCM_STATE_PAUSED:
+			data->stream.ops->trigger(&data->stream, SNDRV_PCM_TRIGGER_STOP);
+			break;
+		default:
+			break;
+		}
 	}
 
 	snd_compr_task_free_all(&data->stream);
@@ -1449,8 +1460,27 @@ static int snd_compress_dev_register(struct snd_device *device)
 static int snd_compress_dev_disconnect(struct snd_device *device)
 {
 	struct snd_compr *compr;
+	struct snd_compr_file *data;
 
 	compr = device->device_data;
+	scoped_guard(mutex, &compr->lock) {
+		list_for_each_entry(data, &compr->open_list, list) {
+			switch (data->stream.runtime->state) {
+			case SNDRV_PCM_STATE_RUNNING:
+			case SNDRV_PCM_STATE_DRAINING:
+			case SNDRV_PCM_STATE_PAUSED:
+				data->stream.ops->trigger(&data->stream,
+							 SNDRV_PCM_TRIGGER_STOP);
+				break;
+			default:
+				break;
+			}
+
+			data->stream.runtime->state = SNDRV_PCM_STATE_DISCONNECTED;
+			wake_up(&data->stream.runtime->sleep);
+		}
+	}
+
 	snd_unregister_device(compr->dev);
 	return 0;
 }
@@ -1558,6 +1588,7 @@ int snd_compress_new(struct snd_card *card, int device,
 	compr->device = device;
 	compr->direction = dirn;
 	mutex_init(&compr->lock);
+	INIT_LIST_HEAD(&compr->open_list);
 
 	snd_compress_set_id(compr, id);
 
-- 
2.55.0

