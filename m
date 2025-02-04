Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488B118B494
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655555; cv=none; b=mfalkqoXXmNty+wF+mX+2Sx9B2MKnpOT0tc4lnReXRTyrgekV0csCy8e70BYn824aUlRDkfOUOw3uZeQ96eZHWbRSKNQONd0KQD7zPI2v5UGownVyQMJAEFE3ALuB0BjedNy5vtup//JdqKAZh6mR/mWXA5fuvGS5UYLO3vQkSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655555; c=relaxed/simple;
	bh=/CgV+N+JSjVzPhhVitCQQUYdDGZx2sNkAdRXBzO25Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CXw7aorvIatUjAQ8rYOqhTk+I7hygJujQC9mixcb5JG6uuYN93pAoEWiWAS2iylIu5VvnO7h2ilm95WMuBgvuGtckbGBBsAhVlXlS+phkIIwoXFSqWEBFwavQ+/RA2FgT11I/eHkaERwoph6GvH+NCVBSkX6/w0F/yu0srniwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWHnNrDV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWHnNrDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738655554; x=1770191554;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/CgV+N+JSjVzPhhVitCQQUYdDGZx2sNkAdRXBzO25Q0=;
  b=aWHnNrDVIOo1cT4WAphtSdlvWecjVTYas3cXhuLRco04ivqGi9EN9Rgv
   BWu8+axsozmnl/32wZqW51bpdyNyWpYGVEYi9xoRWDj5h+scxgj2jDznO
   c/V1rilAWZQ3uZHs2itkr85HleL7kwtqPrddFCsicqKTJTKWCAi6voa4x
   kySjXxH2jlzaDC3c17d0+VEQBHR0o9G+Z2/WlLhXLlOUVZdN8coOlK5+/
   +eDWZObcoZBu/mBQHf169UsGp5p+dW4nIA3DGQ8jrX8VRx/dBY6hloFo0
   aDTlG4k0MUY8k6BGYwZE+bGkJ6NaBPkCh9W5oEk+kGqUNn3sXmvX5s6lA
   w==;
X-CSE-ConnectionGUID: 0wfi657BQ5Opfh2D7f1Wfg==
X-CSE-MsgGUID: tR9C02MATB+RGR7vsd+TmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39271080"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39271080"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 23:52:34 -0800
X-CSE-ConnectionGUID: BSQ80L6ER8SMtSB307/EHQ==
X-CSE-MsgGUID: QbOVt4idTLCvq1XREV5Npw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111104934"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.111])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 23:52:32 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: rt722: get lane mapping property
Date: Tue,  4 Feb 2025 15:52:24 +0800
Message-ID: <20250204075224.162661-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rt722 supports multi-lane and the driver doesn't call sdw_slave_read_prop()
to get all properties. Add sdw_slave_read_lane_mapping() to get the
required lane mapping property.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 25fc13687bc8..e512217b64a2 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -203,6 +203,8 @@ static int rt722_sdca_read_prop(struct sdw_slave *slave)
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
 
+	sdw_slave_read_lane_mapping(slave);
+
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
-- 
2.43.0

