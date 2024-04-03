Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B41369B0
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136675; cv=none; b=ZQYZZhq5thwEUzEMljB+J9PTFkz7arKDqdRX5wv6twBImGybPMqFkG6LF0TIeZqMhUTCB45rIlgkDEF52RpabWP9DJlu/ePux849vl3E3Hu8taSMqc1CyY/ankQGajpMzO533lB2d4/jPFLEH0/Xl6568wNCVqWhuCuhojx1pWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136675; c=relaxed/simple;
	bh=40mSvovdxw4jGIUnLpVxakwvKHEA8sRzb5ALrIoAwMw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hr4VKgIJ4pok9rTMQ0JIq51s0KYAwki7KV3JoWNeXMZtQXU3WnyD6nVaTkAoi0zmo0BuoQSeaKYkOoh5qjxP0AXWpGiuods67ipe+8PCLf/7UWYehjbUeS0zN2wn1FWKstRe0Jxa8WvY1WuuExKPATATVaqwB8zZtHiQqeH2c7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3nuV8nV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3nuV8nV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136674; x=1743672674;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=40mSvovdxw4jGIUnLpVxakwvKHEA8sRzb5ALrIoAwMw=;
  b=V3nuV8nVCjzwgp5s/DGHYyFcNuxGtLT8agMRoM5ivBVQnkerr0C+6h4v
   FsAYN4YsXKWoL7MfuP2+1pqQJs+5FIMq7tJNV21laRSkuz3NaK20iuNL/
   Kewa1B78Zf8bw3DQWMwzblt0rSDFWBTLeHkOdojp5B6b4qSbntfyrTObE
   XxZo9yNrluhRFE2P75J21YdVlzVmkOVZ3rLEgpKGyUtsrzlUgvRJT+Xt4
   XV3gk7W5a+MeI9SdPNv1r4Ltoo6n7iwfaiHb517ra5HYuqps9YkJHhTLz
   gMkob9ZD8Ml0g6pQs01XjWXdDhd4gFsmhq16vO+tmlg3DfKHIm2bw10hh
   w==;
X-CSE-ConnectionGUID: caGT/fCwTOWSrFPjaaXdSQ==
X-CSE-MsgGUID: fYDqTXdPSRKLFohrPtwhzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218675"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218675"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:13 -0700
X-CSE-ConnectionGUID: 0uG/nLzbSla+T6GVNb0Q/g==
X-CSE-MsgGUID: qAX4Qi05TnWODjytcOpwnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797531"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:11 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 00/10] Use const where applicable
Date: Wed,  3 Apr 2024 11:31:35 +0200
Message-Id: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm_kstrdup_const in few places to possibly save a bit of memory.
Mark some of the structs as const, as they are not modified and used as
is.

Amadeusz Sławiński (10):
  ASoC: Intel: avs: hdaudio: Use devm_kstrdup_const
  ASoC: Intel: avs: Use devm_kstrdup_const
  ASoC: Intel: avs: hdaudio: Constify probing_link
  ASoC: Intel: avs: es8336: Constify card_headset_pins
  ASoC: Intel: avs: nau8825: Constify card_headset_pins
  ASoC: Intel: avs: rt274: Constify card_headset_pins
  ASoC: Intel: avs: rt286: Constify card_headset_pins
  ASoC: Intel: avs: rt298: Constify card_headset_pins
  ASoC: Intel: avs: rt5663: Constify card_headset_pins
  ASoC: Intel: avs: rt5682: Constify card_headset_pins

 sound/soc/intel/avs/avs.h            | 2 +-
 sound/soc/intel/avs/boards/es8336.c  | 2 +-
 sound/soc/intel/avs/boards/hdaudio.c | 6 +++---
 sound/soc/intel/avs/boards/nau8825.c | 2 +-
 sound/soc/intel/avs/boards/rt274.c   | 2 +-
 sound/soc/intel/avs/boards/rt286.c   | 2 +-
 sound/soc/intel/avs/boards/rt298.c   | 2 +-
 sound/soc/intel/avs/boards/rt5663.c  | 2 +-
 sound/soc/intel/avs/boards/rt5682.c  | 2 +-
 sound/soc/intel/avs/utils.c          | 8 ++++----
 10 files changed, 15 insertions(+), 15 deletions(-)


base-commit: 36d464cba8bdfd268282a97e9fdc701aca2ed8cb
-- 
2.34.1

