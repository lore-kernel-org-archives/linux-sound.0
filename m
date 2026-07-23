Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4E03DB31D
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790349; cv=none; b=RqfnUad50C6KxRLZbC3e7EU9O64C0VDx9iqexW1IkQMiJVpXxHIhPx4vTrsEA84/V4r4/6H+C837jze4E+DEXyaq0V6XZCqAmoA51VElSGuQDS4oTnIjEcvCz6ouSTvlBKX+351LnYbhiY5Ka3yPJRwRRXRtaZ3us4ta7OhIWGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790349; c=relaxed/simple;
	bh=hlxmR9iq/gncPSwuZAQg2TYB+vXEqwo2otg5fNS4Z1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyBQ1/vGugUXbwWhmYcSrcCypezegOKVQFuRXmIT0EaFHqnqJv4ldSZTLuCizMO+ZIGuFLDp3ONj5md1T14XMcNgGxxRhLiouadAX+AH/ETYb+2JilpHQ1GVTn85pKh8G9aEnoz1AoSr5VHZNbaXXJc3qhk3YztuN5IE1FbS6uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCMvte3n; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCMvte3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784790345; x=1816326345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hlxmR9iq/gncPSwuZAQg2TYB+vXEqwo2otg5fNS4Z1Y=;
  b=eCMvte3nodgD2AblQjObCQU+auhD7u94UtZlvgfXtT5xf0Wy1jBAbXFB
   qPJ5qjACjM0ASJL3CXj137g4vrgfOxa2P0T8ZTXsaSc2hPVylXIa2/zCi
   L9sluSHqSabsjfiqYkVEAHDq321dPO8mfQEHXs4tv5dxIFuK1jdvJiIUr
   73ayyMTr7/ijqqrfFQTsBrRIWwcBCd0zKlq96/MIDCDuYrBWOWWzvwJYW
   +GUyxTrmSR5oDi/zJKgLinRAAo9no/xMSbe9j99Mv0mVphgx7ciabEKGO
   vyNlULhNnPG1VJxl4AfJRVhD1n4FnLCnh8Jl0Ukbuo76ngY73/PrAUbUN
   A==;
X-CSE-ConnectionGUID: VV93OgHCTe2dPFbzgYNMwA==
X-CSE-MsgGUID: ob/cSXtSQ3GmlQyfjZ9TxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96095044"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96095044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:43 -0700
X-CSE-ConnectionGUID: xZjfhUwARf674x8Ii3hJng==
X-CSE-MsgGUID: u7jqw9BpTH+SOXO9hwYOoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256522042"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/6] ASoC: Intel: add snd_soc_acpi_intel_rt712_vb_no_function_topology machine check function
Date: Thu, 23 Jul 2026 15:05:16 +0800
Message-ID: <20260723070521.870256-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
References: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This check function return snd_soc_acpi_intel_sdca_is_device_rt712_vb()
&& snd_soc_acpi_intel_no_function_topology() for the cases that need
check is the device is rt712 vb and no function topology.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c | 8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
index 7caabc501b16..9fdeb6ad96ac 100644
--- a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
+++ b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
@@ -53,6 +53,14 @@ bool snd_soc_acpi_intel_no_function_topology(void *arg)
 }
 EXPORT_SYMBOL_NS(snd_soc_acpi_intel_no_function_topology, "SND_SOC_ACPI_INTEL_SDCA_QUIRKS");
 
+bool snd_soc_acpi_intel_rt712_vb_no_function_topology(void *arg)
+{
+	return snd_soc_acpi_intel_sdca_is_device_rt712_vb(arg) &&
+	       snd_soc_acpi_intel_no_function_topology(arg);
+}
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_rt712_vb_no_function_topology,
+		 "SND_SOC_ACPI_INTEL_SDCA_QUIRKS");
+
 MODULE_DESCRIPTION("ASoC ACPI Intel SDCA quirks");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
index 2ea0a1881c4b..60b665ab5924 100644
--- a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
+++ b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
@@ -11,5 +11,6 @@
 
 bool snd_soc_acpi_intel_sdca_is_device_rt712_vb(void *arg);
 bool snd_soc_acpi_intel_no_function_topology(void *arg);
+bool snd_soc_acpi_intel_rt712_vb_no_function_topology(void *arg);
 
 #endif
-- 
2.43.0

