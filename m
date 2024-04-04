Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B613132C15
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257448; cv=none; b=QIlMXMxQPdESs9WCnHYPPXfvj9E8n+QVkCudaxKKwrDfPqCrEbhOygPA/FUaF2ALNP9RqyPPnwL+2NSyMB5liWT5q7L3sLfU4eP7EaHmbnZJt9ROteJKCTA/SDvAchpm4SxWg6SmwCRZL7EJ0XhWIRZwMvuvh+/0YFPBTNcBxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257448; c=relaxed/simple;
	bh=B0x6Qj2oJDAKQ1Pdrq4ENFEU6JUEvp6eTkcc5HdjsWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ru1/IYrixfmy/YBKM0x10/iXRIybQHFl7WP8MkVG+BUUG9tKCh8X0OMTrRxk2gB1Ur0F8sO+zi8aWyop1rz8SaqkF2JwkADPt3jHa4cBtU5UTFVx19KB1MhX5NhFXM4VEgQheqqiRcYaUuAIG09DEr22Y5wjBE7+B0bEJkuFU0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuEV91cF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuEV91cF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257448; x=1743793448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B0x6Qj2oJDAKQ1Pdrq4ENFEU6JUEvp6eTkcc5HdjsWg=;
  b=PuEV91cFTPMRgAsHP2xpmmZhhkyId5aDDQaqQIs6QcP2QtSJo1cAn7Tr
   HOtwxWVCP/tmyqkfWrI3dfnDNiF234dGd7DaimnWc36rZuLXnGsRF7MZE
   9hOXl9koUGtrQCJzVEi3rBWq4dLJhoqHKvQjMPiFGDpjsoUDfaKP4IWfh
   zV5661kcygdh8jk3O4OLGCws7Gf2I6o26i/XJMEIV7ecli0bRi2I8cqQ5
   co2nBm9pQl3Iyg2NDW/AjAuaK2zm9HLkCuKp8ePtm2jtDO2o7E2IBM/LD
   SfIPKbDX0dVyPohZFV1gaKmKfP3HTvEt6i7bLjD6fWmkohdLdJeFF69AE
   A==;
X-CSE-ConnectionGUID: 3QkD/zyJQAC12Uz8D6rZ9A==
X-CSE-MsgGUID: pa1zL0TqTGefRVsq0nLqHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433875"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7433875"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:07 -0700
X-CSE-ConnectionGUID: 0c2LHNSvR/2Me+42bP4DTA==
X-CSE-MsgGUID: n9hlvTysRp+tGEPcu0YZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19492318"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Keqiao Zhang <keqiao.zhang@intel.com>
Subject: [PATCH 4/4] ASoC: SOF: Intel: hda-ctrl: only clear WAKESTS for HDaudio codecs
Date: Thu,  4 Apr 2024 14:03:57 -0500
Message-Id: <20240404190357.138073-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a PME wake happens due to a SoundWire wake, we currently clear
all WAKESTS bits during the resume operation initiated by the PCI
subsystem. As a result, we are unable to identify which SoundWire
links need to be resumed and don't properly handle jack detection.

This patch only clears the WAKESTS bits for the HDaudio codecs
detected earlier.

Note that we still clear all WAKESTS bits unconditionally in
hda_dsp_ctrl_stop_chip(). The existing behavior is potentially racy if
e.g. a jack event happens during a suspend routine, but there's a risk
of breaking shutdown or reboot sequences so the code is left as is for
now.

Closes: https://github.com/thesofproject/linux/issues/4687
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Keqiao Zhang <keqiao.zhang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index b4f0756e21f6..6d941209847f 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -228,7 +228,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 
 	/* clear WAKESTS */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
-			  SOF_HDA_WAKESTS_INT_MASK);
+			  bus->codec_mask);
 
 	hda_codec_rirb_status_clear(sdev);
 
-- 
2.40.1

