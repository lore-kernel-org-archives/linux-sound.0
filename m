Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFCC469856
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125723; cv=none; b=lhb4D+syv55kh9B4ZvgYlCJGNYlV39FZgwOFPs5YCX83Snyk8Ie2Jf1IBm05hul+QIgPvZbpOUuy8lTeYW2QfWlXntA9SJJ3sOoqACSpn8joGsnPS+tIJ9oLyRcaAAlDRQiwz6c515oYB/q1W3oQP7fnpyz5DuwoY3Pr41fTr+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125723; c=relaxed/simple;
	bh=RrKv05dglhxd3tSJcNvF/VRll+TeJ+JrzC86ANCU+34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEcKJ5z4zettithaUzGroQU8kz+u01GZlm7M9BxvOOJ/J+T9S1ieuwPmYiMscTZg/2IurH5nT5wMoZtk4whftyUiKWb9O9jueJs+NR+Jjk+yp83iNGwNeXA0jbThawPe+wywzPYZymxRdDm4lPb9bXSMARZ6DGaxVJKPFkvlohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkQOHvF8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkQOHvF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125713; x=1820661713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RrKv05dglhxd3tSJcNvF/VRll+TeJ+JrzC86ANCU+34=;
  b=OkQOHvF8QDI0UK3UgZ5YR0Dme0quUAL/ZXHW8nacsiRq69Up4qH0JBXX
   6IPLhkTYdKBtbp/S9SGsPBNYSQtx8lYrF1OA56TTI4HFI381TMRrOQKcP
   /wiBETrToP7OoBEQd/7cxuZbUwbWjGU0543qRYwRNY2l0AUQNeZ2bzPwX
   Hr/ssDzHNWnWT4byOiU4Mzful7b89Fxik+1dsE97hdf+YmIMWtXhQDtrH
   XNa90qmdi6z+22uuPRj5ALEypp0+Db1rPQz0qOa+8llch+V28fSwjCkqC
   AqCMFJPcs9uwJ8l+rVT3XCQueZzAXo0GjgkuNPwbQqYmCpVFGE4XkpF6P
   g==;
X-CSE-ConnectionGUID: H+66ae5aRkqS3UtR6W4Gsg==
X-CSE-MsgGUID: wrqmYQtJTWKsLOf37FZ8AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749863"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:48 -0700
X-CSE-ConnectionGUID: 6og/td8uRyWrQwgTvvnQmg==
X-CSE-MsgGUID: BEXBghhgTt6P7g7Ypx+oFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213243"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:45 -0700
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
Subject: [PATCH v3 01/26] ALSA: compress: pin card module while stream is open
Date: Fri, 11 Sep 2026 14:21:27 +0300
Message-ID: <20260911112152.28528-2-peter.ujfalusi@linux.intel.com>
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
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 7c397b1c9231..ba6cdfe64246 100644
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
 
 	data = kzalloc_obj(*data);
 	if (!data) {
-		snd_card_unref(compr->card);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto __error;
 	}
 
 	INIT_DELAYED_WORK(&data->stream.error_work, error_delayed_work);
@@ -121,9 +126,8 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 	data->stream.device = compr;
 	runtime = kzalloc_obj(*runtime);
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

