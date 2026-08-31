Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE03DB32A
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168725; cv=none; b=mZR7mpt7FmyrkUv2un5xnj0p4QnTgPStiLZ26jw9h0xMrs0sPgrxjYd+jHtJ6ioztP1ADOs000EUOksqYQNZcjLdk7niOSfScdrWmdVjUs3KI715ZTgu9SZJQzeL+t2DCP1YSYynDxe4YlcXjmdTsr3wS6xmb5IYVD8I5vrfkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168725; c=relaxed/simple;
	bh=WNmtC68NJA0/Rqf4KTTozQ2j/CAl/XfqX1JIbDkF3x8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8d3cX878Abr2qz/ZfNekCU+XVBm1/o/1C1H60nLVXV9yg7lL6UC8aoQohglcZ5supPbKtxVk9azNpq9M1XI8oaQTG+72YrFJTMub6SHN275Zbq3MN6mp9MYRQZyY9zcWLdQuh8cRueIjY0XQq7FZuJ3Nh4rYWng+bIg16S45NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSYLL5q9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSYLL5q9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168724; x=1819704724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WNmtC68NJA0/Rqf4KTTozQ2j/CAl/XfqX1JIbDkF3x8=;
  b=nSYLL5q9XsvWgcSgnmh3knvadVx5HEN58Meiax8aiSgOrF0sD/HPo2oP
   Gy+zh01PXKvaUI4XOKoB5Rh5Ho6yKJM4mDXAWYozQg9vRgYxBZqQVSdrl
   I0mgCydnE1fr1wKGM+aedsG3dp4vNWPJtLE8ERQI7j0fLxiZaptLEj/FJ
   nVINKLLqNETBaywgPlxLOTll9Foq2WEvqHM3qNWWMh6rzma1i+T8Sz62g
   w8kZBI+2IxO3hfhp5ObR3Br2caCmYMoBHU+qzELpIxGdIDVIMQ5UjXmbB
   f7iItf5Z0LWhhMGN5po9N8LFXmhFMgi0ZLi5J05T7zGM0yQJXuTHrZthI
   A==;
X-CSE-ConnectionGUID: uLJGmzNrQZGd36OkpqtRqw==
X-CSE-MsgGUID: QMQit/kWR3yuMt1KYZUdkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88332914"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88332914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:32:04 -0700
X-CSE-ConnectionGUID: r/SWuHCCTse/1+09Eh6slw==
X-CSE-MsgGUID: szxBrga8S7GcxeHDJ2Z5Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265507973"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:32:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 06/11] ASoC: Intel: avs: Clean up streams if their initialization fails
Date: Mon, 31 Aug 2026 11:36:10 +0200
Message-Id: <20260831093615.1117987-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831093615.1117987-1-cezary.rojewski@intel.com>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When streams are being initialized the memory allocation may fail.
Have an error path and return early if that is the case.

Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
Co-developed-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 8f27a7d43718..611ae9f034d4 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -92,16 +92,28 @@ static int avs_hdac_bus_init_streams(struct hdac_bus *bus)
 {
 	unsigned int cp_streams, pb_streams;
 	unsigned int gcap;
+	int ret;
 
 	gcap = snd_hdac_chip_readw(bus, GCAP);
 	cp_streams = (gcap >> 8) & 0x0F;
 	pb_streams = (gcap >> 12) & 0x0F;
 	bus->num_streams = cp_streams + pb_streams;
 
-	snd_hdac_ext_stream_init_all(bus, 0, cp_streams, SNDRV_PCM_STREAM_CAPTURE);
-	snd_hdac_ext_stream_init_all(bus, cp_streams, pb_streams, SNDRV_PCM_STREAM_PLAYBACK);
+	ret = snd_hdac_ext_stream_init_all(bus, 0, cp_streams, SNDRV_PCM_STREAM_CAPTURE);
+	if (ret)
+		return ret;
+	ret = snd_hdac_ext_stream_init_all(bus, cp_streams, pb_streams, SNDRV_PCM_STREAM_PLAYBACK);
+	if (ret)
+		goto err;
 
-	return snd_hdac_bus_alloc_stream_pages(bus);
+	ret = snd_hdac_bus_alloc_stream_pages(bus);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	snd_hdac_ext_stream_free_all(bus);
+	return ret;
 }
 
 static bool avs_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
-- 
2.34.1

