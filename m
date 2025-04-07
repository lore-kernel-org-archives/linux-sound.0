Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAF226861
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024014; cv=none; b=IW1S+kGNkEeFWTsARYCu1LbDm/ikJ9x68Drv5Z32aLR11xlAT5c3AbHAboIKfUqh8PZaDERhbHrNj9XAkvLQ1VQg8QFEtV+IiA4nDpGNs3qZvQuDTENw6QrOBpgOFU20hPpYEKdligPLQ77lcO7wwuIi6xM7B3lcmGH5X9Jy2dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024014; c=relaxed/simple;
	bh=M+W3lqBkJVXsO2GFKCEbv4kW88Et7xG1sMQH50E7j3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=e97i759sXI14P/w9tYIcR2rDdWIP+q/9pBYXoRx/1JIP15V+xUKFmT1OzyUklVJwn+iYjR6xItC/JVFPWmAWnKzNfXuRysmeh9sndWJQC8nO0CDpKifNVfjGvjaio+QeLiiZNS/s4EJ+LNIa1nAou9hkYCONngmUWevHfsdUkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmDIJjVv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmDIJjVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024013; x=1775560013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M+W3lqBkJVXsO2GFKCEbv4kW88Et7xG1sMQH50E7j3s=;
  b=PmDIJjVvO7R2XNKJ0zIlf8ZOrfbEH2YxXFNjHmM9zJgOYxVVCjIzwent
   UGEMMHEl76V88JEuO68ozoyLyV1rsH25yuf9E+zIYGXgjeeG60JSAsyMY
   5rv8Bp+2bhEzMkekP7lKLrQsib5RKp/ET/F5n3gHL5kglpyuKcyYP/Lea
   1LSWMOUwd7bOH/n8U97WVR/wYoy4LhdZV/vZjtj2jrCP2XFQpMmNblIJx
   fQadD4Gu/wb9WIKb/7jxdZBt0ZNWEF+IY8OqbRA60IOyFuVYSZT8I0177
   4GoDDpNiQEI2fNp1EmT8is70KvNqwMsIZ76+YbaUM4XnlydoiT6FvQrRU
   g==;
X-CSE-ConnectionGUID: 5UehZkRCSfCfUGsfiUo2gA==
X-CSE-MsgGUID: 7Z1hrko0RtWZ09o91w0knQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057317"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057317"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:06:52 -0700
X-CSE-ConnectionGUID: yaKEbMbYSuaG48CyKcrDOw==
X-CSE-MsgGUID: 8sw/q6pZTzymUUNiN8mCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776248"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:06:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 00/10] ASoC: Intel: avs: Add support for FCL platform
Date: Mon,  7 Apr 2025 13:23:42 +0200
Message-Id: <20250407112352.3720779-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patchset is fairly straightforward - add support for Automotive
platforms based on new DSP architecture, Frisco Lake (FCL), a
PantherLake (PTL)-based platform is an example of.  The cAVS
architecture which all Intel AudioDSP followed for years ends with
RaptorLake familty.  Like all the major updates, this one received new
name too - Audio Context Engine (ACE).

While the range of improvements and changes on the firmware/hardware
side is large, software survives this evolution without need of any
major refactoring.  Additional hardware changes brought with LunarLake
(LNL, ACE 2.0) call for update in PCM-area.  The GPDMAs previously
utilized for non-HDAudio transfer types are no longer there, everything
is running through HDAudio LINK on the Back-End side now.

In terms of code, the mtl.c file, provided with patch 05 'ASoC: Intel:
avs: PTL-based platforms support' hosts largest number of new handlers -
new IRQ and INT control and DSP-cores management.  Combined with lnl.c
and ptl.c which layer the architecture changes done over ACE
generations, provide support for PTL-based platforms e.g.: FCL.
The inheritance in summary:

	mtl.c <- lnl.c <- ptl.c

The functional update to HDAudio library is there to help avs-driver
read certain capabilities directly from the hardware.  Once the pointer
to LINK is obtained, there is no need to call AudioDSP firmware to get
the caps.

Changes in v2:
- dropped the pci_ids and their context descriptors for MTL/LNL
- merged MTL/LNL/PTL patches together, given the above, there is no need
  to keep them separate


Amadeusz Sławiński (1):
  ASoC: Intel: avs: Add boards definitions for FCL platform

Cezary Rojewski (9):
  ALSA: hda: Allow to fetch hlink by ID
  ASoC: Intel: avs: Ignore Vendor-space manipulation for ACE
  ASoC: Intel: avs: Read HW capabilities when possible
  ASoC: Intel: avs: Relocate DSP status registers
  ASoC: Intel: avs: PTL-based platforms support
  ASoC: Intel: avs: PCM operations for LNL-based platforms
  ASoC: Intel: avs: Dynamically assign ops for non-HDAudio DAIs
  ASoC: Intel: avs: Conditionally add DMA config when creating Copier
  ALSA: hda: Select avs-driver by default on FCL

 include/linux/pci_ids.h               |   1 +
 include/sound/hdaudio_ext.h           |   6 +
 sound/hda/ext/hdac_ext_controller.c   |  19 +++
 sound/hda/intel-dsp-config.c          |   4 +
 sound/soc/intel/avs/Makefile          |   6 +-
 sound/soc/intel/avs/avs.h             |  11 +-
 sound/soc/intel/avs/board_selection.c |   3 +-
 sound/soc/intel/avs/core.c            |  60 +++++++-
 sound/soc/intel/avs/dsp.c             |   2 -
 sound/soc/intel/avs/lnl.c             |  27 ++++
 sound/soc/intel/avs/loader.c          |  11 +-
 sound/soc/intel/avs/messages.h        |  29 ++++
 sound/soc/intel/avs/mtl.c             | 200 ++++++++++++++++++++++++++
 sound/soc/intel/avs/path.c            |  51 ++++++-
 sound/soc/intel/avs/pcm.c             | 133 ++++++++++++-----
 sound/soc/intel/avs/ptl.c             |  98 +++++++++++++
 sound/soc/intel/avs/registers.h       |  40 +++++-
 17 files changed, 648 insertions(+), 53 deletions(-)
 create mode 100644 sound/soc/intel/avs/lnl.c
 create mode 100644 sound/soc/intel/avs/mtl.c
 create mode 100644 sound/soc/intel/avs/ptl.c

-- 
2.25.1

