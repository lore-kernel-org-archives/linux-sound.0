Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED2439F75;
	Tue, 28 Jul 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242819; cv=none; b=Vi1VZyf/Z8D6oEMu2eKF78XtXd68/0DJtQcYqWSzizWW6niSpSBbEJFRC+zqWvhGAcjWgK2yTlkT+FwisfqRL0yPuJQPS15ILKv5NZluqTmcv+d/R/dcnm/2+G7rLiOy6SoqJdXpXSB0dhzXLWIEWytVezyzFi63zwUqDKlQWUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242819; c=relaxed/simple;
	bh=XXa1KLNITSbn+t+2KzrhQrriubc2OEFRHbaO+4aBVK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ntYAhF04OkeQaG4qNGEBs+zNFlXikQcxn58fKVZlnhELoZLTtPG946FaMP0dXKP/e/i6tx5d6Z/0BXE7afhhmjpqXYwCcHqy4oNMpKEcvygefodBYpCWZIXaaSWF41OLaeqo5792Dd/oJBv7VkjhuTWxB3jfrQoY/BzgnK93aNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCtjvlyK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCtjvlyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785242817; x=1816778817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XXa1KLNITSbn+t+2KzrhQrriubc2OEFRHbaO+4aBVK8=;
  b=RCtjvlyKJK7jpU7gcaPMcHpTnIRtUmJdhh0CmKH95oeLuKsQf8AIP/85
   hBH5QWGRuwuBIKXKxu60Q+rKo/Rxr/oNVTPEnMBECbpN7X1Br3hjMPMrT
   OImAo71DLdEPFERwpwkHcyoI8pfpCN44WO9YaaKVxPaEgP+AVDwRTxL2o
   4s89d7nKc7B7XpkJ2KPTc3RAx9rCUSpO7diAR+xghxLM9eFFGSCDgLpKV
   m2CTJg61e695Bf529zLRQw+uGJj4t0o5p5L9sYTBfN/QP0RhkKx58vNZJ
   GrP6ipeYTqaL7g2u1oi64u898WGj1ewy2TEWmVF3QuWb1JUuQUWEDcD+W
   A==;
X-CSE-ConnectionGUID: aUDds0xERO+2LcWbkVFC9g==
X-CSE-MsgGUID: CjreUR99Tf2BO9W8iZYcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88361259"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="88361259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:56 -0700
X-CSE-ConnectionGUID: qg0SnNxDQomk6JbacBJdPA==
X-CSE-MsgGUID: xKMTrNJWQ3K2Cc65Ia0juw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264695548"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH RESEND 4/5] soundwire: get mipi-sdw-bra-mode-max-data-per-frame property
Date: Tue, 28 Jul 2026 20:46:38 +0800
Message-ID: <20260728124639.1484973-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728124639.1484973-1-yung-chuan.liao@linux.intel.com>
References: <20260728124639.1484973-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Get the mipi-sdw-bra-mode-max-data-per-frame property which indicates
the maximum data payload size (in bytes per frame excluding header,
CRC, and footer) for the BRA Mode.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 3 +++
 include/linux/soundwire/sdw.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index b122bd1e7321..cfccaa33f438 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -474,6 +474,9 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	device_property_read_u32(dev, "mipi-sdw-bra-mode-block-alignment",
 				 &prop->bra_block_alignment);
 
+	device_property_read_u32(dev, "mipi-sdw-bra-mode-max-data-per-frame",
+				 &prop->bra_max_data_per_frame);
+
 	prop->commit_register_supported = mipi_device_property_read_bool(dev,
 			"mipi-sdw-commit-register-supported");
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 7e27e8bdb64a..89009a2c321d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -367,6 +367,8 @@ struct sdw_dpn_prop {
  * @lane_maps: Lane mapping for the slave, only valid if lane_control_support is set
  * @bra_block_alignment: If non-zero the length of data in a BRA frame must be
  *			 a multiple of this number of bytes.
+ * @bra_max_data_per_frame: If non-zero the maximum data payload size (in bytes per
+ *			    frame excluding header, CRC, and footer) for this BRA Mode
  * @clock_reg_supported: the Peripheral implements the clock base and scale
  * registers introduced with the SoundWire 1.2 specification. SDCA devices
  * do not need to set this boolean property as the registers are required.
@@ -398,6 +400,7 @@ struct sdw_slave_prop {
 	u8 scp_int1_mask;
 	u8 lane_maps[SDW_MAX_LANES];
 	u32 bra_block_alignment;
+	u32 bra_max_data_per_frame;
 	bool clock_reg_supported;
 	bool use_domain_irq;
 };
-- 
2.43.0

