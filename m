Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347893;
	b=K+Gvj05HWd35/on2W967NbFkeEdy4HqTc74c7bMbVsECY1ZWC1L0eS4blqD51PdnyO2u
	 ZFvWjPS6bWAYcTXGqGR7S6b1YVmmsdAljJXbBDR9s664xALEbDnlIYiDUwijT7sCQIFIF
	 IbyQBSXBHm/A2SEPFgCM3xYB5Hn8+HX7MIIQO9NntXCiQ9KTU3iBidaxQ4csAYx/DvlTO
	 MYKgTHuXzJD7TKaxjA1QudNq9Cg5aBQGYNY/WpWMmor/eXH6yMuLZUwj4DvqxEKmXjC+g
	 BtZqmrLvB7X6GTdpWwJAWIHAbeipXBIMiZ5ofOMILiWvqAUiBemPrJc0V2EO2C5mzxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347893;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tqn3evdzfY5lz/GM39OllBYZAG/XOb6qG6Ibnfdd1kE=;
	b=x+vkwYbKkzG2o+iweJ8Mdy0rBMEjmBs51syu4BR+9YV+hbr7bMrvMqiZVfk/0BnWl814
	 biZLG/fh6uBXUbcAOhfcn1bnLE8D4ahXYnZxMuyOpyL/6DJy8230ikRVnijr5kCDv1BHj
	 6qysOO9EVfZLY+J2lVOPbKAMxRsssFGDxZRE8gHXGxw4h+ZTCIuaYd4qkRXyX+898DCwb
	 72g/wQEzGYFMf5xzkl2wH9DbEYbgifJhGvbGP2ZthnLricPDzdjXqG0RUXyYrdkgv6XCO
	 s6TdQ56my+YLGLVPk8VLEjs6v5rHsg5c3yXaHICPWAkPlTcRqfp/p6S211TlkxBgbCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R47fOL1x;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45C606A320;
	Sun, 22 Nov 2026 11:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E45C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R47fOL1x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795347893; x=1826883893;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NaDq3yHRaSEVeWcGiIitp+2C5qU+qo+C4x+8xn0OP+0=;
  b=R47fOL1x69BKIAxAjoqIcju/VuLCYIvdcXaNedC5GXqXyo4BmQJi6yC9
   BqMR93ENdtmUoT02UfjjducpcdaoViyA6BfArKwTMUdqDGt6boq9rsuHw
   jVhRSAVlvkNWJzG+4WBLZ5+88GSALEjeZjt/+eCcQwcnba5kAi7XU9h8E
   fRk1A28BNtteahuCTYFCYMhbROfHkNz4/hfWLQ5lln/CloqkbsNdWsBlF
   vP9UIm+v6IWWeu18wIYWyu6c3BxqyQmBRRTpYw9TfDl+0T4CngZKZwoH6
   OYtgk0Vr+gid8kUdqBP1Sl9ndsKpvnPozS2ne3Kozo1sLD/PWTi/qH3PR
   g==;
X-CSE-ConnectionGUID: 78dJD/i+RGuZZZf0n/YB0g==
X-CSE-MsgGUID: qC0K9cY+R1i5FyBHO372+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4063158"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4063158"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:44:52 -0800
X-CSE-ConnectionGUID: 9FSmiboLT3KHDyCdpVX9qw==
X-CSE-MsgGUID: 3IeqatCMT32dkl/R8/HOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11276015"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:44:49 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: dmi-quirks: Add MSI Modern 16S AI+ quirk
Date: Sun, 22 Nov 2026 19:44:42 +0800
Message-ID: <20261122114442.2140276-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSI Modern 16S AI+ has the ghost rt722 codec in the BIOS.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 715626174367..1c3c57ebc2ea 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -249,6 +249,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)ghost_realtek,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Modern 16S AI+ G3MG"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.43.0

