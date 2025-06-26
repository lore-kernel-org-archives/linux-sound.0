Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F497263E
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750920272; cv=none; b=LUNBgedevFMnPFwLE44pGoJ4wfwW2MZzRL+ItHL+T64Zbx5DCqgdCPTXSba5bn9yQTAUl/SVq4OQa2RQhW/B36kyAntxt5xBFXW63K0A9GTCAuAJ80qli4ElR19m0yHmUJWTrXIvwyXIEiVqktu8Z1f2bZv7BECbsuRheK4oAT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750920272; c=relaxed/simple;
	bh=9saF+ivqNqgLnwlSUAw2ECW0/9hkPpAo+2Gq5Hdlroo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ClbO+Wh5OfWiDaQ8eo8jVweSK+MK587iU3+lEzhfAwNpqtXhMiQT1HBS4Os3qj8ayMC9pS523A4qgvgCtzejunVtHuqKd1cjwKqIkvaK+stRHUv/hBIIcYknvu5ZFpJk+/VCFHHxIvKJgZ4b89ayv4HHCfnzBYNbjkenCBDqwFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtwySCrg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtwySCrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750920270; x=1782456270;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9saF+ivqNqgLnwlSUAw2ECW0/9hkPpAo+2Gq5Hdlroo=;
  b=GtwySCrgddy82q4b6CptO+bHJdeiKcGRKLLmAQPZYhd5n95LZkbt/Zba
   zi+pdY+VY0livcefFt89pmztNifjZq/jDLXxGzpGOMGOTqYAkGqZZafVF
   HnV5h9hRi6snpLIVtEPq8gcm/o+4Qer0T3Z4pOmUUHFeKcLRMVsN4WwFM
   3fnyhu6dLID/EYtGZU7heQtvsndaMNz5xG9rqw2NG/VEXhd25gXHxP/rD
   hEmyzDCjoR2C46PRux+vHV+2d3AwVhm1KWbERqxOw7acuLijFd6BRzDqE
   wTqY9kpstv7h0d+MuvHajwZ0LGuaGLiBVYYzehOSD226fKlGm+/3/f/0g
   g==;
X-CSE-ConnectionGUID: CVyxIhDrQnmS24R1i/AWOw==
X-CSE-MsgGUID: yoJXT0/6RM+IxildJhG7PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63894142"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="63894142"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:44:29 -0700
X-CSE-ConnectionGUID: ATQsh1QqRXOtEl3MbyMPQw==
X-CSE-MsgGUID: Yrmb5HOyQD+G8SS71MiS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="158189248"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:44:28 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: SND_SOC_INTEL_SOF_BOARD_HELPERS select SND_SOC_ACPI_INTEL_MATCH
Date: Thu, 26 Jun 2025 14:44:20 +0800
Message-ID: <20250626064420.450334-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The helpers that are provided by SND_SOC_ACPI_INTEL_MATCH
(soc-acpi-intel-ssp-common) are used in SND_SOC_INTEL_SOF_BOARD_HELPERS
(sof_board_helpers).
SND_SOC_ACPI_INTEL_MATCH is selected by machine drivers. When
skl_hda_dsp_generic uses the board helpers, it select
SND_SOC_INTEL_SOF_BOARD_HELPERS only but not SND_SOC_ACPI_INTEL_MATCH
which initroduce the undefined symbol errors. However, it makes more
sense that SND_SOC_INTEL_SOF_BOARD_HELPERS select
SND_SOC_ACPI_INTEL_MATCH itself.

Fixes: b28b23dea314 ("ASoC: Intel: skl_hda_dsp_generic: use common module for DAI links")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506141543.dN0JJyZC-lkp@intel.com/
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 2df7afa2f469..128b6876af83 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -42,6 +42,7 @@ config SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	tristate
 
 config SND_SOC_INTEL_SOF_BOARD_HELPERS
+	select SND_SOC_ACPI_INTEL_MATCH
 	tristate
 
 if SND_SOC_INTEL_CATPT
-- 
2.43.0

