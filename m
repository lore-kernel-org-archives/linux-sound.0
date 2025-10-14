Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF746296BDB
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426042; cv=none; b=A9s+nmwcY6J3P/LjaTYkXtFYSbfbKFZ/nKd6ne0MaocU9CEQHmI+dvLyLpN1XLGqcmBMRqQZVdvDU26GaaOrvW7ZFCsuv49iBZRNBDwpa+M4wsHku7MFlbyF6WYQiA/+g+n256ZEmPre6hDPXL8amintbHPrDn8L6ImzT17wSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426042; c=relaxed/simple;
	bh=uiyimQJZobn7sm+b77vVq+eDh5LZaXZcheJYoiftx6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XuYScn4u64QiiVRe749uZSluk1e+fz8IpBgeRzJeZq0b9g/m+OX0xEDvjhQSc7kCxFt+KIHcRT3XzoCuKBJNWpOdOvG31+Fy906MsiyDOsZ01UI9oBlz93bD8Oe6JuBnU1VGV6dSqxOTAJj2y+J2lhBf8/u1jcXgX2M/pCIp5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jL3QgpSw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jL3QgpSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426040; x=1791962040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uiyimQJZobn7sm+b77vVq+eDh5LZaXZcheJYoiftx6U=;
  b=jL3QgpSwXVAEee5NSF2CF42U0zjXAf48060tzbyIUTaK13WImmhGiz2F
   zlUmMPV5FHVWEbQc8lIpLW3o4zi/qpUj3wz7on21LPdIGnB78CavyI7PI
   V5e7s/LCJtq+E+ARFG7yQfL5EBfC5+KXWkoxKdbh6RuchF8ZThA+B3Idr
   837sZjnc5sQFwScovjXL38YHCAVgtJZuAnqOBEuDZfbbdchs9RH/EGJ4N
   EKbD6k0KmxHr49/jfq/TAnT8tirwIYgGIyMk/wX6r8+eBuly7mXRwb6es
   /CLHaLI5qmE09+I6389TTbkyony1VSlNuT2L3q3EI6dDYxpkFnz2fvXDB
   w==;
X-CSE-ConnectionGUID: HPX/R355Tgmdro7Y+zkQZw==
X-CSE-MsgGUID: VxT1HMJfRBePXybBHfPwNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233689"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:00 -0700
X-CSE-ConnectionGUID: eUJfEAOxSEet5E4ebfTYpQ==
X-CSE-MsgGUID: lCkuO3JYSaO/7t8RGkK//A==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 5/9] ASoC: soc_sdw_utils: export asoc_sdw_get_dai_type
Date: Tue, 14 Oct 2025 15:13:31 +0800
Message-ID: <20251014071335.3844631-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
References: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asoc_sdw_get_dai_type() is quite useful to convert SDCA function types
to SDW DAI types. It can be used by other drivers.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       | 1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index e289b453baba..76c64c5245d4 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -169,6 +169,7 @@ int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *
 
 struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks,
 					       const struct snd_soc_acpi_endpoint *new);
+int asoc_sdw_get_dai_type(u32 type);
 
 int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				 struct asoc_sdw_dailink *soc_dais,
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index d2db597f84c0..b75cb5c535d1 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1241,7 +1241,7 @@ struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks
 }
 EXPORT_SYMBOL_NS(asoc_sdw_find_dailink, "SND_SOC_SDW_UTILS");
 
-static int asoc_sdw_get_dai_type(u32 type)
+int asoc_sdw_get_dai_type(u32 type)
 {
 	switch (type) {
 	case SDCA_FUNCTION_TYPE_SMART_AMP:
@@ -1259,6 +1259,7 @@ static int asoc_sdw_get_dai_type(u32 type)
 		return -EINVAL;
 	}
 }
+EXPORT_SYMBOL_NS(asoc_sdw_get_dai_type, "SND_SOC_SDW_UTILS");
 
 /*
  * Check if the SDCA endpoint is present by the SDW peripheral
-- 
2.43.0

