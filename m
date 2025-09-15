Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D6143756
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 02:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757904546; cv=none; b=PsnB7rOUYWFTm8R9uA7T8S8F/9xCNcakptsuklNcRxnxEnavGKSgCOuzdrEqUgx74X8pHnfNMylwhXBlCHayIsOxM9WXsMpqZhng1T/kfjrJ5hADj5PpN6cx30UWySEHH0fFhlkp+eetAqnr0x/NQpi/MW4hdCbAZmcqBAXgWVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757904546; c=relaxed/simple;
	bh=QVRlrQi7efUNQH1dFvPl0sCLnDMidmy3kClde40Yo2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yi/DD9prD1EVgTpXdBfGNaFuHRrwuY4BBSPHaV832PCrsgbbBlnXDkiNNiYybeIAy+iLfNN4YuzCHqAKm+qlVk4AumeAui4xpUoZGWejbiZ62zTphdmaDyx/WYp7HBFW8qQjsfzzV6wzglw8K0mzP5p6Ebdc3//7eV+UyICvLHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Li6vTjPN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Li6vTjPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757904544; x=1789440544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QVRlrQi7efUNQH1dFvPl0sCLnDMidmy3kClde40Yo2Y=;
  b=Li6vTjPNGNyPycInmxWRlT+ZF/h5lzK1I25bX08rdXUL16LOB7L7CYRi
   0JqFLJeoQXBzp3Cmf6lYf17RTnwh+j5nnFQxClnR6vjfNXlnU0Jpwuw16
   JNxoE3OCOpt/4xdYt/a3DIHg5Zk5NB7Hi6Lc0k66kDtKGJ45Ke0xNnFbE
   KuBecotwPiiKvj0eVLN7tufHprzpw643l2InrfMG8W0c1sfF48ppZi0O7
   DWHgzfRXjC31wjjUUGU3IWh31MQWPfblAMqED/kGTcUnT+BLH0EyZ2x2n
   /Gz/uSmcf/YZVDE95rPzpGh4S5+zLxyXKrhVEK4X+191ZldCqsDnQlOz/
   w==;
X-CSE-ConnectionGUID: 6B14ZfVUTOqzxC3hU9HS4A==
X-CSE-MsgGUID: LlJo1K1qT2e3DHVVBVOYCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="47719672"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="47719672"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 19:49:04 -0700
X-CSE-ConnectionGUID: kopVPvY3QwidGJyfZBiK8w==
X-CSE-MsgGUID: Bw/iYCqqSi+HpdH0nrRddA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="173786839"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 19:49:02 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: hda-sdw-bpt: set persistent_buffer false
Date: Mon, 15 Sep 2025 10:48:53 +0800
Message-ID: <20250915024853.1153518-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The persistent_buffer agreement is false when hda_cl_prepare() is
called. We should use the same value when hda_cl_cleanup() is called.

Fixes: 5d5cb86fb46ea ("ASoC: SOF: Intel: hda-sdw-bpt: add helpers for SoundWire BPT DMA")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
 sound/soc/sof/intel/hda-sdw-bpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-sdw-bpt.c b/sound/soc/sof/intel/hda-sdw-bpt.c
index 1327f1cad0bc..ff5abccf0d88 100644
--- a/sound/soc/sof/intel/hda-sdw-bpt.c
+++ b/sound/soc/sof/intel/hda-sdw-bpt.c
@@ -150,7 +150,7 @@ static int hda_sdw_bpt_dma_deprepare(struct device *dev, struct hdac_ext_stream
 	u32 mask;
 	int ret;
 
-	ret = hda_cl_cleanup(sdev->dev, dmab_bdl, true, sdw_bpt_stream);
+	ret = hda_cl_cleanup(sdev->dev, dmab_bdl, false, sdw_bpt_stream);
 	if (ret < 0) {
 		dev_err(sdev->dev, "%s: SDW BPT DMA cleanup failed\n",
 			__func__);
-- 
2.43.0

