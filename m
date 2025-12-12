Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEC331771F
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534433; cv=none; b=X51QG3HiEG7PlR3nyyGDU9HWLvoq12jb99MVXUGLPT2zB7pSjSxpWsfaVbfOPZk6juMTpMOiFT0HXLq0UkzuzXvMKnJQeMB0wxBxk/zmiack4BnKviODAl/n2wd43WkFmAtALQYamABKwQoQBI4TPMhieMVB69vGHQJ94gffk7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534433; c=relaxed/simple;
	bh=4dwI72Wu+xo3hyNk1KFr9Dl00AxxMakXW0pVz2wVc7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l648lr54Gn6gpc/oig07XBwgKAcZXG1TdfhdMe7H2K+1qcqZUgJGqCdVVdPoFU8GQyMlM1A3qbGw4lmQCxJvGPdDuKF21wC/ODlRMeYZREEugOtJdJzyxRa9nWfEyb0wdNIiVzAQo1WDzEMolrEe3S3wICJ7IvRB9ROZirKol2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNtpO9C7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNtpO9C7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765534431; x=1797070431;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4dwI72Wu+xo3hyNk1KFr9Dl00AxxMakXW0pVz2wVc7Q=;
  b=RNtpO9C7yfsc2J/J28yRlUr0vqLcMWmOU25qvCQP76FFZs/JPGpGkU26
   zg6Nf0IC5ZVRfecL5q9YVpypvwxpTzuW3V6r8EVdlbN92TJbCko0mFpAW
   TFIhORyqmZYNeC6wzCBUjXyVZaSE6657a9HXgUwx3CAAbIesJMUs79FJj
   eCVNmvMhp4ibFqB0Rhmu1OV+LPu7Zw54Ec+RBz4uqdWA39viGjXLSmmeq
   FTNfgmyeczfh2CvCM1zRY2ELrUDRJxZt5w4K32of+G7CtH4+83tceCel1
   EtkRlXUUHGX58u78Pvun2LgrjEiJ8nHIKux/3Ybgz4XVq+/dlRnbfABve
   Q==;
X-CSE-ConnectionGUID: UhdMhNk9RTW61s5481h6RA==
X-CSE-MsgGUID: 7ZlDZZDlTzuKGxx/gkhPzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78891323"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78891323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:13:50 -0800
X-CSE-ConnectionGUID: buJnetPwR4ahPeQWFamqQA==
X-CSE-MsgGUID: UOTW0vVXQciNO6sedaWZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234444918"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 02:13:49 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/5] ASoC: Intel: catpt: IPC log improvements and code simplification
Date: Fri, 12 Dec 2025 11:38:53 +0100
Message-Id: <20251212103858.110701-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Entire patchset provides no new features and does not alter the code
from functional (user) perspective.

The first two improve IPC-error logging 'mechanism' and align the
catpt-driver with what's done in another Intel's driver: the avs-driver.
In essence, no need to log the error in every function, let the common
handler do so instead.

The last three simplify the code, and fix some spacing issues.  All in
all, we get better readability with lower LOC.

Cezary Rojewski (5):
  ASoC: Intel: catpt: Move IPC error messages one level down
  ASoC: Intel: catpt: Update CATPT_IPC_ERROR macro
  ASoC: Intel: catpt: Simplify catpt_stream_read_position()
  ASoC: Intel: catpt: Specify image names in the device descriptor
  ASoC: Intel: catpt: Drop superfluous space in PCM code

 sound/soc/intel/catpt/core.h     |  7 +--
 sound/soc/intel/catpt/device.c   |  6 ++-
 sound/soc/intel/catpt/ipc.c      | 12 +++--
 sound/soc/intel/catpt/loader.c   |  8 +--
 sound/soc/intel/catpt/messages.c | 89 +++++---------------------------
 sound/soc/intel/catpt/pcm.c      | 46 +++++++----------
 sound/soc/intel/catpt/sysfs.c    |  2 +-
 7 files changed, 49 insertions(+), 121 deletions(-)

-- 
2.25.1

