Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D9F1EA73
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 19:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712605318; cv=none; b=gxMeIpaWuFyrrroQOYy7OVfdcmf3t4vA8i5L8ybCx6oSbynkde/LbLYKBPYCPO+aUu9hWa+Ax5huKm4LqvZ85VAlVHB+xN0B9Q17j/H0wZZoZsPTKYODxoBs6m5y+aNF6pWq/bn7IPYpkrHd49NsrMU97VOzjvqXE8dcBvrXBks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712605318; c=relaxed/simple;
	bh=TIadecTE3985GwTBQfEGz7kUZ3pqi8fCWoZggG5Z3LU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NuCm5RKX0WlokMvcSWQyyvgJcmegBvvqahfy2OABhVG/vx+CpbxADRTumApS79UW00XbrPKQRPOO0uFD8eY8tDGFPkpz0izyZv4xjb4M+eCCei8hGIZWw5870Qy1LcbXCRG1k8gCT3oCsuej9o64waU0fpD6lggrMIdTHfa9C8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7X2MOjf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7X2MOjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712605317; x=1744141317;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TIadecTE3985GwTBQfEGz7kUZ3pqi8fCWoZggG5Z3LU=;
  b=V7X2MOjf1CqRNAnJykeYeDxsUdjUbcWuBaF7zG99JQzLUwN2pW4SwCCj
   1uMEtVd56aE/HyzjqHtZ8nk5CLJWd1WbYLChNeHqyIRcYDRVHulwLv+L1
   vMatEkL81HUVYRC5cilkecM97L78+X82LSlGfgGVmDNKNDUOCV9IHY0lz
   uTn96kbcRtc5B6uInpGpASooUnrQVAi/UPbceJX9eDhOdSNYNMPzQkHxy
   gEnTDEX2kE2/73Sla58e7fqKKXyMFr3ERBa2kxbxIwbLKPfDGVccJO3Ng
   ZfKl3XxQHqfMGHKYvSB1gxTDylrIrQ3bCnL0I8n4BWeut+D5OiuMqY7Z3
   Q==;
X-CSE-ConnectionGUID: ab4MUxglQZC9e/nZfYbKfw==
X-CSE-MsgGUID: g7mg1eWsSZGQUuJXyBqg/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30390448"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="30390448"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:41:56 -0700
X-CSE-ConnectionGUID: e4fToc17SeCIgDvnxJFXHg==
X-CSE-MsgGUID: B3r9OxdmQWG6U9mmR3TZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24776953"
Received: from aikuseru-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.40.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:41:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ASoC: SOF: misc fixes
Date: Mon,  8 Apr 2024 14:41:44 -0500
Message-Id: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We somehow missed the default path for DSP libraries for LNL, and need
to restrict support for D0i3 w/ IPC4. Also add debugfs support for
firmware profile information so that sof-test scripts can show what is
being tested.

Pierre-Louis Bossart (2):
  ASoC: SOF: Intel: add default firmware library path for LNL
  ASoC: SOF: debug: show firmware/topology prefix/names

Ranjani Sridharan (1):
  ASoC: SOF: pcm: Restrict DSP D0i3 during S0ix to IPC3

 sound/soc/sof/debug.c         | 18 ++++++++++++++++++
 sound/soc/sof/intel/pci-lnl.c |  3 +++
 sound/soc/sof/ipc3-pcm.c      |  1 +
 sound/soc/sof/pcm.c           | 13 ++++++-------
 sound/soc/sof/sof-audio.h     |  2 ++
 5 files changed, 30 insertions(+), 7 deletions(-)

-- 
2.40.1

