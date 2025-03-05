Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437EF24BBE4
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182918; cv=none; b=fUUhXVcZsIbQXTzWiQRldHGlWZ/F6oVgiXU5QmNQf5V4ntiMis1CtKAfeCSCoVPDaBRloqQGnmBfR3Li1nLvRgbSbAM4cD0pNBV3Uq5pQT8Pf1ZD4FRK6FNAwrNSJJxe57QqsvL9iM6zbIquKNF7xqJFhr7J4K8Uma5khuaOKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182918; c=relaxed/simple;
	bh=5u/cPJjliKmlA2VeMIuk2AToCCwzl9ahyunY5vQFWDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+me69fw+JzEoSXWGxC8NPq/8D8eH5uvpxsWsrPPioHFcsp2YgresqGUhy2BPzXWm7W140B3PWzw2OGPW7Uz0sPXyCOB2NMgdqHFw6Td1w5uGkaVk58HDY95wWPkoXnTJAbBBssvSSL+AiC6V0yvJM20Uw4Aydv2kgelHPf1OCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9eA+F82; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9eA+F82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182917; x=1772718917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5u/cPJjliKmlA2VeMIuk2AToCCwzl9ahyunY5vQFWDc=;
  b=U9eA+F82XKJVHNgdls7pqdv36wfE0oPx4IH5dZPe3HGeyegWZg6dRRgg
   xlg3A3ZXWibV7VjFVUtvypskEpqz00th15/o3TQqUatPx3dVoFFl/RsZv
   EkBHbPelFhiNCPN+XHa34nOBLZkOp5RQ965sLwloKovap5i6pymzEs6Hr
   5vbcDyeqcWW5lkP9x3eXYWcNNrEXY5Q6worny8TGMbGI3B3x+qWeL1Twf
   FhlaT/l6vjX4f8mSydDfVueFsmwiwz2E1lEr+wlSwylBN4hYoVcHuZriO
   L/VpjP1QXtEpMk6bQQXtosebrbX7A3RIH/rrc3DsDs9Fa+j15fKI7woiI
   w==;
X-CSE-ConnectionGUID: 3ZZAG5IgSyW+M26tKn08fQ==
X-CSE-MsgGUID: Le7mPXqKR/6Nu9bvVqdoXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558083"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:17 -0800
X-CSE-ConnectionGUID: 8p/ZQvgaTyqmZRup5v6jaw==
X-CSE-MsgGUID: v/+mfYkhT9WS3RBY9t86Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847130"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:13 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 4/9] ASoC: sdw_utils: add mic and amp dais to 0xaaaa codec
Date: Wed,  5 Mar 2025 21:54:38 +0800
Message-ID: <20250305135443.201884-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
References: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

part id 0xaaaa codec is a mockup codec. Make it be a multi function
codec. So that we can test multi function with a mockup codec.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 6ee7d30b8ece..5175818ff2c1 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -586,8 +586,20 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 			},
+			{
+				.direction = {true, false},
+				.dai_name = "sdw-mockup-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "sdw-mockup-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+			},
 		},
-		.dai_num = 1,
+		.dai_num = 3,
 	},
 	{
 		.part_id = 0xaa55, /* headset codec mockup */
-- 
2.43.0

