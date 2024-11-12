Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC96230992
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731411557; cv=none; b=IpKYC8c2PW0+GzrFGFsdgBFkYnP9h8EhJP9fWZQ+fBgEFboOGGLsr1743NKl87qCoIeOQNqwWpi/obgfLMzybmEiboWAQ/1xwK8qqPPunCe+FeZLOd9ttAtVL3Yk6ZuTQEX5HZefKS56mszu2IHUZdD3Eg1GS0QqRE0k5WwQN64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731411557; c=relaxed/simple;
	bh=HaFXJBfSzun+1TbbZzwPw3DAsmTFdr3L2rWAPQXfos8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6XeFimOOSrHbFFkWeoyrWajwsuUZc21U+kUTTPsA+GQz9akVtWcCqBRNb3LuEFUomq76s2KX7RjbGiCf1n5W7FB2EUdmkz8KpYL+q4l4UKany6fHIjhLL24Ok0+cPhvhk3hbqPWF7K9ZD36cZ8l1S2XP8itZ01J88tgCrFUqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6BG/oLr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6BG/oLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731411557; x=1762947557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HaFXJBfSzun+1TbbZzwPw3DAsmTFdr3L2rWAPQXfos8=;
  b=Q6BG/oLrFtjzlOzRUaNUY46EhdurNy1zmjhxxWCobxLM3L/3fyM5fDfu
   R1R88FLXlHVDLCbkTV9GQITc/q/ta4E/Xgv+YFysr37TCuGtE+WuM7zAr
   8/3qAQegnelMObzio2A8jUaOIdlK2M+9lQ79dEjOr1E3omU0D/aFwbslK
   z3SMKcM5hLIfILlza7VNhuRjtun3FcUYhJTC3KcDr+bTGycR6WX1qTdFR
   qjv2KRrRad/1ZwuaCOfDsXebLjRuAxZDMprBow3rJq92TTJ97p4hm76xK
   oQXwU2TobHq/rl9beX31d5CukIrTcGMtAJ0vmbxxEu1u54S8E6fXC0qhs
   g==;
X-CSE-ConnectionGUID: 66h/QrmxT72p8HNXkingag==
X-CSE-MsgGUID: u25tmTz0Qem+DfTeJ5Cm2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41802883"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41802883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:39:17 -0800
X-CSE-ConnectionGUID: 99Krs0cySl2X65uuDNAK2w==
X-CSE-MsgGUID: yHfb9WhSQyWgayuuJbVkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="118358218"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2024 03:39:14 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH v2 1/4] ASoC: Intel: avs: Simplify pipeline management
Date: Tue, 12 Nov 2024 12:40:03 +0100
Message-Id: <20241112114006.2812697-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112114006.2812697-1-amadeuszx.slawinski@linux.intel.com>
References: <20241112114006.2812697-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DSP pipelines follow simple state machine scheme:
CREATE -> RESET -> PAUSE -> RUNNING -> PAUSE -> RESET -> DELETE

When code was first designed there was assumption that code doesn't
remember pipeline state, so it can for example send reset command twice
to pipeline. Final version of code however remembers pipeline state and
prevents such operations, which allows us to significantly reduce number
of operations on pipelines.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/pcm.c | 41 +++++++++++----------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 945f9c0a6a545..83eb01cf17e9c 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -206,11 +206,15 @@ static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
 static int avs_dai_nonhda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s: %s\n", __func__, dai->name);
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	if (data->path) {
+		ret = avs_path_reset(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "reset path failed: %d\n", ret);
 		avs_path_free(data->path);
 		data->path = NULL;
 	}
@@ -234,12 +238,6 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		ret = avs_path_pause(data->path);
-		if (ret < 0) {
-			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
-			break;
-		}
-
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run BE path failed: %d\n", ret);
@@ -254,10 +252,6 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 		ret = avs_path_pause(data->path);
 		if (ret < 0)
 			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
-
-		ret = avs_path_reset(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "reset BE path failed: %d\n", ret);
 		break;
 
 	default:
@@ -332,6 +326,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct hda_codec *codec;
+	int ret;
 
 	dev_dbg(dai->dev, "%s: %s\n", __func__, dai->name);
 
@@ -341,6 +336,9 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 
 	link_stream = data->link_stream;
 	link_stream->link_prepared = false;
+	ret = avs_path_reset(data->path);
+	if (ret < 0)
+		dev_err(dai->dev, "reset path failed: %d\n", ret);
 	avs_path_free(data->path);
 	data->path = NULL;
 
@@ -422,12 +420,6 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		snd_hdac_ext_stream_start(data->link_stream);
 
-		ret = avs_path_pause(data->path);
-		if (ret < 0) {
-			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
-			break;
-		}
-
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run BE path failed: %d\n", ret);
@@ -444,10 +436,6 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
 		snd_hdac_ext_stream_clear(data->link_stream);
-
-		ret = avs_path_reset(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "reset BE path failed: %d\n", ret);
 		break;
 
 	default:
@@ -621,6 +609,9 @@ static int __avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_
 	if (ret < 0)
 		dev_err(dai->dev, "unbind FE <-> BE failed: %d\n", ret);
 
+	ret = avs_path_reset(data->path);
+	if (ret < 0)
+		dev_err(dai->dev, "reset path failed: %d\n", ret);
 	avs_path_free(data->path);
 	data->path = NULL;
 	snd_hdac_stream_cleanup(hdac_stream(host_stream));
@@ -782,12 +773,6 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 		if (cmd == SNDRV_PCM_TRIGGER_RESUME)
 			snd_hdac_stream_wait_drsm(hdac_stream(host_stream));
 
-		ret = avs_path_pause(data->path);
-		if (ret < 0) {
-			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
-			break;
-		}
-
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run FE path failed: %d\n", ret);
@@ -807,10 +792,6 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 		spin_lock_irqsave(&bus->reg_lock, flags);
 		avs_hda_stream_stop(bus, host_stream);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
-
-		ret = avs_path_reset(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "reset FE path failed: %d\n", ret);
 		break;
 
 	default:
-- 
2.34.1

