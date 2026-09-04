Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC13845AC
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507104; cv=none; b=CVS/Y8KbM4tleXEte60xunyn2Mc9vP4lIaJfMcnx2l8U1/mBtHdpoqTe5jn6SZJJy+62iKrfpy4yFHS5vGKAPNrH1va4PxH2QUOJ65LofnN/WTEyTqrYsl5BUHfrhEGXHxVq5cS9vuOqK2fKJML2nTwuafsDvD8LfO/bwPJQUrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507104; c=relaxed/simple;
	bh=V6OZpYCI4oc9LtE9gtyvNpOIIDK5GBqkKKm0tHrNm/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uE7Jxlv7SsUS6K01TMJZ4oHRSSkyGbZAXcDUAXHI8jV9Js5WjK9B0DlcR/ZWPkVDHU1ze6b9V+0RKp2Gx9yXjJ8IOnBjkdKScMNG9A+Z3bQtPIieuiiwQ+FLCT48dCtRUSoMNJRWLHWh01hhS4TAYx5o8CuE3BSFzKZj+BcC5/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5MtG3ZC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5MtG3ZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507102; x=1820043102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V6OZpYCI4oc9LtE9gtyvNpOIIDK5GBqkKKm0tHrNm/o=;
  b=F5MtG3ZC2uZFKC5ePbA3CntRCmNVzXtcMV9imIP89elaMW/stI2Wkcxf
   CoQ3gBw8X/5ixar/WNZolhgRCe024gVQ5ImiayWz1C+HiNdvfVNPHLGdR
   wJY0I3lyNJF0xXp1COg1ME1l9gJoZRnkOu0bIa4dvWpMTA7bX4YtWyomI
   QftdQmYr9LizhuAQh+xsZKKXUOoiTlAA/brwvT0ffh6KKy09pC4eyaS9g
   ZWLEjstfssuEI41sNcict6XuMBFpAa3eqU4JiemkGDkfP+vEXJkbDYfkl
   +SCnWnyQpjCq1lGBw+ru88kLBhc+fqG1hAP+jFM26s1xTS+5eX8J3ZQzL
   Q==;
X-CSE-ConnectionGUID: Lnu1m4tDSf6j79aEQ4ju9Q==
X-CSE-MsgGUID: sOsYRbqoSSe4LKWl42fXKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111777782"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111777782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:32 -0700
X-CSE-ConnectionGUID: 0L7IXoE1QAWJ2G6uMZ3sDA==
X-CSE-MsgGUID: wTety404TYmmTZ2Eq2Uthg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480462"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:29 -0700
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
Subject: [PATCH 01/23] ALSA: compress: pin card module while stream is open
Date: Fri,  4 Sep 2026 10:31:12 +0300
Message-ID: <20260904073134.29648-2-peter.ujfalusi@linux.intel.com>
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

Take a module reference in snd_compr_open() and release it in
snd_compr_free(). This pins the card driver module for the
lifetime of an open compress stream and prevents card removal
while the stream file is still in use.

Adjust the open() cleanup paths to drop the added module
reference only when it was acquired, and keep release ordering
safe by dropping the module reference before freeing stream
data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/core/compress_offload.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 23d62fede06e..c7d2f4fb3e02 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -75,11 +75,11 @@ static inline void snd_compr_task_free_all(struct snd_compr_stream *stream) { }
 static int snd_compr_open(struct inode *inode, struct file *f)
 {
 	struct snd_compr *compr;
-	struct snd_compr_file *data;
-	struct snd_compr_runtime *runtime;
+	struct snd_compr_file *data = NULL;
+	struct snd_compr_runtime *runtime = NULL;
 	enum snd_compr_direction dirn;
 	int maj = imajor(inode);
-	int ret;
+	int ret = 0;
 
 	if ((f->f_flags & O_ACCMODE) == O_WRONLY)
 		dirn = SND_COMPRESS_PLAYBACK;
@@ -101,16 +101,21 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		return -ENODEV;
 	}
 
+	if (!try_module_get(compr->card->module)) {
+		snd_card_unref(compr->card);
+		return -EFAULT;
+	}
+
 	if (dirn != compr->direction) {
 		pr_err("this device doesn't support this direction\n");
-		snd_card_unref(compr->card);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto __error;
 	}
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data) {
-		snd_card_unref(compr->card);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto __error;
 	}
 
 	INIT_DELAYED_WORK(&data->stream.error_work, error_delayed_work);
@@ -121,9 +126,8 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 	data->stream.device = compr;
 	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
 	if (!runtime) {
-		kfree(data);
-		snd_card_unref(compr->card);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto __error;
 	}
 	runtime->state = SNDRV_PCM_STATE_OPEN;
 	init_waitqueue_head(&runtime->sleep);
@@ -134,9 +138,12 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 	f->private_data = (void *)data;
 	scoped_guard(mutex, &compr->lock)
 		ret = compr->ops->open(&data->stream);
+
+__error:
 	if (ret) {
 		kfree(runtime);
 		kfree(data);
+		module_put(compr->card->module);
 	}
 	snd_card_unref(compr->card);
 	return ret;
@@ -164,6 +171,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	data->stream.ops->free(&data->stream);
 	if (!data->stream.runtime->dma_buffer_p)
 		kfree(data->stream.runtime->buffer);
+	module_put(data->stream.device->card->module);
 	kfree(data->stream.runtime);
 	kfree(data);
 	return 0;
-- 
2.55.0

