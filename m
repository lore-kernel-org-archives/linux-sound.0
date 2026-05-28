Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4B330C15E
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957193; cv=none; b=ERQ65mWmmSM0+8AntbSG2y84OTSb49Rf12Yj6IeavKqCbpkjJoYDe4RxvySOgZRXoZG/YcdLc4YVvRi6nqEKEvcq1iWI3h0cnvNT/eAw4XDKkqaWu2IRSmloMl13d+DXprBqYj7Pkicf8XtULpJU+ZQuoHrcGFMwwquBhbQkcuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957193; c=relaxed/simple;
	bh=XJDbasH0eLjL8Mvv9AXPQdAUBGW3jRd/UulhcjCJhes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KKfnSFOiHlpnvLgnOkbT4kYor0PM5MKVCiZ7Xfksslk9K0XsJNT+sL5C34XXFAmN+a3+HizJYO94E1Kpcq5WAF39RRDqN7xUvAfYX4C/1XqmeB4dgMcs+bpZIw50BWSR5jrXWgHAq2220tLVWe9nAx4/+HBbN0tG5h30O5pl28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITiv5few; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITiv5few"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779957191; x=1811493191;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XJDbasH0eLjL8Mvv9AXPQdAUBGW3jRd/UulhcjCJhes=;
  b=ITiv5fewAula296NSkV5ushMN7eTBGUnZgbQF3/UL4hWoGbmLwJWM2eC
   KEry+KxUr26D4P1nViDjfMleOnSZRXbqFWuJXNjIdDDfnaIdKmDtqWfw8
   9PeivWmc2V3sN+Xm0U1DZ16ajBKT2SLeJMsJKEuySbh902YDfq1tfrqmc
   MX/J9vl9sUaBfin8hsNj/Nx9/BJeGJEgJnvPBGuhv7C5Ir8cwvSPIHCOA
   XCQbyy0mftRKVGXpHanX1XaPgD/h3H+a3FK19G0EEtgCL7vAnzOmosCGn
   NbCzF9ZPt1eIX8p1xrHXJdtpUJ7AwkYNv1SI6cwfX/iRki1lj+VutfOaE
   A==;
X-CSE-ConnectionGUID: y1QGWxsCQ4SUIreGmJygzg==
X-CSE-MsgGUID: t6rPKM6iQKau4LgL4D2ybA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79828670"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="79828670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 01:33:11 -0700
X-CSE-ConnectionGUID: Fap57inuTwSuBfZ6wypmCw==
X-CSE-MsgGUID: gu/HnLALTnG2WG+I6IaqYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266390212"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2026 01:33:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	krzysztof.hejmowski@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/3] ASoC: Intel: catpt: Error handling and debug improvements
Date: Thu, 28 May 2026 10:34:41 +0200
Message-Id: <20260528083444.1439233-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Outcome of a long debug to solve one, long-standing bug ocurring very
rarely on Haswell/Broadwell machines during the boot procedure of the
AudioDSP firmware.  Clever/unfortunate user can increase the
reproduction rare to 100%.

The bug: an exception occurring early during FW boot (firmware side, not
the software one) leaves the firmware hanging and the existing software
code is incappable of recognizing such problem.  The only solution a
user currently has is: rmmod and then modprobe the driver.

Recently, together with Krzysztof from the firmware team decided to take
it up and clear the dashboard.

The exception handling takes just a few lines of code (all part of the
first patch), everything else that this patchset is composed of improves
the debugability and logging.  If anything similar pops up, the
developers can see what's going on.


Changes in v2:

- moved the COREDUMP_RELEASE operation from dsp.c to ipc.c, right after
  catpt_coredump() to ensure it's always executed, even if the dump
  itself is not written due to -ENOMEM, suggested by Mark
- spelling fixes in the patch 1/3 message, s/COREDYMP/COREDUMP/


Cezary Rojewski (3):
  ASoC: Intel: catpt: Complete coredump handling
  ASoC: Intel: catpt: Add pretty-trace for large IPC payloads
  ASoC: Intel: catpt: Print error code if board-registration fails

 sound/soc/intel/catpt/Makefile    |  3 ++-
 sound/soc/intel/catpt/device.c    |  5 +----
 sound/soc/intel/catpt/ipc.c       |  8 ++++++++
 sound/soc/intel/catpt/loader.c    |  3 +++
 sound/soc/intel/catpt/registers.h | 12 ++++++++++++
 sound/soc/intel/catpt/trace.c     | 27 +++++++++++++++++++++++++++
 sound/soc/intel/catpt/trace.h     | 22 +++++++++++++++-------
 7 files changed, 68 insertions(+), 12 deletions(-)
 create mode 100644 sound/soc/intel/catpt/trace.c

-- 
2.34.1

