Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C460860
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 12:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951388; cv=none; b=uMNfr7S//z3Lshb/MNgU9qILQBiqSVXopm54ftV5A85jR+/fjEdEv8KU+KjUw8QT4QyIRdsrSiLI1Qc7fBGwhQ5d1GNgWbpmzumotexbRF4WL+tgri9lhoKpckDPyyLR+tA+pOi8j45EBPktJ0wIA9u3OlX49hXLXT4QfHmLTJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951388; c=relaxed/simple;
	bh=oTHR95JWcz0ap604v+zFjYvXKhk2SC2e8b03VMGFeXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qTG+JNOYi4KHmcOCeWxrM1swudfRwRbdEk1f05xQYvGDjRRgFMmx6HzNNwgvFjcPsj29NwLRO6bW6HxtraaPKnp6HCAC4crn9ZVhGbj3t+zSW9ABK3np1cQBagA+C4vpSx1/OMZpC5odxTr0Ju5rh6NhOx/SXumOSseT2Gs+k8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXwEre8t; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXwEre8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951387; x=1740487387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oTHR95JWcz0ap604v+zFjYvXKhk2SC2e8b03VMGFeXk=;
  b=jXwEre8tnQe4YpbceKbF4QkyvJnmiFxy/iSKZQU79bYXa1L2TYjM3mVa
   00Xk6QYT4Oy/s9lYIyIpQWF3YcCfSifsGPHQ3j73RscpAkzG1p/NMJ6O+
   CoXIBDrbEG4d+B4BNiWhn50ScbISDtgDDQBY8QPNTfLod1VOBNGxADxS9
   x8k955PjCmNu1R/2s9UxceXctvwlW6pRBZVYk893JiJQ5gX4icdmeriCY
   YO95t/zruPnAOwSi40A9J6WV3jTENh2nR7oRPDmG7+J4qoI+sGVtQookF
   CxTTiiDduoiJwziUC+LAiXHugIlLJNEs9LBoBIHSiQlsMHBy7ZNCQbhlD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658254"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="28658254"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 04:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6688616"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:43:04 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 3/5] ASoC: Intel: avs: Ignore codecs with no suppoting driver
Date: Mon, 26 Feb 2024 13:44:30 +0100
Message-Id: <20240226124432.1203798-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240226124432.1203798-1-cezary.rojewski@intel.com>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HDMI codecs which are present and functional from audio perspective lack
i915 support on drm side what results in -ENODEV during the probing
sequence. There is no reason to perform recovery procedure e.g.: reset
the HDAudio controller if this is the case.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index b3e5a5012167..a61ce42b426c 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -150,7 +150,7 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	/* configure effectively creates new ASoC component */
 	ret = snd_hda_codec_configure(codec);
 	if (ret < 0) {
-		dev_err(bus->dev, "failed to config codec %d\n", ret);
+		dev_warn(bus->dev, "failed to config codec #%d: %d\n", addr, ret);
 		return ret;
 	}
 
@@ -159,15 +159,16 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 
 static void avs_hdac_bus_probe_codecs(struct hdac_bus *bus)
 {
-	int c;
+	int ret, c;
 
 	/* First try to probe all given codec slots */
 	for (c = 0; c < HDA_MAX_CODECS; c++) {
 		if (!(bus->codec_mask & BIT(c)))
 			continue;
 
-		if (!probe_codec(bus, c))
-			/* success, continue probing */
+		ret = probe_codec(bus, c);
+		/* Ignore codecs with no supporting driver. */
+		if (!ret || ret == -ENODEV)
 			continue;
 
 		/*
-- 
2.25.1

