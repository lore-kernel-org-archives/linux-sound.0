Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08998749A
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723026; cv=none; b=NTIvTOdslZYJcQCEEPRODJ4Dmo/8id/xWbtsIZprNrhk+sjZpG6m/Hb3ZN4Q2V3pNxjtp6M9E+T7FOhi94nFKKo05KIIfiANgHhRKSuhMyLReybbjRmoSTTtVKrR6NUMb/N9bFeHzsANaTCQCRpnkDLSvattmMtvudQykTBbZdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723026; c=relaxed/simple;
	bh=hnAANfMFW0xmLVKd2Pe610xJ63d/vRJrR6+877isFbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ro8pwKkvmlQnn8r3O5Lsm0n3GGjTt8UFihasKIVjXZi7VSa5M/elw5NxttgYCenKzza7Y+7Uui8cTo4RZ1IBQkzX+RjFyct2iTzVSpBPQymC8USY/my+fVIbgL3pJUGschRM+ZQirqpWmM9hE9iJbKrZw0eKKXZ4HJDEkNbY55s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hsy75ukA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hsy75ukA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723025; x=1756259025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hnAANfMFW0xmLVKd2Pe610xJ63d/vRJrR6+877isFbk=;
  b=Hsy75ukAvDTXVH2wd9M3iS9S0TtJKv2qxF4+y6L3nRiYcWt4PwYwSuq0
   Ystr1PLCDtde2XAXQF5YXlP4SKoCe5DKobZhW2DVkgZ17RE2FnBJak7HX
   McJrZinWIyL+bBp68kwVUwnR2RCl5CWy3Ow0HlslSOEZguw3zOt14CTvk
   45kWG6PVbHRy3ML6FF8s5qzRrq9KVquyMr+Z9lP7f4/VHVU3dRsFiOf+S
   guegavoBGfpWAnqJA6l2IEONqf3BIAaCV26iKEGJHo7xQXOjuO2ah4uwR
   s06cU5SWfT2lDuRpAQbYdxI5QUfqDdPPJAqPvViflwBhN2bNzvAFJu2cD
   Q==;
X-CSE-ConnectionGUID: V64JpR0xSyOWCr52pXcGZQ==
X-CSE-MsgGUID: Jd6UEn3jSVmweLPAgoIA0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984847"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984847"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:45 -0700
X-CSE-ConnectionGUID: THg8/EqRRzSh2PU2WWJdnw==
X-CSE-MsgGUID: 29psbwS1SIKcbYqxd/Ztpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427725"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 01/16] ASoC: Intel: sof_sdw: make sof_sdw_quirk static
Date: Tue, 27 Aug 2024 09:43:13 +0800
Message-ID: <20240827014329.6542-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

There's no need to make this variable visible at a higher level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 2 +-
 sound/soc/intel/boards/sof_sdw_common.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b1fb6fabd3b7..9b642c6883b0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -17,7 +17,7 @@
 #include "sof_sdw_common.h"
 #include "../../codecs/rt711.h"
 
-unsigned long sof_sdw_quirk = RT711_JD1;
+static unsigned long sof_sdw_quirk = RT711_JD1;
 static int quirk_override = -1;
 module_param_named(quirk, quirk_override, int, 0444);
 MODULE_PARM_DESC(quirk, "Board-specific quirk override");
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index c10d2711b730..3aa1dcec5172 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -58,8 +58,6 @@ struct intel_mc_ctx {
 	unsigned int sdw_pin_index[SDW_INTEL_MAX_LINKS];
 };
 
-extern unsigned long sof_sdw_quirk;
-
 /* generic HDMI support */
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 
-- 
2.43.0

