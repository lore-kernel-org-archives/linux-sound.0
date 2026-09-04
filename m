Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1760A3B27C1
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507157; cv=none; b=mZmLRHWtlmpOjdCchKtc5iZ/udz4LyokkJscH+HyXxmlNyQvhyB4/uDYbjMMxe211KWfwreFv+KB0P3RMMOaAXeejWPg67uLlDqM8rcZhR4Fuih2+hImK5KZMzucQg+jnbQxho7Mkv6zH3KPSbwyHxTabFcCfHNk/+eJjsyOlq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507157; c=relaxed/simple;
	bh=T5qTYxjdj2xdMMRtR7NyE5a0nmSxNxYopagQJ6MGXfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGJyJupmgH+0B8Gg/rbcv7KkKEflGx2pwyGORiS+Wg169o4B0nAOjs5hVDodzp7S54G8TBPV58PAHNCCQJT/R0+rm4edfB1kiR6jAdmyxvguSJ6p2XJtAgaoi1vHiuYbLCJEaaftzV7l4EByW1Ua+fH+I6USfM0DWrMLSTK658c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pk8ofjuh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pk8ofjuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507156; x=1820043156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5qTYxjdj2xdMMRtR7NyE5a0nmSxNxYopagQJ6MGXfw=;
  b=Pk8ofjuhYLsDrUNC/chWrzEt3ksDMdjnA6rvf3ncp3IR93AK1YWOJQ7f
   mCCZphd+BEXZaUarA0mWp6nMiZs2FXIzkd2Cqvkhla0SS6zNtM8rFqjIP
   nWD6rHh6OGt+3xoA3VTEX1XsGrZyHzNg4iW35+F92HRqYf7KGIqbYvlzE
   KxfwwISa/8ZBbft0a2sYjET7cAS5Umu2Vn3gKIycNqiyt9/v34YfmW5Tk
   kWcn8UNsLAell+g3MDyNdOCFE2NWDlB7C7lmOvNzcTrTFsnv5iN9iog9m
   XeZGL1eGkYkwp0VjuEkPfqUvQdpRp6kGS69EpxCL00ELzI2aWkfMJdEso
   w==;
X-CSE-ConnectionGUID: TEdUclcDQLyw1lYL5KlzGg==
X-CSE-MsgGUID: WRMN3JhZTxuloDRE7Rz3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111778106"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111778106"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:36 -0700
X-CSE-ConnectionGUID: DDtM62aGSjmn1fF9XNBsrA==
X-CSE-MsgGUID: yp7XYVt9SrizlwpQ/e9ucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480742"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 22/23] ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
Date: Fri,  4 Sep 2026 10:31:33 +0300
Message-ID: <20260904073134.29648-23-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select SOF_COMPRESS for TGL and newer platforms, on Intel devices the
compressed support is available with IPC4 only.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 840d5a36b958..02b41e4ccab2 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -213,6 +213,7 @@ config SND_SOC_SOF_INTEL_TGL
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_INTEL_CNL
+	select SND_SOC_SOF_COMPRESS
 
 config SND_SOC_SOF_TIGERLAKE
 	tristate "SOF support for Tigerlake"
@@ -249,6 +250,7 @@ config SND_SOC_SOF_INTEL_MTL
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC4
+	select SND_SOC_SOF_COMPRESS
 
 config SND_SOC_SOF_METEORLAKE
 	tristate "SOF support for Meteorlake"
-- 
2.55.0

