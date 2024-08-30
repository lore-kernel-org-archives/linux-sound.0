Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3667516726E
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007284; cv=none; b=QX9SjDw97PQZlFPsvPgKeoRyvVtKTY4GL+T0Q3BEYfikzS1fZWYmZ9JfJmXu8i5n8xTc6bRKc36ku3GrOS0UOVSMQP2wardBiaMoHXFzo3cBFso9V97HE4o9rXbknrj9UNvJ3uWQKC6FZPzGsy7Yeg9522CPfusR/HDGEKcn93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007284; c=relaxed/simple;
	bh=mDY5o8AD6W/04rsJCL84/cv/LReCvRURM8YdB+lYQd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/i2WSkFtcXa2mM23QiAV1kO17QnP3uH5qpeorwPdKgCtOnNHGFJCE3ELrPBoUGnCVyVWgs5xBMI53Zj7g1k6Q8RIpXq92gpbxXcXuhA++gUYVsHCK0F4rSeJBhzwp/pAVO+rR5fdXTgTKmKmNNVuPJ2xUy985UifyyfOk3NRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bzo//C6i; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bzo//C6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725007283; x=1756543283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mDY5o8AD6W/04rsJCL84/cv/LReCvRURM8YdB+lYQd8=;
  b=Bzo//C6iI+7vYzwUElKBBNc6UAmOE3DCQZtjZ/IMMTj9zq0hDFoCZAa3
   XOvwWaV4YmLikFE7KSklVXYTGkStdot/CgsSQEce+1nVrR5xNxCd9TkWN
   u0/2Pn2yOA8ZuZZsR6THKEapG4UNnVYQUannqi5rvM1z8IXOI2MAd5taH
   nx0eNh/bgqLDePRtuFARJUh9PK+BSxDt/+D4wXxpnqyUZwWJxKF7w+lE8
   gv3Wg6MG2pZ5j480Gm9+6vIvt8zD5v5B51EmaJJ2g/xXIQwR3KRS7i/1J
   aP/0B9ei2+nyqXLRYGeqID4renHU1dDnnWcEdC1SCqcY+BvS+Gv5uHLgs
   Q==;
X-CSE-ConnectionGUID: idOAVmdXRV+caxuaVmpMZg==
X-CSE-MsgGUID: t4kCfse3RGKgCzCOTjRn/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26536442"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="26536442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:23 -0700
X-CSE-ConnectionGUID: aa97UwNhS7izX0CP8SrUBA==
X-CSE-MsgGUID: eugAs43wSfuziTvuem+Wqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="94665921"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.247.118.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/4] ALSA/hda: intel-sdw-acpi: fetch fwnode once in sdw_intel_scan_controller()
Date: Fri, 30 Aug 2024 16:41:03 +0800
Message-ID: <20240830084105.154062-3-yung-chuan.liao@linux.intel.com>
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

Optimize a bit by using an intermediate 'fwnode' variable.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 770dabe0124f..7a3735e94545 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -56,15 +56,17 @@ static int
 sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 {
 	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
+	struct fwnode_handle *fwnode;
 	u8 count, i;
 	int ret;
 
 	if (!adev)
 		return -EINVAL;
 
+	fwnode = acpi_fwnode_handle(adev);
+
 	/* Found controller, find links supported */
-	ret = fwnode_property_read_u8_array(acpi_fwnode_handle(adev),
-					    "mipi-sdw-master-count", &count, 1);
+	ret = fwnode_property_read_u8_array(fwnode, "mipi-sdw-master-count", &count, 1);
 
 	/*
 	 * In theory we could check the number of links supported in
@@ -107,7 +109,7 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 			continue;
 		}
 
-		if (!is_link_enabled(acpi_fwnode_handle(adev), i)) {
+		if (!is_link_enabled(fwnode, i)) {
 			dev_dbg(&adev->dev,
 				"Link %d not selected in firmware\n", i);
 			continue;
-- 
2.43.0

