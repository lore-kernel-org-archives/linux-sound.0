Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8DE214802
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567648; cv=none; b=TEcmjOir45+yziuDWyYozypIrwRGBErFeLYYS1V7WBBEnQcTDAi/mTl6E6f1RF+LuFis+LtIt34nZETHXPa+JR3R3BHdy1sVZ+VNORB/YR70l3BO/XbNot6qszqu0Fy5gKKh0j7hxriA1gnPPk0AOEy2nqmS1tmb9/lRynrcD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567648; c=relaxed/simple;
	bh=MJXmrdwNrmvQEeN+W+ekUyJcmdDLNGrGao1tIPCPey0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ohQgp3ItXpSWxQ3MxJwk9hy0IYVWeaZz6TJAQ1mlNRTYJG7VaUIHLjGRkurZfK10LimPW8w5wmH/mKJiL+SC+34FxPGJVVTUfgdHa02Xoc3bPzhI+mKAhPpVvYuPZRjMcj9j3HoMq/9be4w7NTCE/QJgVyu3mR7zz6No+1csHjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWdE03F0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWdE03F0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737567647; x=1769103647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MJXmrdwNrmvQEeN+W+ekUyJcmdDLNGrGao1tIPCPey0=;
  b=UWdE03F0PHb03EZjx2i4o1DNInkt2ISk67YsLnt+KrQkzMrdn5qiWfY8
   W3vztozlgEPP+Fytac4j2ecOcAEDNGvLw4Y2WQJdeKtIaGsQfxwIRi2IC
   BCBfU8quk+rO3JYG6ZQ1c59fw7b9b9xELIvnB4GfT6TQLCIw0VbBN6HEZ
   X/KNZeXRzDbPAuqI6HYBAnmDzvLFePKOJtyol3+Z0KM5ulyBDjaazLAi0
   UUmz1JpSo8JLFT/+igCtsogbdRLqfJQglw0mVsYDSDIXeFf85L0fN+dLn
   WCBvle2VEiJHNv/aOWHIykFOQosIfyT/N+oVYnc4kq/1HOgo5EF49puTq
   Q==;
X-CSE-ConnectionGUID: q5Qxc2PeRXqDl0Q+N9tpqA==
X-CSE-MsgGUID: DBGd7Z++RjamSNX+Qx3EHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49434733"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49434733"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:40:47 -0800
X-CSE-ConnectionGUID: rKAQQHolTAqLgU07mFlRCQ==
X-CSE-MsgGUID: ZRvuytQTQQWwaItw0OExXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112185254"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 09:40:45 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 03/11] ASoC: codecs: pcm3168a: Allow for 24-bit in provider mode
Date: Wed, 22 Jan 2025 18:54:18 +0100
Message-Id: <20250122175426.1369059-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122175426.1369059-1-cezary.rojewski@intel.com>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per codec device specification, 24-bit is allowed in provider mode.
Update the code to reflect that.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/pcm3168a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 43c0cb5e538e..df6836a652ef 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -493,9 +493,9 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 	case 24:
-		if (provider_mode || (format == SND_SOC_DAIFMT_DSP_A) ||
-		    		     (format == SND_SOC_DAIFMT_DSP_B)) {
-			dev_err(component->dev, "24-bit slots not supported in provider mode, or consumer mode using DSP\n");
+		if (!provider_mode && ((format == SND_SOC_DAIFMT_DSP_A) ||
+				       (format == SND_SOC_DAIFMT_DSP_B))) {
+			dev_err(component->dev, "24-bit slots not supported in consumer mode using DSP\n");
 			return -EINVAL;
 		}
 		break;
-- 
2.25.1

