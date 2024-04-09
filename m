Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5324B4A
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651912; cv=none; b=mlBR34pAteSisFEQW+b0Trg5p64+2Q26An4FcskTMQ4ZNHc5WQ3LuTYeICjcBcvjGokBHcaEoDiu8cUHsdpF5POH9ZwJzCjLUi3c9g4v0/bmXKgz4YolIt9hWiQ79wIrSQZRikKNyI70WH8iKdDIiGG70HAoPwgqs4sKt2fNd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651912; c=relaxed/simple;
	bh=BbtYQFRPgQ4gbAM2LFrDe+HxExkkAD6ilGffcnPLHPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwZkIvYSJp2WyZHb9KtLqoeG7BatUyOcME8fwgFzWg/sjspUOI86Aj2A/b5+f8AQY+OTJ+9CR5zHlJiddJwOu/PyWdIXDphs9XZ+a5WFi7LpoO66VRPjxTXgxXNb4x6l5RdCaMxH42Mw6YAappNGxIEhgZcGF0VjLkgqGNLUKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+TMIEsZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+TMIEsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712651912; x=1744187912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BbtYQFRPgQ4gbAM2LFrDe+HxExkkAD6ilGffcnPLHPc=;
  b=m+TMIEsZcb0hmb/fzdyA20Tlp+DirYioaIthv35/v0uRGgt6Y7GWvU6u
   Ew/fDEpXQ55f52zyI3Ba8qZROi6kzmzc9ViCm6YnqlYKbZOQinja+s/ha
   H6PIdK1jcfDNQJHs5v07rf3nOZMWg/mbrycZUe4LgGCteOkQIhtBrXgE7
   cLepsIf3L/FPU5GmoS+vypNoMWS1y1jilgRsBr6VdBba8lOtQq4Bm4lWi
   dYMzjnDwbx/AbK605XorXvn/2iHzbWBee8i5+vJX+hlzwOlt/zeXVYlps
   PABQf0s0Y8f2X8mftWFiZvKuByvb74C3yjaPpOFR040ErBAbadMCJu7/e
   w==;
X-CSE-ConnectionGUID: psvskBX6Ri2PRIYjtEO4Pg==
X-CSE-MsgGUID: xWlWRvWoTOGQvOstswxOFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19108956"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19108956"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:31 -0700
X-CSE-ConnectionGUID: 7B1Nw+PyR1qDc+WrgfpqFA==
X-CSE-MsgGUID: zFyXZ90lTqCF6g4+tPaa5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20189868"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:27 -0700
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
Subject: [PATCH 3/5] ALSA: pci: hda: hda_controller: Add support for use_pio_for_commands mode
Date: Tue,  9 Apr 2024 11:38:10 +0300
Message-ID: <20240409083812.14001-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
References: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the use_pio_for_commands flag in case AZX_DCAPS_PIO_COMMANDS quirk is
enabled.

When the PIO command mode is used we can re-use the existing
azx_single_send_cmd() / azx_single_get_response() functions safely as the
CORB DMA is not going to be enabled in snd_hdac_bus_init_cmd_io().

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/pci/hda/hda_controller.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 206306a0eb82..8af5ee1b0ea8 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -914,7 +914,7 @@ static int azx_send_cmd(struct hdac_bus *bus, unsigned int val)
 
 	if (chip->disabled)
 		return 0;
-	if (chip->single_cmd)
+	if (chip->single_cmd || bus->use_pio_for_commands)
 		return azx_single_send_cmd(bus, val);
 	else
 		return snd_hdac_bus_send_cmd(bus, val);
@@ -928,7 +928,7 @@ static int azx_get_response(struct hdac_bus *bus, unsigned int addr,
 
 	if (chip->disabled)
 		return 0;
-	if (chip->single_cmd)
+	if (chip->single_cmd || bus->use_pio_for_commands)
 		return azx_single_get_response(bus, addr, res);
 	else
 		return azx_rirb_get_response(bus, addr, res);
@@ -1188,6 +1188,9 @@ int azx_bus_init(struct azx *chip, const char *model)
 	if (chip->driver_caps & AZX_DCAPS_4K_BDLE_BOUNDARY)
 		bus->core.align_bdle_4k = true;
 
+	if (chip->driver_caps & AZX_DCAPS_PIO_COMMANDS)
+		bus->core.use_pio_for_commands = true;
+
 	/* enable sync_write flag for stable communication as default */
 	bus->core.sync_write = 1;
 
-- 
2.44.0

