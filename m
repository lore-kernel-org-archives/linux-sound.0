Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CF743A80B
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069010; cv=none; b=q4rRAW0rKLbCbDySx22utvG9M9GBaEyiBtTZUlb+dhFhv8qxmH8jN8M96sazRQTDJQzsmz5bOA5WF9BJiB+aXkuZvt3n42jkEuU06SOOxMsyHwwtHNCbMAS0f/u6DIzxwX9hQigLP1ZTztQ7RWNykCI0fDLpjGqY4GB/Ew3Bm2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069010; c=relaxed/simple;
	bh=XiJq0A7L9MNOiZrrzDP+kimEgsBhHf+Ci2hL41h58kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkgRZh5IoXKFApkwA3DGAVK0yyoUiyHclYbpa8YfireHldApdJ2PdUXvhXh1x1jgFh+0+v5k3GWza1suyBeICaPLN+kTm3IxKTXXzFew18oI5WGmGFFBHNb5UCMSjrdyiUtZMZgfZ/ekrsVj0tos6hWq0g6lc+KBCezohRBX1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7exQRP8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7exQRP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790069009; x=1821605009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XiJq0A7L9MNOiZrrzDP+kimEgsBhHf+Ci2hL41h58kg=;
  b=j7exQRP8YXTk/4bX4PF3a8ONw13L/c/ZNZ+rLICNfMps6uDfogAt6rFX
   gkHXlIXvFF2djw+FwsGbSwDpOQtwuISrJ/8nVcoDqlcTzervWRfWxbEL/
   0H5bkalMXJ7VEK0V3yYuUJVbAEZIXgv2n7Vr2Ws8XhDfQ3ifTYCWacd/Y
   NAFnqD40376YiXOt7w9tSg9l+w2FyO+fcHz9tgzPGVzHzTbE8eEpLMVhw
   JJp+2gFSFUJ0BdaOg5nGIdnHLrGFSgp/pe2rKKO8Khj5DYQmAgbIX0t5B
   +tWuCe45yVunsBj8UIPNsfhLT9X5hMq4U51JO8hLk2xJYM1kR1AtgjliC
   A==;
X-CSE-ConnectionGUID: M0NKVrXLSF2WFslurWEheQ==
X-CSE-MsgGUID: wDEO1t8RQNiYM2UBuaYNlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89576740"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89576740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:29 -0700
X-CSE-ConnectionGUID: CKvf8d5zTH2V6bkZIIvY6Q==
X-CSE-MsgGUID: 1l7NCdvJRouM5oQtdWYxVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277837528"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/7] ALSA: intel-nhlt: lower intel_nhlt_ssp_device_type log level
Date: Tue, 22 Sep 2026 17:23:11 +0800
Message-ID: <20260922092316.2296039-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
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

