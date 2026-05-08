Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0982C3BFE44
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778232758; cv=none; b=SctAR3eBfc6Ww66bac280aJa1DdvBiywDgSHPsgKQ3DWpB+N8mYSjMvhMMqn/WTDBmt/2FEFzsXqXvTjxSTe6XnGe0qYQVwOmHNasD4pQyCM/HKsL//d4vaQkc9wt2eeImTBv1DHCLKgwjXYGylLwsJfmGoRc0kuxOUU7l1c8Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778232758; c=relaxed/simple;
	bh=I59TW+OIO9svjO5p91VpLZf5X+HJnuUbcnTcG8P2HoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+eHXtEJYUwhnRdpiZmQ7pxbI5z9ZLkZIGqIMgq4erlG3Vmt80hdBeA1/yBhrDA4A1T1znisCjOcqGeGYhAelynZpRE6ZBnDAgTFrxLSIc93432TRLlUylFLgygn4KiV5Jp827qN3SZTMA1jo2V5AFCNY4d91jP7DxbfSTJ/kOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yk00NNAS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yk00NNAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778232757; x=1809768757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I59TW+OIO9svjO5p91VpLZf5X+HJnuUbcnTcG8P2HoE=;
  b=Yk00NNASC/OC3SME3LUysT4Dxhpf8aFUtSm+e4LUV11GlI4XJXsGeiOA
   xUvfz91InnHZdQBX9UEFh8fykiS6OU1qM720DAHZh2YH9W4JSSRC38Y/j
   o/qzLyUw8YseL9/RVuHM2FDQqP1ytZI5WnV1fB32Oln+QEWF5siaIA9oE
   AlYAMb2WnnO0vSucjLlJoEi6n1eAXeTqpc4S+AJTMI7ujq1EVzHcNqPWb
   KUbTDnsxsp+usFypIzRyQNtkAV0jQSy4q4rbhCknOV0XVPDtcDkLE6vuC
   8n3SBpZBRR4fubPmWYGLelrmho6whyv5p2kgLkwGL50bDOpdoD1Compy+
   w==;
X-CSE-ConnectionGUID: vmYMi8GLQ4+jKIIZITRIWA==
X-CSE-MsgGUID: g8+z/NwHQVOs56f1GpAw5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96621866"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="96621866"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:32:37 -0700
X-CSE-ConnectionGUID: 0n/1SO0xQC2upTWBm2PfLQ==
X-CSE-MsgGUID: eqGo6LbNQKeVBRc1msroCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236840365"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:32:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mac.chiang@intel.com
Subject: [PATCH 1/2] ASoC: sdw_utils: Add quirk to ignore RT712 CODEC_MIC
Date: Fri,  8 May 2026 17:32:23 +0800
Message-ID: <20260508093224.1246282-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508093224.1246282-1-yung-chuan.liao@linux.intel.com>
References: <20260508093224.1246282-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

Some devices do not use CODEC_MIC but use the host PCH_DMIC
instead. Add a quirk to skip the CODEC_MIC DAI when it is not present
in disco table, ensuring the correct capture device is used.

If CODEC_MIC is present, it continues to be used as default.

Fixes: 9489db97f6f0 ("ASoC: sdw_utils: add SmartMic DAI for RT712 VB")
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 85291bfb58fb..cd4ed0e2677e 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -345,6 +345,8 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
 			},
 		},
 		.dai_num = 3,
-- 
2.43.0

