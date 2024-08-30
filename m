Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B127916726E
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007282; cv=none; b=dURZSuFcNPGYRtQp75toxap7LRIWMVaCozCF3n4luyNNKnu5oQioZDcKjooD3OqR+hfONhTy2Wpu2rMPc7lJEe9OWOBmKCzDmCzNbjT0sNvx4hIiUPTCdx/RbcOhfzrV/tmeh1E1KvVYI0N7tSfnPSvy7TOPMhpQWrPdcC4v+e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007282; c=relaxed/simple;
	bh=NVPZwxuSH44cdCkCcMlfMF0JRyvUIfR45Q3Tn/DYLPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8J8wr9q+qL662xhi2Q+bMV9tRPgHLhWPtLMpomSfaYLwrCiV5yUa4rO8JoF0UfCcXk0ySu5iE8kr6bkuAdAUBMctnsNjAdOJ3ofVKXLf+dRczGMqOEbwNM79dYV2SXHp4tHApRRsjjVPXoCLtChZ1ZBZPyQ3tHQCnCPyz/SmEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVGmGpc7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVGmGpc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725007281; x=1756543281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NVPZwxuSH44cdCkCcMlfMF0JRyvUIfR45Q3Tn/DYLPA=;
  b=SVGmGpc7Q7LBzhJDxRUQKPUFgZVtm70N79QG8lh/6VBJ75UC+hn+ptpR
   N+EDbN1iZxb1D5s3vJsrV3A54NjvWRUiWKgkenrgpp4qGeiKCz11g2nP/
   Y7Qk4BbxE7QIY3mUx4+S/87w87iTsDs5PnweNKbp1eHziECrEVoi8neRF
   cTPxLApEmV579UKa1mEh0xiS/v0rmuGfxolmS5Id9P+L/z7OY8BfW/3dK
   ufCBloppI4Rm3R97kGeEB563yiSZx11EXis3Vl8FcCkjO3fVmGgNPfjM4
   5tqia6sL6yCmIc9LTgRzyd8Pz7mCnNGNCwWkvZVKma/0zmgPZGQ8EKk2c
   Q==;
X-CSE-ConnectionGUID: HpsCQpdVS46KeO5sBiGVCw==
X-CSE-MsgGUID: n0gvURZEQzu41NpBVo7HXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26536436"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="26536436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:20 -0700
X-CSE-ConnectionGUID: jlPrQclVRouStpUNIzrRLg==
X-CSE-MsgGUID: I1KgNAXXSqWFhwcwZrXe1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="94665912"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.247.118.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/4] ALSA/hda: intel-sdw-acpi: cleanup sdw_intel_scan_controller
Date: Fri, 30 Aug 2024 16:41:02 +0800
Message-ID: <20240830084105.154062-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
References: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
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

