Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A888A1A4E98
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756408; cv=none; b=JI0zvDrDFYwwWmeUv06bB5YRg66iJuBLsZPuwk5jm/bjaqq0UjUBPbmaCzouI/HaUAkIZh79cFkUobdT77JccAeUyj7pReXbdIYxrR2xOKk498yspxUhk0gkcqy5onyN7qkX7xVDZf36aSfThf2mkGzSVomCPSyc/uMKdfbKgVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756408; c=relaxed/simple;
	bh=vGEV4mrCWXuJ62c77HprbFfAMOEYKnNGtBF7Z3hJLMw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=emk/MAzxUyoOahptRJcSN0lwCw2RmHYLKc0seA4YdX7lWolysASLiZOIbjWIP5GYZx79F0s9PD24jUDhprg0t3ayrxAjL96kkif3gmm3esz0cDGPDmDNGpE4FBJU/QED1mDbHbxXsse/6HG4VGt8zuSm0iHRxR3e+vbrkuLiXFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lM1mZfVd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lM1mZfVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756406; x=1775292406;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vGEV4mrCWXuJ62c77HprbFfAMOEYKnNGtBF7Z3hJLMw=;
  b=lM1mZfVdbmWITDO2ZJfPeNQEISFxE2oIvnH5t+C/Eu+pCm1jCE3ntsgx
   nOKBnARvxMhvnp5Si2fRzAjxktPplXHCNnDUtP/3WUj12Jn2ZGk1HfMfK
   +VuR1Qy8toK1H7ulwMNCR4V/O6bKOqG4RpJl4ygJJFVtLdHqNyoPuDbhr
   BTJp6+tVI6BfuWN9noCffVQdZ9O6a8fNATE3I3GzQ3GvCDDvSjmH77cno
   6wf6xir+T/T4lEXVauuoB2c5KpHMIG2kyIULvX5LlNqcyKBYAYOQ0qrjP
   lpvuYtHJuPuL4tav5zkVGlEVjyI4xHitZIst4OtsUpDeEZTM4eUKBH3sh
   w==;
X-CSE-ConnectionGUID: 9uS1h2+tQq++qWJJaSUwfQ==
X-CSE-MsgGUID: ELIjFEu2QVue3lipRHuXgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854557"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854557"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:46:45 -0700
X-CSE-ConnectionGUID: xiUQJI5MSiGN8vgtAs+ALw==
X-CSE-MsgGUID: dwX6hK7ERvuRn2aDpaL4nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464210"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:43 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/8] ASoC: Intel: avs: 16 channels support
Date: Fri,  4 Apr 2025 11:03:29 +0200
Message-Id: <20250404090337.3564117-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Relatively small delta-wise patchset which raises max channels supported
from 8 to 16.  The existing limitation is software-based, not hardware
based.  The hardware, as per HDAudio specification, section 1.2.2,
(relevant register at SDnFMT, section 3.3.41) supports the
configurations for years.  The avs-driver becomes the first consumer of
that configuration on the Linux kernel side.

Set starts off with update to string_helpers so that functionality added
with parse_int_array_user() can be utilized in kernel-kernel
interactions.

Follow up is rasing the cap on HDAudio-library side.  The format
selection procedure found in the library is good-to-go as is.

Everything that follows these two patches is avs-driver specific:
- raise channels_max for every DAI-driver template
- provide i2s_test module parameter for testing purposes.  When combined
  with I2S loopback card, allows to test 16ch on most Intel hardware post
  Broadwell era
- adjust TDM masks to reflect the 8 -> 16 channels change

Amadeusz Sławiński (5):
  ASoC: Intel: avs: Rename AVS_CHANNELS_MAX define
  ASoC: Intel: avs: Allow to specify custom configurations with i2s_test
  ASoC: Intel: avs: Assign unique ID to platform devices
  ASoC: Intel: avs: Iterate over correct number of TDMs
  ASoC: Intel: avs: Support 16 TDMs in dynamic assignment

Cezary Rojewski (3):
  lib/string_helpers: Introduce parse_int_array()
  ALSA: hda: Allow for 16 channels configuration
  ASoC: Intel: avs: Allow for 16 channels configuration

 include/linux/string_helpers.h        |   1 +
 lib/string_helpers.c                  |  39 +++----
 sound/hda/hdac_device.c               |   2 +-
 sound/soc/intel/avs/board_selection.c | 144 ++++++++++++++------------
 sound/soc/intel/avs/messages.h        |   5 +-
 sound/soc/intel/avs/path.c            |   2 +-
 sound/soc/intel/avs/pcm.c             |  10 +-
 sound/soc/intel/avs/topology.c        |   4 +-
 sound/soc/intel/avs/topology.h        |   2 +-
 9 files changed, 110 insertions(+), 99 deletions(-)

-- 
2.25.1

