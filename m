Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C149159F
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945049; cv=none; b=jk3QKObw/DxEmfI0DcYG0vYZjXd3GocmSxyyAWHQ5dmNx50QFH9+J7aLQe2J2TMiY3JJbh8Fw4t5SsZk8SnQflshSqs5msEQDl0W5riABxmc8rzC8gMIs4s2nU7UmSrV7xGReAdWk66K4cfpyHo3oMtD6w54rAYsTnnJSHC/G2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945049; c=relaxed/simple;
	bh=T5qTYxjdj2xdMMRtR7NyE5a0nmSxNxYopagQJ6MGXfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2qkmLfO6yGP1hWuMqo82f5ut2b4otTR7BtTkk0rkWpqeoZPHGA3OWP83l8LuwMlpcTssCc4PnuNjwif8HcYIz5krR2iB0zvkvoRsEvUKm9On91iJfeunb3+RN606o84P6csqzOi/BNPuhp7CgpNBjLS3tbPeGt/7n/VBSZFUus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHpAGK70; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHpAGK70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945049; x=1820481049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5qTYxjdj2xdMMRtR7NyE5a0nmSxNxYopagQJ6MGXfw=;
  b=VHpAGK702WonsG9PpOIM029UkALxbIwGhuP2iRAkkjtDMox6uETI0paO
   SRcO2oq0XHMdJjDTCPwBUkBGobc92ad3INqomY7u+OihpOsv6dxcRmkWN
   uMdQcHyRP+xoj8DEZSrJC4JJiVtGRrUwcvbeEukjza6cssKE1IhVEmmim
   axrLSMZJkbmBEb0L3FSm0cI1dPPVlUJl1Ugf2LximWMU0ykYiVTfA3TH+
   btgTdKH6JuwRsR/xDHvpzP+CAdrnv3e7KfWn6RmUcEifd4jc5T7ZKWO/7
   ur6lrdr8I2Wu39MA6CmaKoU20T4jifbJr5zNPF01otvpMO8GKaJ8zdPna
   g==;
X-CSE-ConnectionGUID: 3+jncpFTTfWd4+ugI/X7hw==
X-CSE-MsgGUID: Bcj6C0oOQM6T+J77iY3L4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200935"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200935"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:48 -0700
X-CSE-ConnectionGUID: zIDf6igxQ3G8TNdHGGUTxg==
X-CSE-MsgGUID: z4XRW7rfS+6/QkOt2jSadQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973470"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:44 -0700
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
Subject: [PATCH v2 23/24] ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
Date: Wed,  9 Sep 2026 12:09:48 +0300
Message-ID: <20260909090949.7503-24-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
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

