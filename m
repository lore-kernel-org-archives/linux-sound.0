Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9A410D09;
	Tue, 30 Jun 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823721; cv=none; b=HKPDmjPxV38znGX01jah6u9e+R5QwckbiIhSV4NyxENpw12r0FcZt7q9ioj+M80uQHk8wHyd4bYkzFcrtjhFZxdkCD9tQcELQnOzko1SK07lYM/9u/WRFPkW47DPrevngi9gonAzvMYyWBtGyhsuQgP7ls0X4tfiT6QnOai7LIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823721; c=relaxed/simple;
	bh=CJG9Xk3bR3b4I8UpYAaBpZEwK2e7XFKpXIV2rxPoY2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLQXnE7NsASYB02Zku7Rjq8o2RvB1OohHgMg0YfX35pRZDSVwSJsbzyEf7JXdsgpDCW3BNiEcVjK2INwFPqaa0bCWkVssVrtctaU0clNKbASmurFX/oHjzk9/IJw1qDIa/Nr0OWjSZ0TE0Q8yArJBdJw0t0dMD5i9j+9dhrCLCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiGLUF1l; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiGLUF1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782823720; x=1814359720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CJG9Xk3bR3b4I8UpYAaBpZEwK2e7XFKpXIV2rxPoY2Q=;
  b=IiGLUF1lWob+skPEUMndezDwV4uPWxrxk3DGP1vxbFTHLo8CbLojOPYU
   QBlqAsWm28vhXSINKksLmqvObnuOA7NXjCAKrwgrhfxLF2bbwXWut97qj
   8iEIaWhc2t6ru7IuuOhF/MS32gcT97VJ4gdUyOWppWnxQYrOaNKgH3PbG
   QtUfOb7TYMgt9tWS90IpelxBPu6GWHV1ViBGF/48L3NwI7XJcjOIsBF+p
   A5CYGrJ6vX7nzJt0IWRdhYg/EN3zVW131lxH7pw5BFYxYsZpqxVFSV87h
   beGsr/keRzU9MWwT5Dh40tSHI0ZrLB/b1/Bcyc8lXs0WtBSu+bScqCCnW
   g==;
X-CSE-ConnectionGUID: uLsckFX5S0Oh8RPZV1U6Vg==
X-CSE-MsgGUID: 91POlrGlRcKhCxJ2JBdyIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86084985"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="86084985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:40 -0700
X-CSE-ConnectionGUID: zQhfPPniQlaDwUcXeW2plw==
X-CSE-MsgGUID: hNeUgeDMROa3Z1PW6a+GoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="290382851"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/5] soundwire: Add bra_block_alignment property support
Date: Tue, 30 Jun 2026 20:48:22 +0800
Message-ID: <20260630124825.2263243-3-yung-chuan.liao@linux.intel.com>
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

