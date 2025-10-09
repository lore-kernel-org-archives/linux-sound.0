Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890732D5A0C
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002840; cv=none; b=FPSmCmBV0DUt6xozpuJc/7jSXdT00GndIkLUttV1oWxOiKqSUbNOGudCKJSUW3tJjb1hoiyvR3LarotBtmtKD5WNz7UYNzzrob0d5d6ekVo4Iv0XRGVegTfuywH4t2C4K/iZE60BuRNKv5YbIsfeigg6NuWOtVkdgsuQ9khA/iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002840; c=relaxed/simple;
	bh=qSARa+DeZ5BtT5akZBXImueW79PHSr7KaUeGU1SwZKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CLhz0PPM6z/cEdHu49WaBp5121rWqTTMlJNA0/ji4dXtEefzIPrnC4mtOfEwPiHKT69vGMA4o5BIIH6KtSJIn5Ag5z+udBn6i0+t4fN3z1zm+BFwCPOPd/DCxo9J2yv9CxV1s4FikQun6HTYXBc31UC9/LsJtAQ0xQ0y6azUg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TosNQKdU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TosNQKdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002838; x=1791538838;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qSARa+DeZ5BtT5akZBXImueW79PHSr7KaUeGU1SwZKQ=;
  b=TosNQKdUf0obfNCfjOLHBR53QxsVLl/eHamCzwNie/2fSDcjCuTmDA7T
   FQCPqhhbjA/ZnVqEma9tBQuyd9me6FqcKXX3h3bJagGkVbMVzg+OJhwcq
   pUhuzBAvSVXO2YzVjmbtwzwszgL6afbqUPOuMI0uGpvhiCc7QRrpsWort
   wwrRpednNPTHVaoQuEqzKoqDp1rDW/UNu3JCdB1nHqBIh2SG+01MA3Ilw
   RnHOVXPCZ8pSugU4k16UIP58fAFzylCXy50eMbcbDGAvTcPQ+Z+eyfUXL
   v/WaEwXDVxtE3I55Wu8UVGahI5PqbTqr1BN2eKbqcQ9KGitr+aHTQanKv
   A==;
X-CSE-ConnectionGUID: 0XJ8cd4OTHe+ValgH7b9gw==
X-CSE-MsgGUID: ovoWp2fMTaOLt2ggmGyavA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113207"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113207"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:35 -0700
X-CSE-ConnectionGUID: VylKwGtYTtm2cd+80x979A==
X-CSE-MsgGUID: +IJsK9FSQx+pcrDBJXUfmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181437936"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/9] ASoC: use sof_sdw as default Intel SOF SDW machine driver
Date: Thu,  9 Oct 2025 17:40:14 +0800
Message-ID: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
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
 sound/soc/sdw_utils/soc_sdw_utils.c           |  30 ++-
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
 16 files changed, 276 insertions(+), 11 deletions(-)

-- 
2.43.0

