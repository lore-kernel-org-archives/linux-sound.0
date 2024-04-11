Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A1E3AC2B
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873054; cv=none; b=Jkqg5zY3HnBlaiRHg1wAwUlQmpEaLNrUZhik2G8ZuWWvJ27ZKfICKfEh4lnsiXD9Z12cV4tx8MTNYW+0EwYMMDn6rSrIlzH+yWE6Vncm/SETsd6g+ddKk5r/IV2wkwcvzBkEk25f+WyOLZ00xyJvdZ+rHnAZh8OsIYCoDfxTIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873054; c=relaxed/simple;
	bh=aYhhNME9fvwSMylxt5ncTLkt/NErQVZsyt2NYVWI+O0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jtBG0hzaQsWQ8mKPbB5qs5p+yHZc2r6tzOoPHeRK1egZj3VoPgAK1Xxn/Ezbq5TvpKXrmYmV0f7AYGaPQEAvjyb2WjVTVRSvuqfWYK8Rv/7BvCXLwwQKsztz/AR+uHFOYRjZ9c04Act1JhkZ4Iy/VbvKENMzyCthEGg51RaiYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UN2uN9pu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UN2uN9pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873052; x=1744409052;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aYhhNME9fvwSMylxt5ncTLkt/NErQVZsyt2NYVWI+O0=;
  b=UN2uN9puOowM8Nh95BcNdiMrVKmsAHyE6xeKZ9g658D98B1MJhtDySdO
   +i1erdrnwBdlViQ7FEt4EGT3hgz+2gmy8Wehi3PrXJnaPLjDjzeT138sR
   0tVJFg7XU7UfwgryJVztfm0M2La6OrN+PqzTGpWxKE471MzP8kYddgi5P
   KJsQSJRXcxDnWM8ysa+4VanbfmHZFWpPs3ZmAnzFRXn/FlA3jgLRzxe8v
   zVkddjo+CcMK1DWazqQLDLAdwA1nsYNnPV5u8ymYEjqvSHNfHbEJqIkWq
   C65HI/YDk7eXUL6P1SruLyVaDbGq3X37HPAsVQsy0Fjk4EhKiWy1BssHd
   w==;
X-CSE-ConnectionGUID: Y0vXSjf0QQGFsyVupf7C1Q==
X-CSE-MsgGUID: 8u1oAEu2QX+gbreWYNwUGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708330"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708330"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:11 -0700
X-CSE-ConnectionGUID: lZW5ilL3SUCi0hxLax+cXQ==
X-CSE-MsgGUID: +c8Q8HRVQ3akoMZcTc163g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628680"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/12] ASoC: Intel: updates for 6.10 - part4
Date: Thu, 11 Apr 2024 17:03:35 -0500
Message-Id: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More cleanups from Brent, notably the removal of the redundant
cml_rt1011_rt5682 machine driver, fixes for SoundWire platforms and
changes to sof_rt5682 to allow for 96+ sampling rates.

For the rest of this kernel cycle, we are still working on SoundWire
updates for MeteorLake (usual missing ACPI signature required for
topology selection and jack detection information). We'll provide
those patches as soon as they are reviewed/validated.

Bard Liao (2):
  ASoC: Intel: sof_sdw: add missing sof_sdw_rt_amp_init for Realtek
    multi-function codecs
  ASoC: Intel: sof_rt5682: use RT5682S_PLL1 if needed

Brent Lu (6):
  ASoC: Intel: sof_da7219: mach cleanup for adl boards
  ASoC: Intel: sof_da7219: mach cleanup for rpl boards
  ASoC: Intel: sof_da7219: add mtl_da7219_def for mtl boards
  ASoC: Intel: sof_realtek_common: support 4xALC1011 amplifier
  ASoC: Intel: sof_rt5682: support ALC1011 on cml boards
  ASoC: Intel: cml_rt1011_rt5682: delete driver

Pierre-Louis Bossart (4):
  ASoC: Intel: soc-acpi: add support for HP Omen14 SoundWire
    configuration
  ASoC: Intel: sof_sdw: add JD2 quirk for HP Omen 14
  ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F
  ASoC: Intel: sof_sdw: remove FOUR_SPEAKER quirks

 sound/soc/intel/boards/Kconfig                |  12 +-
 sound/soc/intel/boards/Makefile               |   2 -
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 609 ------------------
 sound/soc/intel/boards/sof_da7219.c           |   8 +
 sound/soc/intel/boards/sof_realtek_common.c   | 178 ++++-
 sound/soc/intel/boards/sof_realtek_common.h   |   4 +-
 sound/soc/intel/boards/sof_rt5682.c           |  37 +-
 sound/soc/intel/boards/sof_sdw.c              |  87 ++-
 sound/soc/intel/boards/sof_sdw_common.h       |   1 +
 .../intel/common/soc-acpi-intel-adl-match.c   |  19 +-
 .../intel/common/soc-acpi-intel-cml-match.c   |   2 +-
 .../intel/common/soc-acpi-intel-mtl-match.c   |  36 ++
 .../intel/common/soc-acpi-intel-rpl-match.c   |  19 +-
 13 files changed, 297 insertions(+), 717 deletions(-)
 delete mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

-- 
2.40.1

