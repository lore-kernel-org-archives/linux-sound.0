Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1E7226162
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834074; cv=none; b=pO/vN5fGqdI+jbMC0Ya9h0eR0OApKp50h1LZcQAbmTpputWokwIX9077ADwP8heBEuYfPB5+RQyiGlgQW98CpWyl7yjjwwWyoAW3bDGZzbNX0UzR3cDhpqwBQPD3JSI46YyeGqpIsB21XNpEaAPlbupdm074yG4pZHBfDzAWo04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834074; c=relaxed/simple;
	bh=DPsQjBUPJN0mQLSf0TsrAcpyFQsedvKX8UrtrEqM2K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKo9ndusJ6JUVoE+7PQg0zcQVolNVhqJx7YhV14niALo9OGiTh1pHhX1M8xZGvtwamjrUjiboqUSKSvJciZUcfMZ0JWutH25SMp+qUuM0/whBGhXQlmsAmGaA+pkRaf//WgJ+eLgNOuIUDdHwO+x2f7l3BH6C8FjUAIKfIuQZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDMXzeAI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDMXzeAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738834073; x=1770370073;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DPsQjBUPJN0mQLSf0TsrAcpyFQsedvKX8UrtrEqM2K0=;
  b=mDMXzeAIQu1Fq6GBhYmNYwlIK5s2qSo7q3u0l7G2fF7SQF2Abs+7fy6U
   dMi7p57aqOKxRV/U6XdDM1FMdkyw0m4rPbS+c0FMLfywx3cgnhS3MkqQQ
   8OMlSCvswgCHtH+kVPXXn3Uc1+NCYybnes33xnh5fhKMD0x+op7DH8KD4
   CAG6tHmy/849xFzFi+DRQhsK5FxFSpKqhz66aZlCGgrdMAxJ3o3ag4T32
   IZuWy7tPEGLI+c21a3Qh+lyZdda/cRRTpQXdMuHiuQ8HmjYV4gjOshM4t
   YmkqCSh8sf+zQu1zIbNbV5MbOYkJ0U7cE3eNTebmOTF/yhjjmlbto2GQ9
   w==;
X-CSE-ConnectionGUID: 6JgQOUIOQY6rD7FOcPKXhw==
X-CSE-MsgGUID: RirY4A88SWuLsStfR+R7vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43090005"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43090005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:27:52 -0800
X-CSE-ConnectionGUID: kOn/aiEeRXi04nXFUBjfzw==
X-CSE-MsgGUID: TJZzO/zITuCC1TU7Mq6EKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148361955"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:27:50 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 0/4] ASoC: SOF: Improve the spcm and ipc4 copier prints
Date: Thu,  6 Feb 2025 11:28:24 +0200
Message-ID: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Introduce new wrapper to present spcm related debug and error prints in
a unified way and provide additional details to help to understand the
reasons and configuration used when the log was captured.

Change the way we print information about the ipc4 copier module to
use type specific prints, again to provide better information for
debugging.

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: SOF: Relocate and rework functionality for PCM stream freeing
  ASoC: SOF: pcm: Move period/buffer configuration print after platform
    open
  ASoC: SOF: pcm: Add snd_sof_pcm specific wrappers for dev_dbg() and
    dev_err()
  ASoC: SOF: ipc4-topology: Improve the information in prepare_copier
    prints

 sound/soc/sof/ipc3-pcm.c      |  13 +--
 sound/soc/sof/ipc3-topology.c |  20 +---
 sound/soc/sof/ipc4-pcm.c      |  16 ++--
 sound/soc/sof/ipc4-topology.c |  40 ++++----
 sound/soc/sof/pcm.c           | 169 ++++++++++++++++++++++++----------
 sound/soc/sof/sof-audio.c     |  49 ----------
 sound/soc/sof/sof-audio.h     |  17 +++-
 7 files changed, 170 insertions(+), 154 deletions(-)

-- 
2.48.1

