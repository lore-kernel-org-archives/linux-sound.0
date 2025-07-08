Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA14729A9FE
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961643; cv=none; b=C4Qtfho03KtcpAiwLDtPTAmjxL3lwMK1us3hYfYCzkaop1D5XZmlZ9kKHKi8XlLp/in92dE6mlsqXQ4PVz6A8yBm51Q/B6Xu+6ZUN4ooamVF7W440voiHWbhnRSlnlZJBVOg5SrGdYjSKu1GlX7QMkAzZniNzY7lL7MoGxDr/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961643; c=relaxed/simple;
	bh=JAOKfuMDVShHntFDEjXkKnazoT7QsNUaS4xhKVuM70o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pRnd7aRcBaVtzw9l95fcLv2QJhcJZKdYWK+rU9IWHkW2Vic8nSYp/14olEb4MBlCGrFGKbxQIAsKO9t7eR9HLuY3rpJ62mQ4Jid4C7MrF+FNphiSi85RDgxi2Asq4jM/8KyYsypb2iztchLd4YrImEd37ZyfHk7f2tmszF8OG/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEpYrjAa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEpYrjAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751961642; x=1783497642;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JAOKfuMDVShHntFDEjXkKnazoT7QsNUaS4xhKVuM70o=;
  b=VEpYrjAa/vT3HcW9KW5f+1UYDNlmAXzqo6iqbeb4iLkN456Ckk10w59J
   Y0SW6L2tbPN0KwGrMaM0S08KRjlptU5FdeWI4TeKv703fr1JtPmrhVVyP
   XXB6BxRPIewhpA/EoLzC1FITjtyHuEj/VP2tPaV4lIV0YAFVk+rcQiQpL
   20hax5s2c7dft55AV1j4EtnIUkwpnexH3m92p/z+Cp4PMOdL3LaN8EdxZ
   KpZqMRT4Egrb4VrO8dTswjd+Eu27HuF+mP+kCsLZ3agXgW71YdJ5bLlhl
   GcEKfTF+8GAYuSSr89dPDK3euRzSHxSupxFymgDLW/w9yBDB94c9uMTMa
   A==;
X-CSE-ConnectionGUID: mKjW6qDoSEqlYKVI9OlOBA==
X-CSE-MsgGUID: 7TrxocLATX2Znwh02rhfPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65542015"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="65542015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:41 -0700
X-CSE-ConnectionGUID: +WmuLxqFTrKD8THn9qUAUg==
X-CSE-MsgGUID: jAZc9LR7QDWscYz2xSIw8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="154832073"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/4] ASoC: Intel: add support for new devices
Date: Tue,  8 Jul 2025 16:00:25 +0800
Message-ID: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for new devices on Intel platforms.

Balamurugan C (2):
  ASoC: Intel: soc-acpi: Add entry for sof_es8336 in PTL match table.
  ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in PTL
    match table

Mac Chiang (2):
  ASoC: Intel: soc-acpi-intel-ptl-match: add support ptl-rt721-l0
  ASoC: Intel: soc-acpi-intel-lnl-match: add rt1320_l12_rt714_l0 support

 sound/soc/intel/boards/sof_es8336.c           | 10 ++++
 .../intel/common/soc-acpi-intel-lnl-match.c   | 34 +++++++++++++
 .../intel/common/soc-acpi-intel-ptl-match.c   | 50 +++++++++++++++++++
 3 files changed, 94 insertions(+)

-- 
2.43.0

