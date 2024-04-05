Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75622611E
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308087; cv=none; b=gwgJ2epEpPsqslGvr58/ykSaHNi2ciVIcATCtzvnZOH4/zGh0P26ZFUrwIipVnFlzJms1w5FS+xZckdPPkVrYRUfH+SJSsx64jwXWqE2J/7TFfR8T6PR7pLqEYo+/R2wS7YuqlQv6h3jzzh+Sm0sT50HPelmBl6S9YhpxwHWwFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308087; c=relaxed/simple;
	bh=w4voot3MVuWaDcFzJX4FnXRWl/6tY1quMjamUlkpboY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tE66wg0SdXaYOGoy8sfY9W/YixFExnTnMyuZpGYoJuMjqD+DoaP3gmvai22WvQYZm6QFPEsCGCvWnWlXSJ82nfM2kuP1tnR0tgqG+HzBO+iXK+cGGBsvxM6KGJEVHTQXaIhfLAmV4V1ayrB5NRL2pOe6DuF6zEMydzXw1sd8ZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpKP7xok; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpKP7xok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308086; x=1743844086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w4voot3MVuWaDcFzJX4FnXRWl/6tY1quMjamUlkpboY=;
  b=fpKP7xokKDZHiHraGw+v/wyGueE+oj6gKArkq5ma/OCDY3bJpFQt6V3D
   XIKnOyciWCkjnQxzBDNaN8WOKkZy4AqyKgTfDCrqOqel8E8FnDLgjX/4M
   trwcpZRAVQNXcE0oZ0/CdP8wiT6Ii0luN1KkIl46Wlq3iRhQX3U04Q3UE
   R2Srn5eQtD6uNtNx2zLt1KmAwYpbqVOiAuZGUFbBkZmg+sV9VaNlsJs3Z
   Zpm1OSHAj0pWk0OX8KBnAWkZkwnW3jh4BYm0T8pvFVDXtNIx1F0U/BD3A
   kfMRyJEus67eVl0foFkUaia/7IvcL2kMZ1G0AMZ7gRtIaiV8l2SlApiyV
   w==;
X-CSE-ConnectionGUID: QwFQxdL5Qs6v5BpXkaou4w==
X-CSE-MsgGUID: g+6r4CGmR6madOoNW9DbsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787397"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:05 -0700
X-CSE-ConnectionGUID: vUJHlC7RS3aWfM/v9UknLg==
X-CSE-MsgGUID: t5b03ECmT7+43DyoTHRvwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042407"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/13] ASoC: Intel: avs: Fixes and cleanups for 6.10
Date: Fri,  5 Apr 2024 11:09:16 +0200
Message-Id: <20240405090929.1184068-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set of changes targeting the avs-driver only. No new features, patchset
either fixes or fortifies existing code.

Patchset starts off with a fix for debugbility on ICL+ platforms which I
have forgotten to fixup when providing support for these initially.
The next two address copier module initialization, most importantly,
silence the gcc 'field-spanning write' false-positive.

The following four:
6/13 ASoC: Intel: avs: Replace risky functions with safer variants
7/13 ASoC: Intel: avs: Fix potential integer overflow
8/13 ASoC: Intel: avs: Test result of avs_get_module_entry()
9/13 ASoC: Intel: avs: Remove dead code

address problems found out by Coverity static analysis tool.

The last two worth mentioning are: recommendation from the firmware team
to wake subsystem from D0ix when starting any pipeline -and- shielding
against invalid period/buffer sizes. Audio format shall be taken into
consideration when calculating either of these.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Restore stream decoupling on prepare
  ASoC: Intel: avs: Add assert_static to guarantee ABI sizes

Cezary Rojewski (11):
  ASoC: Intel: avs: Fix debug-slot offset calculation
  ASoC: Intel: avs: Silence false-positive memcpy() warnings
  ASoC: Intel: avs: Fix config_length for config-less copiers
  ASoC: Intel: avs: Fix ASRC module initialization
  ASoC: Intel: avs: Replace risky functions with safer variants
  ASoC: Intel: avs: Fix potential integer overflow
  ASoC: Intel: avs: Test result of avs_get_module_entry()
  ASoC: Intel: avs: Remove dead code
  ASoC: Intel: avs: Wake from D0ix when starting streaming
  ASoC: Intel: avs: Init debugfs before booting firmware
  ASoC: Intel: avs: Rule invalid buffer and period sizes out

 sound/soc/intel/avs/avs.h      |  1 +
 sound/soc/intel/avs/cldma.c    |  2 +-
 sound/soc/intel/avs/core.c     |  4 +--
 sound/soc/intel/avs/icl.c      | 12 ++++++---
 sound/soc/intel/avs/loader.c   |  6 +++--
 sound/soc/intel/avs/messages.h | 47 ++++++++++++++++++++++++++++++++--
 sound/soc/intel/avs/path.c     | 13 ++++------
 sound/soc/intel/avs/pcm.c      | 34 +++++++++++++++++++++++-
 sound/soc/intel/avs/probes.c   | 14 ++++++----
 9 files changed, 109 insertions(+), 24 deletions(-)

-- 
2.25.1

