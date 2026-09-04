Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A3399018
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507106; cv=none; b=LtLFnBceKYUB20Q8zrqR6Nx6ORyJ6ehomNjxbzXWWE5XjZ3w/H/CL0lZQSB/gftm5/xHHdzbCFQrfh6lf95XfHEzbCcnv/JBobC4CvWhbdzRLNrbFrxDBK1QKFwrAKS4m+T/AB8GkegaujCP5ehD/Z/byCtadjB8/+L63BRNCW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507106; c=relaxed/simple;
	bh=t40SonsnB2rsjTlSRbLkaWbNgJUxK72WhMy8oW6+L7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlWJnBXg5snX6sjhuFcqrHTLGgoeA1tmsK0bwVXZGBj2x/sBq5vT6SB5cmPjBU7QKDlez/x0rl0ahEX1Fcob/UHik79jnFTUUavi1XQsVnRX8uc4vSsLhb1EFCZ7ro9QbfL5DEbHCwVPir+7AnKFsyLmfxNAO6uq8zdN6XlJc8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXcNsfzO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXcNsfzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507105; x=1820043105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t40SonsnB2rsjTlSRbLkaWbNgJUxK72WhMy8oW6+L7o=;
  b=BXcNsfzOy3wCBpT3c+Fs5EHGZJW8o9ZjfE6GBFeBEldliuglkBj7FjPX
   2cyzAIegRa23WDLYaIL0pzDYBtVFp2EBcPmKxwdxF7PvRbUuMQ+oqMbvV
   c7JzkuY3hnUNguHwf+tTKhTeRGzAwQBQ3PPD5UsS8hZTBhpcmKU0Rv+4m
   /HncPV/gcB1U28ILQIGyiHOAEsfuSaDy19kO3KvNKp9iNTZ43rEiOEEJt
   DP7OQ4hc9TaRQtVnskjKp6j8Ps48En/rHpDiJOt8GbRfNQZ+UcASDJBoH
   TafYs2ye1nxXOzbF+KfdiDMqGe7hKgeTLuR3paPOQvsSqdPtdz/bj3Ho5
   Q==;
X-CSE-ConnectionGUID: f3k9YbrLQXuhDxD7PWgAQQ==
X-CSE-MsgGUID: MT2cVt9CTHG9aXjrywTfPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111777824"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111777824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:41 -0700
X-CSE-ConnectionGUID: ojvENP40TIeptgGzHdVrIg==
X-CSE-MsgGUID: NHP5LaWYR9G01oon4RuHkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480551"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:38 -0700
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
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE sequencing as with normal PCMs
Date: Fri,  4 Sep 2026 10:31:15 +0300
Message-ID: <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
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
 sound/soc/soc-compress.c | 71 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e5a70c9b3d31..f0529f6eeefe 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -380,31 +380,84 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
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
 
 	if (cmd == SND_COMPR_TRIGGER_PARTIAL_DRAIN ||
 	    cmd == SND_COMPR_TRIGGER_DRAIN)
 		return snd_soc_component_compr_trigger(cstream, cmd);
 
+	if (fe->dai_link->trigger[stream] == SND_SOC_DPCM_TRIGGER_POST)
+		fe_first = false;
+	else
+		fe_first = true;
+
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

