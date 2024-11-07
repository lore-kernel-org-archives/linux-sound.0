Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A256A11713
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973735; cv=none; b=NOZe6KW19qdG8aAYiziWol4mhMw5FdHsSajwz0JbQDiP22VZqyykdykC0eh80QZ7XTj4I+ryccIjjpuQOblVHara4yG3rhzOv1XeDC5pq7bZndZUgH+v4IA8P0Lt6Qzb9BjR4fj/XbCVC8rc1Efer/R2qsV0SjwZB2kQsfZXUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973735; c=relaxed/simple;
	bh=yDHBGA2qZ3pL/QAgUunVdv3gc9go0XCjXRAb1orVOy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNJPubGdtWVMvaYC1MxwM/sfJtcllQ/Ny4EJSfuezkTCBQrkM2uJSiOy4OG1VOoI2MaiDObYsmNWZTQJHwNaZIvvqoegvEXKZtir/uYpgwfp7IHxa8+4nMC6ExfpmVKkQo+488zn1+aQQX8pkEPDv1tYQFbvAX09cmCcsDUhNlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjbcP5t3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjbcP5t3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730973734; x=1762509734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yDHBGA2qZ3pL/QAgUunVdv3gc9go0XCjXRAb1orVOy4=;
  b=RjbcP5t31PlcXd3CGXVRtBGXRQPFQ3Y+TPpKODrE6xZ9XfY9+xGdJzlW
   WYYab6ePwEhSo3jVmmTJwH8Z9ymVTPMG7jh8nTb+UfLVyColnD4gGC7Wx
   3OSJLznO7ztt9geMyNnShKVyimW3pN7njpahKbwJURDYAWDoS2ZWwYSNC
   D+u0Gqg5KOUyH9dPTYn8K9BVbSA+9poTiOHkjpnbjtkjUUorw46PMK/k1
   XZw8ezEkswDn/lARR2oE4xTSp8Vi+XMJnZHK/vukJkBm/qOcvupGUSeCc
   LALzDju/3IwI3gp7gRJ5ZVadOwu5PqSL6tpUl0shzuA1ts3JAS1XobDdy
   g==;
X-CSE-ConnectionGUID: 3jy4nCqsQ9uinYCtw9jFuw==
X-CSE-MsgGUID: RYxVRCc+TPeajQA50KM6pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30213267"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30213267"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:02:13 -0800
X-CSE-ConnectionGUID: athlArjBSe6qL6lRozrQnw==
X-CSE-MsgGUID: pnYZdymjQ3+wkMMDZaPGCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85425799"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:02:11 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 2/2] ASoC: Intel: Kconfig: Revert make SND_SOC_ACPI_INTEL_MATCH depend on ACPI
Date: Thu,  7 Nov 2024 12:02:04 +0200
Message-ID: <20241107100204.24952-3-peter.ujfalusi@linux.intel.com>
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

The acpi-intel-match should be compiled even if ACPI is not selected.
The ACPI is not compile time requirement, but the exported symbols are
needed for other modules.

Fixes: b6bd3f3b6357 ("ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411070806.UhCRpZok-lkp@intel.com/
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 502129772856..2db494b0e3cf 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -70,8 +70,7 @@ if SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
 config SND_SOC_ACPI_INTEL_MATCH
 	tristate
-	depends on ACPI
-	select SND_SOC_ACPI
+	select SND_SOC_ACPI if ACPI
 	select SND_SOC_ACPI_INTEL_SDCA_QUIRKS
 	# this option controls the compilation of ACPI matching tables and
 	# helpers and is not meant to be selected by the user.
-- 
2.47.0

