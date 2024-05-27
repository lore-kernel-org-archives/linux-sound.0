Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B2168C4
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716837589; cv=none; b=B3WJ8VinGzZIK3JNWZl5PolBqt8jwYV5D6oebH+1nxPz7Rg7+6MSkjNMsZTzcGig9wP4kce0PnAeL9RVHxAL5acGTOc/TmhWYe5P9KOP7LJiHrLDAcUkoGAAoaZkB0HWg1TwcnS1A5E4xf6oMiBEaKefybxfmTdDmpMeHKkiFC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716837589; c=relaxed/simple;
	bh=T1IYaXqTO2TltVT85SSDSvSD+VRTNd6vm1fRgpgQWVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cQNUlSE8pKwi/mip5UbAIrvY2WpB9j0m5//J4ILJ2OvNWOKoc0bEax6+t+CPGF0tMqTCxNF4K0QTQ8G1kfqOLnuPGCRBh9Q4oFulitibAHGcCIj2Tvf2hhXmvnmoe8oETxumGDaaEfJY6cXVBhml2y927t6TJAzfCJN5+yWDwjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3RvBiAw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3RvBiAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716837589; x=1748373589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T1IYaXqTO2TltVT85SSDSvSD+VRTNd6vm1fRgpgQWVM=;
  b=N3RvBiAwHiwy6EIWDBD6T38fdU8QuyALGkQjghak0GxXtwTJzDVEOKjY
   lA9i0wjUjBLCDpQdrYJL7GWqw/NITU/brXlR9+ffovMZT8x8xikUs/aCm
   GYyIzw+c09c/vR66GR35BDDJSdWX4m0TUZl5zBx4daz3Z0AKnyLgpqHTs
   a8/IVmkNPNlCIWQFGPpvNViuXbG9sdxVYgqZeWuZBObnOMPAnCtSMf7Pr
   20qicOTejxvB48FyDhPmf5F7FGRYG3qMHWbOzQ8wV88kj3To8WM6yYzqk
   Z9LTCqvcV9H0nC7ZE3jzvmrQqT6ijhN897+RQuIUjIJo8EJ9MEwdomWbn
   A==;
X-CSE-ConnectionGUID: vxkUwQxgSfORw+uGSs+7MA==
X-CSE-MsgGUID: Oq1+gDQkS8GK5LGez4CC1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24580802"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="24580802"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:19:48 -0700
X-CSE-ConnectionGUID: XMT3tvi8RjSKYVhfjIKxHQ==
X-CSE-MsgGUID: +apK2q5RRLOyvkTxJoMmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="72247644"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:19:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	kernel test robot <lkp@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ASoC: Intel: sof-sdw: fix missing SPI_MASTER dependency
Date: Mon, 27 May 2024 14:19:40 -0500
Message-ID: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of the Cirrus Logic 'sidecar' amps adds a dependency on SPI_MASTER.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS35L56_SPI
   Depends on [n]:
     SOUND [=y] && SND [=y] && SND_SOC [=y] && SPI_MASTER [=n] &&
     (SOUNDWIRE [=y] || !SOUNDWIRE [=y])
   Selected by [y]:
    - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && SOUND [=y] && SND [=y]
      && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
      SND_SOC_SOF_INTEL_SOUNDWIRE [=y] && I2C [=y] && ACPI [=y] &&
      (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n]) &&
      (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST
      [=n]) && SOUNDWIRE [=y]

Fixes: b831b4dca48d ("ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405140758.o2HY4nYD-lkp@intel.com/
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 3ed81ab649c5..4e0586034de4 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -652,7 +652,7 @@ if SND_SOC_SOF_INTEL_SOUNDWIRE
 
 config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	tristate "SoundWire generic machine driver"
-	depends on I2C && ACPI
+	depends on I2C && SPI_MASTER && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
-- 
2.43.0

