Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4CE3DCD99
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560218; cv=none; b=XKCbcc1rV8LfS3EaTM5GmmD/yoBp43JjJCbeu2n+fJlJ1rnANkM6O25ptksUtveb8hVptyEsmxUia+jradPDC6UkO3X4BrjfZHIW2EfBoQFldMy7eqHefO8i82T+caj093EPhFgKkJKlZYZpqBgUy64Fnq0G9jqCE4vbYI5v1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560218; c=relaxed/simple;
	bh=9XEityiEff+28pxW2ALVDDRdMuRQfPGRpGhMjoGOs1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCAlzUiRCrJEnbHZ+WBsVCk72+KRWUSOm5XPN4ZRg3cTJ+ZfKaQ155GBorVW/jfkgPNgFxt15NNMgg1eDLUMXN2MNj5oze62H3BsigOtnOgf3O9YVVpMbzeNdsORl+fCDFcQxDpGAtuiXMnnQK/2nALsPIDNszheg4RWH4ATX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOTYLNfW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOTYLNfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560210; x=1821096210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9XEityiEff+28pxW2ALVDDRdMuRQfPGRpGhMjoGOs1U=;
  b=GOTYLNfW5oP9Kpx9G8jrdpHfDg3ZoMA+NFIbQw+Z3GvcwAliOJptIxao
   dCBtm5WABbPVW+0MgAYc9NN5VjQTquwhyAO3yXI0INUXG83pglgMtO2xw
   ijMGRE8sSHvNR6XfbBa61VGauknMJPx+5Y8iNN6/xU3eKBxAGNjHnL+eD
   QPr53pPq/oL36e4AGqXq3upS+SJydM9SMASpDBDbnz2jRQc54fUHjG1Ms
   ktDBjvygcvRRCaV90cGvoq9w+a2pylmxGST1BOOFih+EsXvBkNO4TH9E9
   2At29iQyEdhw0O7fROcOhQb7VcU0PvSOhz2afT1x5/VCsUeQQ3OwdpfMC
   w==;
X-CSE-ConnectionGUID: GP471TrbSlCkKUOLt+at0Q==
X-CSE-MsgGUID: 6rwOPNxNT22+fgF22P2cfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496265"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:27 -0700
X-CSE-ConnectionGUID: UN8+2LyNSjayhiiphDfp2w==
X-CSE-MsgGUID: RT4vv1c0STOFMb6lAxmdKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293353"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:24 -0700
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
Subject: [PATCH v4 05/26] ASoC: soc-compress: Implement trigger FE-BE sequencing as with normal PCMs
Date: Wed, 16 Sep 2026 15:02:59 +0300
Message-ID: <20260916120320.18318-6-peter.ujfalusi@linux.intel.com>
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
2.55.0

