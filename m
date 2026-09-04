Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B3394462
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507105; cv=none; b=rqLka9PnSFyFqvFgpqEWTj9m3U/yTCsBz/yQtE1NS9OSOz/5znw9MQrN96Tx5mM3mBtkA8SHGgSQwHRs6xSyqphB2uzmr5sU8gAJBQ3qnEHg0VL2v+p/rt02GKaKdoCjAdJ4SG8ZWne/pIAP7KO3l2KHKn0iwPg+9FXsq9Xtayk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507105; c=relaxed/simple;
	bh=9ICPOIooVPQU/zjqMM9bl5UrAN7ObA1kyNFheP3cmhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoVK7hPRRlAH5e2cnBJPcPtuK2CuEQyAWHko4NgJ+Oy98Z5FxRqE7kSqANCUdB0Siucwh0LolhTOabq6IO1XsaGC4ZvHqJ5HXxoCBnxJdRNHUapbUZKqYU0CUfL7p5goVfkmWe1YzRHb+2qZjJbvHMu3dUTfcltlGqEWQY7euO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxNqe8zd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxNqe8zd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507103; x=1820043103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ICPOIooVPQU/zjqMM9bl5UrAN7ObA1kyNFheP3cmhw=;
  b=BxNqe8zd++PlriuVEOMfcLYYkY8FqUVyKuttOK2kulmRZcWHuEER61h8
   L5bFijc6zS7DpgWQVAuiwJ28nOZ82O5FFFF8FNYTL6nHS33b8LoIB073s
   L3WETa4YRwLuvSBYpJpDHy3fE/lWE5mK17bZZFRSbRA0i3FOlkuBk/dw6
   y5u5lPphdJc3wQsYXy4Cx3/q/CJdeJGuRikj9Sde2JHRqST7Au5TRrgxw
   5c2LYrW+sip9ApvciahM3XF8cYesxoHc7FNkHqsI68a3/j5SSgEliV686
   ZnLYj/IiWGeGCpvfbtpYL7VctTow60eozk+GDs4hLqV5/qzijopqhLD5X
   g==;
X-CSE-ConnectionGUID: CBHOSZn1Re6HV+Bex1tLEw==
X-CSE-MsgGUID: 3A90ibn8SZmz48hmo1ptXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111777794"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111777794"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:35 -0700
X-CSE-ConnectionGUID: GeZC5Ct1Q6yIhii5VzruqQ==
X-CSE-MsgGUID: fWDRI6TQQoixq6ujV7qmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480503"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:32 -0700
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
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 02/23] ALSA: compress: stop active streams on disconnect
Date: Fri,  4 Sep 2026 10:31:13 +0300
Message-ID: <20260904073134.29648-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
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
index c7d2f4fb3e02..f6e54ffc8575 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -42,6 +42,7 @@
 #endif
 
 struct snd_compr_file {
+	struct list_head list;
 	unsigned long caps;
 	struct snd_compr_stream stream;
 };
@@ -117,6 +118,7 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		ret = -ENOMEM;
 		goto __error;
 	}
+	INIT_LIST_HEAD(&data->list);
 
 	INIT_DELAYED_WORK(&data->stream.error_work, error_delayed_work);
 
@@ -136,8 +138,11 @@ static int snd_compr_open(struct inode *inode, struct file *f)
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
@@ -153,17 +158,23 @@ static int snd_compr_free(struct inode *inode, struct file *f)
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
@@ -1440,8 +1451,27 @@ static int snd_compress_dev_register(struct snd_device *device)
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
@@ -1549,6 +1579,7 @@ int snd_compress_new(struct snd_card *card, int device,
 	compr->device = device;
 	compr->direction = dirn;
 	mutex_init(&compr->lock);
+	INIT_LIST_HEAD(&compr->open_list);
 
 	snd_compress_set_id(compr, id);
 
-- 
2.55.0

