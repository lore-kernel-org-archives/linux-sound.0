Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72550208D60
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083705; cv=none; b=dcJ9cus4rmesFC9A6DsGZNc7Jkz1f1kdguGLdlJ1/+6+mTFJvl7GehUnZGjomxdLZNNAWfj8UaDjyf0m1kJX1tq3eLGok3ymhFwLvYq6TnFRlZF9MCeOqxCeK+s9MnfBp5s1h1/JvH6jBY75h03vOEUcP2yoGmf0op05G7LJHtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083705; c=relaxed/simple;
	bh=9+IjvcaJFjx7VKTRltojtYicutSkSZlKX5Vijk9d2o8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ndpfIQV31i01MJHi+MRt/XjMGLsVSQACKdF/iloVeVu8P9GwmJ/vHh6ntAj6WZlFwCb0N2h7t98alFyyBh1CqX85GcwD+eRWGONuVbzN+iV4qvMjcQgNCr07JcgK8a/dn6s7EIcPfml8e8BK07QLbWd6lR09gQ7jjYlzWcrXM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8gHmI9z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8gHmI9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729083704; x=1760619704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9+IjvcaJFjx7VKTRltojtYicutSkSZlKX5Vijk9d2o8=;
  b=g8gHmI9zbkfEtg6NeuGWKVfni0xWSM6QfIuccRl1sObiGk/21qpQfOgL
   mPM4pDVXj4feNKYhSAG90ehVGeNGEqrd+aTo7fb+LFdiXROc/6676jYIK
   FrtgcEJoKAmED/ZleRhXEw52CUnSto1pwM0e0n03IQjpCJPhq53RL16Fz
   KE+6vCxmP3su+aI4ccZhujYtsAfQtVzev/WSeFO88uR/HchvdG9aMu2Fk
   MidxlW6SJKJgD6iplRLvOHbwwXKr3QNbukCSlNnTqyPcBOxhcxosWxlPL
   /v0xHsOYg+sDY1QS7tROWncUMRmR7dFwvcJ1Fwy/UHrPtvI/ga11iTX1f
   w==;
X-CSE-ConnectionGUID: uot798ltSpqBGdYo8jmdDQ==
X-CSE-MsgGUID: /hE/RFwHTOyuCUEuv6fZtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32450301"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32450301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:01:43 -0700
X-CSE-ConnectionGUID: Du/KoUrARz6qjjWmpEm/Bg==
X-CSE-MsgGUID: NWmIUrE6T2mkOsfxJpzPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78566098"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2024 06:01:41 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH 1/4] ALSA: core: Add support for running detect on capture stream
Date: Wed, 16 Oct 2024 15:02:25 +0200
Message-Id: <20241016130228.1013227-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
References: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to save power when running detection on capture streams, there
is need for additional state which allows stream to be in "half" running
state. Goal is to allow for DSP to perform detection and then tell
userspace that it detected something and to trigger transfer to running
mode where capture will be performed for further analysis.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/pcm.h         |  2 +
 include/uapi/sound/asound.h |  4 +-
 sound/core/pcm_native.c     | 77 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 0bf7d25434d7f..f06ef7c718733 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -102,6 +102,8 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_TRIGGER_SUSPEND	5
 #define SNDRV_PCM_TRIGGER_RESUME	6
 #define SNDRV_PCM_TRIGGER_DRAIN		7
+#define SNDRV_PCM_TRIGGER_DETECT_STOP	8
+#define SNDRV_PCM_TRIGGER_DETECT_START	9
 
 #define SNDRV_PCM_POS_XRUN		((snd_pcm_uframes_t)-1)
 
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 4cd513215bcd8..c9f53d79638be 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -313,7 +313,8 @@ typedef int __bitwise snd_pcm_state_t;
 #define	SNDRV_PCM_STATE_PAUSED		((__force snd_pcm_state_t) 6) /* stream is paused */
 #define	SNDRV_PCM_STATE_SUSPENDED	((__force snd_pcm_state_t) 7) /* hardware is suspended */
 #define	SNDRV_PCM_STATE_DISCONNECTED	((__force snd_pcm_state_t) 8) /* hardware is disconnected */
-#define	SNDRV_PCM_STATE_LAST		SNDRV_PCM_STATE_DISCONNECTED
+#define	SNDRV_PCM_STATE_DETECTING	((__force snd_pcm_state_t) 9) /* stream is detecting (e.g. voice detection) */
+#define	SNDRV_PCM_STATE_LAST		SNDRV_PCM_STATE_DETECTING
 
 enum {
 	SNDRV_PCM_MMAP_OFFSET_DATA = 0x00000000,
@@ -703,6 +704,7 @@ enum {
 #define SNDRV_PCM_IOCTL_READI_FRAMES	_IOR('A', 0x51, struct snd_xferi)
 #define SNDRV_PCM_IOCTL_WRITEN_FRAMES	_IOW('A', 0x52, struct snd_xfern)
 #define SNDRV_PCM_IOCTL_READN_FRAMES	_IOR('A', 0x53, struct snd_xfern)
+#define SNDRV_PCM_IOCTL_DETECT		_IO('A', 0x54)
 #define SNDRV_PCM_IOCTL_LINK		_IOW('A', 0x60, int)
 #define SNDRV_PCM_IOCTL_UNLINK		_IO('A', 0x61)
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index b465fb6e1f5f0..4fe1d2f41149c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1410,6 +1410,72 @@ static int snd_pcm_action_nonatomic(const struct action_ops *ops,
 	return res;
 }
 
+/*
+ * detection callbacks
+ */
+
+static int snd_pcm_pre_detect(struct snd_pcm_substream *substream,
+			      snd_pcm_state_t state)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (runtime->status->state != SNDRV_PCM_STATE_PREPARED)
+		return -EBADFD;
+	/* Detection only makes sense on capture stream */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return -EINVAL;
+	runtime->trigger_tstamp_latched = false;
+	runtime->trigger_master = substream;
+	return 0;
+}
+
+static int snd_pcm_do_detect(struct snd_pcm_substream *substream,
+			     snd_pcm_state_t state)
+{
+	if (substream->runtime->trigger_master != substream)
+		return 0;
+	return substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_DETECT_START);
+}
+
+static void snd_pcm_undo_detect(struct snd_pcm_substream *substream,
+				snd_pcm_state_t state)
+{
+	if (substream->runtime->trigger_master == substream)
+		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_DETECT_STOP);
+}
+
+static void snd_pcm_post_detect(struct snd_pcm_substream *substream,
+				snd_pcm_state_t state)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_trigger_tstamp(substream);
+	runtime->hw_ptr_jiffies = jiffies;
+	runtime->hw_ptr_buffer_jiffies = (runtime->buffer_size * HZ) / runtime->rate;
+	runtime->status->state = state;
+	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTART);
+}
+
+static const struct action_ops snd_pcm_action_detect = {
+	.pre_action = snd_pcm_pre_detect,
+	.do_action = snd_pcm_do_detect,
+	.undo_action = snd_pcm_undo_detect,
+	.post_action = snd_pcm_post_detect,
+};
+
+/**
+ * snd_pcm_detect - start all detection streams
+ * @substream: the PCM substream instance
+ *
+ * Return: Zero if successful, or a negative error code.
+ * The stream lock must be acquired before calling this function.
+ */
+int snd_pcm_detect(struct snd_pcm_substream *substream)
+{
+	return snd_pcm_action_lock_irq(&snd_pcm_action_detect, substream,
+				       SNDRV_PCM_STATE_DETECTING);
+}
+
 /*
  * start callbacks
  */
@@ -1417,7 +1483,8 @@ static int snd_pcm_pre_start(struct snd_pcm_substream *substream,
 			     snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	if (runtime->state != SNDRV_PCM_STATE_PREPARED)
+	if (runtime->state != SNDRV_PCM_STATE_PREPARED &&
+	    runtime->state != SNDRV_PCM_STATE_DETECTING)
 		return -EBADFD;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    !snd_pcm_playback_data(substream))
@@ -2919,10 +2986,14 @@ static int snd_pcm_release(struct inode *inode, struct file *file)
 static int do_pcm_hwsync(struct snd_pcm_substream *substream)
 {
 	switch (substream->runtime->state) {
+	case SNDRV_PCM_STATE_DETECTING:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			return -EBADFD;
+		return snd_pcm_update_hw_ptr(substream);
 	case SNDRV_PCM_STATE_DRAINING:
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 			return -EBADFD;
-		fallthrough;
+		return snd_pcm_update_hw_ptr(substream);
 	case SNDRV_PCM_STATE_RUNNING:
 		return snd_pcm_update_hw_ptr(substream);
 	case SNDRV_PCM_STATE_PREPARED:
@@ -3342,6 +3413,8 @@ static int snd_pcm_common_ioctl(struct file *file,
 		return snd_pcm_prepare(substream, file);
 	case SNDRV_PCM_IOCTL_RESET:
 		return snd_pcm_reset(substream);
+	case SNDRV_PCM_IOCTL_DETECT:
+		return snd_pcm_detect(substream);
 	case SNDRV_PCM_IOCTL_START:
 		return snd_pcm_start_lock_irq(substream);
 	case SNDRV_PCM_IOCTL_LINK:
-- 
2.34.1

