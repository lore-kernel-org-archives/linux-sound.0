Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5350218C1F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145953; cv=none; b=kG40v8ganL1Dt0v8SNP7AnGH4jdaHIdd5saILRXDCTP4T/uKRFfO3CM1awtWK6TMeFxEcyIN1YDFSO9sJL8bjQWcbFP4C9+mt42r5BMEvWnOa6WlgulCAitY3gomg7kc58BBAaf1D1HYv5plUOUL9aorb2sboVkrCw4518uzSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145953; c=relaxed/simple;
	bh=eM/sttqnYNYtqvj+qs1fjCmYwwwzfirvpY5itd0R1kI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JzxjtPfwCFhHOps6DDpSQTt1Z/IzlULTPW9nKsO0fH2DiZAqm6M0K+GahnDiciPmTYVraiue4bQAmZog3TztgwHaa6X06CclZX1BLj5MrMb5k568liYTNfIvBfpCzWa51lDhML1ET8a2DXRUCJNwFYHdxFefdpNY3pzq8IUNJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSGsmjZm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSGsmjZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145952; x=1745681952;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eM/sttqnYNYtqvj+qs1fjCmYwwwzfirvpY5itd0R1kI=;
  b=VSGsmjZmytBVl8GMcRLttbeNi/X2IqRMO8q8Hhs89tmGI5bwSiZovv6J
   sbx5b4NnjBDckG4AK3Ul4VrU1yz68GpZIVsasIE50rCmEhKCKt7+goxY8
   JnvE2Rm8UDxRcvC1u+UofBxikynW6djk1l1+kPC7xXOEcx7t3FaTVhiU9
   YUyka9HKIcgZqNOpmO9FOQN5JMTejulTQjofNRLkBYKPS3mCvI96hee56
   tSWuuB96nXlnIl3KPJLf3LCfcM7kKxQT4Vwn/DfqmKUUrLTatA7NgQeR4
   6bkaq+eE6VYckUpL93QBqG7ZTeOHW6eW8geCQ0oG3t1a38xuOjFRVpNvT
   Q==;
X-CSE-ConnectionGUID: wsN/L6JATkq78ZNA98PQXg==
X-CSE-MsgGUID: jD+FuOYgRi+HOmkCHb3vaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718426"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9718426"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:10 -0700
X-CSE-ConnectionGUID: vuhXo5NPT1GQZobhfCYJdg==
X-CSE-MsgGUID: O0vOHuzxQwW5Ph6otZtkwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="56623531"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/5] ASoc: SOF: misc updates for 6.10
Date: Fri, 26 Apr 2024 10:38:57 -0500
Message-Id: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes when fw_lib_prefix is not set, updated error messages, improved
dmesg logs to SoundWire configurations not supported by ACPI
tables/topology and support for IEC61937 passthrough.

Peter Ujfalusi (2):
  ASoC: SOF: debug: Handle cases when fw_lib_prefix is not set, NULL
  ASoC: SOF: ipc4-topology: Advertise passthrough capable PCMs (using
    ChainDMA)

Pierre-Louis Bossart (2):
  ASoC: SOF: Intel: hda: simplify and reduce indentation for
    hda_sdw_machine_select()
  ASoC: SOF: Intel: hda: list SoundWire peripherals on mismatch

Yong Zhi (1):
  ASoC: SOF: topology: remove incorrect widget id in error message

 sound/soc/sof/debug.c         |  23 ++++-
 sound/soc/sof/intel/hda.c     | 154 +++++++++++++++++++---------------
 sound/soc/sof/ipc4-topology.c |  50 +++++++++++
 sound/soc/sof/topology.c      |   7 +-
 4 files changed, 160 insertions(+), 74 deletions(-)

-- 
2.40.1

