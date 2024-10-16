Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FB121E3C2
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 03:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729047844; cv=none; b=MBFCvFMQ1OWu0JPZrB6uVoH39qBxea9WjrynJErxAb074hGDknDb/0Z1vWHb9A4y8BGZpg31uYrCQYwx/FmQP3CwcvxUydNSO+Wj/dCIlacT+GyjlS5q9d6LRR3ysQ7c93DLWM/7rUJ8A8kIboBf6qk3FS/MeWwVqXFsUR8xaC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729047844; c=relaxed/simple;
	bh=gjbYAN980IE8cKvnapaGXXskrrg+5IHvN3yfjJE7sa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTZWNmKY6ltrcrVpja1MRqoDVyI/yttBT6bxiJT9Fz5j7xzPmTZ6IflzB3CSYKVFIIglkl7BmhGwnY/JQ9vVx7EFGp+byaPTjp3ssfrY4RL+QQ9Zt+CGFWBb7YdZlTYK/TA2kmYxiV1of7P5eF44CsCMMpF5TvHDcAw4MMAV7jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaoqGpDn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaoqGpDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729047844; x=1760583844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gjbYAN980IE8cKvnapaGXXskrrg+5IHvN3yfjJE7sa4=;
  b=gaoqGpDnQDSHjqR1f08RtJD1nKVk8K0RIXla2XtMnQe1VAaA5VkkVELo
   D6e0mdeXfwug48ZQlc2XKR3ted874bVWr9KoGC/NMRsDXH9SGw2/1WHbW
   nzp9IKgSJnv/wPD6R1EvMymPSHIumf+EGagFZTCpvloS93gTKqXBvsC9A
   nQx+C4fNaqIg1jwOGf9F2dbzKRJXD3t/Z7ACtLpHBbte65+A5JcAZDzyk
   u5TExkvXzyh/wYxr6/nTFOmOlYMsfo7ZU56y6gfwFzyY7CR6bz+mzpTfM
   9jREOHj/JGe0Hea6x3zUvOUkfzIKLsZvun1Oxyj1b4KxwwZ4kNX8iVRgs
   g==;
X-CSE-ConnectionGUID: jWXDZeGZQvaJHknAl0YIGA==
X-CSE-MsgGUID: BoWbKXLFT8uBGBrYfZ84Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28265554"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28265554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:04:03 -0700
X-CSE-ConnectionGUID: rC7sU7stT2S/Y6qZRySM8Q==
X-CSE-MsgGUID: NIABTA7UQj2uzM+v39X+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="77979246"
Received: from cvapit-mobl1.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.236])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:04:01 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 3/4] ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs
Date: Wed, 16 Oct 2024 11:03:43 +0800
Message-ID: <20241016030344.13535-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
References: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add quirk to inform the machine driver to not bind in the cs42l43
microphone DAI link.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0a87aa9347ef..f08636589284 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -580,6 +580,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "233C")
+		},
+		/* Note this quirk excludes the CODEC mic */
+		.driver_data = (void *)(SOC_SDW_CODEC_MIC),
+	},
 
 	/* ArrowLake devices */
 	{
-- 
2.43.0

