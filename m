Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B2A63D5
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717399924; cv=none; b=Y9n9a3sfxiFpVwvIR/mmJ0jA1QGBrKvm5GhrPIAB3UpTmJWJGQY01F1NIcx1zYb4oBBkhwVBhnX5o8UnEDiWFzM75bEIYv5NSNh6+e+DdaWyu4Om10HL+BJv7/bcMDKMHmFmh4vpKKcb7ZCQ3gvpljFUt/HZAI/jH97hwvww0CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717399924; c=relaxed/simple;
	bh=Ei3Gvi+OjeEDnqwlJnQ2fukQ17jef0XD87VucALiQjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ftghkMTOzSMXDG7VglwCleGk/qoMT2OUAj5uLEe/EnAHbPsF3PKl3UzCjnOu69olmQ7XXtPB6a11bLhJT0WSPKOX6HDImPu5FXLJdua5OMe1wi4WprExZCTUNBtqytVhDarA6oXHOnMFxEyv28WUCAqh9nK2GoCza0O1YV5b1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wg8TyHRk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wg8TyHRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717399923; x=1748935923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ei3Gvi+OjeEDnqwlJnQ2fukQ17jef0XD87VucALiQjc=;
  b=Wg8TyHRkOYbXhC8mYMbLRPhwnrjvm1yUFtkZ5J76N23xjlZLSOd918/O
   90WhkIXuLtwwPYiisP/u3L2RdCddOXJulyfWl4xHybW9TpmDCOX057lwe
   9ydoY0K2iLUls+geZP75x59A3nCkCIDz16AkHfz9r0BTFFwAYZQpkNid5
   pRcaZAb2+VZE+FkQQMpeic2lM5dIQTCbIajUyUQo38TbBhy5iuW4tq06f
   6MIHT3W2bkkdEiC0gWMtVExfotC9aejjnF1HiPr0OOS/XKqciTF+MQXIV
   pojrMcUOXwiZ5bx6b0ONNjcpwbJ74ssiV4kovQr0ANniK6+oNjUy7EJWM
   A==;
X-CSE-ConnectionGUID: XPWL82/7RPmSeRIxraT8CQ==
X-CSE-MsgGUID: RQG21wN+RNGMRTkKgOOHlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13729080"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="13729080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:32:02 -0700
X-CSE-ConnectionGUID: PUrhdxcARLOxRGlCRimX4A==
X-CSE-MsgGUID: 58Pp7e3TSZetjChAsX2sDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="36787943"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.158])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:32:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: hda-dai: skip tlv for dspless mode
Date: Mon,  3 Jun 2024 10:32:23 +0300
Message-ID: <20240603073224.14726-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603073224.14726-1-peter.ujfalusi@linux.intel.com>
References: <20240603073224.14726-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

sof_ipc4_dma_config_tlv{} is for Audio DSP firmware only.
Don't set it in dspless mode.

Fixes: 17386cb1b48b ("ASoC: SOF: Intel: hda-dai: set dma_stream_channel_map device")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ce675c22a5ab..a2b6dbcfa918 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -525,6 +525,9 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	if (sdev->dspless_mode_selected)
+		return 0;
+
 	ipc4_copier = widget_to_copier(w);
 	dma_config_tlv = &ipc4_copier->dma_config_tlv[cpu_dai_id];
 	dma_config = &dma_config_tlv->dma_config;
-- 
2.45.1

