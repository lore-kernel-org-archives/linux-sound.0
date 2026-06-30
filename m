Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442F413241;
	Tue, 30 Jun 2026 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823727; cv=none; b=XZHBi5r0z8yLRN4GFNwYf71NYUqNsbk8g6RYvCtL3sL69/eAkEHqn3kWoz7CeDgcKG8I7kwHtvWGChJyuQNfYeqfVNr+aWppxMF8CvcaZA3qRn3SwTGQrSMFjqjSwLILOeDMZcBVEzU/JNeur9Xr4I9zEfjcWsv82Yj292E3jEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823727; c=relaxed/simple;
	bh=FUUbVhl9mL0gMCVdalfUOCC1Zzz4uGrOZwqcJ5xkLIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pf5AoBc0Q42ATSJHaFDjcCKa+HmLjlScwDaok+UT5R8ltRErZXEFEeG/drEIrqyI7ylE+mMODScxa2a9/8cZiYgZO8J51Z1J38ovzFIKdoJCw4DHDwVQFrWyFRuuwEBtWzoEvk5gcYsV0tT8MkoaAAofIMYQ98yaZh6brMaFfgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8QZ+gj6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8QZ+gj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782823727; x=1814359727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FUUbVhl9mL0gMCVdalfUOCC1Zzz4uGrOZwqcJ5xkLIY=;
  b=X8QZ+gj6UX+0U2dSjVtUahWdWLpr9V/o/GFfXoQesqr8ErrDrpn/51Fa
   0yAl7TmgzouUjoRnm/bCDVvEIFx7o6QDDb6oMwJ1OJIW6SxYlIZnehQPP
   X6WqCLGHDDYPBUCBnrgRT8UcxDFZz5om9FGypwD+5+5kFmLqU3EukezZ7
   Pz91o61ux8nsLTZsmRFpZl7LGmtPJ/lmhjPupSgXYHO1R6Y/gR9HbENVG
   dnfRH4gn6FkKFuOidNHd0Q/RigpaA8EqGN+Flo2aRuYa7DLU22nlQfZ1v
   9FSAeB/w+4XJD1PyIt6YBg+M5efGRkO65+6OQo2AYOM5L/8XtVA+/K0iM
   w==;
X-CSE-ConnectionGUID: 0pgEcnoYTIOdWni3BI1lPw==
X-CSE-MsgGUID: ShQrZy30TfSng7Q7YC1W0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86085011"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="86085011"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:46 -0700
X-CSE-ConnectionGUID: /n12H3n6QhyEAT8lWQucSw==
X-CSE-MsgGUID: qsE8RHK5SsG+dA6zgl6uWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="290382871"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 5/5] soundwire: intel_ace2x: handle the max_data_per_frame property
Date: Tue, 30 Jun 2026 20:48:25 +0800
Message-ID: <20260630124825.2263243-6-yung-chuan.liao@linux.intel.com>
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

The optional property indicates the maximum data payload size for the
BRA mode.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 18 ++++++++++++++++--
 include/linux/soundwire/sdw.h   |  8 ++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 2fc5589bbd72..ad83811037d2 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -57,6 +57,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	struct sdw_port_config *pconfig;
 	unsigned int pdi0_buf_size_pre_frame;
 	unsigned int pdi1_buf_size_pre_frame;
+	unsigned int max_data_per_frame;
 	unsigned int pdi0_buffer_size_;
 	unsigned int pdi1_buffer_size_;
 	unsigned int pdi0_buffer_size;
@@ -168,11 +169,24 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	pdi0_buffer_size = 0;
 	pdi1_buffer_size = 0;
 	num_frames = 0;
+
+	if (slave->prop.bra_max_data_per_frame) {
+		max_data_per_frame = slave->prop.bra_max_data_per_frame;
+		if (max_data_per_frame > SDW_BRA_MAX_BYTES_PER_FRAME) {
+			dev_warn(&slave->dev,
+				 "BRA max_data_per_frame %u exceeds limit %u, clamping\n",
+				 max_data_per_frame, SDW_BRA_MAX_BYTES_PER_FRAME);
+			max_data_per_frame = SDW_BRA_MAX_BYTES_PER_FRAME;
+		}
+	} else {
+		max_data_per_frame = SDW_BRA_MAX_BYTES_PER_FRAME;
+	}
+
 	/* Add up pdi buffer size and frame numbers of each BPT sections */
 	for (i = 0; i < msg->sections; i++) {
 		ret = sdw_cdns_bpt_find_buffer_sizes(command, cdns->bus.params.row,
 						     cdns->bus.params.col,
-						     msg->sec[i].len, SDW_BPT_MSG_MAX_BYTES,
+						     msg->sec[i].len, max_data_per_frame,
 						     slave->prop.bra_block_alignment,
 						     &data_per_frame, &pdi0_buffer_size_,
 						     &pdi1_buffer_size_, &num_frames_);
@@ -197,7 +211,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		/* Get buffer size of a full frame */
 		ret = sdw_cdns_bpt_find_buffer_sizes(command, cdns->bus.params.row,
 						     cdns->bus.params.col,
-						     data_per_frame, SDW_BPT_MSG_MAX_BYTES,
+						     data_per_frame, max_data_per_frame,
 						     slave->prop.bra_block_alignment,
 						     &data_per_frame, &pdi0_buf_size_pre_frame,
 						     &pdi1_buf_size_pre_frame, &fake_num_frames);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 89009a2c321d..769a8ba5b5c6 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -843,6 +843,14 @@ struct sdw_defer {
  */
 #define SDW_BPT_MSG_MAX_BYTES  (1024 * 1024)
 
+/*
+ * According to mipi SoundWire DisCo Specification_v2-1,
+ * this maximum value shall not exceed 470.
+ * Note that the largest number of bytes accessible by a single BRA operation is limited to 470
+ * bytes when using lane 0, but goes up to 502 bytes when using one of the optional extra lanes.
+ */
+#define SDW_BRA_MAX_BYTES_PER_FRAME  470
+
 struct sdw_bpt_msg;
 
 /**
-- 
2.43.0

