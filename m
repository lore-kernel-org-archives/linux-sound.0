Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811F1862A
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002842; cv=none; b=siobbJ6qNFmbAddkWYDT5WCQLFibpC7Wwoz1QMhHJVKzlf+7JPza/80jVf2M4BY2aEGal7R1H2xPuuACeObQEaGbbgEBm6Yxdlf8Z/eGqcstNEAU81AbrB6jzDfyPOL0+22qUkr2psCsZCKWENqcvcJumNEVSc35AEPD3vfHuws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002842; c=relaxed/simple;
	bh=SzMeZ3h9VeeEC4MxTuvKmOISlZ84yUuRQ81/6gCO0Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIM/S5kCt+fHSZoWySH3FogepTBGLEg6VAGGF6M6H/tftQvPghW3ZeXO93sHGwgPOOM3MBDUCnOxHpB5We45zcZY+YAaBPDmKcmuiZwSg1Te62gLJaeYPAoQ+/ySoYwoNvSERZuoaumdx8kbFnXbPeZ9Ax5c4KcLkORnM3OmS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBcxKdyU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBcxKdyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002841; x=1791538841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SzMeZ3h9VeeEC4MxTuvKmOISlZ84yUuRQ81/6gCO0Ww=;
  b=CBcxKdyULd+KRc58bKTJRVO5dzLXwip7zCTWnv4jXk41D+JCBXhtuHy4
   Z8tgWVT88zbC5PgXa2w85xMge8RmPLgw2JtgOR0h0UCqlYJ3i8CaEmLma
   IDJc67T1IJWXvScAdvUJFkrKS6HR/Z/PHoY5BmFwEByY6DTDIYuGfT3Yp
   WcF8dGiml7tnvM01l2JC6NZ0uhdtb9GmryxHHcSbyAAMmah4AWEF4hOrB
   QPWFcEcOTKpFc4/ksGAtv72Tb7V/w77InS4psDSnlD2G1FTh2aFHdb4RN
   /m8dZ9suM7AKOOCBTIUJivDrjBWz7El3F06/G1IwErNBTu12t9LIk+Ti5
   A==;
X-CSE-ConnectionGUID: Eg8JdWA2S2u8xLCBmclaTw==
X-CSE-MsgGUID: UaDORTELQNGoeZ0KUt54Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113231"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113231"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:40 -0700
X-CSE-ConnectionGUID: 0QyrTNmbQaefB6Un74fY3g==
X-CSE-MsgGUID: nCx5hq+BTF2cZdhNUTR6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181437979"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 5/9] ASoC: soc_sdw_utils: export asoc_sdw_get_dai_type
Date: Thu,  9 Oct 2025 17:40:19 +0800
Message-ID: <20251009094023.3474895-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
References: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
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
index cd41b0e16777..0460e2a8c50a 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1239,7 +1239,7 @@ struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks
 }
 EXPORT_SYMBOL_NS(asoc_sdw_find_dailink, "SND_SOC_SDW_UTILS");
 
-static int asoc_sdw_get_dai_type(u32 type)
+int asoc_sdw_get_dai_type(u32 type)
 {
 	switch (type) {
 	case SDCA_FUNCTION_TYPE_SMART_AMP:
@@ -1257,6 +1257,7 @@ static int asoc_sdw_get_dai_type(u32 type)
 		return -EINVAL;
 	}
 }
+EXPORT_SYMBOL_NS(asoc_sdw_get_dai_type, "SND_SOC_SDW_UTILS");
 
 /*
  * Check if the SDCA endpoint is present by the SDW peripheral
-- 
2.43.0

