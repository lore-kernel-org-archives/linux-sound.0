Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E547EEF6
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651899; cv=none; b=jq2MTs+R3SRixIx7zmdFMQ/7mk9BcCl6paALyO8sVLszDCNiQJMIzCWUWW0q1mmIpgpjmAacVAoBEoQueHGLhSgK9n+pebjAudhzR0SjvBsPgDDAL4Me9A1DgBd7IIpuBpRNOV5RFA5qxI1yBixBvnAcc4agf2483itDmHpuzuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651899; c=relaxed/simple;
	bh=JY4oxYHMpZE5yHH86rA/MPnU0AW9nEbggFld0K5ZgPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PY5jtOiGhNF3h3rRI+1ThFEQ5SCX4IEdBLekuwhwnChXsXYoKmkWU4LK93eLzduxKEngZ81k1onrJBA0dTOy6owJrQfyBaLisX48TaPuvloNA1Lo9cnQhERx7UfIsbuLo+zSxHpCEIZ3mOfg6ca6uT3Zp5z8ZuGVZwKsSsgFP+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWuHdc/A; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWuHdc/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712651898; x=1744187898;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JY4oxYHMpZE5yHH86rA/MPnU0AW9nEbggFld0K5ZgPc=;
  b=DWuHdc/AYvusahIL4X0BEWslWNpoBwBopYuqYvSvzfLjhtoddRtJXHXA
   737nSY/6OAzNYtzBs/AmKFlgxUJYpShJD99MR6Q1nkvF3coD9Nxt3v4il
   Syk1wsL4znXwgUkikJrFpDsMNn/e2GSXj20g+OHxwiu2D61TipY4PbBGK
   aOE3a0Rdj42rxOsdtd7dU96UGoCslzHPR0m6XqaH3h55zWC1pEX19LBwg
   wgWfSlCb6x1Hj1FhWW+9DSJu1zpO/YRpgi4ZI67zz8ZrcWvdrZyHJsmdG
   1tSUA29+QtRGkmtl9hbWZmionR70boErj40P0gqvxSuFNmtj9TJubNr8c
   w==;
X-CSE-ConnectionGUID: TvTn2XYHT4Cj4XAFNNvgEA==
X-CSE-MsgGUID: zqvEeoEFQyOFmsiJ0992Wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19108934"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19108934"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:18 -0700
X-CSE-ConnectionGUID: h06FXsHQRQKt8QVJTq4ZnA==
X-CSE-MsgGUID: II7fPU62QmWOoo28gf8yTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20189835"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com,
	perex@perex.cz
Subject: [PATCH 0/5] ALSA: hda / ASoC: SOF: Add support for PIO command mode
Date: Tue,  9 Apr 2024 11:38:07 +0300
Message-ID: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series will introduce support for using PIO for commands (immediate
commands) instead of CORB while retaining the use of RIRB for unsolicited 
responses (notifications).

This mode of operation is the recommended one for Lunar Lake family. 

The series adds support for the PIO mode for SOF and the 'legacy' HDA
stack to make sure that they will work correctly when Lunar Lake is available
for consumers.

Regards,
Peter
---
Peter Ujfalusi (5):
  ALSA: hda: Introduce flags to force commands via PIO instead of CORB
  ALSA: hda: hdac_controller: Implement support for use_pio_for_commands
    mode
  ALSA: pci: hda: hda_controller: Add support for use_pio_for_commands
    mode
  ALSA: hda: Intel: Select AZX_DCAPS_PIO_COMMANDS for Lunar Lake
  ASoC: SOF: Intel: hda-bus: Use PIO mode for Lunar Lake

 include/sound/hdaudio.h        |   1 +
 sound/hda/hdac_controller.c    | 127 +++++++++++++++++++++++++++++++--
 sound/pci/hda/hda_controller.c |   7 +-
 sound/pci/hda/hda_controller.h |   1 +
 sound/pci/hda/hda_intel.c      |   5 +-
 sound/soc/sof/intel/hda-bus.c  |   5 ++
 6 files changed, 136 insertions(+), 10 deletions(-)

-- 
2.44.0

