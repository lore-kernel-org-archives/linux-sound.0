Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F297F37F0E4
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 06:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892243; cv=none; b=PJ4p8ca86vQLN1FWPh0MneLvoJIEADWHxzWQf3975p8MldCJpxL1TcQtPeFDHFYJigJabmQEbUSc6V3X8aYvmFB7KbE4NHLqstXRcivOxZO0Dy26CF3yh0sFW2txF09pcBVUn/pMszQVZGrm1uOAW+72HzYdN6zfxvFd6P2dMg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892243; c=relaxed/simple;
	bh=hs2fOdjvO2Ku4Ab2JPK/Bjx7BtcuRVXmm15okOpPefQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TpIc3GPvrrX8l5kLBSYmp0CkdHds0cMJeq0wBw4u+adHCb1y4MqWMRbJSi2QnMTvn1RGsw+iYwaAvuUEFvrP3+268LWH5cD7QijijMkFY40RPamhTIoHYMT7QSOx1wYOl0gnlBfFUHbNjXjoaJdXs+7FsAkqPU7JWSnoDtDszG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kn0Nup7k; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kn0Nup7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768892238; x=1800428238;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hs2fOdjvO2Ku4Ab2JPK/Bjx7BtcuRVXmm15okOpPefQ=;
  b=kn0Nup7ktnhfXxN9yitCe/nh8FiKmKFm7CsT2L/JvcgbjLlbmC6WsC58
   Ir7/zZGnpbNLSIulsLhjk/J0diCiPTkQyibyw+vSvflNH4+zDjGKYtw4K
   cU4zr5M0sPo59TrZPUZS1Yhf6MRE0YiwpczPHwf/NxzkfYM2shwOy8Dod
   oVqncCXw+aRrirQyG1FN25Fahlhybp0N3uFx8Ly3fTBac6ZbaYT6S/AkX
   UFD8S4dje3L2cOsLDYMdXwQzOPVzbybanQxsI+Qu1BXg+rixhzez4o/uk
   PCE5hbnPZH7+6DbrtZ1hJF+fKMGQ4jBDQRIYnKng39QCdjHJ+CKHmc/Zg
   A==;
X-CSE-ConnectionGUID: P095rRFRQ82RLredFw2cvg==
X-CSE-MsgGUID: Ku59cJFbQ8Kd8JHI7iDr6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73948969"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="73948969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 22:57:12 -0800
X-CSE-ConnectionGUID: KDvwK9L0QaepiUH9iCoHuA==
X-CSE-MsgGUID: Ic+gp/TzTIyDNSgw1cxbng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206391109"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 22:57:09 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: sdw_utils: remove dai registered check
Date: Tue, 20 Jan 2026 14:56:58 +0800
Message-ID: <20260120065658.1806027-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checking for a registered DAI for non-existing endpoints causes the
following error. The driver will always return -EPROBE_DEFER if the
codec driver doesn't register the DAI of the unexist endpoint.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index e4ce952e56aa..477eba80e90a 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1394,29 +1394,14 @@ static int is_sdca_endpoint_present(struct device *dev,
 	const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[adr_index];
 	const struct snd_soc_acpi_endpoint *adr_end;
 	const struct asoc_sdw_dai_info *dai_info;
-	struct snd_soc_dai_link_component *dlc;
-	struct snd_soc_dai *codec_dai;
 	struct sdw_slave *slave;
 	struct device *sdw_dev;
 	const char *sdw_codec_name;
 	int ret, i;
 
-	dlc = kzalloc(sizeof(*dlc), GFP_KERNEL);
-	if (!dlc)
-		return -ENOMEM;
-
 	adr_end = &adr_dev->endpoints[end_index];
 	dai_info = &codec_info->dais[adr_end->num];
 
-	dlc->dai_name = dai_info->dai_name;
-	codec_dai = snd_soc_find_dai_with_mutex(dlc);
-	if (!codec_dai) {
-		dev_warn(dev, "codec dai %s not registered yet\n", dlc->dai_name);
-		kfree(dlc);
-		return -EPROBE_DEFER;
-	}
-	kfree(dlc);
-
 	sdw_codec_name = _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
 	if (!sdw_codec_name)
 		return -ENOMEM;
-- 
2.43.0

