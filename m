Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF51F192E
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362987; cv=none; b=cx7aSLakxLKT/Gl74Ji4pJT8yweRk+5nNme+4n6C4kflxsH/4PCiq5TcjAXJ3906RvzKXp6paBkifKTNvkWknXEPysFa5RPLNbRFeUULoQfzyJepbzQfYzrGvxmSzSSk85qv45tZsljW538s6ghUELXv6PbScHvVQKEOkFQcNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362987; c=relaxed/simple;
	bh=kqLiWm3Znw2frGTpM0pTRDy+7OchWuyG3QXR9qHX4XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8h23/mZUQy19GH9+1EAmrgC6kvcTGlF9euIOJpdwiZoL3QuNp+Bg8N75+uv1FwBrW36XrCfXZpjhvwCex1IK81ROG66YfIa0q7JRf2tFpGcupM1fvX8A5/agohP4GVwLt87TdxrkKcZBiXw00lwr6pdxQwuQ1MUZZtK+8Nz1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5URzWcy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5URzWcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791362987; x=1822898987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kqLiWm3Znw2frGTpM0pTRDy+7OchWuyG3QXR9qHX4XM=;
  b=G5URzWcyt1FJAGK9b7EehoLWeydrQqoZcPAjt0uedJoEm/jKfz9EbK8S
   25R4CcIBkrefiWHKtpZlZpr0KgBcxPD262E9HaXuqyMWZEziV8u/2V9Vi
   uonYpVPakN2MwApZOINQlkI+BpOPehQVeIVKBdNUizYaWpDI86OEahOu3
   3Y5ZCZrjL0PkFjZf3uFdiyakjKLRoTPW6BGnpFWB5+gc6ttwznfYPahq+
   GUEIP8aYrdYKdsRZfq74QWlFHIi9ZNQmobKUG2Ck8Ie+keNRoUADMjERc
   YqJK6p4fPYPzXt8uvrUwyGLa3+iieC03AoYtrf0ULYFD8BZltfLdVwc29
   w==;
X-CSE-ConnectionGUID: qQbeI30aTg29q4zwfT6Ptg==
X-CSE-MsgGUID: P0Iey0iOTpai7D3PcTwkMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113840"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113840"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:46 -0700
X-CSE-ConnectionGUID: b3i031zNQaS8rDFp8clJBA==
X-CSE-MsgGUID: 8LFypZmURvKYMGuKYOJPZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670493"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:43 -0700
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
Subject: [PATCH v5 03/28] ALSA: compress: stop active streams on disconnect
Date: Wed,  7 Oct 2026 11:49:30 +0300
Message-ID: <20261007084955.1256-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
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
 sound/core/compress_offload.c   | 48 ++++++++++++++++++++++++++-------
 2 files changed, 41 insertions(+), 9 deletions(-)

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
index aaed865f8175..89435e4394ef 100644
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
@@ -165,14 +170,19 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 
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
@@ -1450,8 +1460,27 @@ static int snd_compress_dev_register(struct snd_device *device)
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
@@ -1559,6 +1588,7 @@ int snd_compress_new(struct snd_card *card, int device,
 	compr->device = device;
 	compr->direction = dirn;
 	mutex_init(&compr->lock);
+	INIT_LIST_HEAD(&compr->open_list);
 
 	snd_compress_set_id(compr, id);
 
-- 
2.56.0

