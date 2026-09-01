Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15EB41169B
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 02:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228716; cv=none; b=R2oBAeD8wWxXRQgPr4yFn7O3WW5p17jjM7b18dmtj53g5F6x+MRWXr5dfNLMj+uiYBvQw7vn6Ryc/M0H1yEQjw90M3F6KItDWjJfa/VNo06I2IxtHHet4fWhe/GXeUM1d5UBZp7q7bQQv9MkicaqWpBxdRpjxcFcieE07/ukekM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228716; c=relaxed/simple;
	bh=285YDRADzs3mAID4NiKmFwM18Kqbv3zZY6R5FvSkAGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkfJ0/PE8eDC7hWoF/rYZAYL7mh2YWGFqLtWIL3229Xh2d4dxClxkL6HwXjvifXkQp1+uQUUKAjyE5zXF5KsH9dcFRKQOIKNglMF6DXbMz+lMb7nrz/CPVPSN+3chxOcGNwjnA3E2vs0zelRETzpZ27mYaZsC0bMVfB7HySD/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyHxUYkD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyHxUYkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788228709; x=1819764709;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=285YDRADzs3mAID4NiKmFwM18Kqbv3zZY6R5FvSkAGM=;
  b=fyHxUYkD0Kr8KsUBBxMiZLwvCic8YSomzlthNcBIa3KnxZQWPEAApH48
   vNheTDXe4Et9xBRuJkeCBq/eTpQmJI/LpGzPh63bWJ5IbvEf7vPdC76ga
   3G68953Xxa+ko+Ym+zwyJXI1smhUL//SlF1TW6VV/AukDf1jyg6T+lAXX
   ZM5Bo1ZaNjtzXCssgsAU2WH/EQIFHkPpCv+lSrNWQrqoEklQ9Zc4eTRVu
   Ud5hObbFm8FpvW7h8wn42UOutcI1wLqYUDjGMV6vDKYICVg6XDFPbDA80
   JZwDBI3vVQ3jiYiYL1pIbUmD/NVsglMpgnM1nABHUUHeI5YAtJIcMh8yx
   w==;
X-CSE-ConnectionGUID: 8yjRDTLYT9qOZtFzlxMjnA==
X-CSE-MsgGUID: RNLo2W8uQ6KiMVeavEORsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88670269"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88670269"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 19:11:43 -0700
X-CSE-ConnectionGUID: GRG9nQJ0SBymJ8G0riIGxg==
X-CSE-MsgGUID: edHzoMiCQ3e13v5jwhSumw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="293788669"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 19:11:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	niranjan.hy@ti.com
Subject: [PATCH] ASoC: Intel: sof_sdw: add tac5xx2-sdw family
Date: Tue,  1 Sep 2026 10:11:32 +0800
Message-ID: <20260901021132.231908-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niranjan H Y <niranjan.hy@ti.com>

 Add Texas Instrument's tac5xx2-sdw family to include
support for soundwire codecs tac5572, tac5682

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
SND_SOC_TAC5XX2_SDW depends on SND_SOC_SDCA and if we select
SND_SOC_SDCA, it will cause recursive dependency error
symbol SOUNDWIRE depends on SND_SOC_SDCA_OPTIONAL
symbol SND_SOC_SDCA_OPTIONAL default value contains SND_SOC_SDCA
symbol SND_SOC_SDCA is selected by SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
symbol SND_SOC_INTEL_SOUNDWIRE_SOF_MACH depends on SND_SOC_SOF_INTEL_SOUNDWIRE
symbol SND_SOC_SOF_INTEL_SOUNDWIRE depends on SOUNDWIRE

That's why we imply SND_SOC_TAC5XX2_SDW in SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
instead of selecting it.
---
 sound/soc/intel/boards/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cddbd2aa424e..b795bcade8e9 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -533,12 +533,14 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_CS35L56_SPI
 	select SND_SOC_CS35L56_SDW
 	select SND_SOC_ES9356
+	imply SND_SOC_TAC5XX2_SDW
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	imply SND_SOC_SDW_MOCKUP
 	help
 	  Add support for Intel SoundWire-based platforms connected to
-	  MAX98373, RT700, RT711, RT1308 and RT715
+	  MAX98373, RT700, RT711, RT1308, RT715, TAC5XX2_SDW family (including
+	  TAC5572, TAC5682).
 	  If unsure select "N".
 
 endif
-- 
2.43.0

