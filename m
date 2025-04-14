Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB461A8F79
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612420; cv=none; b=CBrHq1UPIiCWpMrSg6LvXY2vEq5g07y2Kv+a/s78uPaAHemyr5K8S1McvNYNN+nxdkE926bmaoasrRRr2ughGPJDlPXMPaWnrGdBXilBScZMM12GC+I2Z2j5SkCS/mEVvhoQsNxyIrR/VTfWI1IfLeCZ9XIQHo2G9EHuWFT2tUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612420; c=relaxed/simple;
	bh=+eKmeNAFfNUC1OMAKp3ZtwZm43cCAkTDIqMP12YkBGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/4avMUslWq+cQaGRwP0WSpz6scgeu4eA5ySbHKnweBp6nfcnef+0SR6FyXFMLNwYINiBBdUI6wjhuRa8St8oG6ql3q6eL6sKjKILHA7+1nD7E1QXyaezGLNUTBEVZctnDEdXPEiZtGrZSvljTnX2z8PHj4PL8rwlBTtnjs9PLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKDTgjzj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKDTgjzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612419; x=1776148419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+eKmeNAFfNUC1OMAKp3ZtwZm43cCAkTDIqMP12YkBGA=;
  b=NKDTgjzjsJANi9PzprjZkn/vyD5nwVTWXKKNyxa1fE+nhQqZ/Tpfy/Zs
   g2Ci+67ZG+mjIJ5qLVLt5eP+lwFRcMpJ04ApTWAyfdoNuUXfg6M1TglY9
   eCWBVb0vHQCFNAaPB3c0z1Fr9JV00812LFo0qb3pzb7Pwax6MA9c8HFql
   I4Gya+ZKCFNzOlV54W1xDnwzzFTM40KFq5a4MkDgK1ymMFoB37BcD6OOA
   bH70JCNMN4pbscyu+uXVd9PpyxM+0JG868EWTjnxajoJ6ObUvwhT1F/Sg
   VP3PKe4B6JI5F29tlNoJDPar8agPpFCyyTFXgicx+gzkA6/LJrPbmzTeN
   A==;
X-CSE-ConnectionGUID: zGpUi9sCT26OAVEChmXwCw==
X-CSE-MsgGUID: n5iKkeEiSRK5SHLJy0kogA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872664"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872664"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:39 -0700
X-CSE-ConnectionGUID: dIbc5NjYR2mAQXb0UMMK9Q==
X-CSE-MsgGUID: yW4RHhJsTsq4WpghXKjLjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275324"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 10/11] ASoC: sdw_utils: split asoc_sdw_get_codec_name
Date: Mon, 14 Apr 2025 14:32:38 +0800
Message-ID: <20250414063239.85200-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
References: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently asoc_sdw_get_codec_name will return codec_info->codec_name if
it is set. However, in some case we need the sdw codec name no matter if
codec_info->codec_name is set or not.
_asoc_sdw_get_codec_name() will be used in the follow up commit.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 31 ++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 5175818ff2c1..4c5ce01eae5b 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -934,10 +934,10 @@ static bool asoc_sdw_is_unique_device(const struct snd_soc_acpi_link_adr *adr_li
 	return true;
 }
 
-const char *asoc_sdw_get_codec_name(struct device *dev,
-				    const struct asoc_sdw_codec_info *codec_info,
-				    const struct snd_soc_acpi_link_adr *adr_link,
-				    int adr_index)
+static const char *_asoc_sdw_get_codec_name(struct device *dev,
+					    const struct asoc_sdw_codec_info *codec_info,
+					    const struct snd_soc_acpi_link_adr *adr_link,
+					    int adr_index)
 {
 	u64 adr = adr_link->adr_d[adr_index].adr;
 	unsigned int sdw_version = SDW_VERSION(adr);
@@ -947,17 +947,24 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 	unsigned int part_id = SDW_PART_ID(adr);
 	unsigned int class_id = SDW_CLASS_ID(adr);
 
-	if (codec_info->codec_name)
-		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
-	else if (asoc_sdw_is_unique_device(adr_link, sdw_version, mfg_id, part_id,
-					   class_id, adr_index))
+	if (asoc_sdw_is_unique_device(adr_link, sdw_version, mfg_id, part_id,
+				      class_id, adr_index))
 		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x",
 				      link_id, mfg_id, part_id, class_id);
-	else
-		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x:%01x",
-				      link_id, mfg_id, part_id, class_id, unique_id);
 
-	return NULL;
+	return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x:%01x",
+			      link_id, mfg_id, part_id, class_id, unique_id);
+}
+
+const char *asoc_sdw_get_codec_name(struct device *dev,
+				    const struct asoc_sdw_codec_info *codec_info,
+				    const struct snd_soc_acpi_link_adr *adr_link,
+				    int adr_index)
+{
+	if (codec_info->codec_name)
+		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
+
+	return _asoc_sdw_get_codec_name(dev, codec_info, adr_link, adr_index);
 }
 EXPORT_SYMBOL_NS(asoc_sdw_get_codec_name, "SND_SOC_SDW_UTILS");
 
-- 
2.43.0

