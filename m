Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497A17A300
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759173; cv=none; b=poiR0oKfkl3KXJO3WtGYc8/reTDZ2WrdMydMgqTOnkhUNm79MlLVmN3SoVpSY1eBkE52S23/njLkxGpYm6agzKvqfKmn7FNliseRum9LI8vTZfgdxep33PrgA5qbFkB498M8fbKx95+AL10dkWhRNZkJb9sNynZpXUM0m/K901w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759173; c=relaxed/simple;
	bh=YeZofOye++IVEl/GXunXNF5gqbzHlWMXHdANteYqY3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aEHm/Kp2/o45iyeos8SFF7uXlxohcuu9DaDXrGzFT38KZeOeWfohoZ7VI9+hHEilcJL22VtKZOw4tnsJULxcm4w+J6qZxqGU8jKJ2ICb/oNVXmpxqkrmV+6E5PxuT34SB8hzgqaCAuXBRtOoSIN9nBAUqaHrSPNSW4Ird6ZATsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnMcPk6m; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnMcPk6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759172; x=1775295172;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YeZofOye++IVEl/GXunXNF5gqbzHlWMXHdANteYqY3Q=;
  b=DnMcPk6mdZZb3U4hpjl1QbZbV6PT3tTeD6K9Nh+lnvK7594dxTd7ce6N
   OQ5vYMEZxnqabC06YDItn7Ky56cU0iWzEKXVDLAKflOK6TygRXoo5QNuw
   2G0I+sUG/PTuSKX/dgpeJ9ZyROkGhEWL2b2BOzJoBNUPYAWMbyTbM6r0H
   7eSW5/KcGKlD1O1GWdN7uZgYZaHHpWk99TL60RpStCIM1ncMKQwV6YMoS
   RnoIt/6QRQ9M80xO7o5GFtMvxokmGqH3vWDBp10ukn+sKIvW9qxZQ6/QR
   ogVGo9yWUYjCAx+suqNK7+xRPalAM99DalgDuWBy3kTZCJhwwToywSYH7
   g==;
X-CSE-ConnectionGUID: XOjEq4plRjqpvqW3bwKKPw==
X-CSE-MsgGUID: qmIBcUeWQ5iJmsfI8XGwhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566311"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:32:51 -0700
X-CSE-ConnectionGUID: /642/KVCRXGmcBbm7CVTbw==
X-CSE-MsgGUID: CBbf4eHBQCiJANFlh/Sxhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248568"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:32:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL platforms
Date: Fri,  4 Apr 2025 11:49:41 +0200
Message-Id: <20250404094953.3657679-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patchset is fairly straightforward - add support for range of
platforms starting from MeteorLake (MTL) up to upcoming FriscoLake
(FCL).  The cAVS architecture which all Intel AudioDSP followed for
years ends with RaptorLake familty.  Like all the major updates, this
one received new name too - Audio Context Engine (ACE).

While the range of improvements and changes on the firmware/hardware
side is large, software survives this evolution without need of any
major refactoring.  Additional hardware changes brought with LunarLake
(LNL, ACE 2.0) call for update in PCM-area.  The GPDMAs previously
utilized for non-HDAudio transfer types are no longer there, everything
is running through HDAudio LINK on the Back-End side now.

In terms of code, the MTL-support hosts largest number of new handlers -
new IRQ and INT control and DSP-cores management.  LNL-based and
PTL-based platforms e.g.: FCL inherit majority of the operations from
it. The inheritance in summary:

	mtl.c <- lnl.c <- ptl.c

The functional update to HDAudio library is there to help avs-driver
read certain capabilities directly from the hardware.  Once the pointer
to LINK is obtained, there is no need to call AudioDSP firmware to get
the caps.


Amadeusz Sławiński (1):
  ASoC: Intel: avs: Add boards definitions for ACE platforms

Cezary Rojewski (11):
  ALSA: hda: Allow to fetch hlink by ID
  ASoC: Intel: avs: Ignore Vendor-space manipulation for ACE
  ASoC: Intel: avs: Read HW capabilities when possible
  ASoC: Intel: avs: Relocate DSP status registers
  ASoC: Intel: avs: MTL-based platforms support
  ASoC: Intel: avs: LNL-based platforms support
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
 sound/soc/intel/avs/avs.h             |  13 +-
 sound/soc/intel/avs/board_selection.c |   7 +-
 sound/soc/intel/avs/core.c            | 109 ++++++++++++-
 sound/soc/intel/avs/dsp.c             |   2 -
 sound/soc/intel/avs/lnl.c             |  44 ++++++
 sound/soc/intel/avs/loader.c          |  11 +-
 sound/soc/intel/avs/messages.h        |  29 ++++
 sound/soc/intel/avs/mtl.c             | 217 ++++++++++++++++++++++++++
 sound/soc/intel/avs/path.c            |  51 +++++-
 sound/soc/intel/avs/pcm.c             | 133 ++++++++++++----
 sound/soc/intel/avs/ptl.c             |  98 ++++++++++++
 sound/soc/intel/avs/registers.h       |  40 ++++-
 17 files changed, 737 insertions(+), 53 deletions(-)
 create mode 100644 sound/soc/intel/avs/lnl.c
 create mode 100644 sound/soc/intel/avs/mtl.c
 create mode 100644 sound/soc/intel/avs/ptl.c

-- 
2.25.1

