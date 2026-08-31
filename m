Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0619EED3
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194323; cv=none; b=Kjt/ToNA/b18eKat21mO4OfnTuXGeO3mEw8pHcm4DJwuNEV2n20F9OGKD/BE2xlnReMCq604laFe8xynrQwS/ddR9cKwL1Qy7Ez9GO8OlMgol6nMaccM11GrS5yRBQj8mAJEJKiia51clvd2/SJs5yWddlq5hZk0cb00BCXSuxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194323; c=relaxed/simple;
	bh=WNmtC68NJA0/Rqf4KTTozQ2j/CAl/XfqX1JIbDkF3x8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TafXBrpjL6v8EXqIbuK7bDvjMAT+FLwQHsYv56qNCk4CYJWObAifaOEulU+wRvyZzmbTNcaaWy1Gv3wwQVGGKoPgtZ1QBENY8cnqLKXu5jjXtkmkkh5M9I3q1g3BQE/PMcQUCq0pc1KJMiN7o2dcj8UAhwNWGZh8OsI0aDK0hWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iioK+7K1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iioK+7K1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194321; x=1819730321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WNmtC68NJA0/Rqf4KTTozQ2j/CAl/XfqX1JIbDkF3x8=;
  b=iioK+7K1EJEvK8x5atLGRgzjSl1tJuC1jWKXshaEX22K0aIaHQRvGpbh
   YYewk0dUPqQ3yviRCoM9Ifardo4pT6g59TRgSVYO32nngvmqBsJJDxjEz
   n4JSVzcj0xs3YOc+vXIQsWGoMUUjVkCn4OxPDnfgaURThrK2PMPv1SlUc
   FsAfHc2QR8AUe8uKHGx0ljiaFVwho8Zkfg+8asKRfk1cGllJtLDZfEY0l
   9XntCBjXDbBr9/DG1Os4r1/nZ1Sb9eO1SqULJkmg8CCY8X0wQCs/SPHsm
   7jGCZj/jukXR+5N7kCpTIlgPloV8++BbOf257EaUpSreKjl1hXSXkhx+8
   A==;
X-CSE-ConnectionGUID: RER67KO1S0+mmG2C+ownwA==
X-CSE-MsgGUID: YfDaYdRERBCjU3wbFK8IcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379738"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379738"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:41 -0700
X-CSE-ConnectionGUID: /RPD9JoFSkirnNJ8JS6cgg==
X-CSE-MsgGUID: m8fHMsC1TEmfGCu6f0IJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111822"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:39 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 05/10] ASoC: Intel: avs: Clean up streams if their initialization fails
Date: Mon, 31 Aug 2026 18:42:28 +0200
Message-Id: <20260831164233.1487766-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831164233.1487766-1-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
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

