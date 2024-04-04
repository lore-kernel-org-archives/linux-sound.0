Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D80413249E
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257447; cv=none; b=qE/bixC8AWMymEOagMkiOxFaHZ+ei6ffD31BtlIRMdLjOJ1V3eikteOYOo6no2mUNZ30LM4d51udEjSs1Zlfw7NPDgA73pb0uX2tjXDMdCmHqF3ZNsXaa3oEiNMvnHEfz/xCA4A8EWZWlOGLf+OdkEjfDIXs6JVXK4x+/SeMWA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257447; c=relaxed/simple;
	bh=dO0+Df+UCol+vwpv6OirQZXMXDUJ4CDtRVfQipUXjgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ox1yRCPLpeI5j0UD9iS/eu23WC8T+Z0xhoQ8AoiC2Jb8/sGZFM+A0rqfijcJ2SXUcUuwXj12SKrCGwGlB2XZNVw0v4wUNFW0TDy4DZmf8A10Rw8ziwaW9uiMT24ktGH+Iny9h/OgGRzteyGNIwzLk5K6NE2i/P2AIp3CpxBj7OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdL3robh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdL3robh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257446; x=1743793446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dO0+Df+UCol+vwpv6OirQZXMXDUJ4CDtRVfQipUXjgI=;
  b=FdL3robhO/sqeARUqFbF1znZpmAIqrnz7lEqmq1hcqwJOyAWuh8JhK50
   DY/vC0EJVuKp8ZBgiM0Ena307Ot9Dn6O/6KMiqeQ9tlSq+7O2dpiR4Swl
   g5yYRg6qc1kIdK5tPQ3fcBvnqxjmRHVwowe89jONOewZWVdkNCHHZa2Pn
   gPNhFgqfNP+fSL+RZl+lbzYy3WmXhXd9yHet37mpeUuBWDA8284MOv77a
   jdZrSGyoxTjrRnyFG2ODZp2yuNGB5hfMUnmhZzlSOMeOKvcvz0xXWO8hp
   NytfJXeGLPhJO9jmY8wp+SoYYf6fGIZ39C8swBYFDsFLLIJd+K0ZGs6Gh
   w==;
X-CSE-ConnectionGUID: C5UCRk6GSAKPbfAoV8gM/w==
X-CSE-MsgGUID: g8DOUSYAQbWrKIjOa7IPkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433864"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7433864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:05 -0700
X-CSE-ConnectionGUID: NlKdAZtzQk+zr/P2+CC+Ug==
X-CSE-MsgGUID: +h89JjrjQ0anJj+DMVWDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19492309"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 2/4] ASoC: SOF: Intel: lnl: add helper to detect SoundWire wakes
Date: Thu,  4 Apr 2024 14:03:55 -0500
Message-Id: <20240404190357.138073-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The global STATESTS register will provide information on all
links. Rather than iterate on all possible links, the helpers only
filters the range of possible bits for a quick lookup. The
process_wakeen() helper will walk through all the links and deal with
wakes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/lnl.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 95da0c626832..c3ee507e2e21 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -205,6 +205,23 @@ static int lnl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 	return mtl_enable_interrupts(sdev, false);
 }
 
+static bool lnl_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	u16 wake_sts;
+
+	/*
+	 * we need to use the global HDaudio WAKEEN/STS to be able to
+	 * detect wakes in low-power modes. The link-specific information
+	 * is handled in the process_wakeen() helper, this helper only
+	 * detects a SoundWire wake without identifying the link.
+	 */
+	wake_sts = snd_hdac_chip_readw(bus, STATESTS);
+
+	/* filter out the range of SDIs that can be set for SoundWire */
+	return wake_sts & GENMASK(SDW_MAX_DEVICES, SDW_INTEL_DEV_NUM_IDA_MIN);
+}
+
 const struct sof_intel_dsp_desc lnl_chip_info = {
 	.cores_num = 5,
 	.init_core_mask = BIT(0),
@@ -221,6 +238,7 @@ const struct sof_intel_dsp_desc lnl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
 	.enable_sdw_irq = lnl_enable_sdw_irq,
 	.check_sdw_irq = lnl_dsp_check_sdw_irq,
+	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
-- 
2.40.1

