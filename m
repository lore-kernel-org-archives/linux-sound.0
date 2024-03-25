Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6235774E0C
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404689; cv=none; b=PmiVa8FesJA3Ue2S+RQPW/Jrinu1A58x+U6ZbdCT5Fkn4F8DERAi16RYt10G1/sGE0ltYQ0GZIest/OofRVdm41g+wl+xjC5OXJaP9ygXo2ulVDJ2BPWrgKHDb726dF4Qgz1mc9FPT2EgtAEANWADHaHXvP2HjEuYSg1SjUbPkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404689; c=relaxed/simple;
	bh=laVSfbd4eAmRKQ2DaoMAzXDhpjSciyC7dQqa8fRdp2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qq+oNoK+w4DC4mjFumHDEREpZWiNPWu0iHaiwPIuCEvebdx7hPyAusRcCMWr4QvQcl+i7v55fGzWBuZX1k6WvOXX/9DsftEDiI0QgACdCWSy9/IiOL0hsaEDgGNNx6UU3rROlozZcwxt/dsKeyuNa/5QQdnJ99uMZtgt9WZS41k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWxjk3XS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWxjk3XS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404688; x=1742940688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=laVSfbd4eAmRKQ2DaoMAzXDhpjSciyC7dQqa8fRdp2g=;
  b=CWxjk3XSNcAjKZFVvlH0PW1euthQFbT50zvzobi6F64nB2DRduzU32rl
   kWNqOpG2LqcgcnoYbbAd4iDRh+/yVV2yM6RfT0eQWl3JquMI95ZVRO638
   QcXXZ24oe4yFGTaJUOdZ1XmgDRM4zop9w6aQcTj71bH4F/kK5HhYHeVpk
   Qx97VJYd74n+eOFETym7VOjPuXoUnak77f/g8CB7Vtq/j8yXpkAHambym
   UWYEGouMMKRRC1Ju/EuNM2+2lPs0POY/PwvFU7lS/iLTgZOpbhKGJRTqt
   mUPcj/kSjvjjc4kjlkioPD7AswlJ8j9mYe8fmHq8gDz+TlWVFVfRS4GCz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643678"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643678"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722168"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/21] ASoC: Intel: sof_da7219: board id cleanup for rpl boards
Date: Mon, 25 Mar 2024 17:10:55 -0500
Message-Id: <20240325221059.206042-18-pierre-louis.bossart@linux.intel.com>
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

Introduce "rpl_da7219_def" board to reduce the number of rpl board
configs. This config could support all boards which implement
headphone codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 2 +-
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 0da7aa2e31c2..fd3a7be993c1 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -390,7 +390,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
-		.name = "rpl_mx98360_da7219",
+		.name = "rpl_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index c43e537e60d2..77c917897c8d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -457,7 +457,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "rpl_mx98360_da7219",
+		.drv_name = "rpl_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-da7219.tplg",
-- 
2.40.1

