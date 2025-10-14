Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FC61E47CC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426029; cv=none; b=ZzWNZsnF4rOEO3Pnx4upEAMcKwh+lB/orrVtjjk5jrBpuQT2b9NZZRuZrG04dle+gvBhYbc9eefxMdFYXaYdmJw+T6rKh56y3WKYz82csUd2wuUIHxhm+e3LPBM/N2e/frdg2BQdXI/BzyxQ4EJ+oFMb8aNc3fw1HjK3rW8SrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426029; c=relaxed/simple;
	bh=IV/71/8BF3/+vaD7EtCQUskfLuJLlJrS3nAc4zi+r3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FM5eBmRPohMOU/OskrAj8UP6DguceWlbshI2nerJ2vCpPa4GodoqfF866n8SOCz0YlOZH3cuSWZ1RissS0WIi1BkyRaautd2VJJRSvRo09WeFMOOpobwXqSe+QZWEHGT62i8m8QMS1kqsFdx7AWYI43GwKEdxrLbHoM8ekg3VeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhhkkOuf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhhkkOuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426027; x=1791962027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IV/71/8BF3/+vaD7EtCQUskfLuJLlJrS3nAc4zi+r3w=;
  b=XhhkkOufPyj6sd0JUDB4djLq4YUSsfcpoathpbVENI+QpUa9HWnQg+8G
   1bYzpDWZ0mcqLhOJENNQWVRub+ZONBuNqKFo0FndOzi/EZTLl/gvNYqJ+
   kwMZwQlchN9UX9R4GcDUZhWXTbWMMmOBGDJatTSf+5hY/5akFnECuGYpN
   IYTOX+SXwnxHtBHT0ICtP6SzIAMkkyc0ELVwTEqcwB/RtjLvrK3lb6JGi
   qpMN6UneGxOTfSYsJoeSnnDy0e6gsCEsGJMZ1IYbxgfet9URChWCbQCRX
   v17Og4ttdpQuCUs4zpfm84VVeWLGTwTVF9t/pFAqfinRUi2Z+fCZGdhMB
   Q==;
X-CSE-ConnectionGUID: 53HBxYgDSQGk6PuMkGGT5w==
X-CSE-MsgGUID: lSYmyLYFQy267S+VUHBmkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233648"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:47 -0700
X-CSE-ConnectionGUID: Roj3fSuZTzq8cD85xvrp0w==
X-CSE-MsgGUID: De81Dl0OQMafWlpJtzURpw==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 0/9] ASoC: use sof_sdw as default Intel SOF SDW machine driver
Date: Tue, 14 Oct 2025 15:13:26 +0800
Message-ID: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, we create a ACPI mach table for every new audio
configuration. And all Intel SOF SoundWire configurations point to the
same sof_sdw machine driver. Also, we don't need a specific topology for
a coufguration, we can use the function topology instead. That give us a
change to generate an ACPI mach table based on the SoundWire codec
information reported by the ACPI table and use the sof_sdw machine
driver as the default machine driver.
This will reduce the effort to support a new Intel SOF SoundWire audio
configuration.

v2:
 - Add name_prefix of tas2783 and cs3563

Bard Liao (9):
  ASoC: SOF: Don't print the monolithic topology name if function
    topology may be used
  ASoC: soc-acpi: make some variables of acpi adr and link adr non-const
  ASoC: soc_sdw_utils: add name_prefix to asoc_sdw_codec_info struct
  ASoC: Intel: export sof_sdw_get_tplg_files
  ASoC: soc_sdw_utils: export asoc_sdw_get_dai_type
  ASoC: SOF: add platform name into sof_intel_dsp_desc
  ASoC: SOF: don't check the existence of dummy topology
  ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
  ASoC: sof-function-topology-lib: escalate the log when missing
    function topoplogy

 include/sound/soc-acpi.h                      |   8 +-
 include/sound/soc_sdw_utils.h                 |   2 +
 .../intel/common/sof-function-topology-lib.c  |   8 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  32 ++-
 sound/soc/sof/fw-file-profile.c               |  12 +-
 sound/soc/sof/intel/apl.c                     |   1 +
 sound/soc/sof/intel/cnl.c                     |   2 +
 sound/soc/sof/intel/hda.c                     | 205 +++++++++++++++++-
 sound/soc/sof/intel/icl.c                     |   1 +
 sound/soc/sof/intel/lnl.c                     |   1 +
 sound/soc/sof/intel/mtl.c                     |   2 +
 sound/soc/sof/intel/ptl.c                     |   2 +
 sound/soc/sof/intel/shim.h                    |   1 +
 sound/soc/sof/intel/skl.c                     |   1 +
 sound/soc/sof/intel/tgl.c                     |   4 +
 sound/soc/sof/topology.c                      |   7 +-
 16 files changed, 278 insertions(+), 11 deletions(-)

-- 
2.43.0

