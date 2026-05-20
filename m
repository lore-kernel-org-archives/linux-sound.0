Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072B346A0A
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 06:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257514; cv=none; b=tJfbG2rhbKYuL9yJps/H0MjSESf4GZQlqa8lvENo+40IoGP9rqpo6uwsXUYaC0IcLNotIj4gU37O1eLx7G2lThbWa6CwDQKeYuB/MkBarRhWrl8eWOtZe4xrjlCaRB+3Um7X8gazeY9wuO98lz8NGXvZSCURYUTwHKU29N0ysOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257514; c=relaxed/simple;
	bh=9d7zgUQe30Pmb4TFaSaqsi1cer/kTOpI1XPMdf4W790=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r6uW/f+ltCFeog97z99F6G9njBnITR3QD8YJKeYmjmPuN/jbEms6KT0UY2QSdyrX1f6UboBTimbhzzoL9YPiwy05EmGvXnmeQoq27++eTezaJ0HRqMVY2NqtGKhcgV5syVOXmtYJfTg5HXGkxEM+OxzQbkhuhRVlSqA9Li3ZZJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lrs2DxXL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lrs2DxXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779257513; x=1810793513;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9d7zgUQe30Pmb4TFaSaqsi1cer/kTOpI1XPMdf4W790=;
  b=Lrs2DxXLB2xDmte3ZLbkf5OQ8jOuglks1TkaPc7PcZNrHC89t7Kd4vTe
   wvZTdn77YObAkDRHp6m/3v5GQLkdDnYNoxl7ln/HTGE2j0ALKGdkkMcO0
   kGUnYp9iHU83jQN2FarjQS7uP5PWG+J1khrCG9sZoVDfEBXr4eYcUGer/
   r0zs63JAYIBvPfqjcGfYtfyeupMzcGxfjKz1aey7NwvZEUANqM1Zbul5d
   dMMGOwD8C/7zdf78+x8zXkyLt9GOwt1ca7/FYpIrj1h9TXHzU2kh5k3Xw
   csBua4foeL+Gyid/FmlzunrvMvR4YuPxkeCRc+/EEwd/yC9jnXtTL/PKN
   A==;
X-CSE-ConnectionGUID: w+WfmriHQT2UtTOE30ziZw==
X-CSE-MsgGUID: O9YZz4LfQomfwGj/Dc5LGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="105606164"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="105606164"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:11:53 -0700
X-CSE-ConnectionGUID: KeWlnFqUTEeLhAS6IkGHOw==
X-CSE-MsgGUID: xgiytHJIRjGY7ufZHf9asw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="278145661"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:11:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in NVL match table.
Date: Wed, 20 May 2026 14:11:43 +0800
Message-ID: <20260520061143.2024963-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding ES83x6 I2S codec support for NVL platforms and entry in match table.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
index b8695d47e55b..217272260803 100644
--- a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
@@ -10,7 +10,20 @@
 #include <sound/soc-acpi-intel-match.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
+static const struct snd_soc_acpi_codecs nvl_essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_machines[] = {
+	{
+		.comp_ids = &nvl_essx_83x6,
+		.drv_name = "sof-essx8336",
+		.sof_tplg_filename = "sof-nvl-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_nvl_machines);
-- 
2.43.0

