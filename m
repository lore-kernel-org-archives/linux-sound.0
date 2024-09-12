Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3401A0BFD
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142615; cv=none; b=SgVYDc5fPk9XuYRf+zpEuF6JE70G0eJFjpLc8zz24GLuZJN1x7+pUsQZN7OmphJXpDXjGMGu895hUjRhCRMeiHGEpwUCB/Uu8/hCwhFQ8akdj2F0Z2lHT++VxNfLKBmpWLjcuOjuvol7kJMPOtlrk7HU0r3nyBbeoED6GJ0tbWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142615; c=relaxed/simple;
	bh=ptQbojTywScC+fZE1h5CWKeL5LHKDu2/C6I0qyIJaD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UaAWz8qVa8sJDC4/wm+uSrhWuBeqsFeM1KRBL3VLLHINQ+PN/4yYzk2FOpMjb2yhdARmIZFRTWH9aNIDO+Cf870v6xNsSDgeYPuhxQ85Lniu8arJgq6goIsm6YA07MqnZw10iLvyxm1MMW22zYnx2aAaKUiFI5Sp9rg8Tjs/Zsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhNa7+M3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhNa7+M3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142615; x=1757678615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ptQbojTywScC+fZE1h5CWKeL5LHKDu2/C6I0qyIJaD0=;
  b=nhNa7+M3nH5LdLsqzXFHG7RpV8nTT1QTTdrhgFGVfF7wA3wFbmfCuhOI
   R7FRICk01hfTEMuoAnF3GUyl5OuYfm26WvfzuDyDyyn0XX6WycZNIDKnB
   bQ2MI209xN7ccpfzZMYelsXNt7UHjT6a0xs4LQXamICXZG3b0HbyqU0mA
   QTztKO5iGk9kvWc21OS4ouol6H+6aVjTIgjBuTnxw/KWG9UNGQUejGOjq
   pGR7JWeHgZ4kUTqqaGE8Pd1x9aat0IlBfQJr8Z18YvUs81MjW2rDplbKN
   ma/rMAtwtbUGjw58NAIJQLd4n1Jiqcuw8vEtmb1lZRpP75LfSm64Ff0Nx
   Q==;
X-CSE-ConnectionGUID: EzPR4GWAT3qamhHwM1o9jg==
X-CSE-MsgGUID: L1esGsNVSTWoUP0gVM/KaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812787"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24812787"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:32 -0700
X-CSE-ConnectionGUID: 7NdI2B1RTbahetRwiFrnGA==
X-CSE-MsgGUID: XRhl0mL+Sw62KkVJMBa8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="68459188"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 5/7] ASoC: SOF: Intel: hda: remove common_hdmi_codec_drv
Date: Thu, 12 Sep 2024 20:03:06 +0800
Message-ID: <20240912120308.134762-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
References: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Do not set common_hdmi_codec_drv in SOF platform driver since no
machine driver needs it. Remove member variable common_hdmi_codec_drv
from snd_soc_acpi_mach_params structure.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc-acpi.h  | 2 --
 sound/soc/sof/intel/hda.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index c1552bc6e31c..60d3b86a4660 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -62,7 +62,6 @@ static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
  * @platform: string used for HDAudio codec support
  * @codec_mask: used for HDAudio support
  * @dmic_num: number of SoC- or chipset-attached PDM digital microphones
- * @common_hdmi_codec_drv: use commom HDAudio HDMI codec driver
  * @link_mask: SoundWire links enabled on the board
  * @links: array of SoundWire link _ADR descriptors, null terminated
  * @i2s_link_mask: I2S/TDM links enabled on the board
@@ -80,7 +79,6 @@ struct snd_soc_acpi_mach_params {
 	const char *platform;
 	u32 codec_mask;
 	u32 dmic_num;
-	bool common_hdmi_codec_drv;
 	u32 link_mask;
 	const struct snd_soc_acpi_link_adr *links;
 	u32 i2s_link_mask;
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d0a41e8e6334..70fc08c8fc99 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1051,7 +1051,6 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 	if (*mach) {
 		mach_params = &(*mach)->mach_params;
 		mach_params->codec_mask = bus->codec_mask;
-		mach_params->common_hdmi_codec_drv = true;
 	}
 }
 #else
-- 
2.43.0

