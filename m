Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7686F1DE3C5
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471958; cv=none; b=WSZL+CL6VmXeldI+eFSr2VVCNieAMk03xGChBH7qmHPvA0OAdBFXhwBKbPARczq+okc/J0sdcyLH2M/bRx6wVt37J1c0QZqrWdv1o4p63ZQ9MXKYlSx7SfMh9t+hMDF+XmH8DHMStiiHJ64x2ResoeuOyfnmaWNLtI4bSERFykU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471958; c=relaxed/simple;
	bh=3TXT/mmCDufKjJNQbdv+5liO4u5+w6mvYrcIfZTJYHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hs4ZUTChT/9/epwtGuVQo+ORk9EhSktdHJRf7H+J1HUVL2o0X2p/fX7U4fcwOY59mH8crl30FLmpsGQpRbvyi4JMPMXwnh7FZNrgrwGFKf5AxEkdwOk2UU/qUnHEXtBW70mzJ/wsOSMfZ9/FLC0aCRy/DeddS9CmFqcQlNYnuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAMbnKuk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAMbnKuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471956; x=1765007956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3TXT/mmCDufKjJNQbdv+5liO4u5+w6mvYrcIfZTJYHk=;
  b=KAMbnKukHFpA7wTzp31t2TMI/FLRWnDmA+P65ie+ilv54PnDEv82pYKl
   K6pYR2YMqmus7LAF7tIft1tyO0/tXu9pcJUuspbEruc+tjGLPUREnZjr8
   KvzKuGn5a0RWE1kX9zkoC9xR6eN2HKiCFFj5kuEWlalCa8kpn7QH7pOir
   lmFcWCcXYT74t40+1LnH0KSeBYCjpm8MpwhkxfF2VOwCBuynjYwabZ785
   fwm4TyMilRhwz4fE6fd+AfoDoONZkhuN2QQF8r054ISj6BY/pGJdFZXru
   MtBOtIPhEIIj7MwowCqePJK7+kcu+AME8oPEjCd4P/tETcNMqD7bsn7Qo
   g==;
X-CSE-ConnectionGUID: H+PPbfIhT+W1vA4xEoYKIg==
X-CSE-MsgGUID: Rw7m+jIqRXCx6J8RlGmtWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192771"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192771"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:16 -0800
X-CSE-ConnectionGUID: Hnhg1t0YSCefcrfHxLt2Iw==
X-CSE-MsgGUID: CMZUXJS5Qeel3dmOH2caaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144370"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:14 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 01/10] ASoC: Intel: sof_sdw: correct mach_params->dmic_num
Date: Fri,  6 Dec 2024 15:58:54 +0800
Message-ID: <20241206075903.195730-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mach_params->dmic_num will be used to set the cfg-mics value of
card->components string which should be the dmic channels. However
dmic_num is dmic link number and could be set due to the SOC_SDW_PCH_DMIC
quirk. Set mach_params->dmic_num to the default value if the dmic link
is created due to the SOC_SDW_PCH_DMIC quirk.

Fixes: 7db9f6361170 ("ASoC: Intel: sof_sdw: overwrite mach_params->dmic_num")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 810be7c949a5..b58b9d85b56e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -22,6 +22,8 @@ static int quirk_override = -1;
 module_param_named(quirk, quirk_override, int, 0444);
 MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
+#define DMIC_DEFAULT_CHANNELS 2
+
 static void log_quirks(struct device *dev)
 {
 	if (SOC_SDW_JACK_JDSRC(sof_sdw_quirk))
@@ -1106,17 +1108,19 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
 
 	/* enable dmic01 & dmic16k */
-	if (sof_sdw_quirk & SOC_SDW_PCH_DMIC || mach_params->dmic_num) {
-		if (ctx->ignore_internal_dmic)
-			dev_warn(dev, "Ignoring PCH DMIC\n");
-		else
-			dmic_num = 2;
+	if (ctx->ignore_internal_dmic) {
+		dev_warn(dev, "Ignoring internal DMIC\n");
+		mach_params->dmic_num = 0;
+	} else if (mach_params->dmic_num) {
+		dmic_num = 2;
+	} else if (sof_sdw_quirk & SOC_SDW_PCH_DMIC) {
+		dmic_num = 2;
+		/*
+		 * mach_params->dmic_num will be used to set the cfg-mics value of
+		 * card->components string. Set it to the default value.
+		 */
+		mach_params->dmic_num = DMIC_DEFAULT_CHANNELS;
 	}
-	/*
-	 * mach_params->dmic_num will be used to set the cfg-mics value of card->components
-	 * string. Overwrite it to the actual number of PCH DMICs used in the device.
-	 */
-	mach_params->dmic_num = dmic_num;
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		bt_num = 1;
-- 
2.43.0

