Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD9B217641
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424495; cv=none; b=qO63umrrjaeTSIMZXyQrRVv4IHOJMU5opxe0jPUrHnStXWS+/SXvZTv9/HvXZCGTfmTktkci3Km3UhvUCmH1w9B+LfCFgQUDxa7XeUgqGhsvYURCr/gAdGSia9YZ94INIx5fOAZqH7agcESUmc/FCigw9UcqiEHVrZ3WvbcYHmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424495; c=relaxed/simple;
	bh=NYTgj4in9aBGoh4IsdOAZ9NY0x/JqpZ4WxctqueYYNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ccKmSJQ9lrZ/RdpiS+9u4aVb+2zq+fneTsaAGqzQDEaVGsZsL7S21S8OuJqm21/t8CHQvDqtZ1+X0K6ioMhUBYNcWrFqfCFxMeSVlYOwPTH3lN19ihS+6sj7kpfuIfqf10gR569ziwzwc3kcO3wBX/CXmGmnbtO9dAKnpI6IzSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epVDDs4v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epVDDs4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424494; x=1767960494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NYTgj4in9aBGoh4IsdOAZ9NY0x/JqpZ4WxctqueYYNo=;
  b=epVDDs4vgL8SGuYGte8QhbUwrgvnb2Xxt6J1N1k9j9VrkOXNSdqL+mzC
   Gqv7G67If9j9Z3uFe6AtuJJHXaMlqXVsMNz1VEAfwd2fn443oT0v9N8iI
   IYSqmMkftCiXAuBz5Z5CsiMuWgy9YTVCLh2IdXKnmjd3e3HLcm/Rx82cd
   hytm0nBrCIUguyzHou+WnrHqfrkLvefkehLdVaZEog+MJbBZu7yPuZ3aI
   fk9dYBwtH/QvfRUj9o41EzChWueJJKT7iEUno3ORJoyGvlo72AHmiPIdS
   RucakI4hEUjELOERNzMiTK6LBbsPD1/M98QbyHFXZbMeMB8CRP05xAo9T
   g==;
X-CSE-ConnectionGUID: lSzVcppBQsGWV3gutGMgxw==
X-CSE-MsgGUID: +PBsEiCDQlmr1fXbvsgPDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179550"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179550"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:12 -0800
X-CSE-ConnectionGUID: 31K/nXNYRhW7F0HztM7eRA==
X-CSE-MsgGUID: Qebgs85LQde095Yk+14nOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710265"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:10 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/13] ASoC: Intel: avs: Do not readq() u32 registers
Date: Thu,  9 Jan 2025 13:22:04 +0100
Message-Id: <20250109122216.3667847-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register reporting ROM status is 4-bytes wide.

Fixes: 092cf7b26a48 ("ASoC: Intel: avs: Code loading over HDA")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 890efd2f1fea..37de077a9983 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -308,7 +308,7 @@ avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool purge)
 	}
 
 	/* await ROM init */
-	ret = snd_hdac_adsp_readq_poll(adev, spec->sram->rom_status_offset, reg,
+	ret = snd_hdac_adsp_readl_poll(adev, spec->sram->rom_status_offset, reg,
 				       (reg & 0xF) == AVS_ROM_INIT_DONE ||
 				       (reg & 0xF) == APL_ROM_FW_ENTERED,
 				       AVS_ROM_INIT_POLLING_US, APL_ROM_INIT_TIMEOUT_US);
-- 
2.25.1

