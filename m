Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562674404
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404681; cv=none; b=PmTHaFsuopKq/yIOeIySo/ecuE3a6fLDdVm3HeEEPcjfEhfg4T3Y3GmXtzCm4M97OUiKBFul40ngRtDr42SoSvouAg7JMohAmp3gPdNEfBgbQG71gWMLfw06nzbhFIhHkQehwMlqJbX47ttf0WcotGQZF91AqQoz6izdlD9niEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404681; c=relaxed/simple;
	bh=3Xj5RZRNSXKv7J/MxFQUJPFRkMs0lPtQcij8Y5QF8ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a/7Ndh/EVTVXAi8Q1Yrf5Sf7Kgtu6e033xvJdyUBrU8JOfqWFNMV4JFontH3rzGn6APQVZzSCuO7Ou61azSG4s/KOLxnwBHlkeQ7CHmd348PXt2dPOQENpI7kjaft7TaQ5quV4qEGdBsG9CeEaCvUH1zAAMB+XYznb+mtIe5ItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMy0JcQW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMy0JcQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404681; x=1742940681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Xj5RZRNSXKv7J/MxFQUJPFRkMs0lPtQcij8Y5QF8ws=;
  b=EMy0JcQWyxJBtTTbLx8zJeirh4jp0Sl8P6UvZKooS/KLgZ/8kWPj+gPs
   4WKO18KPRXdx5yVDMaLQ/9//1QyZpsKafEj5IkQsE0w3TLDfAeTZlIAwf
   ZjhfqatV6yM48AZib7lUL9M/05I9d+dtbqXHRCBRe0fomASk4czaGZ/oV
   lp9yq5/fFW5h+bnoVr3p2GYnwsN4naKFJ+yPIdMq6zXnabAVPWDxwT+Xv
   Wv595OczDrjN+pdVC3JmgKc9axNSjNig1+TpgC8mNPTcWxgo69YbK7ObV
   fq7fUxhzpACR0TyzN3OS8PI50HWexj7yl0CwDP/4NYk+TlXkZrLZwyffG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643621"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643621"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722107"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/21] ASoC: Intel: sof_rt5682: support ALC5650 on RPL boards
Date: Mon, 25 Mar 2024 17:10:43 -0500
Message-Id: <20240325221059.206042-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

This commit supports RPL boards which implement ALC5650 dual I2S
interface codec.

SSP port usage:
  HP:  SSP0 -> AIF1
  SPK: SSP1 -> AIF2
  BT:  SSP2 -> BT

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index f797937cf9d8..c43e537e60d2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -462,6 +462,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-da7219.tplg",
 	},
+	{
+		.id = "10EC5650",
+		.drv_name = "rpl_rt5682_def",
+		.sof_tplg_filename = "sof-rpl-rt5650.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.40.1

