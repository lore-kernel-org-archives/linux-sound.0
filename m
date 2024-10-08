Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529E18CBFC
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385758; cv=none; b=XfngEA3BIfUleCnTmo6D16mK4pXhjQreInnWrFZgP17l6weL7ez99LUQRPyzEMeAO54crWjKJ+k1DWHIF774QOphUhmpehyTgOB7n3ABsDEVQ7V+Yt/RmGAiVRATm5uC0G9RtQB4UbmnenpWniGmrdZwkSzI6Fm61Aggko+XY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385758; c=relaxed/simple;
	bh=gno18OMZVd0B1dX2BmmepjgelFi1skn3wzAT0TgZMRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bzdOD05GB2DEIy9FCDB+p+tq98PfkkALvYdpkX20m9Bj8adpwkLmKcrp6+bdWoAM0FxvDBdarUy4Q9zbClsgYiSW5EKzBImTDRr65nyPMBqZ74O2Wgm9szw5FGaZXJPd5RMUVXfKFTibg+5oheS4jFRasinK14xkp4ySD4Vr44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+Dov71w; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+Dov71w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385757; x=1759921757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gno18OMZVd0B1dX2BmmepjgelFi1skn3wzAT0TgZMRU=;
  b=S+Dov71w9FZiNth6BKJRNLFB5qp9dR4Z6U//7VRnYzQmr7PIv0HWMVfO
   p3Og/feW/isSE9CEKE3YUw6kUMEX1U04oZVAjM/IPXdlGnpFj8he9FcF/
   8Rc2kce9rI261RizYAtnowWa/OtKVZBGBM1hO9DA9bltSyhV3sLNaPUpq
   6wYIeHuLC/TYaY0o3rgyrm/aTv9/QsAS8EAGoBFWkNhqBr+5XywOoSOZL
   xeccsQ/K2wyp4wp1CHbFrZgPD0GYbN3m4NN1P4reybsJiUmHlb7vDijhv
   Wmuh0pE57kSeaBTD2EGLebjgUyLsEK4iHRd1PcZnkeMR3jzHfZi5wCnVe
   g==;
X-CSE-ConnectionGUID: qRQWwkGyQaWx36asXCIcnA==
X-CSE-MsgGUID: FvAyUv7qRx+kTGSc6uwruA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45036969"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45036969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:16 -0700
X-CSE-ConnectionGUID: 48jKWXDYQ4CTMzPBbkb0Pw==
X-CSE-MsgGUID: awH9q+nkQSW6h1iwrgRK0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586618"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 0/8] ASoC: SOF: ipc4-topology: Rework the module audio format prints
Date: Tue,  8 Oct 2024 14:09:28 +0300
Message-ID: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

When the audio started we print out here and there the Input and Output or only
the Input audio format for the module that is in path of the stream.
This is mostly OK but provides inconsistent an - in my opinion - hard to grasp
information.

The series reworks how the input/output format is selected and tries to improve
the consistency of the prints by applying universal rules:

- Module is not changing the format or it has only input or output and it has
  single format on in and out side

	Audio format for gain.1.1:

- Module is not changing the format or it has only input or output and it has
  multiple formats on either in or out side

	Audio format (in/out format index: 2/0) for host-copier.0.playback:

- Module is changing format then we print the input and output ones
- Input if it has single format

	Input audio format for host-copier.0.capture:

- Input has multiple formats

	Input audio format (format index: 0) for host-copier.0.playback:

Similar versions for the output format prints.

Regards,
Peter
---
Peter Ujfalusi (8):
  ASoC: SOF: ipc4-topology: Drop the 'index' from 'Pin index' of format
    print
  ASoC: SOF: ipc4-topology: Use local variables in
    sof_ipc4_init_input_audio_fmt()
  ASoC: SOF: ipc4-topology: Remove redundant check in
    sof_ipc4_init_input_audio_fmt()
  ASoC: SOF: ipc4-topology: Simplify match format print in
    sof_ipc4_init_input_audio_fmt()
  ASoC: SOF: ipc4-topology: Use local variables in
    sof_ipc4_init_output_audio_fmt()
  ASoC: SOF: ipc4-topology: Simplify code to deal with process modules
    without output
  ASoC: SOF: ipc4-topology: Concentrate prints inside of
    sof_ipc4_init_output_audio_fmt()
  ASoC: SOF: ipc4-topology: Add helper function to print the module's
    in/out audio format

 sound/soc/sof/ipc4-topology.c | 375 ++++++++++++++++++++++------------
 1 file changed, 248 insertions(+), 127 deletions(-)

-- 
2.47.0

