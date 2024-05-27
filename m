Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E459561FDF
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838788; cv=none; b=Jl6EcSAfUav5jvIJ2QgwZSbUZVvAtvJR//aD/erwNNX167LnpCGl+giSARrJrQrfZSjSHsme3fyEhy0ZsKkr6tte0PGHQUTO5/aBd/u+SFTPXci+kQSa15oZnqfBH+qJGWfMwz1gnZmqSsVmb5jKvsjxnI6BnUUT7zMGlUJOthE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838788; c=relaxed/simple;
	bh=ukarTAUvz5kRDAKuBIB3Tbzq5NS+8cQH9p792UOeg9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5atEijNe1EvPuSmGDp7AoEByPqQxgAPoFw3R0G6oZzTpp3H0Q53FsrE8iE4KpFLeUTb5Z/k+4LyUo5kFOueLE5U/wwt4nP2/CAW+7uwcN+3Pz3mTJUbKqmdEDv39Mx/5ZoNCfLxgAtrWn72RP9xGWLgFTNLgBAfW1cPnPn/MGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHeMhWB7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHeMhWB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838787; x=1748374787;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ukarTAUvz5kRDAKuBIB3Tbzq5NS+8cQH9p792UOeg9A=;
  b=nHeMhWB78Z0zBvKxWbh3g1ykDqTcl5gAy2PlWJwztrqkuD3kBqIdZ1t6
   0RtDV3QW9LBy9SUyckHP6hPrR9uG9HB4KqOGfHqdcDxlGqSPpH4DUCVsD
   0PhRURVnv9trsUFsqgcYuziOFxNwApJoQwgAg/1Lm9SEVRr55lmb/CwBG
   Gu9AnAuoKqXdj6lM3uF8aM7pY56apokkv06LIUUSbiA2WzrW1L9gFhkml
   1Y171dQ+BjUtNAyM92jaDfdmmKTKVYyFu2Iju7iba7Kl46mT8ZX0otz4M
   OxRyaGs0QWvx5yv4VkJw6auHqSeOTfXF2zBxymLqPPyERw/LqtVtg8IW0
   w==;
X-CSE-ConnectionGUID: g4q9vf8gT1iAZ4NA8O1zXQ==
X-CSE-MsgGUID: O4Rci0EFQYm5S3FoFKuZrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38550739"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="38550739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:39:46 -0700
X-CSE-ConnectionGUID: AGd9GxHsTy+9Cc27GOdLmg==
X-CSE-MsgGUID: Walrv7KbT4etmdIdH6fuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="34733865"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:39:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Intel: hda: print PCI class info only once
Date: Mon, 27 May 2024 14:39:36 -0500
Message-ID: <20240527193936.165702-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the deferred probe mechanism used by the gfx/display subsystem,
we see this message repeated for no good reason. Print the information
only once.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index e6a38de0a0aa..541c6052d4ed 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -783,8 +783,8 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
 				pci->class);
 			return -ENODEV;
 		}
-		dev_info(sdev->dev, "DSP detected with PCI class/subclass/prog-if 0x%06x\n",
-			 pci->class);
+		dev_info_once(sdev->dev, "DSP detected with PCI class/subclass/prog-if 0x%06x\n",
+			      pci->class);
 	}
 
 	chip = get_chip_info(sdev->pdata);
-- 
2.43.0

