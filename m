Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E928466F
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804025; cv=none; b=mATww0iSsBTMa7wDKy1YHyvv4Zt9EpMtRBeTFh6zDL4HQoCdb8tq8Rh8po/UhunfiYXmTq5r6K32lRP6cVNh2i6vv4Iy33M33NGr5TNksupcoQddteWRO7LdEdEi1GpmIY0+Z595USVv8PLsCTt/HnDj0nWlZk58m/kZf2YCpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804025; c=relaxed/simple;
	bh=StDe1VGOK6hWUAMXrJcJKaeZ06z3FAAVSn5fFgpfDdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hygLD8cyE85pGkQ0cIH4YG9EXCHy4B8uTdPu7OFE3uHh4pOo8E+1F3tZdMFbFo38y4wUBLd3Quo34ZP4WTfMJwZF/YXN5cxHmSryH/cicEit8SkYp3g3ay7w99yXzSmDTqy2/mZTX/MFsBb4mG7Wv57ioR5VOvkYx2mRFRm7cM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tloht8NC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tloht8NC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765804024; x=1797340024;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=StDe1VGOK6hWUAMXrJcJKaeZ06z3FAAVSn5fFgpfDdE=;
  b=Tloht8NCXQb2/3o54sH7bvBLyfvDmvvDlP/n1DWgl2ItgEe0fuU4nrC+
   87k4tH+KbAyBpZa57CjqW5TOiJ2E6psC9s3h8Zn/FNNM55NOCn0b5BRHH
   KRWu605KuRP06Y2kt2F+6Ob4UQpHvEuBqH8pNj0gAhtSHjbycN01ceopF
   u/Rh84gSbv9B6PlWQk2TJPqhPAcJdZ253ZuHi2HbuQ2h2r/yrg/V5VAe8
   Vo6w+R07mOm9AHOPEtgr98HJiwJ76RS48eimjHWe6wUhyoGq11Yz9+gys
   7lnPc58JLKSFrEn5X9h0sicNov7o2TTrZLWE4pSs6NnA3mB1BV9g78q3E
   Q==;
X-CSE-ConnectionGUID: w/dSVXqnR1m4U/uV8qf3kw==
X-CSE-MsgGUID: Q4ToZQ3gTVCCLHgBQ8SEdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66691372"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="66691372"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:07:03 -0800
X-CSE-ConnectionGUID: ov13nCuATVWFidrs1Kilvg==
X-CSE-MsgGUID: eu0+GCrfRaaz6CdUYB0GaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="196803270"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:06:59 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: set playback channel mask
Date: Mon, 15 Dec 2025 15:07:23 +0200
Message-ID: <20251215130723.31081-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, we send all channels to all amps and copy the channel_mask
to all ALH DMAs in playback. However, the amp may not have the
capability to run any process and SOF may need to split the channels
and send specific data channel to each amp. In that case, we need
to split the channel_mask in ALH DMA.
Copy the channel mask only if the widget channel count is the same
the FE channels for playback, otherwise, split the channels among the
aggregated DAIs. Like what we did in capture.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 221e9d4052b8..588defd3eec9 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2280,8 +2280,19 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				ch_map >>= 4;
 			}
 
-			step = ch_count / blob->alh_cfg.device_count;
-			mask =  GENMASK(step - 1, 0);
+			if (swidget->id == snd_soc_dapm_dai_in && ch_count == out_ref_channels) {
+				/*
+				 * For playback DAI widgets where the channel number is equal to
+				 * the output reference channels, set the step = 0 to ensure all
+				 * the ch_mask is applied to all alh mappings.
+				 */
+				mask = ch_mask;
+				step = 0;
+			} else {
+				step = ch_count / blob->alh_cfg.device_count;
+				mask =  GENMASK(step - 1, 0);
+			}
+
 			/*
 			 * Set each gtw_cfg.node_id to blob->alh_cfg.mapping[]
 			 * for all widgets with the same stream name
@@ -2316,8 +2327,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				}
 
 				/*
-				 * Set the same channel mask for playback as the audio data is
-				 * duplicated for all speakers. For capture, split the channels
+				 * Set the same channel mask if the widget channel count is the same
+				 * as the FE channels for playback as the audio data is duplicated
+				 * for all speakers in this case. Otherwise, split the channels
 				 * among the aggregated DAIs. For example, with 4 channels on 2
 				 * aggregated DAIs, the channel_mask should be 0x3 and 0xc for the
 				 * two DAI's.
@@ -2326,10 +2338,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				 * the tables in soc_acpi files depending on the _ADR and devID
 				 * registers for each codec.
 				 */
-				if (w->id == snd_soc_dapm_dai_in)
-					blob->alh_cfg.mapping[i].channel_mask = ch_mask;
-				else
-					blob->alh_cfg.mapping[i].channel_mask = mask << (step * i);
+				blob->alh_cfg.mapping[i].channel_mask = mask << (step * i);
 
 				i++;
 			}
-- 
2.52.0

