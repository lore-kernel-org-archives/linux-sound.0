Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED4216E0A
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424500; cv=none; b=tMHu4NkSuMIaZWMwKaWCeLBRogpDUvq3d9J3hQlzXSro8iRcshatBSQE7Q1nmVWFD7gVHfqw9UMTMJS2P6a8C/QKBnibXlDufGvtlj041lWCVyHCXlF74VSJXmHlHgh7AklZkNHtPr56LLvqfqa7hPQNCRgJocZb6H0Bi8Ez4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424500; c=relaxed/simple;
	bh=vVbqBhAqyBbwTGWODTf63p1mVMqg9nde0223Q4DtXEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iWu2srNGPxExPyMtnjpSkDhLWXQ8a6Zg9WKXwLHcT9jUuUwtSMHfr7lyaZ4iek/W/MXFgnHrcdvgd4j4ho8Z233XfFYh7HL/75RSvZrIG9pgcuFSjwrN2XwetsTRvEDOS8nvB+czsfggOASn2/eFiJMUeTrbLHZjFmfKZXCieZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwAa1kSg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwAa1kSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424499; x=1767960499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vVbqBhAqyBbwTGWODTf63p1mVMqg9nde0223Q4DtXEE=;
  b=DwAa1kSgl73LjYDtF22b02WrsmpRNz1OQqk0xJhvO03Mjqtbm93JHOZC
   ZzVHSzFQbmQ0FC61OcVR3Y5uAkz8LZ4uEz4JNXfmlFnBlUg41ZtzWjY+d
   ps5FFMNpfgb9ZN98++JE7afoL4fC7MwBkdb3e8CpJB+UoQBWerBQp4k1o
   C9BUpJvBfw+vniaFT9FxXt7RiylHgM7BpQkvLtn00atBpBaQnjGzUryaL
   Ymb20VumuIziqzOkJRFTHiy7zyC6ZuiRLDX0mJxT0RpSdwCfFHNnzmGOd
   MJrmSxgRvqD1+QQ+OMJUAJAp0sBFzSOuHTSBdHEVjdGF+LjCHC2Vv7zBx
   w==;
X-CSE-ConnectionGUID: WKb1c0zxQCWvfF5lFVXLxA==
X-CSE-MsgGUID: d5uL+jFxRSOrOGP1Sjq25A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179572"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:19 -0800
X-CSE-ConnectionGUID: ZiIfyPfeTQuFjWwoe2NVHg==
X-CSE-MsgGUID: 38DaIGf0TqyLA2R5VPYQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710325"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:17 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/13] ASoC: Intel: avs: Update hda component teardown sequences
Date: Thu,  9 Jan 2025 13:22:08 +0100
Message-Id: <20250109122216.3667847-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If case of failure cleanup recently created DAI and while at it, adjust
the remove() operation to match operation order of the probe() function.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 945f9c0a6a54..5878cfdbbee5 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1564,6 +1564,7 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 		if (ret < 0) {
 			dev_err(component->dev, "create widgets failed: %d\n",
 				ret);
+			snd_soc_unregister_dai(dai);
 			goto exit;
 		}
 	}
@@ -1578,8 +1579,8 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 
 static void avs_component_hda_remove(struct snd_soc_component *component)
 {
-	avs_component_hda_unregister_dais(component);
 	avs_component_remove(component);
+	avs_component_hda_unregister_dais(component);
 }
 
 static int avs_component_hda_open(struct snd_soc_component *component,
-- 
2.25.1

