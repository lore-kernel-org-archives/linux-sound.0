Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA501A3169
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568198; cv=none; b=N7a2IISz3mamnssiyeG1WoD5h2RhgMBdBvP4hMjtQs0llZoG7vk3jYGx/JLsU/WXmz9GEFNHWgzbf37WFLoaMKGHFh/5GMxeRPzwYIgWjVtlQy+7jccdcupqhh70NxDtbQvWICjTRkdnu3BAP5ycbZdn3Pz8uzDttWlhpPSUP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568198; c=relaxed/simple;
	bh=nnbonDbf3eq8KnbToPvYwcWz6rMoI7oUYDFZuKLgiqs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tw4arzwXaP6U3Lt1k0Vh0rdbq+JoTvSEuw781CYD+lCjhQu6rG4Wl6ms8pB+yO7cAn+n7Nq59/R1CdqCdrWzunrPsuG3+r7iu7CekCLozindg2UM1Lf0xaSAr5Nysfbj+vk8seHoSmlbeMkqICdialGwhsW4xG2ywjn4X3GZ+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQP3j4fL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQP3j4fL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568197; x=1772104197;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nnbonDbf3eq8KnbToPvYwcWz6rMoI7oUYDFZuKLgiqs=;
  b=IQP3j4fLIYXyuoKvjFPemhlokyLk32EpX8eEX2c3UGyvU/ILMqDQcrgV
   pgm2uTWMfsPAd9jgmR7veMH2PIS/pekN5O/HJLd3tUWFpiJ8inc01dCky
   wWLSyZzVI0t2/vTnofHMBh9L984bBE5mOtBcy5ljt6BjWi8s0PJhXp1NM
   PcnwjNOK6IVs3Rvi96B+9LDfBI7oAcr/SwkQlMQFhYwQHRat+IgEWabhR
   5gyfxFezQGa587Fk3qxcfDLJ48hEvVkRGYXwenp4YTZ75UskwS3A1BY/3
   j+b5IM9OgpY6i63uzo/SSR7LnFknXtc6Wvri+g+lExkq0gCJZiG0mwMJz
   Q==;
X-CSE-ConnectionGUID: nduzeph3RLq2nyKt+wCN2A==
X-CSE-MsgGUID: SyZAOA/FRPWcbNxkC5kfOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111002"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111002"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:09:55 -0800
X-CSE-ConnectionGUID: XzuGZc9DSei1ygmP5hCZaA==
X-CSE-MsgGUID: Z071TiDCSa2SWrcz73aBWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116684936"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:09:52 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	flove@realtek.com,
	oder_chiou@realtek.com,
	shumingf@realtek.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 00/22] ASoC: codecs: Update device_id tables for Realtek drivers
Date: Wed, 26 Feb 2025 12:25:50 +0100
Message-Id: <20250226112612.166989-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series aims to streamline the formatting for ACPI IDs so that a
single pattern can be used to identify the device.

Work implicitly suggested by Andy Shevchenko - reading and learning from
number of his reviews on the Linux mailing lists.

Several formats do exists, however, after technical discussion PCI-based
format has been selected as the recommended one. For Realtek devices, it
is going to be 10ECxxxx where 10EC unambiguously identifies Realtek
company whereas the following 4 hexes specify the PART_ID i.e.: the
device.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Patches sorted into two groups:
- fixes, no functional changes
- updates: fix + addition of new ACPI ID entries


Changes in v2:
- dropped 2 conflicting patches for rt1015p and rt5682s as pointed out
  by Choiu and Shuming
- sorted ACPI IDs alphabetically as suggested by Andy. This targets
  numerous patches and is noted by 'While at it, sort the IDs
  alphabetically.' in the commit message
- spacing (whitespaces) should now be cohesive across all patches


Cezary Rojewski (22):
  ASoC: codecs: rt1011: Fix definition of device_id tables
  ASoC: codecs: rt1015: Fix definition of device_id tables
  ASoC: codecs: rt1016: Fix definition of device_id tables
  ASoC: codecs: rt1019: Fix definition of device_id tables
  ASoC: codecs: rt1305: Fix definition of device_id tables
  ASoC: codecs: rt1308: Fix definition of device_id tables
  ASoC: codecs: rt1318: Fix definition of device_id tables
  ASoC: codecs: rt274: Fix definition of device_id tables
  ASoC: codecs: rt5514: Fix definition of device_id tables
  ASoC: codecs: rt5640: Fix definition of device_id tables
  ASoC: codecs: rt5645: Fix definition of device_id tables
  ASoC: codecs: rt5651: Fix definition of device_id tables
  ASoC: codecs: rt5659: Fix definition of device_id tables
  ASoC: codecs: rt5660: Fix definition of device_id tables
  ASoC: codecs: rt5663: Fix definition of device_id tables
  ASoC: codecs: rt5665: Fix definition of device_id tables
  ASoC: codecs: rt5668: Fix definition of device_id tables
  ASoC: codecs: rt5670: Fix definition of device_id tables
  ASoC: codecs: rt5682: Fix definition of device_id tables
  ASoC: codecs: rt286: Update definition of device_id tables
  ASoC: codecs: rt298: Update definition of device_id tables
  ASoC: codecs: rt5677: Update definition of device_id tables

 sound/soc/codecs/rt1011.c     |  6 +++---
 sound/soc/codecs/rt1015.c     |  6 +++---
 sound/soc/codecs/rt1016.c     |  6 +++---
 sound/soc/codecs/rt1019.c     |  6 +++---
 sound/soc/codecs/rt1305.c     |  8 ++++----
 sound/soc/codecs/rt1308.c     |  6 +++---
 sound/soc/codecs/rt1318.c     |  6 +++---
 sound/soc/codecs/rt274.c      |  8 ++++----
 sound/soc/codecs/rt286.c      |  5 +++--
 sound/soc/codecs/rt298.c      |  5 +++--
 sound/soc/codecs/rt5514.c     |  6 +++---
 sound/soc/codecs/rt5640.c     | 14 +++++++-------
 sound/soc/codecs/rt5645.c     | 12 ++++++------
 sound/soc/codecs/rt5651.c     |  8 ++++----
 sound/soc/codecs/rt5659.c     |  8 ++++----
 sound/soc/codecs/rt5660.c     |  8 ++++----
 sound/soc/codecs/rt5663.c     |  6 +++---
 sound/soc/codecs/rt5665.c     |  8 ++++----
 sound/soc/codecs/rt5668.c     |  6 +++---
 sound/soc/codecs/rt5670.c     |  8 ++++----
 sound/soc/codecs/rt5677-spi.c |  3 ++-
 sound/soc/codecs/rt5677.c     |  1 +
 sound/soc/codecs/rt5682-i2c.c |  6 +++---
 23 files changed, 80 insertions(+), 76 deletions(-)

-- 
2.25.1

