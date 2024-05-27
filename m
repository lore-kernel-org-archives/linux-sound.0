Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2942C61FDF
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838699; cv=none; b=IzapzCicZL5qAcsG3lPpMpQSgrWHArCW8x5Goj5NR6DBilRjpIaNcny3U41bAG6+7Fqcgerk/V0p3SlOKdK00tlHlA9KaSMcPSKH8Q0GKNpVjR77cFSBjmGNH/9sB/Skce+x0JfvkqZuBM9ClkllMqr9U7issGvHTHUjd8U9JzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838699; c=relaxed/simple;
	bh=qcL7xbeSMDErVFyI4rRF6ar189USQKM7MaYTw28Whe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxGRCQuFWfb9k0ucXYJi+eGDnvSesKTWXw18fvIX1+OKu3Jg2ygaNl8GN1bkUq7x6moPO5JfpoXDNxVAY7S1MUBz7sAjoA7z3Q+f1L9Yc2q9Ba7O7SP05M4pb/Zl6g6UuVkJrP2RI93bSEZz3Rjp+vxw8beCJzzHKaRyBdv//F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCSncz4u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCSncz4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838698; x=1748374698;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qcL7xbeSMDErVFyI4rRF6ar189USQKM7MaYTw28Whe4=;
  b=RCSncz4uUyLEPnzMhq1x9muVQSW4hWxds7Fe/7vB+nl/pQ5ftVh3I/gw
   8PDXQgh1ieQedCL0xOhpzRhyQjZ2k5PEGWcSLIq0p+iTpJt9fXhA8hS5D
   +0LlZCFR8sixEwbAmzfpi0FQn/lZb69HZJV9BHSxKhLN7oijO89uJ8QsC
   HuAHG3h+T14jD3JN7lb/sxgGCWYXryCvXVR6gsg7I1RtD5muphnNLGouJ
   D8KKmO7Mwu/LE6+llBaLJuOSn0zF/XcTttE+8XP8fSwDPdzdZU7/BwAZB
   yfwUPLNJrwUWYFcKs8iBNbWbN+mO20FslJFmy7ZWHLlL4LBur4aA80gYE
   A==;
X-CSE-ConnectionGUID: pnUsH5stTwm7rWl8fNU3vw==
X-CSE-MsgGUID: rhvq+JEfQ+mi+ua/ilFu1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13016253"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13016253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:38:18 -0700
X-CSE-ConnectionGUID: rJK/F46bQ0ms/RFHC04zUA==
X-CSE-MsgGUID: YqawX1uwQDOJGMOnW6ntmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="35441446"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:38:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ALSA/hda: intel-dsp-config: reduce log verbosity
Date: Mon, 27 May 2024 14:38:08 -0500
Message-ID: <20240527193808.165652-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The information on PCI class/subclass was interesting in the Skylake
timeframe, since the DSP was only enabled on a limited number of
platforms. Now most Intel platforms do enable the DSP, so the
information is less interesting to log.

When a DSP driver is used, the common helper may be called multiple
times due to deferred probes, but there's no reason to print the same
information multiple times. Using dev_info_once() covers all the
existing usages for internal cards with DSPs. External cards don't
rely on DSPs so far.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index cfdb1b73c88c..537863447358 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -668,7 +668,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 		return SND_INTEL_DSP_DRIVER_LEGACY;
 	}
 
-	dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
+	dev_dbg(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
 
 	/* find the configuration for the specific device */
 	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
@@ -678,12 +678,12 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	if (cfg->flags & FLAG_SOF) {
 		if (cfg->flags & FLAG_SOF_ONLY_IF_SOUNDWIRE &&
 		    snd_intel_dsp_check_soundwire(pci) > 0) {
-			dev_info(&pci->dev, "SoundWire enabled on CannonLake+ platform, using SOF driver\n");
+			dev_info_once(&pci->dev, "SoundWire enabled on CannonLake+ platform, using SOF driver\n");
 			return SND_INTEL_DSP_DRIVER_SOF;
 		}
 		if (cfg->flags & FLAG_SOF_ONLY_IF_DMIC &&
 		    snd_intel_dsp_check_dmic(pci)) {
-			dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
+			dev_info_once(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
 			return SND_INTEL_DSP_DRIVER_SOF;
 		}
 		if (!(cfg->flags & FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE))
@@ -694,7 +694,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	if (cfg->flags & FLAG_SST) {
 		if (cfg->flags & FLAG_SST_ONLY_IF_DMIC) {
 			if (snd_intel_dsp_check_dmic(pci)) {
-				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SST driver\n");
+				dev_info_once(&pci->dev, "Digital mics found on Skylake+ platform, using SST driver\n");
 				return SND_INTEL_DSP_DRIVER_SST;
 			}
 		} else {
-- 
2.43.0

