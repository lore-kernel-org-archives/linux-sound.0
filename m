Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800C8217641
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426283; cv=none; b=k7PncZmjxdJi4BYGX+t5HHEoKgNc/Grn9xEiFGZioJOHCSLSRo3+vEiFP6b+W8tOzLI4XbRqSodHOTsVlJsl2dwC42ZjWE6AuaxokMSJNWOR+A6yZvIYM7gQXRgZX6uCD1IsYfytgQTB9iPOBBDCJWgjStGpyGynPPUlMMw3DKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426283; c=relaxed/simple;
	bh=mSRLZ5+US7N/QVCVq82F35J2d6dmlhNp/If3h1NWcBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dz2aOYS3dIDC7muBv6hC0MEROQdFv+O55bDnMcHI1T3CkF5L7QxWV2XnfRQThu+dgcEXaBtMmkwqTI3bzWpNn+3eQYJDLTkjh2NvyLjJ0T0lwGDfb1PzIvx7q4Ad4b0o9iRyZVGIQYuzZOldgwMFOyJlOnzZbAapEVvdkC12umc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gktdzqpo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gktdzqpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736426282; x=1767962282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mSRLZ5+US7N/QVCVq82F35J2d6dmlhNp/If3h1NWcBU=;
  b=gktdzqpoquFgb6MyhCpaLhCeNr0P8eTne+XpcqJtRkaspTBGBRNeyfGw
   lQXxf/nW9QwDXeRI+k+CZYmrPl1MGRSBQtxi+ZK8yCQNlzSPVSjFgAUid
   dmERBPWZSAxRezqWJoHY84DlKvY+e0KH1wjUvYkcDIUXHYlHey+rkGQdJ
   vT7EouUozI4aX7tDFZ9PEpKiYd2nwHowa1iJekm2DsYFiwlvvHUXDPV95
   Cu9oYWMIU73ZLH8KVn6UPBUyofiEyYLhxmxIOZeb4PCvEhFpmCpAp3Q/S
   aUw0CVkyzeAQQsaqghsfZ4R/ifyerJ0a7cKQ8aT1iP24umNwuA9FK2XVZ
   A==;
X-CSE-ConnectionGUID: eLbXWdKNRzGtqEhSj0TrIA==
X-CSE-MsgGUID: 8M7EgMmISDquVHRlsZyFYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40449773"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40449773"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:38:01 -0800
X-CSE-ConnectionGUID: 31YF1PDmT8yUphd51NH3qA==
X-CSE-MsgGUID: RUbCRNlpT8u6HLugyaOBQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103194310"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 04:37:55 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/3] ALSA: hda: Compilation and firmware-loading fixes
Date: Thu,  9 Jan 2025 13:52:01 +0100
Message-Id: <20250109125204.3668961-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small set of fixes, two of which are self-explanatory: address
compilation or static analysis problems.

The most impactful change updates the firmware loading flow so that the
binary is loaded in two chunks rather than just one. This is to follow
recommendation from the hardware team: SDxLVI is expected to be at least
1 (0-index based so 1+1=2 BDLEs) when performing any data transfer.

Cezary Rojewski (3):
  ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
  ALSA: hda: Transfer firmware in two chunks
  ALSA: control: Fix argument type mismatch

 include/sound/control.h     |  2 +-
 include/sound/hdaudio_ext.h | 16 ++++++++--------
 sound/hda/hdac_stream.c     |  3 ++-
 3 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.25.1

