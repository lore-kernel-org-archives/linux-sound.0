Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE21BCA18
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761968; cv=none; b=E01W2uFZxftEepZ+MtzZdaD72FEPSZF1YG0JfIhffQ4LSYMjTiICmLuYWGUl0sQ43xo6vR0YgFOJRaNwtu+akgyf6kIc/AHoajci7eEyt3TOZPms9kvUd6cpxqKrVlqBhXPdqBJh3PG2MBd8ecdGgwX6qkA3PEalnwxK+RC/W7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761968; c=relaxed/simple;
	bh=hyKMyMBXgP+b4y3sT/vY+bGBaq0hxImDrTq+DdJRA5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRl7QpHo2ePj01nORbxUtDr2uj23biB9PAJbRkgdRLIplx+/1StTFMYQuQKkMwlxVshJXJI6x7/QBpg7TORyJAefdCmyAW0OAYYt4ez1CL1RFM5EJR2NYxtqe4h9do2GTNqmG4/ySqglWkC9v3Tib5Sz8dsWT9oaiMH12s+6JnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUAEftX2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUAEftX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761967; x=1756297967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hyKMyMBXgP+b4y3sT/vY+bGBaq0hxImDrTq+DdJRA5g=;
  b=IUAEftX2KySJJavW3xncgcGsnRRZBAnBRYkvUuTeYP8oin8BoYNxzFa/
   YC4VwbVp7RAcPuKnjwiU6JekAOXRxUuBDXEjdgK8FRTzzTU58wnDD0RhW
   93GhX6DBkbGxa9lzIcTSDKAzhv1LCcDOvT/WMEkO3POA+ritRhPuEgmqa
   zaByd0D+hyhvVE2ma146hhdWjeKqbHA6OxqWFL9dqaACVj4xGjj/qJOqS
   oker1xO82Zdi2b6tUsvBkEmZBdtlHEeyNu0NV4jDicABN9Vst3skbjmEG
   ncawpWw4IdFg/qHOD3KjKf6qlAKHyailYvFgkm3JaU/WH32Bq11bfi7D2
   g==;
X-CSE-ConnectionGUID: IqtLkRXNTZmllIkTzZ8qqg==
X-CSE-MsgGUID: BdDjyJRKTbGF3IJVA4zG7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235507"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235507"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:47 -0700
X-CSE-ConnectionGUID: IkFkjXHtT/6Z/L+tJ/H0og==
X-CSE-MsgGUID: 2wwyy7ccSZmyfSXnSdQjhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676792"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 07/17] ASoC: Intel: sof_sdw: overwrite mach_params->dmic_num
Date: Tue, 27 Aug 2024 20:32:05 +0800
Message-ID: <20240827123215.258859-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mach_params->dmic_num will be used to set the cfg-mics value of
card->components string. Overwrite it to the actual number of PCH
DMICs used in the device.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3781a27bfbed..b06948c16b3f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1108,6 +1108,11 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		else
 			dmic_num = 2;
 	}
+	/*
+	 * mach_params->dmic_num will be used to set the cfg-mics value of card->components
+	 * string. Overwrite it to the actual number of PCH DMICs used in the device.
+	 */
+	mach_params->dmic_num = dmic_num;
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		bt_num = 1;
-- 
2.43.0

