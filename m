Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8868C42E418
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 05:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141333; cv=none; b=fgniV0ZRkvpUYWfapMfO7lWgC/ALR91EEUtRssJtZJ1UHNAJI3xX+pu1HoXfODKyFKA7nYPM6LAclkN0YQry+Z0+eZGAOzmDF1lbyeZ5nJMBoBleUqUFBwMxSQmF+G1gYO+B5TK3HwD2OOObE1jA6KZbEXjDMJ9um4LCMci90Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141333; c=relaxed/simple;
	bh=XiJq0A7L9MNOiZrrzDP+kimEgsBhHf+Ci2hL41h58kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZRZtWknZuKFot56CTorz5fztqC1Aca+MylQpRPagjsuLxBj1VVYNLpiUjDoTQyezJegg1YkhIgYfz2V+PaZlt8FnZNOazjT/HLPJ62iBvpYvY2zNBRyC079JBlGJ5n2HdROGInf+fXfyN5mJAlubZPtGLzw3u0dSEjncnOwNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=keuVi1t7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="keuVi1t7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141332; x=1821677332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XiJq0A7L9MNOiZrrzDP+kimEgsBhHf+Ci2hL41h58kg=;
  b=keuVi1t7Z248GaU/CVFzQtnflzUbcsl5jhNJzb+qG4xtkZNV94Qlrhn8
   suj1/iVLW7GkfhAlxmwW3J+JWhkZwrR645/xorE/n5lr9E+ljKgdvS/Mq
   V9sl4X88c2GOiEduVc9QxQ7TXVNAaSKuCdv1cRJXkhc9HD1hxObafToL6
   qNClSt42dAEn6WKpoq2tvlI8JbK+AX8T1w5wBxLxEvaXRzCiPKSQWyphp
   V0VFrOdymA4k6P4SDPlxJaleYudOPkTzO7nqN2xpss0f8MTwcpATOu3xO
   chd30ky+PZkzeuuexw+lWmvVTAU/ZCC8+PpBryGwCtv22oAlki1WiC+hE
   w==;
X-CSE-ConnectionGUID: /qHJpSKMTQuOaoINhhOAqw==
X-CSE-MsgGUID: 9lmyhBsQTSqppbJMTc22IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90821721"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90821721"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:51 -0700
X-CSE-ConnectionGUID: wkgPmqcmSuGtF3cUiDL4ZQ==
X-CSE-MsgGUID: XUB208ijQ7Ot1Rrt8ughoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272938511"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 2/7] ALSA: intel-nhlt: lower intel_nhlt_ssp_device_type log level
Date: Wed, 23 Sep 2026 13:28:27 +0800
Message-ID: <20260923052832.2392758-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
References: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support multiple topology fragments per function, this function
could be called multiple types with different NHLT blobs from different
fragments. Downgrade the error message to debug level since the SSP
device type could be found from one of the nhlt.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/hda/core/intel-nhlt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/core/intel-nhlt.c b/sound/hda/core/intel-nhlt.c
index 6d72a871bda0..af4d469dbd76 100644
--- a/sound/hda/core/intel-nhlt.c
+++ b/sound/hda/core/intel-nhlt.c
@@ -351,7 +351,7 @@ int intel_nhlt_ssp_device_type(struct device *dev, struct nhlt_acpi_table *nhlt,
 	int i;
 
 	if (!nhlt) {
-		dev_err(dev, "%s: NHLT table is missing (query for SSP%d)\n",
+		dev_dbg(dev, "%s: NHLT table is missing (query for SSP%d)\n",
 			__func__, virtual_bus_id);
 		return -EINVAL;
 	}
@@ -369,7 +369,7 @@ int intel_nhlt_ssp_device_type(struct device *dev, struct nhlt_acpi_table *nhlt,
 		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
 	}
 
-	dev_err(dev, "%s: No match for SSP%d in NHLT table\n", __func__,
+	dev_dbg(dev, "%s: No match for SSP%d in NHLT table\n", __func__,
 		virtual_bus_id);
 
 	dev_dbg(dev, "Available endpoints:\n");
-- 
2.43.0

