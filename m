Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E431A3164
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112350; cv=none; b=U7fKaNLztso2wZfHRlIoNxAhzEeOjWlJzvnzg9kCzxfySLGb9oawhRZZpmrNCks8lD1JukBgsANExgF8yp3130M8ZEA5dnH1E6TBku+CMPOXQYJGXjp4/B7gGvJEFLF9+dHAlJHw4bcBMElLwqvL9sig0z+2Ag4ksSruGDstKm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112350; c=relaxed/simple;
	bh=AYfduMiCGMFuXkeOFQZ8HAYwqPPY5+Y5oFhktKAagys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Io2lfSqFchmT2PZyGEN1JwEBU31D5KViCsglLOha8oHOUF9y5S34KAHInLQvzodIAFFhTXYuyJhowZOXkvSGmzSWWoMf4dRUrS09g8sznjNmX+PHgrbwQhpsWHjy2NxGBlzfO6ULrfbCRuG3P8CjbkJDHlYcUIOum9E8b9vQ5Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZ46zxeX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZ46zxeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775112349; x=1806648349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AYfduMiCGMFuXkeOFQZ8HAYwqPPY5+Y5oFhktKAagys=;
  b=LZ46zxeX3XIg8b6S7ft8UlKTGej5CGNQsnfSUkgeom1PPREiBMp52Oh4
   VEaBlDt8cYpJLEbvKYHPH5un3qfsOKaAxpc0vx8h+v/H95e1/0sQnUKlg
   6IAto3PzJBvldQ13btcEBIRdkag3j7ZB2sW22Pb45AvrkxfUmbkAouwu6
   rcZsCYEEv6Hh0NmMdT0Lvb+ZvodODRJW1qLTnkhVxuSjDQrhcfVuPc8jy
   61eLt6ij8tYEZLRQ7IKj4H7hBfffX5t/DEoo7qbZFZOcTysCAT+oibLIp
   RHBKFvZ61+OwLhln0AD4XwoKf/DLlnL5KBp5P4olATs4L56hkhzd/H4cE
   A==;
X-CSE-ConnectionGUID: h0h+BABcR4K9823oXafwnQ==
X-CSE-MsgGUID: lVfqFdVlQpCXwsWr/9Z/Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63715046"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="63715046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:45:48 -0700
X-CSE-ConnectionGUID: 9F14Ho9uRf2g8xi7/6mANg==
X-CSE-MsgGUID: cTJwgE9BShK4wm+s994jeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226059175"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:45:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mstrozek@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: fix iteration in is_endpoint_present()
Date: Thu,  2 Apr 2026 14:45:31 +0800
Message-ID: <20260402064531.2287261-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402064531.2287261-1-yung-chuan.liao@linux.intel.com>
References: <20260402064531.2287261-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

is_endpoint_present() iterates over sdca_data.num_functions, but checks
the dai_type according to codec info list, which will cause problems if
not all endpoints from the codec info list are present. Make sure the
type of actually present functions is compared against target dai_type.

Fixes: 5226d19d4cae ("ASoC: SOF: Intel: use sof_sdw as default SDW machine driver")
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 5c1f1b97ae15..b3d61d973ce4 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1133,8 +1133,7 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
-static bool is_endpoint_present(struct sdw_slave *sdw_device,
-				struct asoc_sdw_codec_info *dai_info, int dai_type)
+static bool is_endpoint_present(struct sdw_slave *sdw_device, int dai_type)
 {
 	int i;
 
@@ -1145,7 +1144,7 @@ static bool is_endpoint_present(struct sdw_slave *sdw_device,
 	}
 
 	for (i = 0; i < sdw_device->sdca_data.num_functions; i++) {
-		if (dai_type == dai_info->dais[i].dai_type)
+		if (dai_type == asoc_sdw_get_dai_type(sdw_device->sdca_data.function[i].type))
 			return true;
 	}
 	dev_dbg(&sdw_device->dev, "Endpoint DAI type %d not found\n", dai_type);
@@ -1202,8 +1201,7 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 		}
 		for (j = 0; j < codec_info_list[i].dai_num; j++) {
 			/* Check if the endpoint is present by the SDCA DisCo table */
-			if (!is_endpoint_present(sdw_device, &codec_info_list[i],
-						 codec_info_list[i].dais[j].dai_type))
+			if (!is_endpoint_present(sdw_device, codec_info_list[i].dais[j].dai_type))
 				continue;
 
 			endpoints[ep_index].num = j;
-- 
2.43.0

