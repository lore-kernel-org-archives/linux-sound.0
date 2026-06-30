Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E833411682;
	Tue, 30 Jun 2026 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823725; cv=none; b=EAsMOBNZUbzjOFk67djrTzqRt8TmlYEwCTGgl6Vn+IIjSdSKPr1SPQrhDn8CqndEWgzyfy/b0offCPjbNrqlSov8DLuvDqntvMZYvTbyQMuQmq6XDdUI5Ro2MrgaZS1m8dIBlG/SYtpITQ+HpgIGjI+BVqQSAArZTr5qclXAynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823725; c=relaxed/simple;
	bh=XXa1KLNITSbn+t+2KzrhQrriubc2OEFRHbaO+4aBVK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gqObeq+mJyGg/hLyr7TfMfGh09up5d7d0i1hGMHt6dHlv4HlS3S4iCW8dRB6Z6T6BKaSUaS/5dy4fd0qwbySK4Mi6RTKug0EPQXH86BD7nzOcCJb+57/HHP2Ladv3FegGlDaQ/LxvAgS+bSUtDQoFZHMVaMj4b6J2elgljyJWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiIcTnd4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiIcTnd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782823725; x=1814359725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XXa1KLNITSbn+t+2KzrhQrriubc2OEFRHbaO+4aBVK8=;
  b=NiIcTnd4DNF2y+mlXa83PVVwVL77pX1ibgddFpvgIhAK4HVSwjmqnVti
   Ud/7vpgb1rt4UI/aQ1VtP9tKGMKqrAQrwVQhYvwCsyC3pwbvXcOJbX1W4
   jvOueE/xJ4HVcgAlKzxFoZnXQdha9tUc1i0sVaHKbDo5b0j2KqtfLpNOl
   DOIZkQ4XCqCTrpSqvZaKW3/e7iE8NOCBL7HH70tEeIbmlA7Q/6aZVQFP3
   mhk7JB1Ue6zuerKBJxlinCRwsZaO3ZmOQUZZn1M7R6wC4z5p/XscLtUVV
   6TyiHDoNy0Oud2ig8fNwFOhGVCaFzFn6MdeVwHEmooAm7M/XbhQRGYlbi
   g==;
X-CSE-ConnectionGUID: zvCETn2iTYGwHK33/8NLnA==
X-CSE-MsgGUID: lAmjsJTxR1WmoPohL9rvtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86084998"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="86084998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:44 -0700
X-CSE-ConnectionGUID: DGn4WLXGTy6aPTfaT/YPKw==
X-CSE-MsgGUID: Hca4yereS2qy1rgGpHkS7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="290382863"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 4/5] soundwire: get mipi-sdw-bra-mode-max-data-per-frame property
Date: Tue, 30 Jun 2026 20:48:24 +0800
Message-ID: <20260630124825.2263243-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630124825.2263243-1-yung-chuan.liao@linux.intel.com>
References: <20260630124825.2263243-1-yung-chuan.liao@linux.intel.com>
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

