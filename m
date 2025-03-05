Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03F243955
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182927; cv=none; b=U5O+HKR807U4mEUPe1vQbHDCfEnvL1y+14IcokmZpdDwcf25JpWGY9rF2ulyop+IETUWKvD73NzTJXRrcIjtG5p4OZQKaLTQhhB+uEvA/4peGLu6i47+GSfbbHfRDBjr1sBGdZHyep3Me9b+J+ZPae2juJD3O0eUGlMXdmrBdjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182927; c=relaxed/simple;
	bh=638w5IPIpD6OGjSdlIrWyufplbUK16b32sF0NpG4zJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgOAJ7DHlui3W7mwHXQ3CoJEhtjNCGuWYqDxEYUzvr7Nn8pkIcdo1UOxaAgQ1X8mzXnPC4YaHElspqamrv/cUiAnZzIkS6oyxWFE/+iYK+yGzsQVzuJIlcNz1plDe9hmb6hx6rbWiytGICpCgejHriXMTGWOiGJ3cat+hBWGads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMLEkecG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMLEkecG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182925; x=1772718925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=638w5IPIpD6OGjSdlIrWyufplbUK16b32sF0NpG4zJY=;
  b=IMLEkecGZYZisHFjj1jrwOp/5cWQQQArZ+POIRnXd10oMxfnDF7+JxtY
   WHc/N/RRAG5MEhNZH/q61dp6foiUg5dvluGmqPGGEuPh1XO0nhbOUV93j
   lom2wI+N5YOcfkRLMq5VWyhC2SPN4VMUgWC4y+pZEazWbS2leF+u1/JIS
   M8q7Lp5mYgmY+bnJJI4VsNkGONarbqe8UYDs0bbYuXiTJ//Fqm9ARxYUB
   nBQsqQC4vyOdK+la8gdYFfX+9zaJXruiUTRAlPJnUTWRXb75Hu8SIjQPH
   Rme0Wnre1uQF+Y9XOhwAc7T7ta4KzSalLhxarCMgKzFHwnyLgUpkUSS6T
   A==;
X-CSE-ConnectionGUID: 0bV4jOF0RA29QTUfMXDCQA==
X-CSE-MsgGUID: mxn+zquKQ7u6N+YCMF4pkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558099"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558099"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:25 -0800
X-CSE-ConnectionGUID: Kh6Iga9RRHmofFS3Hiulmw==
X-CSE-MsgGUID: kh7AvoOkRdGr5lIRfs8a6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847169"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:22 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 6/9] ASoC: Intel: soc-acpi-intel-lnl-match: add sdw multi function mockup codec
Date: Wed,  5 Mar 2025 21:54:40 +0800
Message-ID: <20250305135443.201884-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
References: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a SoundWire multi function mockup codec support.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 0b4a9c27c47e..1e24e969ad15 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -552,6 +552,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = sdw_mockup_multi_func,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt722-l0.tplg", /* Reuse the existing tplg file */
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = lnl_3_in_1_sdca,
-- 
2.43.0

