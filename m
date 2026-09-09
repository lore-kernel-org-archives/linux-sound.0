Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9153B38A2
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944986; cv=none; b=Vmg/kaerwJO0V/O2VcBueoANATL8pOsub93uzL5QQ+P/aB7BxjmdrGD5zUqWeWS7i5FiN2zSTfN70liKUplaqM3vmCn3nGLIYHutKtQwantHP0Msj72hXiN5uHJcVDDJY+tZPK4YR33uekdo8wVTIYaf4SaF8k9phaY+phMr+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944986; c=relaxed/simple;
	bh=RrKv05dglhxd3tSJcNvF/VRll+TeJ+JrzC86ANCU+34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5tou762GbYRcf/DwyxALjHcOwwZvit9pchm4sm+rN4ThGc4Bh73mm0WtMEHoDgMAbm6UUGboSWKNa2HIhig8k/JjtJimK2XCpDCoA1x746NIUcVCwNF9ceo/w0kw+77Hbt7PJCa9oi9dewaFe7JMcfYn0XnUGuiRBakYaPWBKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEvfn2yx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEvfn2yx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788944985; x=1820480985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RrKv05dglhxd3tSJcNvF/VRll+TeJ+JrzC86ANCU+34=;
  b=TEvfn2yxOHk8U2SnGxR4edj/CjB1SBviG/11B9mhP9LYBvVZbqryxIjC
   AKerM0+eP3ZWOMX2xAQjUemHSc17Tm/w+MDV6GMKh5R35pDiW//jE8/XU
   7CqKmh8X/Tox21csN6OaUTub8TBzwBPOidDtZjxwczJxv9+fQkHIUcH3d
   R3nwFgyTvWxOTqDUgUXNrNCK3IflKJlHx0uMN8EIQSGppjZBNq2uH5C3G
   8Gm/lSjH1az7vqdl9lsZ0Ohhx64O9d2VjcQ0TPLZDiEhVzVmGZhkYv7q+
   fkDIzSVusyMuhLQlwhcTHZ9jvyhJMLOofJ+L2s4qXseJFv6yW5hjOe53M
   A==;
X-CSE-ConnectionGUID: zem55E6UTkOikBX4E150bA==
X-CSE-MsgGUID: Pi+zW6CIRu25LVX2pRdg/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200579"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:44 -0700
X-CSE-ConnectionGUID: mLPKtW0nQxKq9cqx3AlLzg==
X-CSE-MsgGUID: IJwCF9wxRzK31cU9iu7ZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972781"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:41 -0700
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
Subject: [PATCH v2 01/24] ALSA: compress: pin card module while stream is open
Date: Wed,  9 Sep 2026 12:09:26 +0300
Message-ID: <20260909090949.7503-2-peter.ujfalusi@linux.intel.com>
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

