Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2573156F4A
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 03:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734319931; cv=none; b=EbeqzewZmXWV4V+2B2y3CPPUz8dV6G4Fd1SfZny4qGLRjIvBVAjwiH1JnVyysUFhPWz0K6C77hDpsaKVx3JlowXs5z8HWq4D5XhZDBtll8yDm4kXquVxd/FOfkP5BCHnRh8Qd6LVfzfLpewOxUUO+0gaQ7p+ztcpR7YOhpPCNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734319931; c=relaxed/simple;
	bh=mj8ltHj4K1wdpFITQ6ny/TxHK0NmQu9hqcJqYgw6l04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTYBtixqQPxSVeyEnADFDTwDYAcIM+M7ZW4/dks06aydK+4WMeZaTwVTFfuGRC45AHrkEnI7nV04rDthmxf81eOu+BaAJwlfSeFNOsjIll+OW5zn09MSZ0XM8H4rXeBFOersIOi6HvqAz54txJYAF2wAf/RWjOv4QaO88Ew6P14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzCeLBZ3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzCeLBZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734319930; x=1765855930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mj8ltHj4K1wdpFITQ6ny/TxHK0NmQu9hqcJqYgw6l04=;
  b=BzCeLBZ3055Z2AXDYSukOKTv6xicOCMAnTT0/OoddsR3NsxhN80hhqyc
   hhzukTx6f2DaLyg++TdhP4VRuWewzrIP38e6+/24Sz9Sxra/+kwYJgc84
   C4E3T0YpMT0x87lZUh8bJ5MwPU392JJtmSmDcIpQYDXewDXpxOvwavwcy
   EgXxrXzeK9q7Bt+ZhjkWfupGAKQHvlqIqRFqtfmgOIKhz/Vjtm1A3M68L
   452ToMMuH9BCe0Jp7+Q1wPlc8KYhG/WNExgTocOpqNB6RypjDao5kTq/c
   Tp9Lykbgg3bhruLS9Dbio6x9WOjDgezmOvQpmD971d9CE+T58b+0BnWdk
   A==;
X-CSE-ConnectionGUID: pBClLEp+RZSB9kHgsUWxgQ==
X-CSE-MsgGUID: D/8pSHH8T4evv3LWWucHGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="38468367"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="38468367"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:32:09 -0800
X-CSE-ConnectionGUID: 8tIzALUoQ9KLTA5lt39iBQ==
X-CSE-MsgGUID: ZoHyqnZUTYe5Y6R2rMNyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="96978237"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:32:08 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
Date: Mon, 16 Dec 2024 11:31:58 +0800
Message-ID: <20241216033200.131362-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
References: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Update the DMI match for a Lenovo laptop to the new DMI identifier.

This laptop ships with a different DMI identifier to what was expected,
and now has two identifiers.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 5899601ac143 ("ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 53410fb44673..139f4306dc87 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -646,9 +646,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "233B")
+			DMI_MATCH(DMI_PRODUCT_NAME, "21Q6")
 		},
-		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21Q7")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
 	},
 
 	/* ArrowLake devices */
-- 
2.43.0

