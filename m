Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E67C471263
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836300; cv=none; b=tQGFMW65MXzEtL36YbgwzR1uvO6xIXhenVuf+fbE1iLcUbzGOwGhCSux2NmuT3VbTM9j9BXtdd7Ay9ZPE8/GHacW89pHfnbEYRPY7No6XDash0vzFScQYgqEUNXc9FtqzH+18zaE6BPdJ9iySmJKY01kY/xkd+XAylqgcRhJc0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836300; c=relaxed/simple;
	bh=WNmtC68NJA0/Rqf4KTTozQ2j/CAl/XfqX1JIbDkF3x8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YiH6IqALo1mZ3cjZ0mPOJFjKXzu9YJx24Ju9FtBQGhf6ILphbiBDIgVL3/dmrg6FBlipKCcUCwkKwq2JylWgy8oSrM0NEJBidEbYKxHzPhRB1d5n+y3KPAklH70ae8OBLGfm3X0Io4SWeJwou98K2C0OMA9XOteiFjIut5lshIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkEyo0Gp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkEyo0Gp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836289; x=1819372289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WNmtC68NJA0/Rqf4KTTozQ2j/CAl/XfqX1JIbDkF3x8=;
  b=lkEyo0Gp+MPW5cu8KPNI5g+/XAwTGlqdVNInnbDNfcqCjTd0q6dKNK0G
   WzqrrmvggrhFnqwlMTlNunJ+1nx7rVWNz/SQnkwlKpYNPyERMeTXAzXBL
   BLmwH/UcA665Ycat2EdON6uDgjQebUGKXxw2n7nbfvhAJm0DRj+GKX/5l
   FMvAYbW6DnZq+/xhTF5jiNz3h0/12soyWh/Vqp+bGLB16OCFBrQg96/x6
   ZJr/AtZ+Q3FTtgc2ETc92ONMgTqVaWhDwNvPDuISRZl3SFVs5adLaYcCF
   2cSaHsGgaCW7wTZUKSojz7E+CNS2BMFJ8axAQvN6ChrS1pcq4GDAkI+0d
   Q==;
X-CSE-ConnectionGUID: 1Ggce/ltTuu+B4SbmskBEA==
X-CSE-MsgGUID: zvL8qU36R1CMr8+IqVS6Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539059"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539059"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:11:02 -0700
X-CSE-ConnectionGUID: LPJvgoNQTZqXQPJwTzFThQ==
X-CSE-MsgGUID: zDMlg7YNR5mTzKzmHbshDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589349"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:10:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/10] ASoC: Intel: avs: Clean up streams if their initialization fails
Date: Thu, 27 Aug 2026 15:15:05 +0200
Message-Id: <20260827131510.1014084-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827131510.1014084-1-cezary.rojewski@intel.com>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
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

