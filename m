Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D380443C37
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125821; cv=none; b=ECjqz1j5oEk9sl3qYnO8Dtb7vHwr51M2A7DD3jgdxRVfSyAEEb0fE59nuRIKu+l9GbVL02BKOfz9CGPkNsm2J6Q4U3RddFnnkBAWSsmMUPXDlWjxvSJAggy89D0seWmps5q4A/J8GPRaVEeXhCUxT8ThvunBjrXhLxAfFhaz8pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125821; c=relaxed/simple;
	bh=T5qTYxjdj2xdMMRtR7NyE5a0nmSxNxYopagQJ6MGXfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YH/Ks1v4H4XGBalk9KnMBSXra95gkpHJBAIswQyWOvXQfgZ9kCpFLXpoaGsk9ffMwzqumUz5Zk1haUGzCJ2WgklfM7CzMrYdruI29sfwZ9yDKtfkePMSc0I6TtKMI+632UE4hqFpfP27XzSV4PBd07G2mj9wFANpkMRj5WudOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSblT/MA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSblT/MA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125813; x=1820661813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5qTYxjdj2xdMMRtR7NyE5a0nmSxNxYopagQJ6MGXfw=;
  b=PSblT/MAzMaMSD71TN2RnCwC5abD9WO8/eeip8QD0W+uYbrxbxOHPFjP
   aqvxWU8eoRGxkVraejla9d5nryggQzeYc8GTo6zHweWiuw1awwJYFruQE
   4VxSjp4wHZyqFwXm2Gk/WJn4ImoMU9ONBZHLyn6ShyaTdkWOgkOd0qDaZ
   NI0E8sbfObKs6RZaXB3Q9MTxUQwwWpBrwiz0zYGFpLXQrS6bjblaPwUuq
   DdEWNC17KBRrv3LXnFNMSUOhi1RvFWy2LwOXyfY0odQx5FANm6hOx6Y8W
   /KhPy0Tf4iLXsSV0konRsg0OukrZ0EQs5A2a6te9u0ozBRaWY1LUq+ZFB
   Q==;
X-CSE-ConnectionGUID: tNN/ZoU8TGKlT8aMGSJv9Q==
X-CSE-MsgGUID: FLj2FbpHSDOEwMDLvvGhag==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750106"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750106"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:56 -0700
X-CSE-ConnectionGUID: /21zcJjyRV6bQ4fcXd69tg==
X-CSE-MsgGUID: jyJswOcbRqOTfxLXBhcZhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213535"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:54 -0700
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
Subject: [PATCH v3 25/26] ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
Date: Fri, 11 Sep 2026 14:21:51 +0300
Message-ID: <20260911112152.28528-26-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
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

