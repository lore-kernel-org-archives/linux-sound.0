Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5674B11713
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973732; cv=none; b=UmO50C8kGrlGGZuN0BFkKe20/c3YddJwZK1rsCG7dHdb6zn8fwkRMnuxx6BTjvdNKj9613bEn8TMyyiDp8IKekjCV2T4Q0wyrMsHzIMOipIGSc3fEfdi/M9Affw3VOd/6kRnEMAc1+5dr7XjgppSx1xYrkJa+J4psafHbwsiK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973732; c=relaxed/simple;
	bh=X8aW0FHPLl8Blm8J3ENUTfVAjibcG/7IlgtW30OotHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+62+GEVns9qM3YY2X5bL72nQYorMO0fGVNsTOS+V7YHQ+PDNPWsPqcfAaDLXkN8yEUD65OB/OiSPUU6h/AAzH5XRIHepbEayhyiTOP8OelpCbNAhybWrlll8wsMJNHKw0HcgPHz4JXoLAJCMPbb1w+Z6hrKNisoOZXEerP7AHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOb0l+Bf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOb0l+Bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730973731; x=1762509731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X8aW0FHPLl8Blm8J3ENUTfVAjibcG/7IlgtW30OotHE=;
  b=TOb0l+Bf+rJSIfFYA9NOUPRg1wRo3RsHoeYPpB/IJme5ychncf7hzuVr
   vZd3KEyfCbjObQiMzo95PozqJQg0LGwdXnr0EKMV3DoqlSIdwrVkHRbfB
   pnDj0P6cYeb84MOyiHpX7Q42aBo1oKFywIOi2+DZGzCCNDLHf597ZuDp/
   cUTi3ucc5OxnlruVome7G+97ZPQgJ0jbwvWlZ7feS/fcveyKH8aLFtiPI
   JgKEyU2NzqFpbcbO4Nc+4BIvFiApQ3qv5rrCl8r8jbIr31RWN6DIyjW7J
   4A0SXz+PlSzGqWMhJ0ArUQKCBbjtl947kKv1VCMeNkqSf9DZQRLMKA6gT
   w==;
X-CSE-ConnectionGUID: 6I3gKBkMSX6KnAMFC/t+mw==
X-CSE-MsgGUID: H6Ic1DamQIqY+SttaqwSKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30213260"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30213260"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:02:11 -0800
X-CSE-ConnectionGUID: 49msnzSiTjy+NwiTJlBLug==
X-CSE-MsgGUID: mFS14BwhTbecpuVRYe/+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85425777"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:02:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 1/2] ASoC: Intel: Kconfig: Only select SND_SOC_SDCA if ACPI is enabled
Date: Thu,  7 Nov 2024 12:02:03 +0200
Message-ID: <20241107100204.24952-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107100204.24952-1-peter.ujfalusi@linux.intel.com>
References: <20241107100204.24952-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDCA module have hard dependency to compile on ACPI, it can only be
selected if ACPI is also enabled.
The SDCA header provides inline prototypes for other modules to compile in
case SND_SOC_SDCA is not enabled.

Fixes: 845cb1ddf1fc ("ASoC: Intel: Kconfig: select SND_SOC_SDCA by SND_SOC_ACPI_INTEL_SDCA_QUIRKS")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411070806.UhCRpZok-lkp@intel.com/
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 46b45f390ae9..502129772856 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -78,7 +78,7 @@ config SND_SOC_ACPI_INTEL_MATCH
 
 config SND_SOC_ACPI_INTEL_SDCA_QUIRKS
 	tristate
-	select SND_SOC_SDCA
+	select SND_SOC_SDCA if ACPI
 
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
-- 
2.47.0

