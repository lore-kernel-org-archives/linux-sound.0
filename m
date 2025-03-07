Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB3A217666
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 11:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346865; cv=none; b=LlcQ/QDGPyWFJrzQWTSlNVCh1MCVj5PCpNwEoRVI3kLEW0IvFoGCmoioUmw5QlewQhOWXgi5uRFqzVUt7qRPgLKdkyQBRbHO/sBSgA+mfB3n+nYPf/VXbnLqAst9FQnzlt9nLs7weiirZEELx41U5AfVEhaXrVEDoI1VrMXnf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346865; c=relaxed/simple;
	bh=v2w43s369y/BQoHYB6/Lakq2gH7HgUAN+2bee9WPG+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DoJGzS5wcGQgKJeAr8T/GHqcyAm8EeLucXkJ8lyOHHxl0zGi6Cp3qSBvaqbk7oOj3gPUrvdNkhP/a5NF6BRtXy1TF37F8ywYKaQ0lVqK9mVcBmXlymraf/Y0PaYtaAkCnjx/ii+TsxeoKzSEgO04XbirglZp4al1OK1L4tbDYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpL21H/w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpL21H/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346863; x=1772882863;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v2w43s369y/BQoHYB6/Lakq2gH7HgUAN+2bee9WPG+w=;
  b=KpL21H/wgT6spfjJ/liKIOBFzQwyTNGqbv4p7OZoRvC39oATaER1ETnu
   RDIBBiMbyP4MzpTwNoW+ojsDFv8ZpfeEkDjTPOsBG6rOXkqYht643a2bu
   1IFFFuttpjtshJlZHjKoSIOoODfo0Xc2azH5TAsl3sQxEoJ7ZjQLkJ309
   MG3bkWykPz5Az7fHjs0B8n2w9ghqmZTSR6WNRbqNHunlH0wR8eKEeBIK+
   QMnJFFNFzfICXrIhpBd3eZBxj2LH1EgYN4/MQBkhWUBb76mzkFqH1rUpY
   0w3jGDHsHHhc1B5Qzjg2ZdpITEZY27VdBCSb6ZvA22YGXiONDWn4OYnTz
   Q==;
X-CSE-ConnectionGUID: 18B2NOIESryd4pW4Zk6igg==
X-CSE-MsgGUID: HlUDUewBQjOMJswflKjeHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29972276"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29972276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:42 -0800
X-CSE-ConnectionGUID: hoozstOlTbug5vGxFrvqTg==
X-CSE-MsgGUID: 4OOLRnO4S6eRiRIjjS51Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124390672"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	amadeuszx.slawinski@linux.intel.com
Subject: [PATCH v2 0/8] ASoC: SOF: Intel: Add support for ACE3+ mic privacy
Date: Fri,  7 Mar 2025 13:28:08 +0200
Message-ID: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changes since v1:
- Use type aware condition checks for 'alt' in patch 8

Cover letter from v1:

ACE3 (Panther Lake) introduced support for microphone privacy feature which
can - in hardware - mute incoming audio data based on a state of a physical
switch.
The change in the privacy state is delivered through interface IP blocks
and can only be handled by the link owner.
In Intel platforms Soundwire is for example host owned, so the interrupt
can only be handled by the host.

Since the input stream is going to be muted by hardware, the host needs to
send a message to firmware about the change in privacy so it can execute a
fade out/in to enhance user experience.

The support for microphone privacy can be queried from the HW_CONFIG data
under the INTEL_MIC_PRIVACY_CAP tuple. This is Intel specific data, the
core will pass it to platform code if the intel_configure_mic_privacy()
callback is provided.

Platform code can call sof_ipc4_mic_privacy_state_change() to send the IPC
message to the firmware on state change.


Regards,
Peter
----
Peter Ujfalusi (8):
  ASoC: SOF: Intel: mtl: Split up dsp_ops setup code
  ASoC: SOF: Intel: lnl/ptl: Only set dsp_ops which differs from MTL
  ASoC: SOF: Intel: mtl: Stop exporting dsp_ops callback functions
  ASoC: SOF: Intel: Create ptl.c as placeholder for Panther Lake
    features
  ASoC: SOF: ipc4: Add support for Intel HW managed mic privacy
    messaging
  ASoC: SOF: Intel: hda-mlink: Add support for mic privacy in VS SHIM
    registers
  ASoC: SOF: hda/shim: Add callbacks to handle mic privacy change for
    sdw
  ASoC: SOF: Intel: ptl: Add support for mic privacy

 include/sound/hda-mlink.h       |  25 +++++++
 include/sound/sof/ipc4/header.h |  13 ++++
 sound/soc/sof/intel/Makefile    |   2 +-
 sound/soc/sof/intel/hda-mlink.c | 127 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c       |  34 +++++++++
 sound/soc/sof/intel/hda.h       |   4 -
 sound/soc/sof/intel/lnl.c       | 117 ++++++-----------------------
 sound/soc/sof/intel/lnl.h       |   6 ++
 sound/soc/sof/intel/mtl.c       |  74 ++++++++-----------
 sound/soc/sof/intel/mtl.h       |  15 +---
 sound/soc/sof/intel/pci-lnl.c   |  12 ++-
 sound/soc/sof/intel/pci-mtl.c   |   8 ++
 sound/soc/sof/intel/pci-ptl.c   |  17 +++--
 sound/soc/sof/intel/ptl.c       | 106 ++++++++++++++++++++++++++
 sound/soc/sof/intel/ptl.h       |  19 +++++
 sound/soc/sof/intel/shim.h      |   2 +
 sound/soc/sof/ipc4-loader.c     |  33 +++++++++
 sound/soc/sof/ipc4-priv.h       |   5 ++
 sound/soc/sof/ipc4.c            |  18 +++++
 19 files changed, 470 insertions(+), 167 deletions(-)
 create mode 100644 sound/soc/sof/intel/ptl.c
 create mode 100644 sound/soc/sof/intel/ptl.h

-- 
2.48.1

