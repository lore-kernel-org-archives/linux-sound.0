Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6655198E9B
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727763478; cv=none; b=NtRYm7OoCCFI8pxUH1wxcLr0SK/iwanJB7iea6L3psQ6DJWlD1Rq7b0d7p6lic0rL4VNucYYHVBOK2YaCVxBf2/eDA61L6Q3pqCCa6gbi7YPg/juNMV4N7GjVhnrqqepTp1vL7AS34T7LZ+oKL5VKmjpV31vrAmfXMivHm1X9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727763478; c=relaxed/simple;
	bh=b5vS8oWRW0m7VRLtAFZqrzRHhEhK2mSIEuv0/Q3g0Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfzvve7jq+LUeeZhTZoqVMnb6OV1p2iWg1h8/SmJJDWChsCapsLcO1ok6HPVVeCe5WDf1H19sDAw2LV3ASuoiNPP0BgKOkFquI/ayHI1gs9fPsbVLLm7KJsqctbKshXaGuu2PoIXS2xbGHxUv6090Ybz7/WIUTqpr9w++MfdzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgEd8w/h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgEd8w/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727763476; x=1759299476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b5vS8oWRW0m7VRLtAFZqrzRHhEhK2mSIEuv0/Q3g0Z4=;
  b=kgEd8w/hU4vBo4TL5DRT7vOrDJRAADjDc1JhtUmAd1z7bR7Oz66Ru2L3
   Dp6MT3J/esVZo8JlnGqdfuhgOdyPEch+8LddtU5TQXfM14I+WkWWIQtxv
   NJtmPeiNAWMIccbAx1lOhApIE5efvsCIt3JgEIMANfH6h7NpFmta2+k80
   RH9WqNiJ1i/9/ZlPfGEkqe//9FnmmITE7GMsvOKqLfr6fVnAsdnKxtQYB
   Sap++rW6AWweG95sfesB5qYVgulxC6bCJBfHCH4QLY/moME3ySWzE7m00
   Xg8DTB3Tvu4SLPNcS4h893GbJY8MWhT8awrfhAx+3MTGQkrMNU9m2/9TZ
   g==;
X-CSE-ConnectionGUID: plivgHAZSkSRpiJx5CPqGg==
X-CSE-MsgGUID: OJ/ysPMaSgu7vO9vO6KTOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30762019"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30762019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 23:17:56 -0700
X-CSE-ConnectionGUID: TZ9tW9etQ92oq4nrGtZx5g==
X-CSE-MsgGUID: kw+JxdNhRjuUp8Jg8rH6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73509320"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.243])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 23:17:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi: arl: Fix some missing empty terminators
Date: Tue,  1 Oct 2024 14:17:38 +0800
Message-ID: <20241001061738.34854-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001061738.34854-1-yung-chuan.liao@linux.intel.com>
References: <20241001061738.34854-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Fixes: c0524067653d ("ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index c97c961187dd..072b8486d072 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -191,6 +191,7 @@ static const struct snd_soc_acpi_link_adr arl_cs42l43_l0[] = {
 		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
 		.adr_d = cs42l43_0_adr,
 	},
+	{}
 };
 
 static const struct snd_soc_acpi_link_adr arl_cs42l43_l2[] = {
@@ -199,6 +200,7 @@ static const struct snd_soc_acpi_link_adr arl_cs42l43_l2[] = {
 		.num_adr = ARRAY_SIZE(cs42l43_2_adr),
 		.adr_d = cs42l43_2_adr,
 	},
+	{}
 };
 
 static const struct snd_soc_acpi_link_adr arl_cs42l43_l2_cs35l56_l3[] = {
-- 
2.43.0

