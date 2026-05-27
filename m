Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB693DD848
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875146; cv=none; b=HpWRfSZF5T1uIJBLXEi4s6Vbm83cEq8JflciQsnEc1W6VCNTLQWpjQGk1ojOR9kw3QMb3j6kRb3vx098C6eS1SfIOSimsm6ML1k64IDeQiCILV0KLP8wl96PdERfI7b5dzFACM/umkGnepdHFpyQOzEzcIJ62+j6NeP2zWtKTYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875146; c=relaxed/simple;
	bh=17Urt1h3/XqNKVfdRttFG19P+U5A6BBNe3+ylJH/n1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N7XB+kxRft5f24jFyASsgN3azrAsUohUBWG3m+GLmWYs8bbLkofqYaLJL1ST1M1r5eAnMQhEHZFF/AL/Nn/MH2Yj3wzwnfbsM7fqYUvCtJ1HcabpkI57aQ+LDyq+eyh/pQ3+/K8ELtpt7TRt5Xwv04rjiG2QQLJzMHlx9329rEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fuy/xawK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fuy/xawK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779875145; x=1811411145;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=17Urt1h3/XqNKVfdRttFG19P+U5A6BBNe3+ylJH/n1g=;
  b=Fuy/xawK8SNDvSyPx7b76O+yxY+0vNA7n+9KI5uh0MVGiN/tac/ihKn3
   +YXJeWrYqUzJRyjz4oNxMW7K4pIiea6dEA32ZVwdARWtCKorhhEibJYR4
   QlzFENijM61ZHomLcEfq3IVj/XHYsPCwiFzZw5s9hyqC9Hg0xx4VfJGoL
   /NzN06nPiNajm3SS7WMcsB88KkV+Ix99Iydd5lGoUrHEONsQ/DDSxfpC+
   +pFDC8hAUgXDJK7dLrNsDTQdteNgKKNb+3tWVGw2kNBEU5pMawNMqeTmm
   fMGzl4MY5goGLQ+JGKhZHgLHgol775ga5bvm62bnuYjlQ1JMBLHKHWv3Q
   g==;
X-CSE-ConnectionGUID: w1vcP7zuRcal2LBUrSgwrg==
X-CSE-MsgGUID: lpMAFeouRBiu+Pp+N9teWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84592668"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="84592668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:45:45 -0700
X-CSE-ConnectionGUID: ob9jU7KJS1qWPCl0cw9tkg==
X-CSE-MsgGUID: z0zTcN+1R7GfZyoFOK65EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="272519649"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2026 02:45:42 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/3] ASoC: Intel: catpt: Error handling and debug improvements
Date: Wed, 27 May 2026 11:47:04 +0200
Message-Id: <20260527094707.1432195-1-cezary.rojewski@intel.com>
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

Cezary Rojewski (3):
  ASoC: Intel: catpt: Complete coredump handling
  ASoC: Intel: catpt: Add pretty-trace for large IPC payloads
  ASoC: Intel: catpt: Print error code if board-registration fails

 sound/soc/intel/catpt/Makefile    |  3 ++-
 sound/soc/intel/catpt/device.c    |  5 +----
 sound/soc/intel/catpt/dsp.c       |  5 +++++
 sound/soc/intel/catpt/ipc.c       |  3 +++
 sound/soc/intel/catpt/loader.c    |  3 +++
 sound/soc/intel/catpt/registers.h | 12 ++++++++++++
 sound/soc/intel/catpt/trace.c     | 27 +++++++++++++++++++++++++++
 sound/soc/intel/catpt/trace.h     | 22 +++++++++++++++-------
 8 files changed, 68 insertions(+), 12 deletions(-)
 create mode 100644 sound/soc/intel/catpt/trace.c

-- 
2.34.1

