Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD93DD52B
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790353; cv=none; b=lpj+LJF5oR87o/ONzKohOySBLYPe0U0dOsHDu2ZNWjIAAOTVlcbKUFXOLsYvS3sn02ONB3MAzJohswVrKvV6AAUACKrLrse96qXur7K4gj2ZtWS9+u4csNnvcbMqbGrXQq8AD2I0xg8m69fnwV1u73Ud1P8o/twhaAP9tPa0Mck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790353; c=relaxed/simple;
	bh=Hp4XnyAJ2qPX18nvE1okPNIG6/7YJ7aYVSr0RcHzYFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDtfCVHuwkRZ+QyL81ejVRZ8GVd32isTdL77bOSBlJUyZU7jjBcMwkrpye4Qg5+S6TF3OWj0bVfJZh/Z/V1ZrRcFZT6lzhGGfIeR886oJHjNbCUrR8Ej40lomEsozqeIDM47voApH4DykKi9QALQf6J+dajg96V0xDEyu6pVabI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwlBcK9s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwlBcK9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784790351; x=1816326351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hp4XnyAJ2qPX18nvE1okPNIG6/7YJ7aYVSr0RcHzYFw=;
  b=XwlBcK9sku4mpbbmWZ/zdaXzeun7nTg2yCpdL/TlO7LIyHa3hxTwskcv
   YfYTpTjbd0AZO8emPWxeLxD6lh+ZIgLR4Fpx5PqCZRq2EKInJ4Mm0/R5+
   q/10GVLb7OrUBiPoVGe2oA3/xY9ObVkmT7tmoHUWvMjHv5E1W2LH81bZI
   PW8YhffK16I1OFMu1DI+QoOlmXr0WOUL29A+osA10eCghmvnSfZCalPFM
   q3sBCgtt4klh0oh7g6gBS57vkBor47NsaEbTa0siSHsf9EsMxEZf4l4IW
   kfBOZ73aAAnYZ/5cXNTwPv5GTOPOmuhEJQ/OsFkSKZuiz3U83tAuNS/nm
   w==;
X-CSE-ConnectionGUID: BCR8DvFhTEito3GUyNS3Ig==
X-CSE-MsgGUID: Ckzeyr6MS3WGKjw8D7Gh8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96095057"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96095057"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:49 -0700
X-CSE-ConnectionGUID: Jta0BSz0SyqNanAZDwLDkA==
X-CSE-MsgGUID: XK2ADQuiSdOnI2xcgdPrMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256522069"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 5/6] ASoC: soc-acpi-intel-arl-match: use function topology by default
Date: Thu, 23 Jul 2026 15:05:20 +0800
Message-ID: <20260723070521.870256-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
References: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit c84179a1d36b ("ASoC: Intel: sof_sdw: append dai type to dai
link name unconditionally"), function topology can apply to all
SoundWire codec configurations. Set .get_function_tplg_files callback to
use function topology by default. If any required function topology can
not be found in the file system, it will fallback to use the monolithic
topology.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 59bfd5248819..1033f2d45c8a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -572,6 +572,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.links = arl_rt711_l0_rt1316_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt711-l0-rt1316-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(3),
@@ -600,12 +601,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.links = arl_rvp,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt711.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = arl_sdca_rvp,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt711-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(2),
-- 
2.43.0

