Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D84E1C84AA
	for <linux-sound@vger.kernel.org>; Mon, 31 Mar 2025 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418547; cv=none; b=W6s3R9zP56De/dq3KxS+4rbr15x93WCWwzut3I8p1WtIrqVBzUghbz2cgrrkYqVAYslE+7MfwPtawRjc3MdEVY32gLZ5cIr2Uzk23JGstRpQvE1qHuZ9pCHyvXikrI+Cz2HieSboRRxLwGgdAZD/o4YmQtZT18jsKO6ZS4J0fi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418547; c=relaxed/simple;
	bh=7l7X2jaEuXCdVbY2uknCsnwMvXW1nnNNuwgF3PveaVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gAT9M+Sok8Td7QfGC8h7rBXN87EKmSRAELggnWzNj5tEULchQGMQQ+0fMKgq10S4kEfLGNxcDzURgpNJV50cDGqExheDvpeBOGh5e2eWi53MqffugQwDjpyStTw2ECnFLfjB2KvTdKpmU5Gv2Y+iPkJhEloWMwNcZJc4O6/AhIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8wHgVe7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8wHgVe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743418545; x=1774954545;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7l7X2jaEuXCdVbY2uknCsnwMvXW1nnNNuwgF3PveaVQ=;
  b=m8wHgVe7mFyBfqHC5SsCOA6dtrkI1PptXqbvGUOdM/eXutfrqXhUsjQ/
   n6gljxI8WeZehOomfvNeeFK6Qe65QpnUJ2LfOTNrwpbU1oebeOylq272+
   lPJddwiqTnakElNWYsEYl3TaOwCTLoson0yY4GTA2fX7BGQymSzXZGFIX
   xoGqlM8ro6O7KPvS9iu3LSvCXwLC2uWf252Qj/RYm+rpuoWYr/E4h55bl
   GaihXgSrfA9hTem7BO0HEJt1yVNBmYOfPOYQhyQIwt9/1Ht2+PLASg2S4
   Zy7J0Re4NQwndCxJjQ2kq9WPUqJGUm2W+iMvd0B5iksgr3iYNzUIzTO5i
   w==;
X-CSE-ConnectionGUID: k/1bRs/eRlmnb68rqnMi8w==
X-CSE-MsgGUID: AZfKbsClQaGynpg1AoAhmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="55348236"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="55348236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 03:55:45 -0700
X-CSE-ConnectionGUID: 50T8OnvxQ7a/y3EvSA3MBg==
X-CSE-MsgGUID: BEuyA9jcQ6SNZSprjL6LCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="130764570"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.251.162])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 03:55:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [RFC] ASoC: SOF: sof-pcm/pm: Stop paused streams before the system suspend
Date: Mon, 31 Mar 2025 13:56:31 +0300
Message-ID: <20250331105631.7436-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Paused streams will not receive a suspend trigger, they will be marked by
ALSA core as suspended and it's state is saved.
Since the pause stream is not in a fully stopped state, for example DMA
might be still enabled (just the trigger source is removed/disabled) we
need to make sure that the hardware is ready to handle the suspend.

This involves a bit more than just stopping a DMA since we also need to
communicate with the firmware in a delicate sequence to follow IP
programming flows.
To make things a bit more challenging, these flows are different between
IPC versions due to the fact that they use different messages to implement
the same functionality.

To avoid adding yet another path, callbacks and sequencing for handling the
corner case of suspending while a stream is paused, and do this for each
IPC versions and platforms, we can move the stream back to running just to
put it to stopped state.

Explanation of the change:
Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
does not support RESUME then on system resume the RESUME trigger is not
sent, the stream's state and suspended_state remains untouched.
When the user space releases the pause then the core will reject this
because the state of the stream is _not_ PAUSED, it is still SUSPENDED.

From this point user space will do the normal (hw_params) prepare and
START, PAUSE_RELEASE trigger will not be sent by the core after the
system has resumed.

Link: https://github.com/thesofproject/linux/issues/5035
Link: https://github.com/thesofproject/linux/issues/5341
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

Please see the problem statement and details of the issue in the commit
message.

I'm not sure if this should be done in ALSA+ASoC level instead. My fear
is that this is changing how things has been working since almost
forever and it really puzzles me why it is not affecting other drivers.
It is true that in SOF the PAUSED state is not equal to STOPED while
it might be so for other vendors (it is for TI stuff for sure).

The main point is that when we do a system suspend and a stream is in
PAUSED state, it will not be triggered (PAUSED == SUSPENDED/STOPPED
assumption?). On resume, if the platform is not supporting RESUME then
nothing will be done for the PAUSED stream, but a PAUSE_RELEASE will
fail and all sorts of state machine assumption will break in SOF/ASoC
stack.

I have a PR open for quite long [1] but we would like to find the best
solution for us and possibly for others facing the same issue as well.

[1] https://github.com/thesofproject/linux/pull/5058

Thank you,
Peter
---
 sound/soc/sof/pcm.c      | 76 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/pm.c       | 11 ++++++
 sound/soc/sof/sof-priv.h |  2 ++
 3 files changed, 89 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index d584a72e6f52..0b78aa585cd5 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -760,6 +760,82 @@ static snd_pcm_sframes_t sof_pcm_delay(struct snd_soc_component *component,
 	return 0;
 }
 
+static int sof_pcm_trigger_suspended_paused_streams(struct snd_sof_dev *sdev,
+						    int cmd)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_runtime *runtime;
+	struct snd_sof_pcm *spcm;
+	int dir, ret;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		for_each_pcm_streams(dir) {
+			substream = spcm->stream[dir].substream;
+			if (!substream || !substream->runtime)
+				continue;
+
+			/*
+			 * The stream supports RESUME, it is expected that it
+			 * is handling the corner case of suspending while
+			 * a stream is paused
+			 */
+			runtime = substream->runtime;
+			if (runtime->info & SNDRV_PCM_INFO_RESUME)
+				continue;
+
+			/* Only send the trigger to a paused and suspended stream */
+			if (runtime->state != SNDRV_PCM_STATE_SUSPENDED ||
+			    runtime->suspended_state != SNDRV_PCM_STATE_PAUSED)
+				continue;
+
+			ret = substream->ops->trigger(substream, cmd);
+			if (ret) {
+				spcm_err(spcm, substream->stream,
+					 "trigger %d failed\n", cmd);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+int sof_pcm_stop_paused_on_suspend(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	/*
+	 * Handle the corner case of system suspend while at least one stream is
+	 * paused.
+	 * Paused streams will not receive the SUSPEND triggers, they are
+	 * 'silently' moved to SUSPENDED state.
+	 *
+	 * The workaround for the corner case is applicable for streams not
+	 * supporting RESUME.
+	 *
+	 * First we need to move (trigger) the paused streams to RUNNING state,
+	 * then we need to stop them
+	 *
+	 * Explanation: Streams moved to SUSPENDED state from PAUSED without
+	 * trigger. If a stream does not support RESUME then on system resume
+	 * the RESUME trigger is not sent, the stream's state and suspended_state
+	 * remains untouched. When the user space releases the pause then the
+	 * core will reject this because the state of the stream is _not_ PAUSED,
+	 * it is still SUSPENDED.
+	 * From this point user space will do the normal (hw_params) prepare and
+	 * START, PAUSE_RELEASE trigger will not be sent by the core after the
+	 * system has resumed.
+	 */
+	ret = sof_pcm_trigger_suspended_paused_streams(sdev,
+						       SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
+	if (ret)
+		return ret;
+
+	return sof_pcm_trigger_suspended_paused_streams(sdev,
+							SNDRV_PCM_TRIGGER_STOP);
+}
+EXPORT_SYMBOL(sof_pcm_stop_paused_on_suspend);
+
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 {
 	struct snd_soc_component_driver *pd = &sdev->plat_drv;
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 8e3bcf602beb..e257d23d9d19 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -210,6 +210,17 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (runtime_suspend && !sof_ops(sdev)->runtime_suspend)
 		return 0;
 
+	/*
+	 * On system suspend we need special handling of paused streams
+	 * For more details, see the comment section in
+	 * sof_pcm_stop_paused_on_suspend)(
+	 */
+	if (!runtime_suspend) {
+		ret = sof_pcm_stop_paused_on_suspend(sdev);
+		if (ret < 0)
+			return ret;
+	}
+
 	/* we need to tear down pipelines only if the DSP hardware is
 	 * active, which happens for PCI devices. if the device is
 	 * suspended, it is brought back to full power and then
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index abbb5ee7e08c..5750d9038647 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -706,6 +706,8 @@ void snd_sof_complete(struct device *dev);
 
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
 
+int sof_pcm_stop_paused_on_suspend(struct snd_sof_dev *sdev);
+
 /*
  * Compress support
  */
-- 
2.49.0

