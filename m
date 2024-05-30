Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E5417799B
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067938; cv=none; b=nkw2mtiweziodbKgSzoF6F1W5C6UiU/Mg+ebJHLymarLtJVqdLPV9s9kBD1o2bcgILd4+vHAxicexjuTwXD1rkzKcLf+OfMzJihr5aacJHiRhYTXy6GoeXN2aGzZ6vN+yBWCmaWQv1HUzD8m0VNlINWzasleCRAaR0obBWcQHD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067938; c=relaxed/simple;
	bh=N/lN7jK2wXXn7rqPddlxBASSZNFO4MEjn+eN0kHwl54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GznBC9ifrJ/r911jP4H+oEQn1nKufV98PCTlWNMy+jSnP4qccEGkl7oQ3Zz7Ys4cd6UKCk3CbxTP7ZD7k23NeFy3+QqkDctVEDwGa5xBcYePmf/3952lQUgv09AnT146KLExeGW1de+XN9EamsaUBsLmc1HykT4l92kIEEayMNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZc+VDWz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZc+VDWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717067938; x=1748603938;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N/lN7jK2wXXn7rqPddlxBASSZNFO4MEjn+eN0kHwl54=;
  b=XZc+VDWztOPpX5UiVqKgKoh056KrsLU+rXFTGLBNLN+upSrgA4qyC0me
   H19D6SZZvMtgJqsG7jaoXjUN7piln+QPTockN6D1gmaovXDnHKppuZurU
   eFWaehX6zc92W2SO1fv20kM8gpy911iZqcrLWw826YphH8ZEMZPJ7+uM7
   8jBZ1WE5pk61yZFy77cMwunRRmhBwgeMpPhYXBDSPUPJybEfmpBoHfR1X
   B4fOsIfmq3Pj5zMTl7QvFssEvYDHi/4lknsmhyQ58NnWdVZGAufsl5JCt
   9oTxwlonZP1UKDFLUKH8SqRFa0VEAzu2MtUXWVeCKVuRaBPC4VS+IkMH5
   g==;
X-CSE-ConnectionGUID: 06jj8Z9cQwmxkJRAQs5C6w==
X-CSE-MsgGUID: E7cOKkhVS7mhcoQ5PUM6XA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31065104"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31065104"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:18:57 -0700
X-CSE-ConnectionGUID: kEsaqUeHQBq0zaCMl5OHXg==
X-CSE-MsgGUID: B1NHaeC7QgKNvMreY6MDNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="73258606"
Received: from unknown (HELO pujfalus-desk.intel.com) ([10.124.223.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:18:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6.10 0/5] ASoC: SOF: ipc4-topology: Fix nhlt configuration blob selection
Date: Thu, 30 May 2024 14:19:13 +0300
Message-ID: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

the existing logic to pick a DMIC blob is based on several historical assumptions
that the NHLT in BIOS always contains 32-bits per sample type (first patch, [1]).

The other issue with the existing logic is that it was designed to care only
about the bit depth of the format and fails to find the existing and correct
blob when rate/channels are different on the FE side compared to what we should
be using on the DAI side (we have components in path which can change
rate/channel count).

These issues have not been observed in past but with new MTL based (Windows)
laptops and new topologies to enhance the audio quality, we started to see weird
issues around how our assumptions of vendors failed.

Since some NHLT blob handling cleanup has been done for 6.10, this series will
complete that work to cover even cases that we don't anticipate to see.

[1] https://github.com/thesofproject/linux/issues/4973

Regards,
Peter
---
Peter Ujfalusi (5):
  ASoC: SOF: ipc4-topology: Add support for NHLT with 16-bit only DMIC
    blob
  ASoC: SOF: ipc4-topology: Print out the channel count in
    sof_ipc4_dbg_audio_format
  ASoC: SOF: ipc4-topology/pcm: Rename
    sof_ipc4_copier_is_single_format()
  ASoC: SOF: ipc4-topology: Improve readability of
    sof_ipc4_prepare_dai_copier()
  ASoC: SOF: ipc4-topology: Adjust the params based on DAI formats

 sound/soc/sof/ipc4-pcm.c      |  12 +--
 sound/soc/sof/ipc4-topology.c | 155 +++++++++++++++++++++++-----------
 sound/soc/sof/ipc4-topology.h |   6 +-
 3 files changed, 115 insertions(+), 58 deletions(-)

-- 
2.45.1

