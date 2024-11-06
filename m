Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A223E191F90
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 05:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730872739; cv=none; b=p2yaGIrhnhPv390xwMuDyumZgSp9l0SQlyvyEwYaajbL0hJo0PoYOm0E/+GD8UKM2eDFTJrGA1KaEOqzUBL/QMnJceMDXARLU9W8eOovsp4+49Bvd8c/FIoiKJgf1OdKdXWTp5d4glz82AaVEVJCRZPIq0CBConWxzB4fLUMx/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730872739; c=relaxed/simple;
	bh=wm/+SlcXjq94WTJY5FKVNbMEJHHHQFNB+nGHOtcTWC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwbFa9nRXiXJBTaK9Cey0vt9DED5tFhsaQchkt6LbDGAPwBgWK11VqrAws44OyraCS4RB4j9XV9xqjsg4eXuB9bVEeB4JbkRCqUhUZHhJJMNdel5rfsAxZ5XcSPWOlXA5+0LhtP7xHDJRh32wZCy0OxbeD5eMMBkjJlQF8gMwTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRBGa4Fi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRBGa4Fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730872738; x=1762408738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wm/+SlcXjq94WTJY5FKVNbMEJHHHQFNB+nGHOtcTWC4=;
  b=gRBGa4Fi8fevaZKuxtlzBZkah4/J16eetG5k3eMxT2UBCt7v0tvF1/tr
   01UFZIhaxrYleZy988wbIdbKu8TF8fFAtBlA2hmHf1s54VzUyLdqsc/FL
   TJgWhmSvvr9lkvV3LecD2b4lo6bcOkQ3W9pejKXMEh3iqyqgPcascT45D
   6INFMwfrcI4BO2js0u+pSWZAkdayFNhwbJymuuPhoCi7G9/ACPaskcZg0
   72r3dwCTjAhqVYYO8dBF2aNNDwKd+uNa2VsdU8js+kqxmPOoudrDYw4VQ
   hOyX1/og5XaqQb0pac105UM/eIPFqMGQS2xCquKF6jDSnPtL1CZWEGJDK
   g==;
X-CSE-ConnectionGUID: ETT1wZWES4exIlKQoXZWXg==
X-CSE-MsgGUID: WZNy12n9QsyC/9C4k4lmfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30505157"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30505157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 21:58:58 -0800
X-CSE-ConnectionGUID: sTcVwJdFQs+kXamYgi1l5g==
X-CSE-MsgGUID: DVqryRz1QCipraNEpGYVfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89484317"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.45])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 21:58:20 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI
Date: Wed,  6 Nov 2024 13:58:09 +0800
Message-ID: <20241106055810.10123-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106055810.10123-1-yung-chuan.liao@linux.intel.com>
References: <20241106055810.10123-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SND_SOC_ACPI_INTEL_MATCH relies on ACPI functions. It will not work
if ACPI is not selected.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 14461dee3e52..f644e9423428 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -70,7 +70,8 @@ if SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
 config SND_SOC_ACPI_INTEL_MATCH
 	tristate
-	select SND_SOC_ACPI if ACPI
+	depends on ACPI
+	select SND_SOC_ACPI
 	select SND_SOC_ACPI_INTEL_SDCA_QUIRKS
 	# this option controls the compilation of ACPI matching tables and
 	# helpers and is not meant to be selected by the user.
-- 
2.43.0

