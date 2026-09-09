Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7363B38A2
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944997; cv=none; b=ftOpmdeQQwO7OK0hbrLMVNmwT5IdgS7C5uuvcY0fBkB3A+rGMuGIwTEdZIznnEJy6YE5kjTivOoqGN3F4U1Cz/5UFHUPQUdo6jj+bQI0vvFCMgLdILdpNgfr7zyhf1TzDgJRmMke0YVFF01hnMpJICQr9iWzdk/8OPvjFwWxFlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944997; c=relaxed/simple;
	bh=4JMa5lrHeTfJsa4aFoBv6GFwVxYvh6xVt4wbvYr/0SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdFDHH4Yy93/CvI+Cd1uM3ehFPEOMhQ99nKHuCXuuQZKc7csAI0Mt5qxS6XabE16tZRV6UmTRc8Se46/nV0ZJVJUrxKPmRQmstdEToQSzPIZSQ86a73EMlyJlgmQ14hmZB+SfiE7DyqZXVqJdpawOCZeHHU/DHbcnB34Pim7ezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8kOUbkK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8kOUbkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788944996; x=1820480996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4JMa5lrHeTfJsa4aFoBv6GFwVxYvh6xVt4wbvYr/0SY=;
  b=b8kOUbkKqV0xF2Y4JIcMpNanK6h7A5bMzVqjzuvN0ZzeYI0kHu+dfl71
   mFkz5XakJ2m9CIGQ8lB9ZOou2kp8B1YfKFF1JsiYQPBX4ORuwdLdL1/OD
   kDhREJp7tQ1hHhqfwICouexdFaw9FQSOIWloOld7YcHeJ71KrN25+gB4X
   kNpsPkqREPmIfrsmp1hQv+SY7SIG9n3q0N0wVyjrRclg5Ql0fmpu5tq0d
   ha6bbK8MxT4m/V0xeqLyAotsKsZGQoFS/wirjz6KdXFfPkrIc37LlZI8o
   ord4CbDCQdFXVZ0RUsTU2nbO03JEWoRV8OFfX4TTudDU3pDWYR3JfOY+D
   w==;
X-CSE-ConnectionGUID: KdzDMZnlSae8/tCFtFsk/w==
X-CSE-MsgGUID: 3Ujw+UNLTj+kReYGIF+Aag==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200631"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200631"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:56 -0700
X-CSE-ConnectionGUID: rxam9u5aQh64qzK/4XfKhQ==
X-CSE-MsgGUID: 0NwZ3/KjQ7afoDoFsF0gAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972857"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:52 -0700
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
Subject: [PATCH v2 05/24] ASoC: soc-compress: Implement trigger FE-BE sequencing as with normal PCMs
Date: Wed,  9 Sep 2026 12:09:30 +0300
Message-ID: <20260909090949.7503-6-peter.ujfalusi@linux.intel.com>
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

The FE-BE trigger sequence should be dynamic, similarly how soc-pcm.c
dpcm_fe_dai_do_trigger() does it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/soc-compress.c | 81 ++++++++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e5a70c9b3d31..e9f6ab8c1678 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -380,31 +380,90 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 	return ret;
 }
 
-static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
+static int soc_compr_trigger_fe_be(struct snd_compr_stream *cstream, int cmd,
+				   bool fe_first)
 {
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
+	int ret;
+
+	if (fe_first) {
+		dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
+			fe->dai_link->name, cmd);
+
+		ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
+		if (ret < 0)
+			goto out;
+
+		ret = snd_soc_component_compr_trigger(cstream, cmd);
+		if (ret < 0)
+			goto out;
+
+		ret = dpcm_be_dai_trigger(fe, cstream->direction, cmd);
+	} else {
+		dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
+			fe->dai_link->name, cmd);
+
+		ret = dpcm_be_dai_trigger(fe, cstream->direction, cmd);
+		if (ret < 0)
+			goto out;
+
+		ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
+		if (ret < 0)
+			goto out;
+
+		ret = snd_soc_component_compr_trigger(cstream, cmd);
+	}
+
+out:
+	return snd_soc_ret(fe->dev, ret, "trigger FE cmd: %d failed\n", cmd);
+}
+
+static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
+{
+	struct snd_soc_pcm_runtime *fe = cstream->private_data;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
+	bool fe_first;
 	int ret;
 
-	if (cmd == SND_COMPR_TRIGGER_PARTIAL_DRAIN ||
-	    cmd == SND_COMPR_TRIGGER_DRAIN)
+	/* FE only triggers */
+	switch (cmd) {
+	case SND_COMPR_TRIGGER_PARTIAL_DRAIN:
+	case SND_COMPR_TRIGGER_NEXT_TRACK:
+	case SND_COMPR_TRIGGER_DRAIN:
 		return snd_soc_component_compr_trigger(cstream, cmd);
+	default:
+		break;
+	}
+
+	if (fe->dai_link->trigger[stream] == SND_SOC_DPCM_TRIGGER_POST)
+		fe_first = false;
+	else
+		fe_first = true;
 
 	snd_soc_card_mutex_lock(fe->card);
 
-	ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
-	if (ret < 0)
-		goto out;
+	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = soc_compr_trigger_fe_be(cstream, cmd, fe_first);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = soc_compr_trigger_fe_be(cstream, cmd, !fe_first);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
 
-	ret = snd_soc_component_compr_trigger(cstream, cmd);
 	if (ret < 0)
 		goto out;
 
-	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
-
-	ret = dpcm_be_dai_trigger(fe, stream, cmd);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-- 
2.55.0

