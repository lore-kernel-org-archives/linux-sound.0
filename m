Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3472B1C5D4D
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649384; cv=none; b=IM4VUSfmb53/UNCEIzTvMk7F8/JiRw/MDJgbSe3NF600LsxgfQo8Ri8S8HV2343H9MtGPbjFMumAZ3uL0KXWK9l3NhvDKK8FEVPS/wItNJqWMl9sXcgMcQl9EDu5U4x6ZxUWxF3yn/plKc8DfhLQf88xMXHZRXKdy36mlaaLXWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649384; c=relaxed/simple;
	bh=MJXmrdwNrmvQEeN+W+ekUyJcmdDLNGrGao1tIPCPey0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GdYL/jUdj0mbV13IRyo4TUYgUvXB40P/OLUEad74hqakZKcPcxofZfaId6O3gx1jCL416IGWcGZNAln78qlGMFk5cW8d3+zLzT/Op2rya+SW4GxgiR9JV4KjZlT0Gb8TB926GyT2L+4vWx5lU9JD393tvznNnubC9GMIT9+wvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bl3eDkeJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bl3eDkeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649384; x=1769185384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MJXmrdwNrmvQEeN+W+ekUyJcmdDLNGrGao1tIPCPey0=;
  b=Bl3eDkeJByLNvB0I+8XukbfDnY2zXLGQjKbJpBzQnGmruCxitOF16V0T
   Vt0fRmBK9Opx6JDIu0PoLzAFCaYqvJ37lpjowKH3wgCroZlmwlaYzY0jQ
   SboP2U5jZf2rDolVQKLUk8t0ART9c18ns4SnVTY7XkfSdxXI2IYmMyfxE
   0Dd/wnTAA8CF/+NKkpLlII9FS5/qPGi8IokLjsOWrpRMVghebgk+SWofL
   frqehnCJOKH+XrFjFSVGgfgnHDYUOGsjoGEiZfcGMcYz20pW90SlWUXDA
   asGuu81rwfRoz0Bj0hnk7n2d3MAWLj+LEvgfrWf61gfIobmOAaOt3wtao
   Q==;
X-CSE-ConnectionGUID: YJzHdkpkQK6IQR26G5+Uww==
X-CSE-MsgGUID: 4kxDyu3rQ4CybB665Dr5pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572494"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:03 -0800
X-CSE-ConnectionGUID: wrkHLxnrQx2I8Xjl5KpTHw==
X-CSE-MsgGUID: Zued4RBfTwWV/RY58XAxQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346736"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:23:01 -0800
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
Subject: [PATCH v2 03/11] ASoC: codecs: pcm3168a: Allow for 24-bit in provider mode
Date: Thu, 23 Jan 2025 17:36:26 +0100
Message-Id: <20250123163634.1451237-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
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

