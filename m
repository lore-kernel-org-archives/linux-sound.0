Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FB6205AA7
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591031; cv=none; b=IxXAnFabn1i8WyKx51AAXzrA6EF1X4z3Ebo7/lcxrl6rWNrFMrhNMKfhRGuvNJy8aeUmJXkpEmcfD78FFdkbxzKYhnTs9LftaCGEuIDkyXDExrfD3K0cm3yLHGlVPKsdm04jaD2KI4e3m+tqozUhEzK6lGqXjHevMLTUpfdXWDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591031; c=relaxed/simple;
	bh=MJXmrdwNrmvQEeN+W+ekUyJcmdDLNGrGao1tIPCPey0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GnW/ZQlc9kMSFkdvSdbcImy+Z1y3A8b6+CaOHAp49/asZ0Uwv5hONvYxnQSeIPEQUD2DumNiprJiQBeBRVmF0hfVdj/otmziFoP7rJYfP96HqAC/R2MahBI3baXUGKxUhvfNo8za1MDLh5wq1qRhBsB7arJxawDdRL/tELNPwqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZaQ06CX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZaQ06CX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591030; x=1770127030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MJXmrdwNrmvQEeN+W+ekUyJcmdDLNGrGao1tIPCPey0=;
  b=IZaQ06CXbu7AD6cnvbFP0UOm3IZXDAHJizlouVRmpx2/gC26dx6R2ZQb
   7ZWgeMtH0xMBU+4hm1CzD3jP1PTr8fFjIOkQQPThD+zG7rj7/QkxGnYIu
   CZd/H6jL6CNSz8haWnBZoKT95BtVs8Sm0EgfAoBB4HBE129MQf/14JSB4
   Gjo7rjXt6HSGPJUORuhyAzzDHGVsx9kV2FwD28FyKzPXiamrbSEtV2PrU
   75j1VASDTTFa3rZDJaG3empod4EQE1EezAcVFM0NHSiutu2/EVwOVCuMI
   PSKEwE5mCAS1GV/anY4TutsXIYcfDiynCqevtRmQPcVcsoVP71m7SKTJV
   A==;
X-CSE-ConnectionGUID: xs7lzDw7QO6HuISOpJk0Mw==
X-CSE-MsgGUID: Qi+Udaf+SruFjNcLearmGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511805"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511805"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:09 -0800
X-CSE-ConnectionGUID: Lzivu8YITKKrzHigEYV3Ww==
X-CSE-MsgGUID: fxypVKdJTha/2KLnbdId3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057881"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:07 -0800
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
Subject: [PATCH v3 03/11] ASoC: codecs: pcm3168a: Allow for 24-bit in provider mode
Date: Mon,  3 Feb 2025 15:10:43 +0100
Message-Id: <20250203141051.2361323-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203141051.2361323-1-cezary.rojewski@intel.com>
References: <20250203141051.2361323-1-cezary.rojewski@intel.com>
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

