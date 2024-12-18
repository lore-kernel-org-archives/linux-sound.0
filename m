Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1816C69F;
	Wed, 18 Dec 2024 08:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508939; cv=none; b=ZoKNGifG4Mhjhcf3tbQu1epCe6L6mt25HVnHXs33Th+NxYsFrVj98LoXruYuDGxWszk1fmQcwXQ1T8EexzDQTeJeCdJD6w542vw11KSINM3AwmYFW/J4Ibh6XeRnFa/4WKh2AAa8txd5ZOdrkYzVlvX+90d567S7/peXa4VF7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508939; c=relaxed/simple;
	bh=Q7maksDBaLIIDrKSJZH4DRQa93S4eVVppMEdVHaY0oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKWVw2TL2x0RlqWynYWTLGR0VoO5zZL6f8cgfx8mGKnuy6Jr57IyqYXA+R5dslmrFe7BOAF0oJ8DU5wOJ7Z94EZAOijCQP+0vW3Fm40i501wp08xttDoGRvL8iq3zQs5fe/YDA6KUgeXlMaSdHzh/2sxRkTLMR4/9WWVKsbU3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmQZ0mMr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmQZ0mMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508938; x=1766044938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q7maksDBaLIIDrKSJZH4DRQa93S4eVVppMEdVHaY0oY=;
  b=BmQZ0mMrATEXZdoW9yoVvN4wNwM2XraqtVRMqCTh2PzxW+giE4gQMODx
   3pxIuXKcSK2G1g87jPESCyRSXUg/6VdbfxvD7YrmcJJXJBeqemkfYJvOV
   zUDeHxqcWIzvT8IT/QHJbQhfkjx0WoVxNnNdK6t0Farh/JLVjjRbq1Sco
   gRdA7ikxMoe74c5XMZsFJvn9sVf33wY8RmYIlFcMiDgE10BDfVHY2z0Zr
   JnRYbVLGnq+1/3OYyIIRilFS1GnbVGL7m7o2hAiKPt3koPIQ937lcixqd
   2JUDV3JgBsHDLWmEbpOkjxHsfnE1hKjSFLveMirFJKf89CwdG4hIQvblZ
   A==;
X-CSE-ConnectionGUID: vGi8z5tkRXKsGJH13WqwKg==
X-CSE-MsgGUID: XV4TZuAYRj2J16ud59HaDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978521"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:09 -0800
X-CSE-ConnectionGUID: v14On7v0S2esmwwsNZzPMA==
X-CSE-MsgGUID: zApkKkoISO+Pjg4Juy7GsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914652"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:08 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 03/14] soundwire: add lane_used_bandwidth in struct sdw_bus
Date: Wed, 18 Dec 2024 16:01:44 +0800
Message-ID: <20241218080155.102405-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
References: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To support multi-lane, we need to know how much bandwidth
is used on each lane. And to use the lane that has enough
bandwidth.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index bb4e33a4db17..ae38ac848d38 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -893,6 +893,7 @@ struct sdw_master_ops {
  * @multi_link: Store bus property that indicates if multi links
  * are supported. This flag is populated by drivers after reading
  * appropriate firmware (ACPI/DT).
+ * @lane_used_bandwidth: how much bandwidth in bits per second is used by each lane
  */
 struct sdw_bus {
 	struct device *dev;
@@ -924,6 +925,7 @@ struct sdw_bus {
 	struct dentry *debugfs;
 #endif
 	bool multi_link;
+	unsigned int lane_used_bandwidth[SDW_MAX_LANES];
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
-- 
2.43.0

