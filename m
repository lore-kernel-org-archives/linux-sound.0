Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A72621576E
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623001; cv=none; b=Miados4Oluv3PUe7bLbllRmPWFs5M6DgewtuhZEupb9z/Fm9R/9Y/RDveeIL/HbpTl6WrXj/d13wJJ+33X1zl0PlWiMoGZHJunZgnq+ANv6mZsLfMTC54D3J31uBZOiQ+aojTdiIJ9x9lH2Z3l4WZhwHwXRPaKDwyIFq9UpQXMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623001; c=relaxed/simple;
	bh=mFgJNTA0jIwTKVe9e+n0/NGZrR0NcWj2TUI4775cCsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5jVpLk38V9OpOnjl8+l0qeKiLtYH2y259c/F50VZ/4qKNOTpLEcKQOXIbp/+vKkavQSZWE05Q0PuzB/wpZd4YPfJl0m4BWR4pd4nu3FIsFONeV6IBoQNeB+aCcyosk+E13M+HwEjWETZAl/fbgSti4/HixG+pASjf8hc7+8uQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRWP9A7P; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRWP9A7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773623001; x=1805159001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mFgJNTA0jIwTKVe9e+n0/NGZrR0NcWj2TUI4775cCsI=;
  b=QRWP9A7POF0aMzWiVYCuxfO4xXMw7SrtKEJaNEG5fV48q9WOCIfFatxq
   g5pt2gaebKzyDQjNlm7X49yHVGZPRg9L9Yd0EHwMW6YJ+1vp8tnyuQTGd
   D9vpSfaaxgg5siNp14nJ3iU/pQHTGxmAh0ueoFxAn0rGqs3z8JVHyEnDe
   Q/bmujQPWpjIHyy6Z2DrKtLghVXiU9V138GxqU/WHVzKE+JbEYd4MtHS+
   aRcB6E8pHIzCa0WhnvDKpPRCXQ6Dih4fvWytdEQT/HvlKlFRPS8PG0+XU
   vmTh6mUkP1IFX8WPRSOgYngUI7K0Lyr/9c10svYE9m80eLHh3IgxCWO1I
   w==;
X-CSE-ConnectionGUID: JLIDsusIRAqQG5jJh/FjqA==
X-CSE-MsgGUID: 5+Zmh3wKTZmSG8421eNanQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78486095"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="78486095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 18:03:20 -0700
X-CSE-ConnectionGUID: 244DnSsvQ8OnFZp/or0+2A==
X-CSE-MsgGUID: wV7x4NobQymia1Ylpc9qhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="244794702"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 18:03:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: soc_sdw_utils: remove cs42l45 SmartMic codec name index
Date: Mon, 16 Mar 2026 09:03:07 +0800
Message-ID: <20260316010308.285622-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316010308.285622-1-yung-chuan.liao@linux.intel.com>
References: <20260316010308.285622-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the index is 0. In theory, it will not change even if any
other endpoint is not present. But to be consistent and avoid surprise,
remove the index and let the machine driver match the codec name
partially.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index becc22328230..ab197edeb75a 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -791,7 +791,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
-				.codec_name = "snd_soc_sdca.SmartMic.0",
+				.codec_name = "snd_soc_sdca.SmartMic",
 				.dai_name = "OT 113",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-- 
2.43.0

