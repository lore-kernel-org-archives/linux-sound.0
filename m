Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7AC2F531A
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561637; cv=none; b=qB8Fk3ZniW0K2NA8v+2iSkQU9WECPl0FPQs5tTl2IsLU4EXkdICqAMqMcHEdOA4857Idvn7kCaibi/x8cWcGA+XYxs+/ALbGg9TVYIyGwqEZ+Cg5ZsjPHfRmLsjBoZQm3TnQIGHi+763fR4VB5vDqnsLs760QXZiayldsvhNKG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561637; c=relaxed/simple;
	bh=4PHtU+VTOiidm3VJLVWryCpeeYQSBABZ+1LV7RLnzSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RSW8JcdvE5LsqQM/cIXub8Fx1WFeyFIEwt1dl8Nodw32VJh6s3c8Z/lM19lxMvHhhdeRdQ/U7AqWVuWfjWdIuBtOv1jGuirFb4cSEnj2dtAhK/8WfBmWDJ/aXgYvPjQXd3Ppboclc/nPen9Ct+UqHj2qQngU3BThkHGX6crodoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKlKqiwY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKlKqiwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761561636; x=1793097636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4PHtU+VTOiidm3VJLVWryCpeeYQSBABZ+1LV7RLnzSA=;
  b=EKlKqiwY7WkIJXOtM8qpe2wc2Ms/9/zqTm//mfEc0oMxpKWGMjnGWymb
   +5beQGFv2YknGH8L5KMHA1RXk2+TQqQneK553ctuww4xpCXUJZtCjSKKN
   Yr4kzpbpEoaa3tk0kCK2mI87nqxqB/4+Ibdl4KUyIDAA36TPlXrXKowtE
   +M8bo1f6aFuPd3B0QVd6ZsFjth0Uo19+wY63cmCWaCRhfPQ1T1VXPrAlX
   rUGqWel9RrvppuX3RmpPrrZMhenMLXzP5gZj9eqHE57pyM1dsvnp/h7mO
   0hRRKeiHgM5AkWRdbnbKHmGky14GMORF1rHbdYZFw3X1cgPcAha+PTM/J
   g==;
X-CSE-ConnectionGUID: QcU15aneQTGeV/VzdYRKPQ==
X-CSE-MsgGUID: pKPsLZ4fTXKSF9Bb0YRRRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63672084"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63672084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 03:40:36 -0700
X-CSE-ConnectionGUID: 6AOR0msXRO2jBPvYHOA0Kw==
X-CSE-MsgGUID: qErSNeTISYGnMhPi1N1dmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189051600"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2025 03:40:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 2/3] ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
Date: Mon, 27 Oct 2025 12:01:05 +0100
Message-Id: <20251027110106.3157415-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251027110106.3157415-1-cezary.rojewski@intel.com>
References: <20251027110106.3157415-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

avs_dai_fe_shutdown() handles the shutdown procedure for HOST HDAudio
stream while period-elapsed work services its IRQs. As the former
frees the DAI's private context, these two operations shall be
synchronized to avoid slab-use-after-free or worse errors.

Fixes: 0dbb186c3510 ("ASoC: Intel: avs: Update stream status in a separate thread")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 501466bd1f7f..80c001120cdd 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -651,6 +651,7 @@ static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
+	disable_work_sync(&data->period_elapsed_work);
 	snd_hdac_ext_stream_release(data->host_stream, HDAC_EXT_STREAM_TYPE_HOST);
 	avs_dai_shutdown(substream, dai);
 }
-- 
2.25.1

