Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4E46519F
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713516109; cv=none; b=k+Mk4ftKCSvSyQ4lTbCsQk7J+0mvWGagJji9a58n+W6G9Fppdwdw0d7L3w+e1QB/7/PkfDSAkLlPJGmmf0kHcvxqacirLs3v18UeI4CZNV653J5fk767rUn1ASY7UMVH6ts7zJYElZeQctfaNZEFCjFsMB0wbjz7mU+ueuxBdCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713516109; c=relaxed/simple;
	bh=h0KetJO9To1Cm7HgblSbAoEW0LeAk8mv3CuNxq3NfsU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iYwAdk2w3+Qqj/uGiWDNV3Hs3cOwShxduaLhZTf1LcLFlIshmG+4U/Yp50GGBuxZOGuSzjXFmZjohGtvQOEFDx2CJfNweRJgRpbURMPNjG3EVNiGTL6R77C8Snq8bbbwMXW6HHhJ14jDogAziiN+99NWYuBOm9IRY2N6sGlFNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeNlOxDB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeNlOxDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516107; x=1745052107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h0KetJO9To1Cm7HgblSbAoEW0LeAk8mv3CuNxq3NfsU=;
  b=YeNlOxDBBcsYOHFnUcecDDs8ui06Kf4cb8NTqQ25EEoBlu0h8HVZN7R7
   aE6VGNtoxgV2B2r6u9FhLbpnWRFSGbRLSnvQVlYwjU9F/4x+/BH35OZy4
   Ik3VC4rOW1gM8AbpG89Ni0TxJlzytOgTz9fm0NA+COuF/ge66Ev4o7ydS
   JdXcS/Oq5UGXJEeTqPR9TKTkefr2JM/Z5NRvtOWmfnhcdiW55P+1xZHm/
   E4Z+e2bb195OWlirFyWQUZocR/KKdMaPZ5+GgypZ04NGd8i2X7P8v62Ql
   GkYXyT2jgBAQng9nxxXBL7QAh9bJFzS56MXqktahDzrafXh3wSNHZeagq
   w==;
X-CSE-ConnectionGUID: tMq0XvNEQaCToEpemF1dYw==
X-CSE-MsgGUID: F1VzkNVdSo6o6MvPzCQ4QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9233732"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9233732"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 01:41:47 -0700
X-CSE-ConnectionGUID: K2cFY9h0Rlaa736nEfN2cQ==
X-CSE-MsgGUID: svcevjaPSwS3jUMPJB+VWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23353157"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2024 01:41:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	rafael@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/2] ASoC: Intel: avs: Switch to acpi-nhlt
Date: Fri, 19 Apr 2024 10:43:05 +0200
Message-Id: <20240419084307.2718881-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The change is based on rafael/acpi-nhlt [1] immutable branch which
Rafael kindly prepared for me. Without the topmost changes to ACPI/NHLT,
the patches present will fail to compile.

Recent changes for the ACPI tree [2] refactored interfaces of the NHLT
table. Currently we have two implementations - one found in acpi
subsystem (unused) and one in sound/hda/. As NHLT is part of ACPI, idea
is to make the former useful and then switch all users of existing
sound/hda/intel-nhlt.c to this new interface over time and remove the
duplicate afterward.

Two patches present here migrate the avs-driver and the intel-dsp-config
module.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/?h=acpi-nhlt
[2]: https://lore.kernel.org/linux-acpi/20240319083018.3159716-1-cezary.rojewski@intel.com/

Amadeusz Sławiński (2):
  ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
  ASoC: Intel: avs: Switch to ACPI NHLT

 sound/hda/Kconfig                     |  1 +
 sound/hda/intel-dsp-config.c          | 16 ++++++++------
 sound/soc/intel/Kconfig               |  1 +
 sound/soc/intel/avs/avs.h             |  1 -
 sound/soc/intel/avs/board_selection.c |  7 +++---
 sound/soc/intel/avs/core.c            | 10 ++++-----
 sound/soc/intel/avs/path.c            | 32 +++++++++++++--------------
 7 files changed, 34 insertions(+), 34 deletions(-)


base-commit: a640acab545b21ed1f347376f34d34e461ea92ba
-- 
2.25.1

