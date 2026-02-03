Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D213B315775
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118855; cv=none; b=ixplfYoqSSrf/aDSjrmAJIhONKgo9xzwm16HO7qwsXO8RscR7TXEkw0YrAS/76X2+B+DA63TIPmbtqfWSpqhP/JuLWY0mvCbVAJNHd5+aphifGxd0vEcL7gJQnqsPDrvWhELfewvHOlFATLa0NCUyzn3+1ty0AvWH2OFS3nx9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118855; c=relaxed/simple;
	bh=dwaN0rJDBeNkVT+xD9RWhFrj/IRtXcw5nExC3LUEyH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qou7f/wjXb4UcsEZ2ESCCmyo5/drTa5DJCUst+eMrXC9na+eeCSxMpLzdAsXltDBxHvxDqeTbJ08EJ9Yaoe6nVoXFoB9sRkfqV9muKmURdNptxcfjttFeKFwOFNJZMmT7y6Vx+L+gPnVQFisTZTzZ1OBOOlvNYd/VTaH4FK2F2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4HchjgI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4HchjgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770118854; x=1801654854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dwaN0rJDBeNkVT+xD9RWhFrj/IRtXcw5nExC3LUEyH8=;
  b=N4HchjgIEi3VpZYGfDEh5u841z5PApece/uReztHBZAAfoi4PpQEb21S
   iVhbyn5voV1WAyKZBHJM1M/E9egQofWgTShItPmuPnKArfYGojiCrQ2D5
   s+GCsgfRbcGvJtSi9hHGr/s49sU4RaDY84OfKAk/DrOYdSna7tBxboFil
   OJGRNNvNcebIo36wMzhM5Up3fP8blMrQt8qOGKsokGn40d9RNpXb+n627
   ou/E/xQ6j+zsqxpcDxEQ6e6EaRUGdqVLBeypUonVievqLsuixul584ogJ
   3tG6SkuUhtX0DI9ZQIK5AFqjdZeDX6zhbU8dC2CVL9WksRn7XuT2gTrlV
   g==;
X-CSE-ConnectionGUID: 19R/HhqwRlaYUmKL4GrAhQ==
X-CSE-MsgGUID: GbUKCy2LRnyyxx47BOXmKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82023850"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82023850"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:40:53 -0800
X-CSE-ConnectionGUID: GxlkAYzwRV6Fr8kX0YB4dg==
X-CSE-MsgGUID: oU1zWU13T/aHAcOKxmDeKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209547595"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:40:51 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 0/3]ASoC: SOF: Intel: reserve link DMA for sdw bpt stream
Date: Tue,  3 Feb 2026 19:40:24 +0800
Message-ID: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, hda_sdw_bpt_dma_prepare() get a HDA stream and use the link
DMA but doesn't reserve it. It works fine because we assume the
SwoundWire BPT will not run with audio streams simultaneously. Create
and use the new helpers to reserve the link DMA and allow running BPT
and audio stream simultaneously.

Bard Liao (3):
  ASoC: SOF: Intel: add hda_dsp_stream_pair_get/put helpers
  ASoC: SOF: Intel: add hda_dma_prepare/cleanup helpers
  ASoC: SOF: Intel: hda-sdw-bpt: support simultaneous audio and BPT
    streams

 sound/soc/sof/intel/hda-loader.c  |  94 +-----------------
 sound/soc/sof/intel/hda-sdw-bpt.c |   5 +-
 sound/soc/sof/intel/hda-stream.c  | 157 +++++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda.h         |  11 +++
 4 files changed, 171 insertions(+), 96 deletions(-)

-- 
2.43.0

