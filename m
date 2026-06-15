Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A93F20FA
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531091; cv=none; b=fjPTAcCeEvRFgRxCIC/2WWCTMUcLkFC3SMjkIlxVRnLqbvWDtLNeNKj8mh8FnScuqS75smvOOyTjssfxfPkTQ9+csn55p+l9C16QZM6loxIIMiPniYHO7YtVmG3c2jZjTeeUMqcrNW4m/bW2qVNvtOyOlFHBSOb1tt+DxDPJC/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531091; c=relaxed/simple;
	bh=yKColTieZ/dL6WF61xZgDPdIOIBhvOMeiWFd1SHgUMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bs+PB/BOt9QmB5u0YYBvi/DaAEqC3tV4XkVZ95qnAIC5kwi/SfzFR8ZcrtJRxGQh8+ncYWh1viNVQA1Hpd7m178QYvUZvROLSi6HlntvAJHkoF4mjD/egSv+2jQuVvlC33/2zhm+VAUZ+F5XLy9disLv9LcE3ayFtiI54xKY5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvKvf927; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvKvf927"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781531090; x=1813067090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yKColTieZ/dL6WF61xZgDPdIOIBhvOMeiWFd1SHgUMI=;
  b=TvKvf927yzqupOLPpH0LvPp3LYsBBSSGzxdEQnTihguQhlqgRvuN1gkC
   dQxqQwFKZ0xwITgt4gPSEBzmYGMEyMFYWdU81i1VwNrD5lgjN1TPd9hZL
   +fnCsyCSzWFiMq8zJ9j9KNKt9zjbyOg/ZTJujQgtyLYPDkM/d8qpPq8/r
   I8kk1sck2EKU+YOMMFe5/x0XeUWHRWM+ZtMfhs8EHwkS8o3r8uPunUzIJ
   uTpskC/QcTvBXQ4RNW+vSF4YSwwvIUh99cVt5yQ9oK/1Is4YzW6uDR5NC
   TUln4caVQvEG1DM5ph18gmPAi91RgT8iaKKqyl/9xfBGQMlMm6XVYoPNA
   g==;
X-CSE-ConnectionGUID: DiMOOvZyR6S3Tz8fQpwG+w==
X-CSE-MsgGUID: SJL/Q/TlTP+g7tqGqTqRXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82168678"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82168678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:44:49 -0700
X-CSE-ConnectionGUID: AfBucriqT5qPrWoBkpXfXg==
X-CSE-MsgGUID: KHIkULxIS+ewh1bR5s+xOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="241110379"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:44:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: SOF: add Intel UAOL sof_ipc_dai_type
Date: Mon, 15 Jun 2026 21:44:39 +0800
Message-ID: <20260615134439.1044872-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The type will be used for Intel USB Audio Offload Link (UAOL) DAI.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/dai.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 36809f712723..0b6a6ba6489a 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -90,6 +90,7 @@ enum sof_ipc_dai_type {
 	SOF_DAI_AMD_HS_VIRTUAL,		/**< AMD ACP HS VIRTUAL */
 	SOF_DAI_IMX_MICFIL,		/** < i.MX MICFIL PDM */
 	SOF_DAI_AMD_SDW,		/**< AMD ACP SDW */
+	SOF_DAI_INTEL_UAOL,		/**< Intel UAOL */
 };
 
 /* general purpose DAI configuration */
-- 
2.43.0

