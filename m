Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167911C2325
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083708; cv=none; b=KEWoLfiMqJSmYyOkZKjRBsGjYhZ4rXB5XxkQy1MSW9p3hKuYtX6Iq9GSPcjJA+A63GE8PaamWw0lTTGR6agFycDI1B9wfRY0s9eIVgdtAgJIPRQALEJfZVbsRdiOIbzGBBqfLqqeYdIs4qn0K4y/T3aCgzdvPtJhyHq/SJkuJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083708; c=relaxed/simple;
	bh=zDmtgweDuOLg46Y8hyTZlkdExXCrOLa6FqIUvt3aulQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U/v0qA0cDzpIiiP9cY3cZUC7IeyMhBdIzlDHrpAP2Pv8seJyej4r2gIehfAF2aZ9JJfwEDoIUH+rIxc7Oib3FknZH3DUvk5/pVCVmdsJzzO3hHEzIIi8OR6OzPXR4E3ShaR6wluejJ8VDwt149OhNy+nVyBISV58ScRWpX+uuHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8J67jOU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8J67jOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729083707; x=1760619707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zDmtgweDuOLg46Y8hyTZlkdExXCrOLa6FqIUvt3aulQ=;
  b=l8J67jOUzpW/TpRIYbyBGVaux0842n55sE6yHR6iTaICh0OrKpsZsXFs
   +qDeukgyUWUtHl6cQ9c++UZxapBNvudBh81PydSZEXEhdaTmFWSju4O0s
   vKFPdWN3Tgu3XIJYHMxERtLDWGgaP/7ZxAzVv2Z/qxoyUktP3sIZr4WTa
   2WdTWlIcXY1kLVIC+5IlXDAacE7rlqy8jqWlGq1eKW9o9NuGbfE3ybv3j
   Mt+1qB4OmA/Z7owx5PFqq964vgoKIFqWhSZ4cU6n6YDZnEBGYlJwMg67X
   Z6J4tCCQM3OH9nfbx8adhtzRbPSBOj/8ArbbZXlTWe600JoXjLcfTxodu
   A==;
X-CSE-ConnectionGUID: XiUoo4YDSUSxpJJ7Z9oZ6g==
X-CSE-MsgGUID: taK/YQpQR8aBExaWcpUzVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32450324"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32450324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:01:46 -0700
X-CSE-ConnectionGUID: IM9fvkH9RDKZnyQ221Dz4A==
X-CSE-MsgGUID: TyAbngOdSJKZeatVqy4QSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78566138"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2024 06:01:45 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH 3/4] ASoC: pcm: Add support for running detect on capture stream
Date: Wed, 16 Oct 2024 15:02:27 +0200
Message-Id: <20241016130228.1013227-4-amadeuszx.slawinski@linux.intel.com>
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

In order to be able to run detection on capture streams, DPCM state
machine needs to be expanded to recognize "detect" state.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/soc-dpcm.h |  2 ++
 sound/core/pcm_native.c  |  2 +-
 sound/soc/soc-pcm.c      | 56 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index c6fb350b4b062..7062f77528edd 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -40,6 +40,7 @@ enum snd_soc_dpcm_state {
 	SND_SOC_DPCM_STATE_OPEN,
 	SND_SOC_DPCM_STATE_HW_PARAMS,
 	SND_SOC_DPCM_STATE_PREPARE,
+	SND_SOC_DPCM_STATE_DETECT,
 	SND_SOC_DPCM_STATE_START,
 	SND_SOC_DPCM_STATE_STOP,
 	SND_SOC_DPCM_STATE_PAUSED,
@@ -98,6 +99,7 @@ struct snd_soc_dpcm_runtime {
 
 	int trigger_pending; /* trigger cmd + 1 if pending, 0 if not */
 
+	int be_detect; /* detection runinng on BE */
 	int be_start; /* refcount protected by BE stream pcm lock */
 	int be_pause; /* refcount protected by BE stream pcm lock */
 	bool fe_pause; /* used to track STOP after PAUSE */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index c024eb0ed74ff..5370797801132 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1470,7 +1470,7 @@ static const struct action_ops snd_pcm_action_detect = {
  * Return: Zero if successful, or a negative error code.
  * The stream lock must be acquired before calling this function.
  */
-int snd_pcm_detect(struct snd_pcm_substream *substream)
+static int snd_pcm_detect(struct snd_pcm_substream *substream)
 {
 	return snd_pcm_action_lock_irq(&snd_pcm_action_detect, substream,
 				       SNDRV_PCM_STATE_DETECTING);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7a59121fc323c..2d65008ec7a2b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -110,6 +110,7 @@ static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 		SND_SOC_DPCM_STATE_START,
 		SND_SOC_DPCM_STATE_PAUSED,
 		SND_SOC_DPCM_STATE_SUSPEND,
+		SND_SOC_DPCM_STATE_DETECT,
 	};
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
@@ -127,6 +128,7 @@ static int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		SND_SOC_DPCM_STATE_PAUSED,
 		SND_SOC_DPCM_STATE_SUSPEND,
 		SND_SOC_DPCM_STATE_PREPARE,
+		SND_SOC_DPCM_STATE_DETECT,
 	};
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
@@ -171,6 +173,8 @@ static const char *dpcm_state_string(enum snd_soc_dpcm_state state)
 		return "hw_params";
 	case SND_SOC_DPCM_STATE_PREPARE:
 		return "prepare";
+	case SND_SOC_DPCM_STATE_DETECT:
+		return "detect";
 	case SND_SOC_DPCM_STATE_START:
 		return "start";
 	case SND_SOC_DPCM_STATE_STOP:
@@ -1250,6 +1254,7 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_DETECT_START:
 		for (i = 0; i < TRIGGER_MAX; i++) {
 			r = trigger[start][i](substream, cmd, 0);
 			if (r < 0)
@@ -1274,6 +1279,9 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 			cmd = SNDRV_PCM_TRIGGER_PAUSE_PUSH;
 			break;
+		case SNDRV_PCM_TRIGGER_DETECT_START:
+			cmd = SNDRV_PCM_TRIGGER_DETECT_STOP;
+			break;
 		}
 	}
 
@@ -1284,6 +1292,7 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_DETECT_STOP:
 		for (i = TRIGGER_MAX; i > 0; i--) {
 			r = trigger[stop][i - 1](substream, cmd, rollback);
 			if (r < 0)
@@ -2247,6 +2256,25 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			be->dai_link->name, cmd);
 
 		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_DETECT_START:
+			if (!be->dpcm[stream].be_start &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP))
+				goto next;
+
+			be->dpcm[stream].be_detect++;
+			if (be->dpcm[stream].be_detect != 1)
+				goto next;
+
+			ret = soc_pcm_trigger(be_substream,
+					      SNDRV_PCM_TRIGGER_DETECT_START);
+			if (ret) {
+				be->dpcm[stream].be_detect--;
+				goto next;
+			}
+
+			be->dpcm[stream].state = SND_SOC_DPCM_STATE_DETECT;
+			break;
 		case SNDRV_PCM_TRIGGER_START:
 			if (!be->dpcm[stream].be_start &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
@@ -2254,6 +2282,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
+			if (be->dpcm[stream].be_detect > 0)
+				be->dpcm[stream].be_detect = 0;
 			be->dpcm[stream].be_start++;
 			if (be->dpcm[stream].be_start != 1)
 				goto next;
@@ -2308,6 +2338,23 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
+		case SNDRV_PCM_TRIGGER_DETECT_STOP:
+			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_DETECT)
+				goto next;
+
+			be->dpcm[stream].be_detect--;
+
+			if (be->dpcm[stream].be_detect != 0)
+				goto next;
+
+			ret = soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_DETECT_STOP);
+			if (ret) {
+				be->dpcm[stream].be_detect++;
+				goto next;
+			}
+
+			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
+			break;
 		case SNDRV_PCM_TRIGGER_STOP:
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
@@ -2440,11 +2487,13 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		case SNDRV_PCM_TRIGGER_RESUME:
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		case SNDRV_PCM_TRIGGER_DRAIN:
+		case SNDRV_PCM_TRIGGER_DETECT_START:
 			ret = dpcm_dai_trigger_fe_be(substream, cmd, true);
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
 		case SNDRV_PCM_TRIGGER_SUSPEND:
 		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		case SNDRV_PCM_TRIGGER_DETECT_STOP:
 			ret = dpcm_dai_trigger_fe_be(substream, cmd, false);
 			break;
 		default:
@@ -2458,11 +2507,13 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		case SNDRV_PCM_TRIGGER_RESUME:
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		case SNDRV_PCM_TRIGGER_DRAIN:
+		case SNDRV_PCM_TRIGGER_DETECT_START:
 			ret = dpcm_dai_trigger_fe_be(substream, cmd, false);
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
 		case SNDRV_PCM_TRIGGER_SUSPEND:
 		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		case SNDRV_PCM_TRIGGER_DETECT_STOP:
 			ret = dpcm_dai_trigger_fe_be(substream, cmd, true);
 			break;
 		default:
@@ -2484,6 +2535,10 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 	}
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_DETECT_START:
+		// return -EINVAL;? as FE is not running when detect happens?
+		fe->dpcm[stream].state = SND_SOC_DPCM_STATE_DETECT;
+		break;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -2491,6 +2546,7 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_DETECT_STOP:
 		fe->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-- 
2.34.1

