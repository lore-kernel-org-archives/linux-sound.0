Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D121F192E
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362981; cv=none; b=HZsQBH0Nw9rdDwioHytuJbs5E+zOUeM4BxK1bY9jrgavKOGCvcuj7rveCwk8rpx8I1V2aPXOmsC9O/h0I3Ift6Ior8UEOpollFLctTeNQbbEqX+O0h8O3yjX1a7rDcOYgQBVPF33qsH5bBfUgYr7ldN5CR4uwnQJfNLCwvJkMEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362981; c=relaxed/simple;
	bh=51c9+tChvp4U3ZXwbW5hCoNq+kgNsNot6g5TsWZeJ1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oc6+YxR0iuotX3PUO8L5WYj5jXTYnKZ1TPulvKsnsAfMIG4q6iB7uvxFWBhEhgR7MFBNkNzmbTh9OKOWu0rCJiZSwQ8/SpTU6GQRHZGajPM/qkTtZq2V5h92WLFqzpCvbjXlWevdU4KZyQvgeDEhGNQPm0WfpDOVYuCHiatmH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxT1VS1F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxT1VS1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791362980; x=1822898980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=51c9+tChvp4U3ZXwbW5hCoNq+kgNsNot6g5TsWZeJ1E=;
  b=AxT1VS1FBGmdNae5SpNThMwxyQV7sAyhGKEJB4Q2cR26SjV1gIdFUebr
   ngt46SI1q8JcUsTzd1lV1fLEhlsqHemcsRap21cnO6ZJ5XJYzeBUSNQ8m
   EgRmBZfcMZ9RCAyEKgtxYDCovQ0FsTiBpk2X9fCJY9tEOG8v9tsi64GAJ
   dwtVEf4bdktTjo/YQFNJzDhzcsT+oUoVtoD10wAeL5Sm8/oSOX7mCnVtL
   VCOuC3jQsLgKd7gKmTRkjFo2uQDFjOpDcQz2PUEG+zXpjsU8aEmiGZlBC
   ymJZDjydNV48cXN9+3NQgP14XaltmXQAAenKIDTd9aUP2Q/JLBahDF7K4
   w==;
X-CSE-ConnectionGUID: 8UNuhYvES2uupj+dD7vHMA==
X-CSE-MsgGUID: JFS3PdEXSKminPs31YDnUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113814"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113814"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:40 -0700
X-CSE-ConnectionGUID: ynQ91PrcSKmjstA5pfrCUg==
X-CSE-MsgGUID: 3a1CODRnT5+wGJmgraK+Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670424"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:37 -0700
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
Subject: [PATCH v5 01/28] ALSA: compress: pin card module while stream is open
Date: Wed,  7 Oct 2026 11:49:28 +0300
Message-ID: <20261007084955.1256-2-peter.ujfalusi@linux.intel.com>
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
2.56.0

