Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4243459ACB
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363059; cv=none; b=jaKnbntm35wxBaQ69S+l413Wc6fvw0r2ARTiUqtJGzxycaH34dhf9+KFUjuYZPuiIb4dMhLx3Ub6iHtQdOmtl2WuylfGVjlUNPt/qXW9/k3S18wQAd8uRzkr4BH5fXjXNXKxyWoQj2rsJt1kCN9eMIGUAC1QkL8cU8waLzPaReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363059; c=relaxed/simple;
	bh=nIEtfccif9IddsiiYMU/C6t8mZvwU8UDlvZkLlqxr0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCVPMMD5KwbwU2Ff1YIEWnhmirkhM2qXufoGP1Fyi6iMK+14Q/tnFWosM3QMI0E6mshFgNA5TNTRp4n+AstC1FnAeLzT6bm83W+R0pCt9zheZ49xV5kb+nQNQKSvin0RwWkRlANfD+jBBTfFqDntlKgPIO2wKMhuJKn5++jzKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ae/V4y3E; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ae/V4y3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363059; x=1822899059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nIEtfccif9IddsiiYMU/C6t8mZvwU8UDlvZkLlqxr0E=;
  b=Ae/V4y3EhK5fZ8YkWZZYA7m7E5EHN/c7GrLze7RFGwoGoZQxpLfLCkk0
   XSS2Zlt7tDw+UJLGK3HrYhWOeOygRjA58WYtdcOltuKmMyfwJ7yQkVQ/8
   9jWaS/gTxVTLOM5PgUujeRQKFsftsjZIUd8Trq7maGDsLf4XVbOVghEq4
   XdHaR4XUJIsCKzglWjlVR8V8qvRGdQc9M7R1XxniWPXcC3jz0uIcrPBvk
   yGeTBGiP9V0tW4owdtdrlVXwhRxUcvHgXfkSu06kc/kqbHnOkKng6V2nc
   3WVw8l78Z3iDu9gTeI69qcB0jEZRe0QHI5Qjd2hbkH5LOdgXxAJMD2MFM
   Q==;
X-CSE-ConnectionGUID: WqsplBjjSx6dAbn5P9BkmQ==
X-CSE-MsgGUID: k3NmX+FMR32B+KbtyYw0ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114100"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114100"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:59 -0700
X-CSE-ConnectionGUID: Nyp6bG4IRlm0SdARljA8Og==
X-CSE-MsgGUID: XpqLSNgSSbGOgedhecBCmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670853"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:55 -0700
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
	daniel.baluta@nxp.com
Subject: [PATCH v5 27/28] ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
Date: Wed,  7 Oct 2026 11:49:54 +0300
Message-ID: <20261007084955.1256-28-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
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
2.56.0

