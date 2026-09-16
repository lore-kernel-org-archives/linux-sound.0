Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7610F30D40C
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560206; cv=none; b=R6Q/85K/Z9OvoBCUotimGk+GNbUiSDHvAAu8Uo2bnI4U3xvD2FIuHCHxg6y9UltQuB3Y/Epe3eLC9VCqsz/b4Hj0QpG/eVxa1Uah4g8hT7v/i1/AlK/3TH6QI7K2sEKYU1qRY+2xFDztYFYdjth+AG9GvvTD549okFEcRUDtOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560206; c=relaxed/simple;
	bh=RrKv05dglhxd3tSJcNvF/VRll+TeJ+JrzC86ANCU+34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7j4/vW0C24bDYjikPAv7S3/KdCHHiMlUHMHxDGWAC/VUZuyrtZkRAyIDV47JXen1lKzsTKebxQSHZKSg4+28ZlYaVaQWdtH8XebXToGH8ERMZmXbeMevuWyLoUoywUYiKvltP9CsWI1E5qvbgNuRiYTPwzJyHItRZX2Zfn5YW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEigBmdP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEigBmdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560198; x=1821096198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RrKv05dglhxd3tSJcNvF/VRll+TeJ+JrzC86ANCU+34=;
  b=eEigBmdPp1UH4wjbVgYRwUHHmKIJG/pGDFmZMkhfAfOz/zye/+8WJtSK
   UnKnVTHHWUG8t7fXrS6OXpswzpM4CZAA/84+fJecKjGvpmq1/gf3zisRA
   SaaoworauZcFxe+zR0gRLKs5uWITYI0RUoAF4ZzH7zsGxrzcCZIiBMLmy
   t4JOFAJA89txZowzQq5ZTnAewRiJamUEgfc+GYvcFSwuuXCmSxX3JTXW9
   patXf6XhmojHIhmxgyK6V3W6TsaHdfL98dOwg/N6pgNdUI3Ff2MA5kdNN
   zlD+OTTzlsCEnqMDGMRz3fwk/8OTSY/KRoFeC35oCjGr0pbvVADEO7to0
   w==;
X-CSE-ConnectionGUID: 9FyxUE0pS+Cy4BW1qk+v2w==
X-CSE-MsgGUID: zJHPOYiRQgOmqoF52isg+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496218"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:15 -0700
X-CSE-ConnectionGUID: FCYc3k2QQn+2mUTRqHhyuQ==
X-CSE-MsgGUID: yGRB7xTsSSS4hZt9GrMN4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293324"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:13 -0700
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
Subject: [PATCH v4 01/26] ALSA: compress: pin card module while stream is open
Date: Wed, 16 Sep 2026 15:02:55 +0300
Message-ID: <20260916120320.18318-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
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

