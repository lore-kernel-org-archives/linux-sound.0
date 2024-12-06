Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A01DD88F
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471961; cv=none; b=XVs/00oLvpi2b+KeCsrut5N5UsIClWEXd3jC8LM+caGFLF/RNayj/gq7o39aCW/ujNGOrW9U7Ofu6D6IFVPWGLM5L3layfvr7Um/AZxtie/5b+pVHdAsntWWCw1s1TgNPxYBZJB/dGtbTHlFkWmpnkJRNP1DQfrqnilcUOX6ceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471961; c=relaxed/simple;
	bh=tWlEkTC7hVmXFjXHGZAXfarADBOlET5wmKiHLfXaNEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwSAMsjR30SlFdEOO1rMljBTIf7nmLBVP43xnEFCi4Nyg5/VC9iUprShdSPwgk5urwV+pF87+teW2y/rqUjr4DOZwHy39LAz3A9L1AHEUuVpmpOh+Dnr8mqgpGqfQDDf3+T2XFMJ1SRnYlNtBqSIRFfmL7pXCSy69vPq4RhHaT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dd1JrZdm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dd1JrZdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471960; x=1765007960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tWlEkTC7hVmXFjXHGZAXfarADBOlET5wmKiHLfXaNEU=;
  b=dd1JrZdmOx7OKvULSw19FCftX0TcmYwjLbc4XvKoKUvL7tbUJvDycw9D
   KadwdVYXoIN8tQhGciltC5wsoWr+y7Q1aBmX1lZlhQHnTjy18XomQCIl4
   tZ/Dt8LAwbzwKV5pD8u2Ti4W4FDVL7Iem47MuwLiCJMxlFdvlfM8VsoBQ
   XAiwWyfw7UQBa8rwbbvEwHXdlfMz3Vd30d9o2fB1ZRAq/v3kEBoXFJClJ
   ux5MZcq5MZROUB0zClw0aHmnQ3jVYlibrZjyzMSVzXVeiKdvTZgL/qvQX
   mWyAgn3mlgnzKZY3b6mz0FArX2V4+mmGVms/sSK8FO9WyNqYuep2hUQLG
   Q==;
X-CSE-ConnectionGUID: uMfODzzTStmJGIZQ6wBY8w==
X-CSE-MsgGUID: OCjQs+8nT3O/8bGHcbZjkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192786"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192786"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:20 -0800
X-CSE-ConnectionGUID: +jMIpKSsRYy3k9miTdZSsg==
X-CSE-MsgGUID: J57B39YlQzKAN8XMAi1nrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144404"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:18 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 04/10] ASoC: Intel: sof_sdw: Correct quirk for Lenovo Yoga Slim 7
Date: Fri,  6 Dec 2024 15:58:57 +0800
Message-ID: <20241206075903.195730-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simon Trimmer <simont@opensource.cirrus.com>

In addition to changing the DMI match to examine the product name rather
than the SKU, this adds the quirk to inform the machine driver to not
bind in the cs42l43 microphone DAI link.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8b220df8ebc1..70a1d1620e06 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -626,9 +626,10 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "380E")
+			DMI_MATCH(DMI_PRODUCT_NAME, "83HM")
 		},
-		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS |
+					SOC_SDW_CODEC_MIC),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

