Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB147217642
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424509; cv=none; b=KYLM8t6wGEtr3Om0mYk45RXYmHrMySFIl+2ax0FJ7ey0a0Ql2eLbr3DjgFcuuHoP4o+klXOQaosoyPJt6X1iy4WPf99+oKCTDmMSO5UOWwjz2QCEtbVoiRJNlF1mUxZCS4DtPGtDOoUOsverTEw8zP9f0w+z6Na5bpAgTh/4VrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424509; c=relaxed/simple;
	bh=UX9TkIm0WrI2teyBj/nvmsScgxAV2V/zR89+LhB6pPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPUctJJIQ8W88KU+HPQCvstdB3gR2XPl1eyVNQtMLT2W8i527KO6UjhIq75XY/y8ddG8QM7cdtBY0ZIcGtJ/rGDLJgNGJqEpu7Ijjk3rb3nYiKupSOQmntqvyV51EsUZoEFtSgsDdbcGzf5UQGw9hFtlzohg4sZtD9TArnk468c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gkt9x1pX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gkt9x1pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424508; x=1767960508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UX9TkIm0WrI2teyBj/nvmsScgxAV2V/zR89+LhB6pPs=;
  b=Gkt9x1pXt93CstTypuC6mYYvwmQVSiw4gVEcfhWXMX61HPUMx9lCLYwk
   aCul94YVaov63AsvX0NlUl1Or+OIsQGN0kFwyfuLJw+3ZiKgfGIDccJwY
   WPWUZAQXSN9IsrGZQHY49qE8u+9+i8XCngJkJJ/LdBOb3ivrrLE5UhinS
   HZ77LhdgGeXrQGiydpi3/+6GVSSMY4KdgPIUqCvUxiy0z2BW87W4CYehr
   GnpKT7IbHnyroNtT9csA3aboJzcHaxu6fNoe72tS2DKR6TTQ6NwW3aujk
   zcLsAmgCh34MnTJwXlSdOqcC0s813XXvHN/8t+EnDVosmVmqD40srtXDJ
   g==;
X-CSE-ConnectionGUID: m/o0AI7sQ8+TRaQL36+TMA==
X-CSE-MsgGUID: zSLi9kPLTpaBEM/N3/KWKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179592"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:26 -0800
X-CSE-ConnectionGUID: 56jHzzEHQSyM3kzn7mj1PQ==
X-CSE-MsgGUID: yaKyqn3fSKi40hsyBTGjxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710352"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:21 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 07/13] ASoC: Intel: avs: Add MODULE_FIRMWARE to inform about FW
Date: Thu,  9 Jan 2025 13:22:10 +0100
Message-Id: <20250109122216.3667847-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

MODULE_FIRMWARE macro adds hint to module information about which FW is
expected to be present on file system.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 82839d0994ee..0e750e9e01d9 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -902,3 +902,13 @@ MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
 MODULE_AUTHOR("Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>");
 MODULE_DESCRIPTION("Intel cAVS sound driver");
 MODULE_LICENSE("GPL");
+MODULE_FIRMWARE("intel/skl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/apl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/cnl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/icl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/jsl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/lkf/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/tgl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/ehl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");
-- 
2.25.1

