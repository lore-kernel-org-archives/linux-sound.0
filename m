Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A26922EF4
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819162; cv=none; b=gFeASnfLzdlVteKddMI1vZXiN/yn1rN+vtwIHhsbsXDy/ZGBbGFN7QY487xEfn3Cgj3a5z0k9OIS9JsRb+ArbZdr0rMUQEeLhPGic2+SrLZMaU+t9c43iiBX6hFCdRiIS60xwiL9n7wT4au5OhzPHwaIrZxpNXXj07vwYdyRoGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819162; c=relaxed/simple;
	bh=LSZvTIG5a4TyqV5eGuK1fEtLU22Dc8Hc4ucgXc3waJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UIY91vxHpQxjT+LsXNxFlryPRClwjezZ8dO0GRBrS5KH+WmBFatBkvnMmbsmMVVQ2ENUF6vEt8e9sUfaVyhcFZtg+j/C+vPftwnGIOP6VE1RwMIYwiBWdkDrzka4IMZnrTJEsNdTGzItp2BeQwKNcjfdBFyfmi7vwxFBtVvOTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGx7m7rj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGx7m7rj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819160; x=1739355160;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LSZvTIG5a4TyqV5eGuK1fEtLU22Dc8Hc4ucgXc3waJQ=;
  b=nGx7m7rjCkyKAmggWhBAlObVy8TruGP8e6ceYo/FLrgNQMNvbgJkmjZ9
   +UJHAh5lgueQBfRQCP+md4ElVOY+KKUsQMjkq+tKNGvJIuaK7uLMSfKh4
   AWWrj5jkAVZhQnjb/it1XCQeuh21OdRbqhP8E6tQVjywlY1oqjcbmmER+
   2AXvoz81yL4W1/yku2bNAXuO8wjITWqwgSs/CqbG+y9BP2O3Y1GxEKRdS
   TbZQjC3xx2Rd1m5KDPkDKzGPNeBhausaXeWrYnUZoHRMN1Xne7x6dJwzk
   iMXbBq4GvfzTH6prJb2B+174PHD6rg45gz902iJVm3rv81NVb8lbxWPK3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260145"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260145"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7497988"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:37 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 00/15] ASoC: SOF: Extend ChainDMA and DSPless mode to LNL+ SDW
Date: Tue, 13 Feb 2024 12:12:32 +0200
Message-ID: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

For both ChainDMA and DSPless mode the requirement is that the link must
be serviced by HD-DMA.
On pre Lunar Lake platforms this was only valid for HDAudio links but with
Lunar Lake all link types now serviced by HD-DMA.

This allows us to enable ChainDMA and DSPless mode for SoundWire links as
well.

Regards,
Peter
---
Peter Ujfalusi (1):
  ASoC: SOF: Intel: lnl: Do not use LNL specific wrappers in DSPless
    mode

Pierre-Louis Bossart (13):
  ASoC: SOF: ipc4-topology: change chain_dma handling in dai_config
  ASoC: SOF: ops: add new 'is_chain_dma_supported' callback
  ASoC: SOF: Intel: hda: add 'is_chain_dma_supported' callback
  ASoC: SOF: Intel: hda-dai-ops: enable chain_dma for ALH
  ASoC: SOF: ipc4: store number of playback/capture streams
  ASoC: SOF: ipc4-pcm: fix dma_id for CHAIN_DMA capture
  ASoC: SOF: ipc4-topology: allow chain_dma for all supported DAIs
  ASoC: SOF: Intel: hda-dai: remove dspless special case
  ASoC: SOF: topology: dynamically allocate and store DAI
    widget->private
  ASoC: SOF: Intel: start SoundWire links earlier for LNL+ devices
  ASoC: SOF: Intel: hda-dai-ops: use dai_type
  ASoC: SOF: Intel: hda-dai-ops: add SoundWire dspless mode
  ASoC: SOF: Intel: hda-dai: add support for dspless mode beyond HDAudio

Ranjani Sridharan (1):
  ASoC: SOF: topology: Parse DAI type token for dspless mode

 sound/soc/sof/intel/hda-common-ops.c |  1 +
 sound/soc/sof/intel/hda-dai-ops.c    | 51 +++++++++++++-----
 sound/soc/sof/intel/hda-dai.c        | 17 +++---
 sound/soc/sof/intel/hda-dsp.c        |  5 ++
 sound/soc/sof/intel/hda-stream.c     |  9 ++++
 sound/soc/sof/intel/hda.c            | 80 +++++++++++++++++++++++-----
 sound/soc/sof/intel/hda.h            |  5 ++
 sound/soc/sof/intel/lnl.c            | 24 +++++++--
 sound/soc/sof/ipc4-pcm.c             | 19 ++++++-
 sound/soc/sof/ipc4-priv.h            |  4 ++
 sound/soc/sof/ipc4-topology.c        | 22 ++++----
 sound/soc/sof/ops.h                  |  9 ++++
 sound/soc/sof/sof-audio.c            |  8 ++-
 sound/soc/sof/sof-audio.h            |  1 +
 sound/soc/sof/sof-priv.h             |  9 ++++
 sound/soc/sof/topology.c             | 25 +++++++--
 16 files changed, 236 insertions(+), 53 deletions(-)

-- 
2.43.0

