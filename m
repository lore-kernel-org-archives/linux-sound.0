Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1923E3D667D
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768897149; cv=none; b=GkwfUZ51DtOmMqMFLH9utHp2BOaGx7NYD1Plng/SddNUpSNlcjFcvc46/BrieEgpJw8Kphe0PbtttC8T7CrvM/p3rXwr3TayA1j/i4ecnTJHGe8yjxHxVGQuPybNt2Pqd137AgYkCOjLTspWMbE2ASjYOox9KKBMu/du35AIkHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768897149; c=relaxed/simple;
	bh=loK1oW7SJLBZTZkEyc3md37BzPH5fmCy74rdrWsXZO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgbPygt0R6C9DNEA822xULWgRTT14mWsB3r+q5TS1iYqnA1iV2/DtJ8sREHo5iXX2xl9ili1zVCqDjW3s1ahOzeTwSCDIHp2ywA7avf/UxWdSOHM3BT70J/4WPXUZRfLccBCEY2Zgk0kgqbvN2+1IyK8dGfpg3gUVx49kd/Vhis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7hSu0Hj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7hSu0Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768897147; x=1800433147;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=loK1oW7SJLBZTZkEyc3md37BzPH5fmCy74rdrWsXZO8=;
  b=C7hSu0Hj7dMw7WmmiyKPoVyd4vOVVG+wHdpoZeL6KiVse7JBCmLu7SRk
   Zx0qPCqPcyC4FAAXwk42GArxeOAOYhaWkcIuNiz2vO3gzma5p2rUBPNAv
   faCiu83S+/3jYDD96jeHaQFEjWAGNTREWplGYyhR0IyyyCW0v/V7372YC
   l58HdjVMeobGbC5CTGIlqzcwWoLcnEIG66v+FM9i6UqM2MsaET2lqDNxh
   32hibNdqAlyZuFtkxK22IjsRPgJUqr2vxL/rypXcXardGgGmA5tNwcXEN
   C9vbaAxD3qSEH2cOsKQ9/VSiHdSL8kNnJaCQOglAN38ajMVUPwEvkIrBo
   w==;
X-CSE-ConnectionGUID: PdB3OPcCTlqZOsmBCTxZ8A==
X-CSE-MsgGUID: Fr5bqYQLSw2F8Ox/pdOsnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81209413"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="81209413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 00:18:55 -0800
X-CSE-ConnectionGUID: /FORMfUfS5umADj4N4KGvg==
X-CSE-MsgGUID: i+P3u2UKRx2W/1lNhwp84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206403976"
Received: from krybak-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.55])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 00:18:52 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: Intel: hda: Remove MODULE_SOFTDEP for  snd-hda-codec-hdmi
Date: Tue, 20 Jan 2026 10:19:35 +0200
Message-ID: <20260120081935.11005-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sofdep no longer works due to the reworked HDA audio stack and
it was an incorrect way to try to work around system security
policy blocking request_module use, even if they are legitimate.

Drop the softdep to stop the whack-a-mole hacking around system
configuration issues.

Revert "ASoC: SOF: Intel: hda: add softdep pre to snd-hda-codec-hdmi module"
This reverts commit 33b7dc7843dbdc9b90c91d11ba30b107f9138ffd.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 37674ea452d6..fd371850b0d6 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -451,7 +451,6 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_i915_exit, "SND_SOC_SOF_HDA_AUDIO_CODEC_I915");
 
-MODULE_SOFTDEP("pre: snd-hda-codec-hdmi");
 #endif
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.52.0

