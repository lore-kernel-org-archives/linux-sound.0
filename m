Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2604B36F42D
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560226; cv=none; b=qTa1skx1uD72d/2CbzzNXrDnHLI3BVCGi08SkulZvfF1wvZDWksUaQlQHxlyq6xMiD3FahSxAkoupne5g4zuImaOFLzZSTqWq6K65iCUwFO0DYzVGHCWIxvSBJgbgH7wEMoW5ntmBElmMlW+JFzN1Fh+lI3PyhBzcqCluxEcJSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560226; c=relaxed/simple;
	bh=Mo+ObBylqF1Fc/oCwM6Acv8RFU18zsM0n2iuDvdQJBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+I1xD3i2rZIAlOSbq7on20byGJgEVoWVW1REUeIWVe7wPKDfyUaPuyv46XIFaOG/L5mQNAlkIzcbzT/n3ojYOgTiAJG07NIlkLEpNMJF1aAbZryF+/2Q9bpyZ4KPlGqInsbY7AiWf7mBtBjlm9mp8EuJRn1kPeoI4huI+JgaaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpKi7sR8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpKi7sR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560216; x=1821096216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mo+ObBylqF1Fc/oCwM6Acv8RFU18zsM0n2iuDvdQJBA=;
  b=LpKi7sR8PIvLX41uMFR7nGNG5fdVPlULSAEM+j5Q3nkR6zEB3zI0xJb2
   1vAkJTGaVTDQ407lX95y+6BZ1NpmurYsK4d4hxdrVuqPEzrIKuJpHJGyX
   kpfk+QccjsztOD3yqGMrd0kA2gn8wo1Olrvtzj1I5yZp0tuXSlk/y7PFa
   8FQDYD/YCJ3hYlvLBrswQwIOF+ku64cY5BBdtVU+oE4XPv04fT6CSPwku
   HY5cMxMtQpgX0TI5SAVApwhNhiPtC1cnXAhoLEgAif2vOGqxxL1DRu+ce
   MZdEBVTFJSqpVgVIcvnzLfQ0P256neAVCSqQ3cIRuQJzXkFmHvbMoDul2
   Q==;
X-CSE-ConnectionGUID: cBY6Rg+rSQ2sehJlrcow2Q==
X-CSE-MsgGUID: 6tkhBCSoRBiSdjjVZnfLUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496280"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:30 -0700
X-CSE-ConnectionGUID: UGzkjg3dThuyoB/a0g5JmQ==
X-CSE-MsgGUID: Str9x1MUQcGmrmgg2uJj6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293365"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:27 -0700
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
Subject: [PATCH v4 06/26] ASoC: soc-compress: Stop running dpcm on free
Date: Wed, 16 Sep 2026 15:03:00 +0300
Message-ID: <20260916120320.18318-7-peter.ujfalusi@linux.intel.com>
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

If the last trigger that the compr device received is a DRAIN then the
DPCM is left in running state (no stop trigger is sent).
Before we execute the free we need to send a STOP trigger to make sure that
both BE and FE is in expected state and prepared for closing.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/soc-compress.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 9fd2eeeeabb4..a941ed0908c6 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -312,6 +312,16 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 	struct snd_soc_dpcm *dpcm;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
+	/*
+	 * The core will not send a STOP trigger on free if the device is in
+	 * DRAIN state, but we need to stop BE and FE before we can proceed to
+	 * free the stream.
+	 * Run the STOP trigger if the DPCM state is START (DRAIN is not
+	 * changing the DPCM state).
+	 */
+	if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+		cstream->ops->trigger(cstream, SNDRV_PCM_TRIGGER_STOP);
+
 	snd_soc_card_mutex_lock(fe->card);
 
 	snd_soc_dpcm_mutex_lock(fe);
-- 
2.55.0

