Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F13A4E1CC
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951385; cv=none; b=p2EAsFcQ3/bZLuAh2llxY92mkpeyaxZMsv1bFCwcjoa8E89MjU7WC2fm6AbC0Q7llSOraQuXkRh7Ax5WKDYr86UhBll8MwQloMiyvWdDjX5yUDT+TRn0YhHmyLy7PaMIVYmJHHXY7YgdL6/KFiXCLkBkk9egQr/RckK92JX75VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951385; c=relaxed/simple;
	bh=z8lPSEjbSrtzAuUskaODEdGF5O7WHGh3H8vOdHVof2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gF/p5PR73sTfo5g2uvMImwMmuIZFChaQynBZb5QIbeoO+eWhTyUPDA+ZAe5VCqoCmtSbgzZL2TP8grlXweh4vPPCPZh2HirAcHgZlJZSjXN1vTZ3rX3VmaLkjdJ2DyuQgp4dTBVaYdMrRyWXk0W9b2CUTLwc+ntzbORvUZiIcbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbo7vgTr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbo7vgTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951384; x=1740487384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z8lPSEjbSrtzAuUskaODEdGF5O7WHGh3H8vOdHVof2M=;
  b=jbo7vgTrntm1NQeHWbG0VCFXwoPAiAPToQ8S9qugayQSZHLKlU/Rz2Kc
   mPsJ4nUUT1xEAvdLJhhg61nEeCE2HMnQyVfjsSLNDVoMEkXjkT1ON9sI4
   NZJ8U/cZCglXsVcIlRpNjKfs1r+kB9XI581adLLgWmacPXmPERUZN/kLg
   WHyM5XDLho8o4qFTIoYveiRYTI9S4c14tyXl6uF7kRAeibrG0dDiVYzJV
   ryxzE+G9j/SHzRxPjRGARXDef4YED5D46XrsPZ3TZZUPdvmf9rfz0WX+S
   o0y1FWv5KFDri2sfTIYDTmwW8uz/imItPotph4m+FZXk1Fx9ptHDlUIX8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658245"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="28658245"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 04:43:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6688613"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:43:01 -0800
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
Subject: [PATCH v3 2/5] ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
Date: Mon, 26 Feb 2024 13:44:29 +0100
Message-Id: <20240226124432.1203798-3-cezary.rojewski@intel.com>
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
index d2117e36ddd1..7c6bedeceaa2 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -350,6 +350,11 @@ static int hda_hdev_attach(struct hdac_device *hdev)
 	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
 	struct snd_soc_component_driver *comp_drv;
 
+	if (hda_codec_is_display(codec) && !hdev->bus->audio_component) {
+		dev_dbg(&hdev->dev, "no i915, skip registration for 0x%08x\n", hdev->vendor_id);
+		return -ENODEV;
+	}
+
 	comp_drv = devm_kzalloc(&hdev->dev, sizeof(*comp_drv), GFP_KERNEL);
 	if (!comp_drv)
 		return -ENOMEM;
-- 
2.25.1

