Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDC0194A43
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963911; cv=none; b=L0EShaJU/KvjbXSt35MdP9sBEbVl7KEqsPnICxo7wPr5aV14J5f8NFKjTcu6+qvml1UnzZ3jF4NZTQlMvceBERqYMheG7rMdMa9JxvnhVZT2W1eCgjJE0pMr7jBS/uP0wYhUihmZnlV3LG9byFkF9VgnLy6eIv1i56M3MRlcUA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963911; c=relaxed/simple;
	bh=uFyZTwiJiMprtJJR8D/wrJtHsoNW+I53PoAOVJuspnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6iS0z4LHByzN/FS891eZbxAWwr+7FOGW4IN1kJBih7S1b5Hl5PqBSNwxtiC94XDp3b7X5jnhybncaU6Xqosu/lCgWTN/6BObA1cf4CV0oFkvjdd9SvnZWPSvme9BR2izO3ZRFQ53mMe2tZjqiC+hqYK2qwHwnj7LiQ6pjJHk3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j67oTE+G; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j67oTE+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730963910; x=1762499910;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uFyZTwiJiMprtJJR8D/wrJtHsoNW+I53PoAOVJuspnA=;
  b=j67oTE+GIQXNbyXYrTsvq6rPMw4lRCEjKmtTouuR2HtIfdBWkurgxGpy
   ljx3WH8hxpYUZI7j2srP3Je7W2LG94o9NDLpaMdJYgCbmBDn2oxAEzXhx
   CrWoVbkD8M/1sq7F73dxrSIVW0AnZ8fwd3TBwyVeEwpuRFw8Z+Myr/MkR
   lGmipASOvj9invvT+6LZ4kd2v5W9QbhxHzhVWRnj3SoXdqKe7SzHCU7nY
   oypDiR54ULXZh/e5s6ui76iDFthxc0gF4NyR1Ni1NvEyEssYy1yzo8n1S
   bF4fezgUDoiyXFy/e/dUS0j/o5tKH6UbkwHB2muQLcu+8ZmbfsXpteJAU
   g==;
X-CSE-ConnectionGUID: SPII3IDhSZahzfMTxpO1fQ==
X-CSE-MsgGUID: JqFt2Ue/RGeqk4BClYYE5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34569849"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="34569849"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:18:29 -0800
X-CSE-ConnectionGUID: dbA+9oBNQhiz/BV+js+eLg==
X-CSE-MsgGUID: SnIl+1/8R6GQOauVVhlUcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85152087"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:18:27 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: Intel: Kconfig: Add ACPI condition for ACPI_INTEL_MATCH in INTEL_COMMON
Date: Thu,  7 Nov 2024 09:18:25 +0200
Message-ID: <20241107071825.12704-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only select SND_SOC_ACPI_INTEL_MATCH via SND_SOC_SOF_INTEL_COMMON if ACPI
is enabled.

Fixes: b6bd3f3b6357 ("ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411070806.UhCRpZok-lkp@intel.com/
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 2c43558d96b9..e22b5bbb47f0 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -26,7 +26,7 @@ config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 config SND_SOC_SOF_INTEL_COMMON
 	tristate
 	select SND_SOC_SOF
-	select SND_SOC_ACPI_INTEL_MATCH
+	select SND_SOC_ACPI_INTEL_MATCH if ACPI
 	select SND_SOC_SOF_XTENSA
 	select SND_SOC_INTEL_MACH
 	select SND_SOC_ACPI if ACPI
-- 
2.47.0

