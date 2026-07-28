Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0777A438022;
	Tue, 28 Jul 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242814; cv=none; b=rUa7Bv0VlLY/rAUxtb6Ypxh7trao0aVlpEzYIVsRL4SfC3TLYoy0kwmZXTHQXew18XKS9FWzFO4u0nCUvY0X676xhBh1Xzkn5YA/ALEk5lZMNtKYW23wbJNw/tKK1PQKb3vukT5T8vmH4c3YxD0dRXGrXTwjwlSutjJ8tOrtdDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242814; c=relaxed/simple;
	bh=CJG9Xk3bR3b4I8UpYAaBpZEwK2e7XFKpXIV2rxPoY2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEglu0XbyDUZZKeFGAt3nMBKZDPu8dj/vIhBU/Rhs2JCTFKige+GC5QU4qsHnzXLs8Tw1yhBF5zRqxKWeAsitLsZslWUQsmyvkl/6N+tC8QtOviTnd7gB/7ZeWb5S4xojLAs7p9PUpPgDrCHuUxjTcatfWxR3FHm6csegz+q3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6Br8YFq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6Br8YFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785242813; x=1816778813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CJG9Xk3bR3b4I8UpYAaBpZEwK2e7XFKpXIV2rxPoY2Q=;
  b=Q6Br8YFq76Njs+JoTfvl22waEcbLC52VN7Hj7dfxzMVaBlCQcMvYbbiA
   vwkMg4/as/Mnet88aCBbiu6k/b2Y/X+HI0DcAKLP2Exzhbmg2zLRIahEq
   m1PbTn3x1HU854Psr/r1Hvb9+SD+B5J891Ss88gx5ofBN0m3bUWM1Gcol
   uCpMY7QMSdFgEtKXDOIhgT6qZ8L9A6ML59vt6RYatD1mYkmaPOZH0SKVn
   NNYHKaI8VgZlQSzb/qPbrJFNJfVYK3NlkOM8JxPVG8TP8hZ5nNZeDKsTr
   4aYqacBbVqS6Mc8GOFUOGqlG97Y/tmuWJM1LsbtOhZVOb/cTofnTvl7I1
   w==;
X-CSE-ConnectionGUID: 0kP44KkLSE6Xbs2hF4QWLw==
X-CSE-MsgGUID: oGwUJPk/RQC2TjFosbv9uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88361250"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="88361250"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:53 -0700
X-CSE-ConnectionGUID: DzpqiWdhRS+ktz9krQUhRA==
X-CSE-MsgGUID: w0T2IdjjQQCCjJrZmeIE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264695508"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH RESEND 2/5] soundwire: Add bra_block_alignment property support
Date: Tue, 28 Jul 2026 20:46:36 +0800
Message-ID: <20260728124639.1484973-3-yung-chuan.liao@linux.intel.com>
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

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Add a property to struct sdw_slave_prop equivalent to the Disco
property "mipi-sdw-bra-mode-block-alignment".

The SoundWire Disco specification defines this as:

"The data payload size for this BRA Mode shall be an integer
multiple of the value of this Property."

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 3 +++
 include/linux/soundwire/sdw.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index c69b78cd0b62..b122bd1e7321 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -471,6 +471,9 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	device_property_read_u32(dev, "mipi-sdw-sdca-interrupt-register-list",
 				 &prop->sdca_interrupt_register_list);
 
+	device_property_read_u32(dev, "mipi-sdw-bra-mode-block-alignment",
+				 &prop->bra_block_alignment);
+
 	prop->commit_register_supported = mipi_device_property_read_bool(dev,
 			"mipi-sdw-commit-register-supported");
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b484784e2690..7e27e8bdb64a 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -365,6 +365,8 @@ struct sdw_dpn_prop {
  * @commit_register_supported: is PCP_Commit register supported
  * @scp_int1_mask: SCP_INT1_MASK desired settings
  * @lane_maps: Lane mapping for the slave, only valid if lane_control_support is set
+ * @bra_block_alignment: If non-zero the length of data in a BRA frame must be
+ *			 a multiple of this number of bytes.
  * @clock_reg_supported: the Peripheral implements the clock base and scale
  * registers introduced with the SoundWire 1.2 specification. SDCA devices
  * do not need to set this boolean property as the registers are required.
@@ -395,6 +397,7 @@ struct sdw_slave_prop {
 	u8 commit_register_supported;
 	u8 scp_int1_mask;
 	u8 lane_maps[SDW_MAX_LANES];
+	u32 bra_block_alignment;
 	bool clock_reg_supported;
 	bool use_domain_irq;
 };
-- 
2.43.0

