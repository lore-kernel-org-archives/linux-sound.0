Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2790C377EC2
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336859; cv=none; b=vB846zWYU3WUls5uNv3ibsG3OiMPoR23bCZVYxq2d6XtELFinhF9WHcgyW+FSUuCAHNIT8keF8K9zGMEenqJb284WBTGZxdL3wYc0UvOF7y9j3U+5OGNJhvf0q6/oZ6pYNNkHXAd1dzzpnvXtQfoafK24OvNOLCVowWfFafWpQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336859; c=relaxed/simple;
	bh=WNmtC68NJA0/Rqf4KTTozQ2j/CAl/XfqX1JIbDkF3x8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIS3T6ItFjL9dffF4FEo/ZIyhEVR3Agduv/a9oYOF4310qpnSXITdDe1DfdPtzvcHUMAC/ZDfVIuyfB+EcvBvNeTO9bmQhVBZ+3ow6O/Jb+3DtbLZyfKHI6mqrJCX2Au7MgCkKYOUMPyj9aWtqZAits1kf1H17drF6CxOzPF4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/av4i+E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/av4i+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336858; x=1819872858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WNmtC68NJA0/Rqf4KTTozQ2j/CAl/XfqX1JIbDkF3x8=;
  b=S/av4i+EWH/jW0s+2+XJGcKcKkFRAGokqJal4Uz/PjqrJP2NkZDkXeoO
   HVlXT+IaEnMe9Do+dNc504FqoxktE+ABLI2e5UX0099jF9NwBZuTeSHLr
   epz63LyiyRLpnJIwKEeyW228Q4mufwG1gd9vggWO58Vsb+1Y/CpGt/o3a
   osKcXnyN+IhjnYCEgEDxnXg7t9Nm603tOmBWzx7Uhi6KWfigjRJpeY8F6
   H/PD0qp3eBmaJY+qqZpRPT3sB5pFGfBGaJQb0iY/dWNGSMD+SO6yCBGbu
   OQb1tyU11dsBaqMTWeWfhUNmC9MnQQvCMCL5OksxrT1wfobQBgFZgA0e/
   A==;
X-CSE-ConnectionGUID: U4zKe4O4TIiZvL4Rtz9NIg==
X-CSE-MsgGUID: eeZeTsIzQOidZHdYfmw2MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99120991"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99120991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:13 -0700
X-CSE-ConnectionGUID: mbaDgIY/T8Cl7Tb/FDnh7g==
X-CSE-MsgGUID: ArzAPh96SqCdGTvIw8dCfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099071"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 05/10] ASoC: Intel: avs: Clean up streams if their initialization fails
Date: Wed,  2 Sep 2026 10:18:09 +0200
Message-Id: <20260902081814.1590883-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
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

