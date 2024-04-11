Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36673D96A
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873060; cv=none; b=FjSdev5Q4audYJWt5oJw7JmN4x7NgPdx59XGzOHTzVJtu8QELWQEnc8jbw6Ci4sFy41/Tc9AY8Gv9vTELX6Qrxd3X99pJgeTJ19RojR7rIu0Fwyfu0J8RcxSocxTEu7tD8ZdWxIoyHtEvhUGpHoFon6ht4e9WQBkK2RU4652uGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873060; c=relaxed/simple;
	bh=FWG2AfFnImMcpOfUcKhPWUGMJBhZtewcs9s04fO8Wig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SAyrZisKOAuKKY22eFwvAy1qTM0XsK5ha1tkLNmERVu35WJP2weKNkSt/MuIy4xzx5ywblOrKkZD6u+DbolhRS85GVY7tMiFXRek6UvcxLGeGthTVzH2sT3V6iUIcRckKW8SrxWPClkaDqiEQ/NT3EppGABNUlLiHlafu+w+hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSgXia2o; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSgXia2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873059; x=1744409059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FWG2AfFnImMcpOfUcKhPWUGMJBhZtewcs9s04fO8Wig=;
  b=YSgXia2oNkL+JWWg8Jx9MqPVZR1e00XkSc7y4u1K5X7y4PAzcw+WZ9qh
   NsF3sIXlsCiwseH19bKWH/K9Dw+o8MzU6dQX0ZJUGjf5uAt0Z+JQQEykX
   jN8TivrjkYvXOlzRokDSQGpig7Y6yslXojYm52U2DJNkkLo7Ln8jeGZzQ
   o+wKpmbb7wuyulGJbDh4a5emgaEBIvnRg2O4RPVmXUZ1ZMeq++yIuHYgR
   HIe2nm+yzuwZlOObf0/B9cEfgpzLyk+1ilAMekJg6fqM02zfaH+rSo8Ms
   2O7u/+2Egy6L5RcsRQbxVO4JL/mR98KlGIvQfVmSCW0y8x4ab9p1gRCKE
   Q==;
X-CSE-ConnectionGUID: AAnPUptuTLeMqMfqQAfVGQ==
X-CSE-MsgGUID: lzSZuYePQqya0gYBNNEFcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708371"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708371"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:18 -0700
X-CSE-ConnectionGUID: tlA6iIWlTwGccwSKxTLg/A==
X-CSE-MsgGUID: NEk9o1LdRoeO0Hlkd+ahLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628755"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/12] ASoC: Intel: sof_da7219: add mtl_da7219_def for mtl boards
Date: Thu, 11 Apr 2024 17:03:43 -0500
Message-Id: <20240411220347.131267-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add the board config mtl_da7219_def to da7219 machine driver for all
mtl boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP0, and BT offload on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index fd3a7be993c1..cbbce07ec5f7 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -398,6 +398,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "mtl_da7219_def",
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
+					SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(0) |
+					SOF_SSP_PORT_BT_OFFLOAD(1) |
+					SOF_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 264f5c19af56..f95490a16b55 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -76,6 +76,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = DA7219_ACPI_HID,
+		.drv_name = "mtl_da7219_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "mtl_nau8825_def",
-- 
2.40.1

