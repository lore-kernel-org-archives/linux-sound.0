Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF72B2FD1A4
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210381; cv=none; b=VlcPD7ptCaX6T8sbVlj14WpbsXWNLOZW2wBMXhGxghpKPZO6wQ95W5tyiBI55Hddt7qeg3282oq/yQWLjopvLVtqwTsTJ4AJ3ozjP/VLy/WFQ38FC9dw+dvQ0EdB7YtOyM3SFKonphaasifPulFCTfe1N5vbGl6wtsbWiU4ZARU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210381; c=relaxed/simple;
	bh=VTXEv/xSjGY4Npfwk1N+zJenmh7iNuYu9KaAI3nv4gQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XCM5DXVTnC7HPBV1LqvbpBLgfIKy7fEdpc2C8D2IXqFYlW0uKa81LvQc0QbI0cnmEyRzOIqDrrtmJV1KVZBRihKp3CPTYbwIKpiI32CjNTWXY52NzDc4vFHsQA9nUNRgRxhp4qjVlrY6gOoxBi6yWiJlT7kS6SXKJ3qDlT+OnZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loUuQ7jI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loUuQ7jI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761210380; x=1792746380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VTXEv/xSjGY4Npfwk1N+zJenmh7iNuYu9KaAI3nv4gQ=;
  b=loUuQ7jIS+3Qe/hnrlgl5576PiItLBSMMV4tnQuY6Hjz0WYumFHXbtCE
   1c6TaL9hSZXqs3yigtSPuLw4Ve/3ePfJYsvMABhGIHAixn8uaSVMBB6sB
   mEWgza5gsv3Gzr7xduq6w0Y/i9wpFEPjqtVBDrAbB0+nYPa0F1kf0n+fn
   yBAzhV/OJuY5jYyIGJnsQeX0WsNU5+zBL02FMv2gzAL5DuwiKipdQmDrF
   Gj28clNlgmtgLtrzToNU9ceApty8/nDnhhLcJWyLxKLJSs/1qk0snp15P
   e0v3dM3ZtRNJz6p7BcS2cH0HT8+SesQnUamEDoL2ie6zkGJQHwNzNOVGH
   Q==;
X-CSE-ConnectionGUID: P2sp1u2xT1eLPuvpaAieEw==
X-CSE-MsgGUID: 4l3SbzYVTeeqjvf0u2rYPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62404301"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="62404301"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:06:20 -0700
X-CSE-ConnectionGUID: yHKMv4c5Ska3egWCj2I8Jg==
X-CSE-MsgGUID: v/2Q1gD4SGeyWWBpJ1a6xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="189372411"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2025 02:06:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/3] ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
Date: Thu, 23 Oct 2025 11:23:47 +0200
Message-Id: <20251023092348.3119313-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251023092348.3119313-1-cezary.rojewski@intel.com>
References: <20251023092348.3119313-1-cezary.rojewski@intel.com>
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
index 6af10046fd36..c585830f9247 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -659,6 +659,7 @@ static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
+	disable_work_sync(&data->period_elapsed_work);
 	snd_hdac_ext_stream_release(data->host_stream, HDAC_EXT_STREAM_TYPE_HOST);
 	avs_dai_shutdown(substream, dai);
 }
-- 
2.25.1

