Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68E30102B
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321240; cv=none; b=HnPsTvrfkqc3zxTuhnMuIXx3yhLz+49ROrN/XGYQaVY5zdkJGZuKQU8Nf05MBFFDyeBLnBDwFQcEbbCtmXN5BGAZAozCkZr1DN39WKthzoPxYPDFO9t5FkqR9r+w1wsY/bJQVfW95waDml4xxwmI8nFVcd4wFnJAQVLVjYQMxKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321240; c=relaxed/simple;
	bh=KMeiFlbMVEtFjGrAenu5WScln98ATNexzQ95YaYhH14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OthBo86ARfL5miHOUcKXq4SDsB/HxNPUEx6pUclHj8ic5UmSH2YhQGzaxrrTjTmoYJq9FTMWnOz/WgSixH7BH8vzIY3NdAulBoudaIe4vtgBAlp1lq9VhYekeS7gpSm93LNerW6aM3lTt7x+zr8bZlBTS97yP5V+JBdrhettoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f18v5EYg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f18v5EYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764321234; x=1795857234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KMeiFlbMVEtFjGrAenu5WScln98ATNexzQ95YaYhH14=;
  b=f18v5EYg0cnvY5p827ynTqDjs8tla5W/WKaSzXPIoI64Qeu94fbcR8hZ
   dsbtyDaZxo5ijczH1WTrq139ETE5Q8nB8eX1czu2Eb2Z9jpx8W06s3O6I
   MSnTa+y2yTtU+cvbjGJti/daUMmpBKUjNJmifvHvJLukTGxAh3ULLE/XL
   DoOXmGatNJPMJx1IErXjld7gifJGd0KJ7PE1kSysfUi//Fs9tkEjhGZGs
   bqkxhq6tBxpcAXeh7d9IkhWpjxjskBYXY51HT4Bae5wKqqEGJOPnHDM7J
   ZKGym6kHjCqLVN3Rp9VTVHy3Hd6k7UuIu+Bewt5/zMPo5YJpK6QCw0I9C
   g==;
X-CSE-ConnectionGUID: odBCGWKoQXeztYYN7SkGrA==
X-CSE-MsgGUID: v56Ga69DTjWWGFPNLCPg4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66428478"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66428478"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:13:51 -0800
X-CSE-ConnectionGUID: WsLVspLEStiGUrNvnUxkcA==
X-CSE-MsgGUID: i8r80lLyTUuQOvmKHXy6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192680909"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 01:13:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 1/6] ASoC: Intel: catpt: Fix error path in hw_params()
Date: Fri, 28 Nov 2025 10:34:07 +0100
Message-Id: <20251128093412.3949374-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251128093412.3949374-1-cezary.rojewski@intel.com>
References: <20251128093412.3949374-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not leave any resources hanging on the DSP side if
applying user settings fails.

Fixes: 768a3a3b327d ("ASoC: Intel: catpt: Optimize applying user settings")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index f15385683d9c..9baaad13a273 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -417,8 +417,10 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 		return CATPT_IPC_ERROR(ret);
 
 	ret = catpt_dai_apply_usettings(dai, stream);
-	if (ret)
+	if (ret) {
+		catpt_ipc_free_stream(cdev, stream->info.stream_hw_id);
 		return ret;
+	}
 
 	stream->allocated = true;
 	return 0;
-- 
2.25.1

