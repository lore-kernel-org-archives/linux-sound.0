Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7FC1A76AE
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756420; cv=none; b=eLol5vQtaT/Kz8n7ow2c73XErXhem2Ut1tQBQaTQjtjp3FUj4/LatEZYdc1U5ex/8ziar/+MV5XfYmWXYUJuVuoTgOgoQ/SxxgSAenRJpMUluyHqSqnbse1L9GA9Y4eKxXLGM2z2zI+XW9K+yq/mWMn8XY0GMfP1QXBh4z28saA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756420; c=relaxed/simple;
	bh=aOpNgbxxrQnKNENb/N+cnm855Me/zWHHEymkNL6hEBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R5fMYw7s4gugDFwBRXJIbqpjwo8Bj5Kz6VgCfRVtlZOMOqbPeXn2emQyV0UkN574bPJTJC9uDdb1L3scfAwZC8kOgmj4UdBtW70umz03qjsmOFPu1+/dZQ2kmxrG2A7MKIGjfsSN+0hCwKoiQ6f90OYz+zMgug1RzZsr+ZD2Cxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzLp+sPk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzLp+sPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756419; x=1775292419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aOpNgbxxrQnKNENb/N+cnm855Me/zWHHEymkNL6hEBw=;
  b=IzLp+sPkhpQVaiagNhRKQq+mf096kFg7eaPALvPU3hGmNW9ypDl3Nc4k
   kHYOigJOMpOvT0y1VOFvwVHNjT1LkvY1XC8NMyUYfWg2Ckt1WLdfsYXZi
   M4KtFyiXZH1VFWk6IgOZ1L2bg9ZyP8pMMsAPnbygCVt91Lg9JK53rU2jg
   118v+gI4Y/rTqoBmW0P3QBI1QsT7IbaQWpvgrVN6UX3U61xMh+5CDaAHB
   9AxzUgkq5ZxWKfHHZC1cMDkpsnj/a29P2qsQSa4zdgu5UiHQAnv+ZIUrl
   c+BgvF/mmwTkA2naRlIpcl3kw0sycaf9Ckz3j0g2922hDzHBTdpyUCxtM
   w==;
X-CSE-ConnectionGUID: /p9ncmsYSDac6wlWPQeoAg==
X-CSE-MsgGUID: VKmAIZXRQm6m2ZOU5ViKTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854607"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854607"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:46:59 -0700
X-CSE-ConnectionGUID: 76eID68tRlWvevBXrMxMlA==
X-CSE-MsgGUID: x0CuAt/RSQmKeeEUyNzWaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464265"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 7/8] ASoC: Intel: avs: Iterate over correct number of TDMs
Date: Fri,  4 Apr 2025 11:03:36 +0200
Message-Id: <20250404090337.3564117-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404090337.3564117-1-cezary.rojewski@intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

When handling TDMs, don't iterate over number of SSP ports, but over
possible number of TDMs.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 7d57a5735157..9dd5215b2c72 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1406,7 +1406,7 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 		goto plat_register;
 
 	for_each_set_bit(i, &port_mask, ssp_count) {
-		for_each_set_bit(j, &tdms[i], ssp_count) {
+		for_each_set_bit(j, &tdms[i], AVS_CHANNELS_MAX) {
 			memcpy(dai, &i2s_dai_template, sizeof(*dai));
 
 			dai->name =
-- 
2.25.1

