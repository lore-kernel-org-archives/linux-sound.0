Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7EA22ACEB;
	Wed, 13 May 2026 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689581; cv=none; b=FFPo9H/haYKw9U8KAAWgSkDRWkIXNRYaBpshhAE40CBOZO0QGVwRi1biqC5F7n0ovLizLPvpWmU/IQTEJT60sn5o7a9XOzdz1+LU44KDfAT7t20KQpd71OXs5jd6c0CL1Zf3PJ8dOg5A0tWqoTA/yAna5gkLewR1S2ZrH5LmyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689581; c=relaxed/simple;
	bh=jT4ssmpzJ8RQ/GukV18JeffazJirKGu4MnMHUUVJAx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Od4nQLtGGEQhfNRAcQXDAKlvv4fH/gV+FpsgT0ekjAe6VUtzXZ83UysK/a7wuI60VVAXltpyZFePcJbIf+LGYOImlmwruGYaSq0ghJmKcrHL4Kl3aEFgn3y4XdZfJbZPP8d3PUZOAmlaMnjzH3BRUSJXFDE7TaXtdeoBW6CEcik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqYxRz0Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqYxRz0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778689581; x=1810225581;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jT4ssmpzJ8RQ/GukV18JeffazJirKGu4MnMHUUVJAx0=;
  b=KqYxRz0ZdrkCPe2alqh3lU9C15Pp7r+8fdhV7A4kYk8xREu/ZKDiWAAm
   pEAp0oQZkbtlCBNIKxMkFfPIaWfOUDCGLYKbjgk3a/Qz7fQoen3W6YeWC
   i45zQZfIXq2i0V6PSBogiyUcDUmmM0P4Pjy66nR25abey4IY2WDoGo6Ow
   vcwrHSUwSPQQu7Wt76QSixoLU/mdZagUkv4FyIBn5Rh8bmPgylAKhrLWK
   SjQZuFtAdB7D4sN+cxx7jkb/yO1a949V6UeFy2aj1AZmV1qzddQlKugT3
   l0Ct8Ova7EiGLyuZF+FWw5sA/3vcPxjvtanqqaY9TkYWTozzfcVIFYkKo
   g==;
X-CSE-ConnectionGUID: +gfjvJ17SRusnGfdxF/WGA==
X-CSE-MsgGUID: v4cobjRVTVuSAeyoZFejGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79518553"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79518553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:26:20 -0700
X-CSE-ConnectionGUID: f/QsEe49RwGqW+IixONNgQ==
X-CSE-MsgGUID: FBVU4QvZTJayZqcn0nZvGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261634011"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 May 2026 09:26:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C74DA95; Wed, 13 May 2026 18:26:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: cs35l56: Drop malformed default N from Kconfig
Date: Wed, 13 May 2026 18:26:12 +0200
Message-ID: <20260513162612.365729-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First of all, it has to be 'default n' (small letter n), otherwise
it looks for CONFIG_N which is absent and in case of appearance
will enable something unrelated. Second and most important is that
'n' *is* the default 'default' already. Hence just drop malformed
line.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 069ec05e4a61..db321b9f6771 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -900,7 +900,6 @@ menu "CS35L56 driver options"
 
 config SND_SOC_CS35L56_CAL_DEBUGFS
 	bool "CS35L56 create debugfs for factory calibration"
-	default N
 	depends on DEBUG_FS
 	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
 	help
@@ -911,7 +910,6 @@ config SND_SOC_CS35L56_CAL_DEBUGFS
 
 config SND_SOC_CS35L56_CAL_SET_CTRL
 	bool "CS35L56 ALSA control to restore factory calibration"
-	default N
 	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
 	help
 	  Allow restoring factory calibration data through an ALSA
@@ -925,7 +923,6 @@ config SND_SOC_CS35L56_CAL_SET_CTRL
 
 config SND_SOC_CS35L56_CAL_PERFORM_CTRL
 	bool "CS35L56 ALSA control to perform factory calibration"
-	default N
 	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
 	help
 	  Allow performing factory calibration data through an ALSA
-- 
2.50.1

