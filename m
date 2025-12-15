Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B315728000A;
	Mon, 15 Dec 2025 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804167; cv=none; b=Rv9IGw2QN4zUq/IjWxoOlLlXUrEG8foDPEiHvdc4mjGy6gTyCqlJFCykJJnsFtkM3zoOMK3WNAD0J6BT4luBJRrRZjZYOA+R1qVLxqaNTr6UxoVlAd17SG2wzLu0w/E+ZpbR/215EnOLwUgcPYIjW1q1dnH+MSFW8bwOqfD6hqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804167; c=relaxed/simple;
	bh=VlzlFtnjLgkEnpYJYwo18CIwE5Ry2/x63kIs+emvo6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITeCCD4gaBEu3Zp0yGHIzmb1jA/b3jt72VgrEXULNbjXTCDqxI0FbcVBtGHDpU/dXZG8i2YIClonpWr7kquzKx2zeq5gDilSp/UQzx0EBs6vJe6Ew+t2XwQnm45ckF1THSbzVGAZrVZpH24G7VplC+y3oFwrnv/GTM/vi5anLiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJoCqI0U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJoCqI0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765804166; x=1797340166;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VlzlFtnjLgkEnpYJYwo18CIwE5Ry2/x63kIs+emvo6I=;
  b=cJoCqI0UNihXuWxDbKc0TeADvlyuE+zOa4lf5LuUMqUtqhrWqxfK7Soe
   cb5/Mds3At6eOHTctpjlCrgmWbbw4bVbgox61gyU2VZGk5WS6Tr3WtXB6
   4ecixrGyTY6QY734k91sTVNH+L1kVrv1HZ20OE1UgzyfnCuTMM9FDx749
   y6f7FBji1d1YJ+S2LFE6keCpH4aFhsGjiwtBbmoZD9jZostvUh1lZLFq7
   YmO7RrnHJKyfU+DIriws0CNGVf3zWJ1D9nUU8lNvWSwYpMDlRr7w+S6dN
   CoPeyzZdmxLsyqqZ4ZNA+1weBCIbtgs9gi04fWbXg3LVt8pYkjkX4pdM8
   g==;
X-CSE-ConnectionGUID: QyefWuyqT12kWI6aVOKsBA==
X-CSE-MsgGUID: 2Lqql0DPSBmFpIqsWsAzTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85296085"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="85296085"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:09:25 -0800
X-CSE-ConnectionGUID: 50lsdFXRSLa8Bq+QGkRPVQ==
X-CSE-MsgGUID: WnwpBZWeQqiRr0qxaiTveQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201906129"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:09:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: dmi-quirks: add mapping for Avell B.ON (OEM rebranded of NUC15)
Date: Mon, 15 Dec 2025 15:09:47 +0200
Message-ID: <20251215130947.31385-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avell B.ON is an OEM re-branded NUC15 'Bishop County' LAPBC510 and
LAPBC710.

Link: https://github.com/thesofproject/linux/issues/5529
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 91ab97a456fa..5854218e1a27 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -122,6 +122,17 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)intel_tgl_bios,
 	},
+	{
+		/*
+		 * quirk used for Avell B.ON (OEM rebrand of NUC15 'Bishop County'
+		 * LAPBC510 and LAPBC710)
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Avell High Performance"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "B.ON"),
+		},
+		.driver_data = (void *)intel_tgl_bios,
+	},
 	{
 		/* quirk used for NUC15 'Rooks County' LAPRC510 and LAPRC710 skews */
 		.matches = {
-- 
2.52.0

