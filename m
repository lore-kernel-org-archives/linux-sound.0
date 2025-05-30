Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F5E21C9E4
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613239; cv=none; b=NkUTYSPqcM33l/AInUIR3tJLTebRKWZziPn/6kgl4GP99hmCwA5/6mKmFm3aLayjyXnATIZCfcGhX4HTIflTdMxJIHzuC3XWIp4X6s2SeJFHVOjlvWs0XKo2PRHONJXBU8cRanHUKnrylX++jwq/M/w6ZiCvtrNwI7AR8voy5nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613239; c=relaxed/simple;
	bh=JzKm0/QhMABape9eJg+wNwhPwGW33gtZERZbxdhEdQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbUDrQmHkPGMCwjwJFsY4BxYsTGqkutlN8By0ngHIXGSLijAkyJTLfN/ZwrdfshSucZivKIYqcb5UnaP0Ijrx4tAPiVynQ/aFzeq1jcm5BTCKXbETZOBsGE/8Ll3KCjTQQB3n2x+JxDrJp1Yax/oI6Y3+gJWjgny0dPutHeI3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPjACvXz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPjACvXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613238; x=1780149238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JzKm0/QhMABape9eJg+wNwhPwGW33gtZERZbxdhEdQc=;
  b=dPjACvXzzE3pFtfcU0kTO6JvrWWYW5s2YKWKn03aPpm1BdJaZ7NEqQGG
   e5v+uM0QLksmN6dHqw3ffnjNucnSaO/vNBmJ/OIgzobw1x5Z3a3seYu8d
   93KYLzisJ5wWrDrDFm6sGf61iy782Os8oLWhUwCEp3XL8a7avvgfqS5Ky
   nDBsBH83hxRwkOAMbaQhpEmaHn8gEJKHllmQIwTHhWX93IKT0vNHYEv/V
   +nONjVM67nHavdWqhnVE1JTASQCfUtzmctzSIAgpQVSaARCN+ST8tjl+/
   S+SXWz/kWu93s+qCBDXFys8r8B6aL31cs0GiM7evFf/Y4G7c0nh27sr7f
   A==;
X-CSE-ConnectionGUID: vnjCzVTUSHGSKiKbz8Di7A==
X-CSE-MsgGUID: QyTU0cXLTXGtfqrPQkJTyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256169"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256169"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:53:57 -0700
X-CSE-ConnectionGUID: Uz9xdY8jQ26iGwBsSwpJVw==
X-CSE-MsgGUID: HTPlcxLbQjuHE1ePlsR6lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763324"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:53:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/9] ASoC: codecs: hda: Fix RPM usage count underflow
Date: Fri, 30 May 2025 16:10:17 +0200
Message-Id: <20250530141025.2942936-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RPM manipulation in hda_codec_probe_complete()'s error path is
superfluous and leads to RPM usage count underflow if the
build-controls operation fails.

hda_codec_probe_complete() is called in:

1) hda_codec_probe() for all non-HDMI codecs
2) in card->late_probe() for HDMI codecs

Error path for hda_codec_probe() takes care of bus' RPM already.
For 2) if late_probe() fails, ASoC performs card cleanup what
triggers hda_codec_remote() - same treatment is in 1).

Fixes: b5df2a7dca1c ("ASoC: codecs: Add HD-Audio codec driver")
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index ddc00927313c..dc7794c9ac44 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -152,7 +152,7 @@ int hda_codec_probe_complete(struct hda_codec *codec)
 	ret = snd_hda_codec_build_controls(codec);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "unable to create controls %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	/* Bus suspended codecs as it does not manage their pm */
@@ -160,7 +160,7 @@ int hda_codec_probe_complete(struct hda_codec *codec)
 	/* rpm was forbidden in snd_hda_codec_device_new() */
 	snd_hda_codec_set_power_save(codec, 2000);
 	snd_hda_codec_register(codec);
-out:
+
 	/* Complement pm_runtime_get_sync(bus) in probe */
 	pm_runtime_mark_last_busy(bus->dev);
 	pm_runtime_put_autosuspend(bus->dev);
-- 
2.25.1

