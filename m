Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0045A153BF8
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 17:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708621560; cv=none; b=AuZpm/41H5YLSF5jvhYyB6OUwFghB2uchB/MmlwRsscOlcc02mBK+9Zza/n8Eb6WEictBiMRhA+ldZM7LMuusVkPSF63RCMSOeVPQBWM/EiNt+8ys1O6Kilj76hSV0aH+zLqsbF4rIbaGdesREcZJlmiIm9EKgLDTGbtoTmPVqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708621560; c=relaxed/simple;
	bh=ZmPygFGWtyXY/k7V0UYpP1keYvjjSFA7st8mQ7lnUbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tKk0cSlPVh7VUp7xjX9xeYitw0zh3biGBuUrugTfxXRRqrOFLC8cajgy91dM82pVpvNHEL16p2BMeyPkMZhLm7n1seS0zWG1/bg4Ki7xpWjvQJcI9rIYEC1jsGri+nQbb6ZNxxM/GuYHyw3CN9+bd8pdynTu+j3avEgR4DnRDn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOlnkJit; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOlnkJit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708621559; x=1740157559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZmPygFGWtyXY/k7V0UYpP1keYvjjSFA7st8mQ7lnUbE=;
  b=eOlnkJitqLGp2BjwCDaLJpQ2hQZDvLP10XgMKIYwsgokYfAOLnBkP1su
   iHbv4hjcc4Rb7G8DIIQMamsDRh95VYlFRHWwjA2R6m0g+telbTE+w1KHl
   73VMBVSDvujQn6s/t41Q9pzLhmwUGtTFVgTREJU/O7Yj5eW3Hp0WiapgE
   QZmi4wNmgd/3T+o/TSOTkIyv49Lag2v2wc4DdD1T6xxTE8ymWzZtgPpLe
   OpOUNyoMoCb9NrgQL0JPZ9j5AoG7bvpeHX/g1mOuhm7d5zjX6AWsb/uE8
   w3pqu5ywR/3oJSPtYRVs/+UbxkC9RLuudz7ZZfOcSN/WlCpaDfW6QOvVd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20299225"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20299225"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 09:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827575240"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="827575240"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2024 09:04:57 -0800
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
Subject: [PATCH 2/4] ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
Date: Thu, 22 Feb 2024 18:06:12 +0100
Message-Id: <20240222170614.884413-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222170614.884413-1-cezary.rojewski@intel.com>
References: <20240222170614.884413-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If i915 does not support given platform but the hardware i.e.: HDAudio
codec is still there, the codec-probing procedure will succeed for such
device but the follow up initialization will always end up with -ENODEV.

While bus could filter out address '2' which Intel's HDMI/DP codecs
always enumerate on, more robust approach is to check for i915 presence
before registering display codecs.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index d2117e36ddd1..d9e7cd8aada2 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -350,6 +350,11 @@ static int hda_hdev_attach(struct hdac_device *hdev)
 	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
 	struct snd_soc_component_driver *comp_drv;
 
+	if (hda_codec_is_display(codec) && !hdev->bus->audio_component) {
+		dev_dbg(&hdev->dev, "no i915, skip registration for 0x%08x\n", hdev->vendor_id);
+		return 0;
+	}
+
 	comp_drv = devm_kzalloc(&hdev->dev, sizeof(*comp_drv), GFP_KERNEL);
 	if (!comp_drv)
 		return -ENOMEM;
-- 
2.25.1

