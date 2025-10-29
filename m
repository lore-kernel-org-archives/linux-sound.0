Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8182728369D
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 04:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761710650; cv=none; b=GatFF5OJT0An1gVFF066z2p5L05xYH2rR8ZA6DCk4Tn4cs8oMh5/BFXxrivPL9owkAje6CzjaVzzCv/bXqsXpihTrZ6IHyBrg9kNIGZuByOZzNrvTeQCNeZkUWGhocXmXy0+YTj88r2GfNzBGG7HfFp3S+hhLXz0eVOh4dFtNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761710650; c=relaxed/simple;
	bh=01xG0ghfcVx/r/SdNntXBuQYr+0WxcYTkGI6bc8WEF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jZ+WNI46MSCVb/yIrx/vcy5+In9Sg90gdvb2727MB2+g0YAG6Bk2vDJnYWbBclkppF8uNPuVQW1zzb67mkbrXVACsSCuiFLTZzzhzKllOzTYckdOvJJImDiXzJJo6aZ770yHlRKo2K3c99LYfsiOTtabED7paJy3dh8C9s+CYwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gySF4Jou; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gySF4Jou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761710649; x=1793246649;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=01xG0ghfcVx/r/SdNntXBuQYr+0WxcYTkGI6bc8WEF4=;
  b=gySF4JouVsOeywEIIbo2CdNMoFAM13mXEGRox5fbqgFSOP6JldDHtIJs
   /0K6atSACVfEh3wJuM4C5E8csuWB74DkCbd4m3mmJi/XXIzC1/IOPB5Tn
   EszNxusPzgzBARPwc5spJ9+iH57T7roo2yT2DEhmheVQnD5EJEwlq6do7
   P+U9YQouS+T9t+cMeCB2cMl1fgWuYM7xbTFDpeq25pP3z8pb4/pHay+H/
   eQgyQ/hQMs1KQ+zvTYZaBKA6WJpjOwwaY54N6T+jZK7hasaSmIE7P7MUI
   gGekVRi7U60eVsLHbWzboEr9OKqSvEfo1KNldvKOdfBXp8c15L0EsUvSy
   A==;
X-CSE-ConnectionGUID: nAnQV61aT922sATj/sI0Mw==
X-CSE-MsgGUID: go3ABbBLRFqyUa45xZl2ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66437197"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="66437197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 21:04:06 -0700
X-CSE-ConnectionGUID: DqX61MYISSiY9e0lypy0Ww==
X-CSE-MsgGUID: WvSxZgcZRXi+WPS+Lf2hgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="189599418"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 21:03:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS in SND_SOC_SOF_HDA_GENERIC
Date: Wed, 29 Oct 2025 12:03:44 +0800
Message-ID: <20251029040344.1116201-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The "ASoC: SOF: Intel: use sof_sdw as default SDW machine driver" commit
uses asoc_sdw_get_codec_info_list_count() and codec_info_list[] in the
hda_sdw_machine_select() function. Select SND_SOC_SDW_UTILS to fix the
function undefined issue.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510220819.KrN5gjKL-lkp@intel.com/
Fixes: 5226d19d4cae53 ("ASoC: SOF: Intel: use sof_sdw as default SDW machine driver")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 4f27f8c8debf..4fca4c9458c5 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -311,6 +311,7 @@ config SND_SOC_SOF_HDA_GENERIC
 	select SND_INTEL_DSP_CONFIG
 	select SND_SOC_SOF_HDA_LINK_BASELINE
 	select SND_SOC_SOF_HDA_PROBES
+	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE
 	select SND_SOC_SOF_HDA_MLINK if SND_SOC_SOF_HDA_LINK
 	help
 	  This option is not user-selectable but automagically handled by
-- 
2.43.0

