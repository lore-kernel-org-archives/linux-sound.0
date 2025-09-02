Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD35B2EA731
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805337; cv=none; b=tp2ColhUEH29EO4AdyQqLX7mgDWg9JZBMeTd/7B6mStd2+W0FrDgcIAw1qNlP5DUI43omYbMMl9KskM+M77mmoHPgaK4AJIj7sfwtcS2ZrjdtWvIZIf69JaRRYuykwkPTk1QVaSharpUhsCvVW4so7Z0/jzrk8Kl+NSlx3ZeLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805337; c=relaxed/simple;
	bh=SHwyFmsI9MX6smyD9lXPjTLcUReAJylVajjDEK1lX0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F4UCGvc40SGJcCUKww7Km4dgZq+ZxoNgLUeiMJZWskc8Qhyw/+U6KGYW9M12EEzkyYZdho98UF5PHov29yxEwSoTw9QYIEdhXu80LsW/mM4EBM8erh1ogMpxUnYCTVIYtOcRYczQL4+a+3EU6+BjL3MVH2WOcV+5gYRam77p1aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esj5Qcl2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esj5Qcl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805335; x=1788341335;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SHwyFmsI9MX6smyD9lXPjTLcUReAJylVajjDEK1lX0E=;
  b=esj5Qcl2uVEv3XllkslDiKKn/1xuUYtncilFJr56lR+WYA9VvrJnmRfc
   T4XrDLPG+2Y/OSllrv7Szbgq5tu5nEkK4EWEBGmA8T68JF3FVOC+JFYEj
   Wg128BDtYfzpX3d4gjUWR4Ju45zOvBuwLobjq7a9xCQ6PAISwGaNdZpGd
   aeNTmIZP60H8rBOMBHVaLZt2hazQGVTcEJRtoIUmtdPN85S5xUaFAiiZV
   x2SgnySkZCgmD2wfINMWIO3seb4Z4irBGDlL4SEGaR8pfzDtPxTAY7C0A
   gbydCWAa3FaZlLOPH4P6FPmjMRf6S5rAetDwTnbENt8iF0QKB+u7b6Lk5
   A==;
X-CSE-ConnectionGUID: 7wihZjlQThq629YrMWp5Yw==
X-CSE-MsgGUID: 0K2uLsvCSMeC9dE7K902uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275178"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275178"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:28:54 -0700
X-CSE-ConnectionGUID: swbWq9a0QMucvCQwa7QdMw==
X-CSE-MsgGUID: p4XWkL+yQ8uRd6wAIjcaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503107"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:28:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/17] ASoC: Intel: avs: Adjust platform names
Date: Tue,  2 Sep 2025 11:48:36 +0200
Message-Id: <20250902094853.1231842-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a direct follow up to the recent
machine-board-registration changes [1]. Initially, a number of smaller
patchsets were part of a bigger block of changes. My attempt to split
them up to make the review easier was unfortunately not successful [2].

The goal of this series is the same one as with [1] - allow for multiple
cards of the same type without workarounds or code duplications.
With the machine-board names being unique - thanks to
PLATFORM_DEVID_AUTO - platform component names shall be adjusted too so
that no misbindings happen.

In essence, majority of the changes can be summarized as: simplifying
card and dai_link initialization. Actions:

- drop mach->mach_params.platform usage
- drop snd_soc_fixup_dai_links_platform_name() usage
- for the probe-board mach-context is dropped entirely. The panic [2] is
  gone

[1]: https://lore.kernel.org/linux-sound/20250827142229.869139-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/linux-sound/20250829225532.GA400117@ax162/


Cezary Rojewski (17):
  ASoC: Intel: avs: hda: Adjust platform name
  ASoC: Intel: avs: da7219: Adjust platform name
  ASoC: Intel: avs: dmic: Refactor dai_link creation
  ASoC: Intel: avs: es8336: Adjust platform name
  ASoC: Intel: avs: i2stest: Adjust platform name
  ASoC: Intel: avs: max98357a: Adjust platform name
  ASoC: Intel: avs: max98373: Adjust platform name
  ASoC: Intel: avs: max98927: Adjust platform name
  ASoC: Intel: avs: nau8825: Adjust platform name
  ASoC: Intel: avs: probe: Refactor dai_link creation
  ASoC: Intel: avs: rt274: Adjust platform name
  ASoC: Intel: avs: rt286: Adjust platform name
  ASoC: Intel: avs: rt298: Adjust platform name
  ASoC: Intel: avs: rt5514: Adjust platform name
  ASoC: Intel: avs: rt5663: Adjust platform name
  ASoC: Intel: avs: rt5682: Adjust platform name
  ASoC: Intel: avs: ssm4567: Adjust platform name

 sound/soc/intel/avs/boards/da7219.c    | 15 ++---
 sound/soc/intel/avs/boards/dmic.c      | 80 ++++++++++++++++----------
 sound/soc/intel/avs/boards/es8336.c    | 16 ++----
 sound/soc/intel/avs/boards/hdaudio.c   | 13 +++--
 sound/soc/intel/avs/boards/i2s_test.c  | 15 ++---
 sound/soc/intel/avs/boards/max98357a.c | 15 ++---
 sound/soc/intel/avs/boards/max98373.c  | 15 ++---
 sound/soc/intel/avs/boards/max98927.c  | 15 ++---
 sound/soc/intel/avs/boards/nau8825.c   | 15 ++---
 sound/soc/intel/avs/boards/probe.c     | 53 ++++++++++-------
 sound/soc/intel/avs/boards/rt274.c     | 15 ++---
 sound/soc/intel/avs/boards/rt286.c     | 15 ++---
 sound/soc/intel/avs/boards/rt298.c     | 15 ++---
 sound/soc/intel/avs/boards/rt5514.c    | 15 ++---
 sound/soc/intel/avs/boards/rt5663.c    | 15 ++---
 sound/soc/intel/avs/boards/rt5682.c    | 15 ++---
 sound/soc/intel/avs/boards/ssm4567.c   | 15 ++---
 17 files changed, 145 insertions(+), 212 deletions(-)

-- 
2.25.1

