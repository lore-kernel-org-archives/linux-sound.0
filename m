Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E6A1BC9F9
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766391; cv=none; b=GGjPL9rM2SA4U4ATMTz9PfkV4a4vMmN+z7EOkf0RQbJukNs5S1t1FS31u0kKlqfNhh2FFTsWiiXb4lmJHxYmSgw0u/JmeBam8wTVRiI98YHYg+J7NTdGrAoHcUBfZh8FTeZSNYR1BZWiwFRNt5tW8pJ70iDFqx/mQRnb226IcXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766391; c=relaxed/simple;
	bh=NVPZwxuSH44cdCkCcMlfMF0JRyvUIfR45Q3Tn/DYLPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqOk+Zz347Kf3UwlI9tvwWPpG9wGw9ptF1X4AstPa/mcZ6JCyZJDUyNpAYQX+yTM2Wg+qv1MmlLn013paew7KArWTSaM1j+JIYyIeCAUM27sRa0UseoNpVsayAigf09ZiXY2n9D/OWbMPQ/xKkyaQBA+s39Um6sIQi9idCGAkhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULG/Ph0A; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULG/Ph0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727766390; x=1759302390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NVPZwxuSH44cdCkCcMlfMF0JRyvUIfR45Q3Tn/DYLPA=;
  b=ULG/Ph0ADf1ZSGi1jo+o93Tn0x9PjPlDreGHZVALkhC7Bq2gEX1NLEVY
   mNRBtPTvRweJTJXkPGr3KZ1v2BFNs5/K5DEOzhduahmu44TKswDzTnL+p
   UytZHbUhCwRMwUa6cRqy2Y7q/S5cHLuqTsoiaLQ49RwLuvQqQfCg7lr7P
   cEbtYlGdsoJGaLMz7lT7dORLeAhmHC0Ev8lWS0MpXCK+NeWG22iKukKxE
   OIeeSpiMvZjraRv7gnz6c24brurNq+C7c5hnNHiHN2CyWtiWYfMxOtjwe
   JLUSEyaE2mK/plfxxO9Q8wUyDKj6K7W9bLaMVGPucTHwNEHKd7sXV5NMR
   g==;
X-CSE-ConnectionGUID: sGYmj40FRhKRgNyyjoKEYg==
X-CSE-MsgGUID: hbkr+uCESm2OlglzwhLWHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37556040"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37556040"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:29 -0700
X-CSE-ConnectionGUID: Jm5Y0HWxQp+LiyRFOBPUSQ==
X-CSE-MsgGUID: svukjIzPQgydtUDC+nXfvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78096803"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.243])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH RESEND 1/4] ALSA/hda: intel-sdw-acpi: cleanup sdw_intel_scan_controller
Date: Tue,  1 Oct 2024 15:06:08 +0800
Message-ID: <20241001070611.63288-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
References: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Remove unnecessary initialization and un-shadow return code.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 04d6b6beabca..770dabe0124f 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -63,7 +63,6 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 		return -EINVAL;
 
 	/* Found controller, find links supported */
-	count = 0;
 	ret = fwnode_property_read_u8_array(acpi_fwnode_handle(adev),
 					    "mipi-sdw-master-count", &count, 1);
 
@@ -82,7 +81,7 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 	if (ret) {
 		dev_err(&adev->dev,
 			"Failed to read mipi-sdw-master-count: %d\n", ret);
-		return -EINVAL;
+		return ret;
 	}
 
 	/* Check count is within bounds */
-- 
2.43.0

