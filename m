Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69172882C5
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212570; cv=none; b=bbQmKSRbPNKmpWXkSHRPlkblwjswvrET418u9lMYI6fA5kG6Xov2V1BYAo0yqORfXtehPjiVW6rhaizTsxrmmneIwr+jCdabQvGI/jlaHWQnAoP/dAGUigoevyHjOFDy5K6c3lJVvi6ZKY1GwejAZGHfiH5p6HzE7k/8naOIkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212570; c=relaxed/simple;
	bh=WyErHCdq3SBj0KQEYf0tZ81RY6kUqAXmhTmp+p7vhQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xww6QCFwtcR4fA9wglf60ZRvv+hZuJPaRZCOUB5tCqS1ByXMYF8ilsVWPfoEJvWzxlzuD3iUH7NM/gUrsriMj/UWGJn4fwLwXj0B3ozk/rEHnuqe6HPrHdGwskofOnHrwZSs81J6/UPTqGK61iXEuscRhTXfAQgYOkULX5DEvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGCj0b3s; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGCj0b3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212568; x=1799748568;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WyErHCdq3SBj0KQEYf0tZ81RY6kUqAXmhTmp+p7vhQE=;
  b=nGCj0b3seItjgJpaspCW/Rm1+w8RYh9XqDt6qHaFraQuTi3dmzKANtuQ
   mdnodageOU9MawREHfDver0hh9vb6q1IqEFMYnGmsX59YK3m/0942B5WH
   vxf9IwoeQxOMKvRhCfcKIFsw4nWLJ2JhJnLcDHFI+X9xY4OCFQL6hrhdm
   9ek62nM16aK6Lo8PmYP0YQEZsNSE2DRzfHmH0rNbi43lWKn4Lfh83e6LX
   KU7MsFPid0W7kg7Bh3DerYEY7w2c3Vb2XYYqLGNIN6VlNeQK4BojRg3Cv
   +RVibEACQyRBiswtrjqHMyTKHIpDmMC2HjopTDzFjBaOl9+bIq2cP0JZ2
   g==;
X-CSE-ConnectionGUID: vrPEnwvPT3C4BS/rNB8igg==
X-CSE-MsgGUID: Pn6uK/pkSBmlabhk7m7Fyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535245"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535245"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:28 -0800
X-CSE-ConnectionGUID: Gt59waLTQJ6+U10fT3EDSw==
X-CSE-MsgGUID: nqb8Z50KRf6IzFhtVShTEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208534704"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 0/7] ASoC: SOF: Use guard()/scoped_guard() for locks when makes sense
Date: Mon, 12 Jan 2026 12:09:57 +0200
Message-ID: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Only code refactoring, and no behavior change.

Replace most of the manual *lock/*unlock handling with guard use.

Regards,
Peter
---
Peter Ujfalusi (7):
  ASoC: SOF: Use guard()/scoped_guard() for mutex locks where it makes
    sense
  ASoC: SOF: Intel: Use guard()/scoped_guard() for mutex locks where it
    makes sense
  ASoC: SOF: amd: acp-ipc: Use guard() for spinlock_irq()
  ASoC: SOF: imx: imx-common: Use guard() for spinlock_irqsafe()
  ASoC: SOF: mediatek: mtk-adsp-common: Use guard() for spinlock_irqsave
  ASoC: SOF: Intel: Use guard() for spinlocks where it makes sense
  ASoC: SOF: ipc/ops: Use guard() for spinlocks

 sound/soc/sof/amd/acp-ipc.c              |  4 +--
 sound/soc/sof/imx/imx-common.c           |  8 ++---
 sound/soc/sof/intel/atom.c               |  7 +---
 sound/soc/sof/intel/bdw.c                |  7 +---
 sound/soc/sof/intel/cnl.c                | 11 ++----
 sound/soc/sof/intel/hda-dai-ops.c        | 25 ++++++-------
 sound/soc/sof/intel/hda-ipc.c            | 11 ++----
 sound/soc/sof/intel/hda-mlink.c          | 29 +++++----------
 sound/soc/sof/intel/hda-stream.c         | 11 +++---
 sound/soc/sof/intel/mtl.c                |  5 +--
 sound/soc/sof/ipc.c                      |  9 ++---
 sound/soc/sof/ipc3-topology.c            |  6 ++--
 sound/soc/sof/ipc3.c                     |  8 ++---
 sound/soc/sof/ipc4-mtrace.c              | 24 +++++--------
 sound/soc/sof/ipc4-pcm.c                 |  3 +-
 sound/soc/sof/ipc4-topology.c            |  5 +--
 sound/soc/sof/ipc4.c                     |  8 ++---
 sound/soc/sof/mediatek/mtk-adsp-common.c |  4 +--
 sound/soc/sof/ops.c                      | 34 ++++--------------
 sound/soc/sof/ops.h                      | 10 ++----
 sound/soc/sof/sof-audio.c                | 46 +++++++++---------------
 sound/soc/sof/sof-client.c               | 40 ++++++---------------
 22 files changed, 95 insertions(+), 220 deletions(-)

-- 
2.52.0

