Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48423B6C1E;
	Tue, 28 Jul 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242820; cv=none; b=IgtLZlAkgmrmDYXPwrbAOf/bDXX5u5PPu5wTGrWUdGRL7BnlqjGzWTvY0VFpS6ljybYwLJ33NFgWJAg3N6f2Vany2nQNigp9gudHSp/tl5ql0EiJUpWM1oeNueB88Jo+o4w9laIXWaml63aV5K1TiZ/q3i4zS5mu5tDljEMWzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242820; c=relaxed/simple;
	bh=FUUbVhl9mL0gMCVdalfUOCC1Zzz4uGrOZwqcJ5xkLIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YnAQjnUngWERCLHDgbq+f+tWj7SIIHJx8hirJUGi/uTmQzWv9fyWZnryR9+S/oyVPWF9Mamjfnysdw+Hyy1cqLSyHbyhlvE7nYFOOu5twj3mfBZ81dQn5sbduhOJ+2+rj2IvkMzI72/RnMjH7ht1YDJ3UPultuP3YUuPSmnuNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+ch9Yom; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+ch9Yom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785242819; x=1816778819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FUUbVhl9mL0gMCVdalfUOCC1Zzz4uGrOZwqcJ5xkLIY=;
  b=B+ch9YomIxP0ZgcL/psDHTMyHcfDQ+CGFU5kJovtgfcD05Xz6/VIhtpV
   tvemnxD6pVyAmXKoBiApOCOEhxGM+PkQ/B3LUAO6tYBZoxeS/xKwKVhRd
   2TRXtDDqXhi6Hklh+OfSujhkAZP9v/GPm7oLKK77QrIgkZ9Uj0Poi++74
   NVnxCQ7MlbYCtdJ8QDbBBqdL7QzFVn7KqcQuNPvUmhfEoj9Mh29oaGzvP
   mIGVbQp+VyHs9EhEyVeRc9Csdb5xu8VSrRCCf894aopY8BTu15ZHB6XrU
   Mb+R8pOqRuRxdYg5i6Hbu1b8nqq+pgrExJOubLNBZa4NJ47iXRZPlYLQr
   g==;
X-CSE-ConnectionGUID: 4jr/P0TeQiu5ukJLAyENwA==
X-CSE-MsgGUID: ChqF1lVHQSalm84tpbKQUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88361266"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="88361266"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:59 -0700
X-CSE-ConnectionGUID: rBwC0XFoR9S0Yccg5rnFgQ==
X-CSE-MsgGUID: oKhwh5wRSly54Yu8CiobrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264695554"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH RESEND 5/5] soundwire: intel_ace2x: handle the max_data_per_frame property
Date: Tue, 28 Jul 2026 20:46:39 +0800
Message-ID: <20260728124639.1484973-6-yung-chuan.liao@linux.intel.com>
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

