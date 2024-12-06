Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951BF1DE3C5
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471962; cv=none; b=EHTmG6oiKDEhvLpdRTfUXNovxxep6QOxZ+HJkkgdff2Jvd2G0EMtcOZpBZjF8Ye9pfTI3a/jCZDaP2GIBF2IPYrEpQgheB+xTGPEUDTRpvspiNQd2Fn9Xd/K2cLJFbWI3SAxV9Dgdd376qEghINYtIlbf1o26ShprW5GMCkLa+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471962; c=relaxed/simple;
	bh=o3G5SWn26jfuxbGnjqSyks1kF98J9JZ2595C2F0Jl7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tnz+ZZen4ZD73+NCHqtmUXh+enPgufyEP1LMVbo1XmLrJfUigaVkUEeRn+XKRtvAN8TckXeCynhOPaj/elqcIAPuRGhRTP3kE8RQTYQs33poPn778C1isT8XVqeR+QfMHQScqKY/riM/5a0CmbRVrO51366poXiPngC/7aEUZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kihdNdzX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kihdNdzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471961; x=1765007961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o3G5SWn26jfuxbGnjqSyks1kF98J9JZ2595C2F0Jl7E=;
  b=kihdNdzXn5yzYRzRSKihtSIq4OsZw/fl5D8uxohHid5kfBRzKuOgnnCE
   ATNW7A+Rh4zzOWlN9lpBdgDrDYzAZHXLxNFKOh4efJiDOGk8bibmYuKRn
   HLZXfjAk6eoQ4RR+gnWgO9VMMS/q2r7OToQp18c2H/CpAIoQcHRx6uc8U
   hhrTFzkleUWp26gfBgRUce5hOgolz35irlFhb6+MdtwUSg2WvVOsrrt9w
   fptWLIpnvn8QgEM1h3FjTenkrkkvQ/2SqjVIw2i2iEWdf+F+hLa4pUkkM
   T1AooKRh2nwDkQWjRUUgyb2g4Ym444meYyNToBmv+qBRuqJC5iwKTZ9Kr
   Q==;
X-CSE-ConnectionGUID: DUqO4LjYSIqy1hxm5Yx72w==
X-CSE-MsgGUID: U6XRqtCMRsCShFNT+4siXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192790"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:21 -0800
X-CSE-ConnectionGUID: 1gt6WYnxTTuDJjhOf4F/6A==
X-CSE-MsgGUID: ucxkhG76SlWM8F73PfUZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144412"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:20 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 05/10] ASoC: Intel: sof_sdw: Add a dev_dbg message for the SOC_SDW_CODEC_MIC quirk
Date: Fri,  6 Dec 2024 15:58:58 +0800
Message-ID: <20241206075903.195730-6-yung-chuan.liao@linux.intel.com>
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

Add debug message when SOC_SDW_CODEC_MIC is enabled (which informs the
machine driver to not bind in the cs42l43 microphone DAI link).

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 70a1d1620e06..0652d17a81dd 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -44,6 +44,8 @@ static void log_quirks(struct device *dev)
 		dev_dbg(dev, "quirk SOC_SDW_CODEC_SPKR enabled\n");
 	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS)
 		dev_dbg(dev, "quirk SOC_SDW_SIDECAR_AMPS enabled\n");
+	if (sof_sdw_quirk & SOC_SDW_CODEC_MIC)
+		dev_dbg(dev, "quirk SOC_SDW_CODEC_MIC enabled\n");
 }
 
 static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
-- 
2.43.0

