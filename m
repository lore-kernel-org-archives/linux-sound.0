Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7956A40E8FC;
	Tue, 30 Jun 2026 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823720; cv=none; b=DysIB8k8KRBhSsuxOjMaBTTj7coP9wla/fhdT+jCoh/gaeA0Uu5V3/NXQZbhsXJc13XPetFjR8Q2KREEckPg27DgEHy9S4xTYHQXkoKd7pLfEyjPJMgpA5wjBHA82wa099sitRUw72XT9vO6VQ6nborKqfdlk1NiSmgkB6Hqs40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823720; c=relaxed/simple;
	bh=GhaaISLu9se2V7j9HHcfY0NxH9yD2vNBGeuqhlSHDaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1hbufGTg0GMuHVAbp0/aDLMQ9/ZUSdjZOvuFp+QdCb2oTuqJY5lYmZBPZyleeFKlJtP4zTkVWcIr3bDFBQQnwHqIdZVC4nAYATy7bRhPLUhMUm4Ykbt1i8IstsEfxIWSFKy1l60cAB+zZijnxa9UMSw1QrHryBVh8e67sescf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEyNn01J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEyNn01J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782823719; x=1814359719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GhaaISLu9se2V7j9HHcfY0NxH9yD2vNBGeuqhlSHDaQ=;
  b=MEyNn01J1O+muXNkBH29aA4RjXGC8rIkEjq/lyrDzsEHtACTNt7NVHF3
   dpeRGGq1r7Y2bt8OVW0nNmf0Gtpv1bSQu4+qxuovtzxAj7yS707+fXdys
   syyev3oko7mx4E3u5ad/1soZ4/YHM3eD7t6hLYpblE60ChhIzvoG68S9K
   XEZ5b7WedM7RmDVOkXzgXpHydMWFRl+I8QHzAkTGXJ/x/mk8z/As6kY7B
   n6OpPKlAvuOpcH+n0yS/Q+Y8P5TFMVkQRkTgAY3M0Y+C4DOokSz8uy57E
   T0kRFGkZm79ji9pVsCps/Rr2LuIwve9fyoJbty3jvQWUwjhrPX1dQJW/O
   A==;
X-CSE-ConnectionGUID: 9KiT/DYtRHyFtEWQteo1Qw==
X-CSE-MsgGUID: m77F5z1tSz6wj6bmc8v3qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86084970"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="86084970"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:38 -0700
X-CSE-ConnectionGUID: VE6WPhRVSaO1fUUQWhz/Ow==
X-CSE-MsgGUID: 1YgBk/56QSKqnASiI9JC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="290382845"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/5] soundwire: cadence_master: add BRA_NumBytes[8] support
Date: Tue, 30 Jun 2026 20:48:21 +0800
Message-ID: <20260630124825.2263243-2-yung-chuan.liao@linux.intel.com>
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

