Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5813B5AD
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231104; cv=none; b=jTU2BBQeYsF9l/LStwkgQWevsrK7B/c77aJd0uMa9EF6AjWzAbXD/mmtgV3d2ToTTWwDCpAr/ZhPVgSSTzcWCHSKjsa1/uPVXnder4Z+VotD3YU8D3c3zRrUs/nfzt566zXZsewK3pq4gw02AQGiA8kJ9a0qbGi8le+NXgQalTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231104; c=relaxed/simple;
	bh=Dp+m3q2E7PgVso4OtZK0clbxLP/VF/JVrzwZvIK4P+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJxOfOHuyfTG/vfythH/AC34ihTi4QUg7EWOo7WV91tzc81WKBSNyHYHmwMZck9O5PY6+/0l8RMrqhycGLfCvyBe2SZ5T7HxbOP0CSY4XEng5fDDGJ2gd7zVEFmH+Hxz6MwOSNlth8OZhB5WssvElJhQobVe0G8qfU/1NvkmU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaVbYMgz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaVbYMgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231103; x=1750767103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dp+m3q2E7PgVso4OtZK0clbxLP/VF/JVrzwZvIK4P+Y=;
  b=QaVbYMgzjydm6bSpEUy0EqTtmHMj28mtXcP6L2S/luh+IJNxJrToIy7p
   T05L0RU0eSjgCJpWrwBBhf6oQxB1AttqNQPP5yT+huUE/4JwhyCXqC14V
   tojqTSTvOXWq/VGYwLCX5LDd1eZGcCQ9d0LW9hxyx7AlCqOiYP2W/KsA5
   t0lg4NgqsjHL0gCYiVJ/hVkdAlD3kGiSYENxPlka5z4nZR4Z4WiJa28Vq
   YdSE5UshOVTA4UmER6KdJi6wU41D4mqcp7L/Z82spgYzeafVrRMjYMvQg
   uQSgRxCVuJQsqSBHdukN+Tvth3TBHCmdqtpjaiM23qUWa2jWLx9lrjmGG
   g==;
X-CSE-ConnectionGUID: UMmMSD9/SCCwfsJ1I8hhZA==
X-CSE-MsgGUID: MuGEVEAaSeWPxtnuVEAx4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887556"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15887556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:43 -0700
X-CSE-ConnectionGUID: rWcG9NItTY6ZNe9Rn61Y2Q==
X-CSE-MsgGUID: alK3MkPFQUWog/MnBtxX3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43091222"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 4/4] ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43
Date: Mon, 24 Jun 2024 14:11:19 +0200
Message-ID: <20240624121119.91552-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Cs42l43 bridge mode needs the two configurations.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 4e0586034de4..f1faa5dd2a4f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -677,6 +677,8 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_CS42L43_SDW
 	select MFD_CS42L43
 	select MFD_CS42L43_SDW
+	select PINCTRL_CS42L43
+	select SPI_CS42L43
 	select SND_SOC_CS35L56_SPI
 	select SND_SOC_CS35L56_SDW
 	select SND_SOC_DMIC
-- 
2.43.0

