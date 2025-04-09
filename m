Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD9F25DB0F
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195884; cv=none; b=JUf4HbTDl10m4Ox4W/94BaMijQQ3C0bsR1ixgiTCxRJ1rwy804Wsg69dll1lvnKNraATQItiiKxDbMOmYktXzEMB2rcCaDJBXV7p7nzL+wEvWpbstyuIPSPmAb4WUTEyL0cWEvptTtgEQ2k/ukPU3MooJY4gk8eddkq8/uuhyJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195884; c=relaxed/simple;
	bh=6FkBpWVnrOGogjTK4mDjWYFjYSsXNGDoRjAoHJqwrzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mGG9yZDsO7vuE7i8iHkDdRX2wSi9CJmt4u5Ja3UoT6whQLHi4QDh1p/sfzlKMdSAR7tGBddHynhsU046WriHETRIsTEPODvNIjjMbz3iGcTCu22j+GPM0kwpOXWdnuNllK4iLaw3jS4qZou1CwCdaqXRAvJ2GP5cwF0qnCNnQy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsW9e0RV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsW9e0RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195882; x=1775731882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6FkBpWVnrOGogjTK4mDjWYFjYSsXNGDoRjAoHJqwrzQ=;
  b=CsW9e0RVnifGV79BNnK8kfvBmRAYZOeR80UsDwRDm7Xb7/GEMuBhSkWn
   yJ0rv5Y73gXzCRm5aui1RXM7Ir09rmGb1OKU+M+4AC1g0VCyPQbU5THe4
   06kbSW+vH5LP/wWXZsj2qZ07WMESsQQLAPz1JLOR9gYVtS1j6iQiFsGLo
   CToeABlxdB8NgHHceI5vu40cXL8Ze6+XHECNvPALnBRrKrN2zIMbYOgW1
   kMorJjzW1FQ8GzhSViZSQzXezYsv+6DefemcTWQYT/rGexODAFHFU86h0
   OWGtU7x0/QSnMeABA5QK2Gj2f/vtRg9cv/5X1AfvACutG8KfTxVp292mE
   Q==;
X-CSE-ConnectionGUID: pYZApMysSwuAIamObA60JA==
X-CSE-MsgGUID: Jiic3rJjQvmy+UDWaeexvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380099"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380099"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:22 -0700
X-CSE-ConnectionGUID: xIZo3bj3SNSkWemXmeZkwA==
X-CSE-MsgGUID: Y1Tye1K2TuSnjosRS4qMog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426244"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	quic_wcheng@quicinc.com,
	mathias.nyman@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC 10/15] ALSA: usb: Export PCM operations
Date: Wed,  9 Apr 2025 13:07:25 +0200
Message-Id: <20250409110731.3752332-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409110731.3752332-1-cezary.rojewski@intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing PCM operations can be reused by DAIs on the ASoC side. Not all
of them are exported as endpoints of the offloaded USB device are
entirely controlled by the Audio Sideband and AudioDSP hardware. As ASoC
occupies substream->private_data, update existing open() and close() to
utilize runtime->private_data for obtaining USB stream instead.

Provide a wrapper for ASoC driver i.e.: snd_usb_pcm_open() as they are
unaware of details of USB streams and do not access USB substreams
directly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/usb.h |   9 +++
 sound/usb/pcm.c     | 159 +++++++++++++++++++++++++++++++-------------
 2 files changed, 120 insertions(+), 48 deletions(-)

diff --git a/include/sound/usb.h b/include/sound/usb.h
index f30a8a96c49e..daba868fb6e0 100644
--- a/include/sound/usb.h
+++ b/include/sound/usb.h
@@ -93,6 +93,15 @@ struct snd_usb_audio {
 int snd_usb_bind_card(struct snd_usb_audio *chip, struct snd_card *card,
 		      struct usb_driver *driver);
 int snd_usb_bind_pcm(struct list_head *stream_entry, struct snd_pcm *pcm);
+void snd_usb_pcm_hw_init(struct list_head *stream_entry, int dir, struct snd_pcm_hardware *hw);
+
+/* PCM operations, see struct snd_pcm_ops. */
+int snd_usb_pcm_open(struct snd_pcm_substream *substream);
+int snd_usb_pcm_close(struct snd_pcm_substream *substream);
+int snd_usb_pcm_hw_params(struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *hw_params);
+int snd_usb_pcm_hw_free(struct snd_pcm_substream *substream);
+int snd_usb_pcm_prepare(struct snd_pcm_substream *substream);
 
 #define USB_AUDIO_IFACE_UNUSED	((void *)-1L)
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index ea698f061af9..e04e47c0a35e 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -471,8 +471,8 @@ static void close_endpoints(struct snd_usb_audio *chip,
  * if sg buffer is supported on the later version of alsa, we'll follow
  * that.
  */
-static int snd_usb_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *hw_params)
+int snd_usb_pcm_hw_params(struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
 	struct snd_usb_audio *chip = subs->stream->chip;
@@ -579,13 +579,14 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_usb_pcm_hw_params);
 
 /*
  * hw_free callback
  *
  * reset the audio format and release the buffer
  */
-static int snd_usb_hw_free(struct snd_pcm_substream *substream)
+int snd_usb_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
 	struct snd_usb_audio *chip = subs->stream->chip;
@@ -603,6 +604,7 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_pcm_hw_free);
 
 /* free-wheeling mode? (e.g. dmix) */
 static int in_free_wheeling_mode(struct snd_pcm_runtime *runtime)
@@ -634,7 +636,7 @@ static int lowlatency_playback_available(struct snd_pcm_runtime *runtime,
  *
  * only a few subtle things...
  */
-static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
+int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_usb_substream *subs = runtime->private_data;
@@ -693,6 +695,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	snd_usb_unlock_shutdown(chip);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_usb_pcm_prepare);
 
 /*
  * h/w constraints
@@ -1075,6 +1078,47 @@ static int hw_rule_periods_implicit_fb(struct snd_pcm_hw_params *params,
 	return apply_hw_params_minmax(it, rmin, rmax);
 }
 
+static void usb_pcm_hw_init(struct snd_usb_substream *subs, struct snd_pcm_hardware *hw)
+{
+	const struct audioformat *fp;
+
+	hw->formats = subs->formats;
+	hw->rate_min = 0x7fffffff;
+	hw->rate_max = 0;
+	hw->channels_min = 256;
+	hw->channels_max = 0;
+	hw->rates = 0;
+
+	/* Now reduce the scope based on substream capabilities. */
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		hw->rates |= fp->rates;
+		if (hw->rate_min > fp->rate_min)
+			hw->rate_min = fp->rate_min;
+		if (hw->rate_max < fp->rate_max)
+			hw->rate_max = fp->rate_max;
+		if (hw->channels_min > fp->channels)
+			hw->channels_min = fp->channels;
+		if (hw->channels_max < fp->channels)
+			hw->channels_max = fp->channels;
+		if (fp->fmt_type == UAC_FORMAT_TYPE_II && fp->frame_size > 0) {
+			/* FIXME: there might be more than one audio formats... */
+			hw->period_bytes_min = fp->frame_size;
+			hw->period_bytes_max = fp->frame_size;
+		}
+	}
+}
+
+void snd_usb_pcm_hw_init(struct list_head *stream_entry, int dir, struct snd_pcm_hardware *hw)
+{
+	struct snd_usb_stream *as;
+
+	if (dir <= SNDRV_PCM_STREAM_LAST) {
+		as = list_entry(stream_entry, struct snd_usb_stream, list);
+		usb_pcm_hw_init(&as->substream[dir], hw);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_usb_pcm_hw_init);
+
 /*
  * set up the runtime hardware information.
  */
@@ -1086,30 +1130,10 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 	int param_period_time_if_needed = -1;
 	int err;
 
-	runtime->hw.formats = subs->formats;
-
-	runtime->hw.rate_min = 0x7fffffff;
-	runtime->hw.rate_max = 0;
-	runtime->hw.channels_min = 256;
-	runtime->hw.channels_max = 0;
-	runtime->hw.rates = 0;
 	ptmin = UINT_MAX;
-	/* check min/max rates and channels */
+	usb_pcm_hw_init(subs, &runtime->hw);
+
 	list_for_each_entry(fp, &subs->fmt_list, list) {
-		runtime->hw.rates |= fp->rates;
-		if (runtime->hw.rate_min > fp->rate_min)
-			runtime->hw.rate_min = fp->rate_min;
-		if (runtime->hw.rate_max < fp->rate_max)
-			runtime->hw.rate_max = fp->rate_max;
-		if (runtime->hw.channels_min > fp->channels)
-			runtime->hw.channels_min = fp->channels;
-		if (runtime->hw.channels_max < fp->channels)
-			runtime->hw.channels_max = fp->channels;
-		if (fp->fmt_type == UAC_FORMAT_TYPE_II && fp->frame_size > 0) {
-			/* FIXME: there might be more than one audio formats... */
-			runtime->hw.period_bytes_min = runtime->hw.period_bytes_max =
-				fp->frame_size;
-		}
 		pt = 125 * (1 << fp->datainterval);
 		ptmin = min(ptmin, pt);
 	}
@@ -1202,12 +1226,12 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 	return 0;
 }
 
-static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
+static int __usb_pcm_open(struct snd_pcm_substream *substream)
 {
-	int direction = substream->stream;
-	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_usb_substream *subs = &as->substream[direction];
+	struct snd_usb_substream *subs = runtime->private_data;
+	struct snd_usb_stream *as = subs->stream;
+	int direction = substream->stream;
 	int ret;
 
 	runtime->hw = snd_usb_hardware;
@@ -1215,7 +1239,6 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
 	    as->chip->lowlatency)
 		runtime->hw.info |= SNDRV_PCM_INFO_SYNC_APPLPTR;
-	runtime->private_data = subs;
 	subs->pcm_substream = substream;
 	/* runtime PM is also done there */
 
@@ -1227,36 +1250,76 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	ret = setup_hw_info(runtime, subs);
 	if (ret < 0)
 		return ret;
-	ret = snd_usb_autoresume(subs->stream->chip);
+	ret = snd_usb_autoresume(as->chip);
 	if (ret < 0)
 		return ret;
-	ret = snd_media_stream_init(subs, as->pcm, direction);
+	ret = snd_media_stream_init(subs, substream->pcm, direction);
 	if (ret < 0)
-		snd_usb_autosuspend(subs->stream->chip);
+		snd_usb_autosuspend(as->chip);
 	return ret;
 }
 
-static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
+static int usb_pcm_open(struct snd_pcm_substream *substream)
 {
-	int direction = substream->stream;
 	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
-	struct snd_usb_substream *subs = &as->substream[direction];
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	/*
+	 * On ASoC side, substream->private_data is occupied by the
+	 * framework.  For ALSA and ASoC to share USB PCM operations
+	 * runtime->private_data shall be utilized instead.
+	 */
+	runtime->private_data = &as->substream[substream->stream];
+
+	return __usb_pcm_open(substream);
+}
+
+int snd_usb_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_usb_stream *as;
+
+	/*
+	 * On ASoC side, substream->private_data is occupied by the
+	 * framework.  For ALSA and ASoC to share USB PCM operations
+	 * runtime->private_data shall be utilized instead.
+	 */
+	as = list_entry(runtime->private_data, struct snd_usb_stream, list);
+	runtime->private_data = &as->substream[substream->stream];
+
+	return __usb_pcm_open(substream);
+}
+EXPORT_SYMBOL_GPL(snd_usb_pcm_open);
+
+int snd_usb_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct snd_usb_substream *subs = substream->runtime->private_data;
+	struct snd_usb_stream *as = subs->stream;
 	int ret;
 
 	snd_media_stop_pipeline(subs);
 
-	if (!snd_usb_lock_shutdown(subs->stream->chip)) {
+	if (!snd_usb_lock_shutdown(as->chip)) {
 		ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D1);
-		snd_usb_unlock_shutdown(subs->stream->chip);
+		snd_usb_unlock_shutdown(as->chip);
 		if (ret < 0)
 			return ret;
 	}
 
 	subs->pcm_substream = NULL;
-	snd_usb_autosuspend(subs->stream->chip);
+	snd_usb_autosuspend(as->chip);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_pcm_close);
+
+static int usb_pcm_close(struct snd_pcm_substream *substream)
+{
+	int ret = snd_usb_pcm_close(substream);
+
+	substream->runtime->private_data = NULL;
+	return ret;
+}
 
 /* Since a URB can handle only a single linear buffer, we must use double
  * buffering when the data to be transferred overflows the buffer boundary.
@@ -1744,10 +1807,10 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 }
 
 static const struct snd_pcm_ops snd_usb_playback_ops = {
-	.open =		snd_usb_pcm_open,
-	.close =	snd_usb_pcm_close,
-	.hw_params =	snd_usb_hw_params,
-	.hw_free =	snd_usb_hw_free,
+	.open =		usb_pcm_open,
+	.close =	usb_pcm_close,
+	.hw_params =	snd_usb_pcm_hw_params,
+	.hw_free =	snd_usb_pcm_hw_free,
 	.prepare =	snd_usb_pcm_prepare,
 	.trigger =	snd_usb_substream_playback_trigger,
 	.sync_stop =	snd_usb_pcm_sync_stop,
@@ -1756,10 +1819,10 @@ static const struct snd_pcm_ops snd_usb_playback_ops = {
 };
 
 static const struct snd_pcm_ops snd_usb_capture_ops = {
-	.open =		snd_usb_pcm_open,
-	.close =	snd_usb_pcm_close,
-	.hw_params =	snd_usb_hw_params,
-	.hw_free =	snd_usb_hw_free,
+	.open =		usb_pcm_open,
+	.close =	usb_pcm_close,
+	.hw_params =	snd_usb_pcm_hw_params,
+	.hw_free =	snd_usb_pcm_hw_free,
 	.prepare =	snd_usb_pcm_prepare,
 	.trigger =	snd_usb_substream_capture_trigger,
 	.sync_stop =	snd_usb_pcm_sync_stop,
-- 
2.25.1

