Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738115C60F
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708688698; cv=none; b=MDoKRHxJJg0fQVJgFfQWEUfT7or7yMsTv9I4/C14m/Kd4rIW0+eLw05HQQXOm+A/zQVdw22Vxa+o0bUZaPg0Kp5uJZkvcEM8tY46CNgpolH7B0/ZowC8gUKEn1um0bBJxIGSKUKwAxU4Jr1xf9kCG3PB71mbnBBVdKJwl50gizc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708688698; c=relaxed/simple;
	bh=ZmPygFGWtyXY/k7V0UYpP1keYvjjSFA7st8mQ7lnUbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lEoEimiavxPUEOIf5ulLztCJ+HFxuNlWGknDaXvX3x9JMPJs9ByNbMLZ+mfrDvjCn5oWK99pTCCwVRPeKuSLXdalsU0JzOqtZNj4Yq8YrIX3SLytD2Uaqvn6wsYnk1QzGS0r+q61qy4PznhMBAvw7UfKEjXcALRkqeLBgDTAv1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jkh6fR8t; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jkh6fR8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708688697; x=1740224697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZmPygFGWtyXY/k7V0UYpP1keYvjjSFA7st8mQ7lnUbE=;
  b=Jkh6fR8t8sKJiMvpjoyxZjM3uwxSq4takJhwhMLIfdu8zQcSvZ8uxReD
   AsvjHmIoKpUmwky/RhRjy3eBNRaMZpBtIx0SH4I9Kyst6P+ElehGiSLvZ
   WfuYf3US/bhnKqjy7VmSdmyT8Ne8v08UXW6sii4DhxJjHMogGziHLxeTx
   cp+TF8lTkhsn78b54c9r848gfLol1S4YuYpk0cyO3rpfzy9lfxOJuGR+p
   cOXckxOr24391FVqD6y2oXhZyEOB2Eu4+1qJ/asxE8SvStGlrkXLgX9ZH
   wHqG8Q4kiWvh9EwnSF9rICxuzFQvfJORYMFLXNBywF1yzA5RtLBcYjsy3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3504603"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3504603"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 03:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6092905"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2024 03:44:54 -0800
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
Subject: [PATCH v2 2/4] ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
Date: Fri, 23 Feb 2024 12:46:24 +0100
Message-Id: <20240223114626.1052784-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223114626.1052784-1-cezary.rojewski@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
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

