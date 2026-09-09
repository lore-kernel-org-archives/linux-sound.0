Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726C3489868
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944991; cv=none; b=n9TXXUi8ltcDbetc4EUwhigxkNSk3TNmcXb3fb/wFdJJ2X9Fchz1EIi8S9Hwvi9ow2wMpHzbELtIiICW3qK0QbMBiCmRHZUIepR/U71rJuGfbBl4Xu4zGhO/qLR3vN9TR60/LcMwKDULq5D8Mdqgx6wUvU4OIlxIbAM1S8JY/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944991; c=relaxed/simple;
	bh=QN8kP45lewWABrmM7AtjnoLBnLfNgvhwa1P1BtqZGpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXDIURq4NM/m1TjPwPGXtoljMial6Y8+Yzj6SCxuJ2wouh0PGVw2t426G2GK/60l+owrIwVy3dOaTyLrzFqoq9Z1gymLcH1LIWIppxzBC1976UNZSoGaWlyQ9c4lW29hMC5y1T1adbbuzS5FGbg+wyhJhGa38CLeBsIOAvyfyro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXYDbOS6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXYDbOS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788944990; x=1820480990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QN8kP45lewWABrmM7AtjnoLBnLfNgvhwa1P1BtqZGpg=;
  b=LXYDbOS6kxkZAjkc+RPNEDCOguCiSuWqP6j9ChDDyGI+9Rn4bSofCwa6
   +49nU9Sngm2za9rQlFz+jzXwSV/ROst8UsgK1vSm09hJIXp9+FP3JMs0o
   HecAEshSBtGJpWz93Z5l8WFpaTuI5mdmzqQVNLT8EY4ptbl58cH50K6nH
   Dk8oojMjtR5J3/p5TLRwD/ivf10UxlBOtwuZTdme4UxAG4T5JRmh6TX4q
   CgA1ptHtfQFbp4JQiUc4rHorZS/35raPSrmfuWwu9MkCNL/mT3PBDLPgJ
   g2yjOX5Hm4K21PultSKHes9TXXUxVLpjvT7BiGt8ZEeDHIXC9eeWSUXlb
   g==;
X-CSE-ConnectionGUID: e6jMLmodRl6YOLh2VIQf9A==
X-CSE-MsgGUID: wHxVcP3yR0aZq/Rc0Jkrfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200597"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:50 -0700
X-CSE-ConnectionGUID: YAPgPf6aThaEBlXw0UTSFA==
X-CSE-MsgGUID: cCW0Uox8SXSDPFCtu+TIog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972811"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:47 -0700
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
Subject: [PATCH v2 03/24] ALSA: compress: stop active streams on disconnect
Date: Wed,  9 Sep 2026 12:09:28 +0300
Message-ID: <20260909090949.7503-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
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

