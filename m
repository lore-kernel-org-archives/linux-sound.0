Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D53612BF26
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071118; cv=none; b=jFr1UcYvBUHq8dtHN0QaVk7SnKG2aoCydd5ZPtWEH6HX+rOo3vSyOTO5k3fkF84Cl+VnOSAJrxrr9nrtbECKtq9VnoBGDtwdZGC2GHrndF/GGcDs6GMaIwBDsNaQVji/XbuP6CDQQKo7qnSP9CV3N3EP2CnB2SYXgAXFQJpLozM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071118; c=relaxed/simple;
	bh=yIECqiD3W2xpYuXanadiVDrfUeVTFKr9CBOkADPKmYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZIjTGHQFddciXb9l3pqr+1kgxyiTJ4Mm80YWWBxktCxpb71wmD0tIFPvLIx/W3Pf78pJei+GnacuRZ55Txlpemd89iylo4fLtcQPHmKenA2DJTd2M+YzF6YMjKjpz0hL4NnTDbPU9OcNpTzsbr8nyXwNiemccxQPRTSV1SIdvLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PknAee48; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PknAee48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071117; x=1743607117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yIECqiD3W2xpYuXanadiVDrfUeVTFKr9CBOkADPKmYM=;
  b=PknAee48ay/ePv8w4zYb1ykAIuD+TUqNEDtFEr9ZOsF1TCmgna3xNwiE
   kNm53TYBOHsVG+INrlEL1f4EtxaFeecq+LUZOBn28gDzLp0K1rmsHMDrv
   mUPESPJWfmJEXyN2CaGZo4YjQj9KH0fFAX4xy9EaeNXMOaDTEUqeTGFQd
   IWed+xWqyy8FrUMWrX07y02gcowaRPpA/v4YSiyOd4bQ1g7goAAP22V+1
   U94KTXN39C0A02TDz8rDlkWfYnHEWcfmGaiXWEbRIxGCpxqFbdinfCW6s
   u1tRPFFu6uUT8zY+qSeob/JtW3QaLeIlVSfLyuQLF6UenF02f++h2I5Mt
   Q==;
X-CSE-ConnectionGUID: dLB2pAncRZKhGdmKki4faA==
X-CSE-MsgGUID: QfWIinvYTlee+3U7Zjmk5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729858"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29729858"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:36 -0700
X-CSE-ConnectionGUID: FarfZ5wjRnWBUVS+3Ykwaw==
X-CSE-MsgGUID: VlVB21HDQXGHMePrZIu6CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796477"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/17] ASoC: SOF: Intel: improve SoundWire support for LunarLake
Date: Tue,  2 Apr 2024 10:18:11 -0500
Message-Id: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset contains important updates for SoundWire support.

We initially implemented support for multiple amplifiers on different
links using a single HDaudio DMA transfer. To align with the other OS,
the 'aggregation' is now supported by the firmware. This change in
directions has kernel impacts, since we now have multiple HDaudio DMAs
to program and start, but since there are no platforms released so far
there's no end-user impact.

In addition, the behavior in case of xruns is improved by clearing the
PCM states and better handling of the hw_free case.

Note that the hw_free support will compile but will only be functional
with the companion patch "soundwire: intel: add intel_free_stream() back"
already applied in the SoundWire tree.

Bard Liao (5):
  Revert "ASoC: SOF: Intel: hda-dai-ops: reset device count for
    SoundWire DAIs"
  Revert "ASoC: SOF: Intel: hda-dai-ops: only allocate/release streams
    for first CPU DAI"
  ASoC: SOF: make dma_config_tlv be an array
  ASoC: SOF: Intel: hda-dai: set lowest N bits in ch_mask
  ASoC: SOF: Intel: hda-dai: set dma_stream_channel_map device

Pierre-Louis Bossart (10):
  ASoC: SOF: Intel: hda-dai: fix channel map configuration for
    aggregated dailink
  ASoC: SOF: Intel: hda-dai: add helpers to set dai config
  ASoC: SOF: Intel: set the DMA TLV device as dai_index
  ASoC: SOF: Intel: hda: extend signature of sdw_hda_dai_hw_params()
  ASoC: SOF: IPC4: extend dai_data with node_id
  ASoC: SOF: Intel: hda: move helper to static inline
  ASoC: SOF: sof-audio: revisit sof_pcm_stream_free() error handling and
    logs
  ASoC: SOF: pcm: simplify sof_pcm_hw_free() with helper
  ASoC: SOF: pcm: add pending_stop state variable
  ASoC: SOF: pcm: reset all PCM sources in case of xruns

Ranjani Sridharan (2):
  ASoC: SOF: Intel: hda: Clear Soundwire node ID during BE DAI hw_free
  ASoC: SOF: ipc4-topology: Save the ALH DAI index during hw_params

 sound/soc/sof/intel/hda-dai-ops.c |  41 +---------
 sound/soc/sof/intel/hda-dai.c     | 124 +++++++++++++++++++++++-------
 sound/soc/sof/intel/hda.c         |  29 ++++++-
 sound/soc/sof/intel/hda.h         |  11 ++-
 sound/soc/sof/ipc4-topology.c     |  62 ++++++++++-----
 sound/soc/sof/ipc4-topology.h     |   3 +-
 sound/soc/sof/pcm.c               |  58 +++++++-------
 sound/soc/sof/sof-audio.c         |  29 +++++--
 sound/soc/sof/sof-audio.h         |   2 +
 9 files changed, 232 insertions(+), 127 deletions(-)

-- 
2.40.1

