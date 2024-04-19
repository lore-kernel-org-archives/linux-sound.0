Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A07865194
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713516110; cv=none; b=qciric7w7alCxF9eFZarpMwWtDhyPyuYQk301AQHSY/l8OrS4TlE/jLvEf0ZQ2sB7qGukGRwj+0DK//Cl2sqs4E8wUu3OtilRw/yISZ7KbrGrdOZ5IsNgFq6f9aq1MBRivfErpVHN++RaKCHrzh5cjfUee+z9NpgG7m+ki5/Y0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713516110; c=relaxed/simple;
	bh=4G3vxx+BVYU/F3fALZo8cptAG+2Ub3U6wxF3IBeuTRA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJ03AAdwthoEr7vatFJ++YJvsdn0FawHfNt+ggikiVRVVY2FG75rHYJl2o2cb3Dg4Z4mZJIrUwMObQNiFclmSB1o/23oU2ylw+CymEMb+8e40UW/PxxMbwHTG6reP6e77jlhNy2IsfVBaN5ulYDJUocS+mtE0B1Ri98JuL3FOog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4zrbhd7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4zrbhd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516109; x=1745052109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4G3vxx+BVYU/F3fALZo8cptAG+2Ub3U6wxF3IBeuTRA=;
  b=g4zrbhd7gJ5JGcO1AT4it6u/SH/DhJGbD+d/jIsKrWYSr1mQRc4kL/uG
   mcBQcUSSkZQTuLVsQ4XuEMJDuN4lFg7c9BqyE524WVtyGU2fQ8PC75HNW
   n1yKWSc9/VWRZEdbiBcuBhxCkCHSuL/i6GEW8aKTM2/VH1tlc4oqwMmLi
   32B86XwOpq8+TLQZSQm3JOfsWRIcHtHKG7D2J1qA9QcS6vVysyi9Keh2E
   d6sWUc/kDffKvWSac2CvMGLWQCOB/9QILKe4Z5G3sTEZpfqZxCXeDwbCL
   6ZI7qWE2uGsbz91TJdssiGmtUTpFsgiPQyh0vyLYOJ2rw4Hj90nEppgUK
   w==;
X-CSE-ConnectionGUID: gvVJfMm0TLq9iH/incGvGg==
X-CSE-MsgGUID: aKGZK5XlTbi4cVIFq9JqaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9233741"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9233741"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 01:41:49 -0700
X-CSE-ConnectionGUID: HNjlznS0RtSPs0ZmRGaBQw==
X-CSE-MsgGUID: kW2KUOKTTaqGGhmDPyJsUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23353166"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2024 01:41:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	rafael@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
Date: Fri, 19 Apr 2024 10:43:06 +0200
Message-Id: <20240419084307.2718881-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419084307.2718881-1-cezary.rojewski@intel.com>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Now that NHLT support in ACPI framework was introduced, migrate
intel-dsp-config driver to new API.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/Kconfig            |  1 +
 sound/hda/intel-dsp-config.c | 16 +++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 741179ccbd4e..e2ac247fc1d4 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -42,6 +42,7 @@ config SND_INTEL_NHLT
 
 config SND_INTEL_DSP_CONFIG
 	tristate
+	select ACPI_NHLT if ACPI
 	select SND_INTEL_NHLT if ACPI
 	select SND_INTEL_SOUNDWIRE_ACPI if ACPI
 	# this config should be selected only for Intel DSP platforms.
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 6a384b922e4f..ea050805c20f 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -13,6 +13,8 @@
 #include <sound/intel-nhlt.h>
 #include <sound/soc-acpi.h>
 
+#include <acpi/nhlt.h>
+
 static int dsp_driver;
 
 module_param(dsp_driver, int, 0444);
@@ -570,15 +572,15 @@ static const struct config_entry *snd_intel_dsp_find_config
 
 static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
 {
-	struct nhlt_acpi_table *nhlt;
 	int ret = 0;
 
-	nhlt = intel_nhlt_init(&pci->dev);
-	if (nhlt) {
-		if (intel_nhlt_has_endpoint_type(nhlt, NHLT_LINK_DMIC))
-			ret = 1;
-		intel_nhlt_free(nhlt);
-	}
+	acpi_nhlt_get_gbl_table();
+
+	if (acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, -1, -1))
+		ret = 1;
+
+	acpi_nhlt_put_gbl_table();
+
 	return ret;
 }
 
-- 
2.25.1

