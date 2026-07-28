Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F43AC0FB;
	Tue, 28 Jul 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242813; cv=none; b=otp7iaTP4gchj/q2TsWKPXyQOoYppmzRwWrDGYIwiN9lRkcm7blnyl7UBrCFvWZYO+x2Y8Tz5Vvfw0fvDtOxnR9lKgyunBLb0F1Iy2gAZBLrXGxzBT9znB7bH5T87DiWwXtX+ms3qTGbYFWdhE7DJ9kLy+1poe4xtiGX7d/iB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242813; c=relaxed/simple;
	bh=GhaaISLu9se2V7j9HHcfY0NxH9yD2vNBGeuqhlSHDaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHXdzwtYS2V9Ql3djZef3yQdBGg4cYkD4SfeNO8CuIRYU4F+x/+j5K+E/6SoTR6MpI3dfEv17B4pEP6uXC4KONIUlEnMhQ8aKxQVs3rZUqgoza8Ji1eIq4ib8E+alQESnI7xSC9wnOVtwXR6TQMguD+5PzFpEbFAHBbQC2CXJGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMsvx9JA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMsvx9JA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785242812; x=1816778812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GhaaISLu9se2V7j9HHcfY0NxH9yD2vNBGeuqhlSHDaQ=;
  b=lMsvx9JAmpFh3n1IBD0TYZuCQxEdnnPFZFQLDMyorROWI7Jy4uM8Pjus
   8sKmvlhBwl8h3VKZ+V9NRq1R6AXbQXC0EVb7FRamcOc/1/SnrsAycLs5p
   eshhwVR4hiYg9lS65RaEURT1R+65aIqjQYahs36vmGgLo0WLPWn/zBQCP
   lvvmYVHLxKuM83qvT3XNSvbSyhJHxt79GWPCseL9NFFp60zVoeM2+PAQm
   LOnCvborT39BfipUp2My/iqiXPV98j540jSMagJdEtx4roI18t2cZFQeF
   Xy+iQot4AfhQc9FDTI8oqTqMnPUzEdwt+vVK0z8NZav+ci0Swx69GG9bc
   g==;
X-CSE-ConnectionGUID: Cpvwjsj3TTO42FBOsgGhzw==
X-CSE-MsgGUID: 1WQPLgqGSiGQtjX5nLOa8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88361244"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="88361244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:51 -0700
X-CSE-ConnectionGUID: uJqH1JtNT1Wsqpwl0IQmWw==
X-CSE-MsgGUID: +3GSlokdS722d3YObK9C8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264695495"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH RESEND 1/5] soundwire: cadence_master: add BRA_NumBytes[8] support
Date: Tue, 28 Jul 2026 20:46:35 +0800
Message-ID: <20260728124639.1484973-2-yung-chuan.liao@linux.intel.com>
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

The header[0] bit definitions are:
Header[0] bits 7 – 6: BRA_HeaderType
Header[0] bits 5 – 2: BRA_DeviceAddress[3:0]
Header[0] bit 1 BRA_Opcode 1 => Write, 0 => Read
Header[0] bit 0 BRA_NumBytes[8]
And the header[1] indicates the BRA_NumBytes[7:0]. The existing code
doesn't handle BRA_NumBytes[8] therefore the maximum BRA number of a
frame is limited to 255.

Fixes: fe8a9cf75c1e ("soundwire: pass sdw_bpt_section to cdns BPT helpers")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index b8b62735c893..99414e71428b 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -2359,7 +2359,9 @@ int sdw_cdns_prepare_write_dma_buffer(u8 dev_num, struct sdw_bpt_section *sec, i
 		p_data = sec[i].buf;
 
 		while (section_size >= data_per_frame) {
-			header[1] = data_per_frame;
+			header[0] &= ~BIT(0);
+			header[0] |= (data_per_frame >> 8) & BIT(0);
+			header[1] = data_per_frame & 0xFF;
 			header[2] = start_register >> 24 & 0xFF;
 			header[3] = start_register >> 16 & 0xFF;
 			header[4] = start_register >> 8 & 0xFF;
@@ -2385,7 +2387,9 @@ int sdw_cdns_prepare_write_dma_buffer(u8 dev_num, struct sdw_bpt_section *sec, i
 		}
 
 		if (section_size) {
-			header[1] = section_size;
+			header[0] &= ~BIT(0);
+			header[0] |= (section_size >> 8) & BIT(0);
+			header[1] = section_size & 0xFF;
 			header[2] = start_register >> 24 & 0xFF;
 			header[3] = start_register >> 16 & 0xFF;
 			header[4] = start_register >> 8 & 0xFF;
@@ -2436,7 +2440,9 @@ int sdw_cdns_prepare_read_dma_buffer(u8 dev_num, struct sdw_bpt_section *sec, in
 		start_register = sec[i].addr;
 		data_size = sec[i].len;
 		while (data_size >= data_per_frame) {
-			header[1] = data_per_frame;
+			header[0] &= ~BIT(0);
+			header[0] |= (data_per_frame >> 8) & BIT(0);
+			header[1] = data_per_frame & 0xFF;
 			header[2] = start_register >> 24 & 0xFF;
 			header[3] = start_register >> 16 & 0xFF;
 			header[4] = start_register >> 8 & 0xFF;
@@ -2460,7 +2466,9 @@ int sdw_cdns_prepare_read_dma_buffer(u8 dev_num, struct sdw_bpt_section *sec, in
 		}
 
 		if (data_size) {
-			header[1] = data_size;
+			header[0] &= ~BIT(0);
+			header[0] |= (data_size >> 8) & BIT(0);
+			header[1] = data_size & 0xFF;
 			header[2] = start_register >> 24 & 0xFF;
 			header[3] = start_register >> 16 & 0xFF;
 			header[4] = start_register >> 8 & 0xFF;
@@ -2483,7 +2491,9 @@ int sdw_cdns_prepare_read_dma_buffer(u8 dev_num, struct sdw_bpt_section *sec, in
 	/* Add fake frame */
 	header[0] &= ~GENMASK(7, 6);	/* Set inactive flag in BPT/BRA frame heade */
 	while (fake_size >= data_per_frame) {
-		header[1] = data_per_frame;
+		header[0] &= ~BIT(0);
+		header[0] |= (data_per_frame >> 8) & BIT(0);
+		header[1] = data_per_frame & 0xFF;
 		ret = sdw_cdns_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR, p_dma_buffer,
 						       dma_buffer_size, &dma_data_written,
 						       counter);
@@ -2499,7 +2509,9 @@ int sdw_cdns_prepare_read_dma_buffer(u8 dev_num, struct sdw_bpt_section *sec, in
 	}
 
 	if (fake_size) {
-		header[1] = fake_size;
+		header[0] &= ~BIT(0);
+		header[0] |= (fake_size >> 8) & BIT(0);
+		header[1] = fake_size & 0xFF;
 		ret = sdw_cdns_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR, p_dma_buffer,
 						       dma_buffer_size, &dma_data_written,
 						       counter);
-- 
2.43.0

