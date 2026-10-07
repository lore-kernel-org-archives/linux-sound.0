Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC2C40FD9B
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362998; cv=none; b=RPXuNuts1wiQhiFFHrrujY/O7US1gJNQAyQ6dNymgpJj2ygkqHl7DPvban/2TXEQc6wiZ7zvQXIlQc36j8r7NoFnzwqjKdqOYVjiOFkT+K0KOx9eCw9m7GUa0GR3f++tjW6aXPsn8cTiXJsbjrD9CvjZ7Z/EcfrrhS9U7yml7e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362998; c=relaxed/simple;
	bh=dkABo8dLxICQbE/KSGoxF65SZY4kCblO8IZ/p7Wa8uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qo5e4wYDfibZH7Pmhx/fLMROeK2wB50gobjORVenlbNazsAH5DfXoM9htRe/HmT3SO+Z2jt0fNWbwxkn95SYuE5kbT+JcTg95+MUMzGCRqZAcgr359kDjIUPHgN8lL68vH7j+W0MTUnktw+K7xJ/mrzViBf92tP4E0az95wEUWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwcFxv1G; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwcFxv1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791362997; x=1822898997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dkABo8dLxICQbE/KSGoxF65SZY4kCblO8IZ/p7Wa8uE=;
  b=GwcFxv1GdVgxW9sWGhhf3i5kE2pqwQfVpSjACUXIyVXPyG7RDBon5y5b
   WK8xuG/RwfmMCyJSwdMJUaqV2xKdD4lNUWGENu+uBG6MlX+SpexITUhsP
   VDhtZuTVeX8KA1/Df2EAd7zSsB5UrnNN+qGGmeSjTfoaeTDv0qd0mi9mK
   SknVqUeXChN1lSmPmWsAfIrxxScNfDTTuasY6P2vVE9lJJ8FT2eiJMSeN
   LNck44GzMTLDyH7SBU3/aC5a6kW0G36bRgNNyCM9TPVp7mjpL6gkQ2VZq
   rNMraw+fjCY4Ea3DNcHjAS0MzbWA5yuMGgQE7FEMyDDy0eaPGKMe8jyLb
   Q==;
X-CSE-ConnectionGUID: TKnhkFxSRzWQ/fuGuUw9Dw==
X-CSE-MsgGUID: usxNRoJAQWOUv8oLp/dqrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113876"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113876"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:56 -0700
X-CSE-ConnectionGUID: NNkcK3wMTFiAEzU15Hfp1Q==
X-CSE-MsgGUID: qRfwQL1MRMiA5v3B89WDWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670544"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:53 -0700
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
Subject: [PATCH v5 06/28] ASoC: soc-compress: Implement trigger FE-BE sequencing as with normal PCMs
Date: Wed,  7 Oct 2026 11:49:33 +0300
Message-ID: <20261007084955.1256-7-peter.ujfalusi@linux.intel.com>
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

The FE-BE trigger sequence should be dynamic, similarly how soc-pcm.c
dpcm_fe_dai_do_trigger() does it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/soc-compress.c | 81 ++++++++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index b803e8cb4ea4..9fd2eeeeabb4 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -381,31 +381,90 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
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
2.56.0

