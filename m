Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B70437875;
	Tue, 28 Jul 2026 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242817; cv=none; b=Qm91jtL6gUdoty4f9oHd7iqQ7gsg0rzpIY3J8oNZv5XuSRpMIwb66mlJ2fZ2/vfGQzK9/OPTjck8ELeHF/37ZXRWyTrTylwoK2FRwkOWPsdpbnAbbUqR5k7qGv95Ky5epDsQ9R9xzVP27+3HU488q10u85Fi0Qef2TbZvRV3OdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242817; c=relaxed/simple;
	bh=jjYPXsIuxlMYdRtXaxPp9YAVycpCu6A5cGA6pKZeq/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lD2X7t/tTgPEbktMWZDkVWyL7pa1NSlanYcXZjWkS+8hWUVAADPDGjgGwgs1HgnI32QS9GdA7onnvpF4P86PYNyGtKrHDE9mCeEqslYGlObeljhiq7cNb5mBM3zkrpUN9LAPNRRtMDToy9qX2hkTK19y9oXtbQdNHrCuy+IoBng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnyRnmjD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnyRnmjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785242815; x=1816778815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jjYPXsIuxlMYdRtXaxPp9YAVycpCu6A5cGA6pKZeq/4=;
  b=VnyRnmjDy3XcbywrrLN7/5JQ/ZRhFcJHP0lCrARzcNRLrKeJ5Tf9p+jz
   YubaWplVaCxMjdWSa2kaL8WcVS4OIzyo1DD1xkOqUEMtqAeY0wmk3psFz
   8vC6HyCxRZsykh8CX0SlkZ89His1YktWt2OWkLcBYhAUcPZpvDcqsv++W
   nzA9DOq1j6Hdg6pI3ZxpEeT934j705zoIyLj0gaFztJV+jeoCUs0PXFBL
   97fwZZCIO6UjI2l1GOup1N+ddmySR0vQfVb48gahNWcZpokscpp/OxASi
   B3rLFeTXHN9UiO2s8iNHBqt6ZshB3OKsg3E/VeLx9ihQpPt4MU4ZJr37z
   Q==;
X-CSE-ConnectionGUID: xxwBWp0MTuCF3M4LLC1HPg==
X-CSE-MsgGUID: 8jVXzOXMSla4PBkk+Jhdqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88361255"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="88361255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:55 -0700
X-CSE-ConnectionGUID: W8mZuVfHR+2x+K3qr/KJbw==
X-CSE-MsgGUID: 2ejgEo3uSJKKXqqEGZDZ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264695538"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH RESEND 3/5] soundwire: intel: handle Peripheral bra_block_alignment
Date: Tue, 28 Jul 2026 20:46:37 +0800
Message-ID: <20260728124639.1484973-4-yung-chuan.liao@linux.intel.com>
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

The data pre frame size should be a multiple of bra_block_alignment.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 11 +++++++++++
 drivers/soundwire/cadence_master.h |  1 +
 drivers/soundwire/intel_ace2x.c    |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 99414e71428b..6fa3739221ee 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -2135,6 +2135,7 @@ EXPORT_SYMBOL(sdw_cdns_bpt_find_bandwidth);
 int sdw_cdns_bpt_find_buffer_sizes(int command, /* 0: write, 1: read */
 				   int row, int col, unsigned int data_bytes,
 				   unsigned int requested_bytes_per_frame,
+				   unsigned int bra_block_alignment,
 				   unsigned int *data_per_frame, unsigned int *pdi0_buffer_size,
 				   unsigned int *pdi1_buffer_size, unsigned int *num_frames)
 {
@@ -2159,6 +2160,16 @@ int sdw_cdns_bpt_find_buffer_sizes(int command, /* 0: write, 1: read */
 	if (requested_bytes_per_frame < actual_bpt_bytes)
 		actual_bpt_bytes = requested_bytes_per_frame;
 
+	if (bra_block_alignment) {
+		/* align to a multiple of bra_block_alignment */
+		if (actual_bpt_bytes < bra_block_alignment) {
+			pr_err("effective bytes per frame %u is smaller than block alignment %u\n",
+			       actual_bpt_bytes, bra_block_alignment);
+			return -EINVAL;
+		}
+		actual_bpt_bytes -= (actual_bpt_bytes % bra_block_alignment);
+	}
+
 	*data_per_frame = actual_bpt_bytes;
 
 	if (data_bytes < actual_bpt_bytes)
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 668f807cff4b..f4e41a9ab165 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -218,6 +218,7 @@ int sdw_cdns_bpt_find_bandwidth(int command, /* 0: write, 1: read */
 int sdw_cdns_bpt_find_buffer_sizes(int command, /* 0: write, 1: read */
 				   int row, int col, unsigned int data_bytes,
 				   unsigned int requested_bytes_per_frame,
+				   unsigned int bra_block_alignment,
 				   unsigned int *data_per_frame, unsigned int *pdi0_buffer_size,
 				   unsigned int *pdi1_buffer_size, unsigned int *num_frames);
 
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index b37933efac5d..2fc5589bbd72 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -173,6 +173,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		ret = sdw_cdns_bpt_find_buffer_sizes(command, cdns->bus.params.row,
 						     cdns->bus.params.col,
 						     msg->sec[i].len, SDW_BPT_MSG_MAX_BYTES,
+						     slave->prop.bra_block_alignment,
 						     &data_per_frame, &pdi0_buffer_size_,
 						     &pdi1_buffer_size_, &num_frames_);
 		if (ret < 0)
@@ -197,6 +198,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		ret = sdw_cdns_bpt_find_buffer_sizes(command, cdns->bus.params.row,
 						     cdns->bus.params.col,
 						     data_per_frame, SDW_BPT_MSG_MAX_BYTES,
+						     slave->prop.bra_block_alignment,
 						     &data_per_frame, &pdi0_buf_size_pre_frame,
 						     &pdi1_buf_size_pre_frame, &fake_num_frames);
 		if (ret < 0)
-- 
2.43.0

