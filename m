Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3095F1311B3
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556681; cv=none; b=QrcaALP1viWk6Exk3iSLuV7YmTCKvypaVGW/3FQsoYlUC3vAQOIutaCJ+ey1dDaqJ/fvhlbXBRcCwuo05uA9FsFoHL9iMe27gxUWcElvzH+JrYh7cACf7D5pp2CSQgFVhgd8Iq5sjcUUsps2VZHm2wX6AxwlE1Ue+QpNnmvckr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556681; c=relaxed/simple;
	bh=Et/Bpq0RKd9eLmA9c0OeqzY3evz0f/slQrkvVBl7WcY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DWvRmKNJ+lcxPu4xEiAOTqGrVTB+raP+wSxhz5I0qGs+BN9lJ20v/4u8bZxHFWYAkYSiB4RQEvSvm3MWmu2Xke0icans0At2LDM2YpKchN4PYKIhe9eKF83x2zoeii96hvqVXxIH/ti5Q92N9SXkOXB3ziYZAxpwy8IpLWuPWqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAXrgn2t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAXrgn2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556681; x=1743092681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Et/Bpq0RKd9eLmA9c0OeqzY3evz0f/slQrkvVBl7WcY=;
  b=dAXrgn2tCOU6Me035Qosx9NBJRS58BsVtlGzlJuDjTopckpKG5nfuomn
   /J1B5d/u4sGja8XY8wS97lmGeLjWuMyLjkj0H6dDfPZfAvmmAKMK6fCVo
   yX8Eqyycd7P7oXAO3LKGZ/5GpUuyirlDdC5hgmCvztp4YERlKC3JTLYS6
   k0qGUTigelWlE3j2E7FUhUxc0DZ92g9gDl8AebZCYwc2L3XoBnCD24G71
   zUUhfe1oAT8WwJdLRsXIfMpWtgSx1YzOeUe5jgtECk+0eHvEp7loUV/Hl
   y+fRTSwgGXWvoyZFrKr5odX+v8GwtJm2/jkWM8ae4rwBGSd8+typFeuyS
   w==;
X-CSE-ConnectionGUID: aE+edwVOSJyZaUtW59kx+g==
X-CSE-MsgGUID: 9VEXV47ZRJqHcepBKE5YxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221581"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221581"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821356"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/18] ASoC: Intel: sof_cs42l42: add mtl_cs42l42_def for mtl boards
Date: Wed, 27 Mar 2024 11:24:08 -0500
Message-Id: <20240327162408.63953-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add the board config mtl_cs42l42_def to cs42l42 machine driver for all
mtl boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP0, and BT offload on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c              | 7 +++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 3fc76184bdb3..f4fee2ee0d63 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -278,6 +278,13 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_PRESENT |
 					SOF_SSP_PORT_BT_OFFLOAD(2)),
 	},
+	{
+		.name = "mtl_cs42l42_def",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(0) |
+					SOF_BT_OFFLOAD_PRESENT |
+					SOF_SSP_PORT_BT_OFFLOAD(1)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 7f422848a3ba..75935b454e5d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -69,6 +69,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
+	{
+		.id = CS42L42_ACPI_HID,
+		.drv_name = "mtl_cs42l42_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "mtl_nau8825_def",
-- 
2.40.1

