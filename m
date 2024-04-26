Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9334215574F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145144; cv=none; b=qmR593bwkcxxT8OUw3t/rzZRx+ZebmXKuA1skMi0dCB4NLvg1rA+Jm8BpFmhm7p6Wck+9pMEfTUn3xXD3+yRwM02IhbL0lA57Nhzb7auY120bFwP7sQV5JfUDMVbYagrED4O0IAHiI2WbVE/1UujFzHuQD/9oXch4szQmKXyF6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145144; c=relaxed/simple;
	bh=wJ+K0kGzDt7cV8Ivu/Cbi1pV10bEEu2u/O3vynYkHxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pNpy6Tvx/YE77nAZDwsH3ztJ63eAVew15+txhdUsyDORaQ007UXCiTGtALKcSKxew1XrvcRBWtjuIPhqjKSNJMErrUX3u6A4XZsx9cQVJpg1tDNAn4D04lED4SsI0DZLrN5V3LSwe7/FlqVjh4e9QRQ7J8tPix6z+eyJGTdXNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLE5496i; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLE5496i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145144; x=1745681144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJ+K0kGzDt7cV8Ivu/Cbi1pV10bEEu2u/O3vynYkHxM=;
  b=gLE5496isYy7q7bvLOFtEIy+K3x7HnM6Ga8jXugypxShA5HBFKZhuxv9
   umbXfPJiojw13RuU0UvaPObtJsta5E2YVnO1ofgrZESr11vIow1j7Y1TY
   m9kUA3OQo7lY1OriRf5/hQM8m6KFiZgx3aypAHannllzPVpdEZqv3/KtE
   QK7CqiMHU1LJ2GGmNlFAJo+KrIQjyllLNCkTDAlqA0uzMQ2xQDR5vzyuC
   hgbwjBLONHewwH+nmLRyO8MUUPnvv9t7v8KSYV/pquKPWeESewRz0Oly4
   MKjeaQLzmAlwwkdAvkKmYU588xw7c7DOmZqSTIwL7YQs5rTNNn1Boocsn
   w==;
X-CSE-ConnectionGUID: exHNq0G/QKWoN8oJ5Eh6TA==
X-CSE-MsgGUID: kK0lrQ11Rh65gdWlsFU7nA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291298"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291298"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:43 -0700
X-CSE-ConnectionGUID: 3uzE7i83SnCaXox851EeQA==
X-CSE-MsgGUID: bhTPoK+5SdOPC/NUl2VcsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259550"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/23] ASoC: Intel: sof_rt5682: add missing MAX98357A config
Date: Fri, 26 Apr 2024 10:25:13 -0500
Message-Id: <20240426152529.38345-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

sof_rt5682 supports MAX98357A/MAX98360A amp. Select SND_SOC_MAX98357A
as needed.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cb3984b08d1f..8dfc1cc0f08e 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -486,6 +486,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
 		    (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
+	select SND_SOC_MAX98357A
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98390
 	select SND_SOC_RT1011
-- 
2.40.1

