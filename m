Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A711B1DF755
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620822; cv=none; b=gtFcLnB2a13GXa0L1+Zbd3ceZCYxLqZwhbBcAfwCViLYkkivYjjMgIeyofP5BsbfgOzZnS8WwA6S9ifFwiegBPsmrj1/WGxl0LrLyJz0j+8ZvmfEU2ZfAFsqNpfZUVz4a8epcArJl5jVv8CKF8Y9XHD9nNDm2iofPdVkhiXbTRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620822; c=relaxed/simple;
	bh=z6DqocAoOrsQDYH8ONNVHKSlr1WDp1E9wIfMRKzu1G8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXEbGcfECp+vzUlswCsH3jS4mYCm9Jbqx3c4t7XSmeq86Ztm0PSiO/CcpS1WBCbGlpr9vDH95n8DqdKnSWy+CHqUc2d1vTuy5yLSj/KawMFxQpSNmCwLvx5svoF3DAki3AcmCrioG22SiWhsMcjMN0r0FTKewp1ZYQwWq6kBzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVX8OLIK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVX8OLIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746620821; x=1778156821;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z6DqocAoOrsQDYH8ONNVHKSlr1WDp1E9wIfMRKzu1G8=;
  b=nVX8OLIKKOczVeDmm+cxPv7IZ0jMrP/HzwKScbIuareYt12dz/3YTsSY
   qFB5525a9UIWAWDTl80Z9Wl9UwGY0DLyQW7IQLBoT/JOA95uKaT78V0jY
   KrmOCYF/C5PolnHJMa4chlZ9s+YuEsMFkwgAbSJ9bBaIRHIUIHn5MbjyN
   vwL63wTE4Vj0ih0G8kH/40DxPW2M+XA9b78LEEwU3kFbsmCNPOSfH+4T9
   94ZpjlGj5rVIU/21dmzoRrHD9CJ+BoNAJsOX1gvPbyfISZckWzpkMIQyg
   pfYgTaSJuI2gmruczQd47+AlIZNCr15BzDKgfDnlIey9m2kjqQ/+QxihE
   w==;
X-CSE-ConnectionGUID: gaJdSnG0RricCnKKaxlvbg==
X-CSE-MsgGUID: plJXwqmkSl20jl7ZzIQvhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65757064"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65757064"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:27:00 -0700
X-CSE-ConnectionGUID: NCsoz2yQRouTT7yuqrPbVA==
X-CSE-MsgGUID: +Szfc03XQMG54VHf+CDVuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173131928"
Received: from hcaldwel-desk1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:26:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 0/2] ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Add rt713_vb_l3_rt1320_l3 support
Date: Wed,  7 May 2025 20:26:47 +0800
Message-ID: <20250507122649.153579-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series simplify the variable name and add rt713_vb_l3_rt1320_l3
support.

v2:
 -  Follow the sorting rule to put the ptl_sdw_rt712_vb_l3_rt1320_l3 in
    the suitable position.

Mac Chiang (2):
  ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
  ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3
    support

 .../intel/common/soc-acpi-intel-lnl-match.c   |  6 +--
 .../intel/common/soc-acpi-intel-ptl-match.c   | 41 ++++++++++++++++---
 2 files changed, 39 insertions(+), 8 deletions(-)

-- 
2.43.0

