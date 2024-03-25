Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844673518
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404681; cv=none; b=Vg6ZPRfQuZBC5Ha0gN02EPmSpbm3ayxmHRvE6PpYVhNIAu9EXu/f7hJ4C5GWBfNpGKTw78LtEEGUZM1Bgl3F9Nj+Vn0n2012ui3RgNutXDfEyfTnZ0ISIJWjUO+hf56w6F+DnDgla37QIqIa0izpNesGsnxqhJUphvJtjMk7E/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404681; c=relaxed/simple;
	bh=Wywr4VA7AxafZFUyAAtsuXWMM3q95q02IaLHyvm6k1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LFkOBKMsexpUP+8f9vkXO9OySYztQEo2uZf/gpnKTlmbpoIVGev2npnM+1N7yQ9NxG2UTAjMdDKoQGjtHCdklK9Z3jHGu3Q52YtCT9wHuQFnBmhUGHc3szK4meuClcAsKCo8oDHZBTVzRG1TNAE22L+37oiGrHhQZ7Ngec0Dsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1HN+ud5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1HN+ud5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404680; x=1742940680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wywr4VA7AxafZFUyAAtsuXWMM3q95q02IaLHyvm6k1I=;
  b=J1HN+ud5it8jq8j24gEiMkj25z1aEkT8Wro600L1C/H6vUHhk7wgB2jr
   +fHmz/WGoLupUQKvBW7EOhRdUIVm39/y449hyekuuZ/ktxyANv7Oh682W
   F16OOcu5DRAN0dadTiwDSadUg3j43N7eP3XykZiAdqbhRRhmh2eY5aDvf
   ioAdsleFR5wO5JM9dUYZTP1VPjFyIqiFq1tnIFH5cW4qqabGF6847wFAa
   rVgLgFY8kjhXr/Z4KTabtagtVgs3xNmi7yOJN75ZFEJ9vRWXqWN01Z6Cq
   Xc+nYQ+C4WwswIINcfq7/1ho3/6DzAkwDquE8/f6iaWnAtkD90nBspyDx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643617"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722103"
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
Subject: [PATCH 04/21] ASoC: Intel: sof_da7219: add rpl_mx98360_da7219 board config
Date: Mon, 25 Mar 2024 17:10:42 -0500
Message-Id: <20240325221059.206042-5-pierre-louis.bossart@linux.intel.com>
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

This configuration supports RPL boards which implement DA7219 on SSP0
and MAX98360A on SSP1. DA7219 uses PLL bypass mode to avoid WCLK
locking problem. To use this mode, the MCLK frequency must be 12.288
or 24.576MHz in the topology binary.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 4 ++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 6eb5a6144e97..290bf75bdaef 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -545,6 +545,10 @@ static const struct platform_device_id board_ids[] = {
 		.name = "adl_mx98360_da7219",
 		/* no quirk needed for this board */
 	},
+	{
+		.name = "rpl_mx98360_da7219",
+		/* no quirk needed for this board */
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 00a21af210fa..f797937cf9d8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -455,6 +455,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.drv_name = "rpl_lt6911_hdmi_ssp",
 		.sof_tplg_filename = "sof-rpl-nocodec-hdmi-ssp02.tplg"
 	},
+	{
+		.id = "DLGS7219",
+		.drv_name = "rpl_mx98360_da7219",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rpl_max98360a_amp,
+		.sof_tplg_filename = "sof-rpl-max98360a-da7219.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.40.1

