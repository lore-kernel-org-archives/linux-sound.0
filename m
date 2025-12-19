Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047BF1F5820
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 03:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766116155; cv=none; b=doFQy6xDlK4kTVR2+eq2G3FQp/JTQC8CgBeNDKN2SK0Dv2bFF/yXBKVrIKqBYihsmB/vR6FxMl9SKLwb4xtXR+3CUYDgBD9V17ECQwX6I44BihQ5BmKReon1Rn4UO8E44Zn8BK2BqSy8vu9Tw/qi/0ang47L/+kjbuwgOOMsyUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766116155; c=relaxed/simple;
	bh=wUUlzkhH5w9nDD2KAOM6oX5GoTlmxndH1F6c8FsaYp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OuGv0YLaCe1Tz8pcoEAttvM79Rzhz8TzH0La5tCQ3urS6PFXmKLxWFreZKdJES3EErG0TN91pafGShbhmxJsjVY81SIfiahNye//JWINLquKPgf2sWoLCPqTZ7WZh+sdLHlpYKlrT1Ga/z+X86IqO8+KvPhZgnW/wiV0c3xpDcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsRZhIeB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsRZhIeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766116153; x=1797652153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wUUlzkhH5w9nDD2KAOM6oX5GoTlmxndH1F6c8FsaYp4=;
  b=gsRZhIeBnLeQhk+Vv3vqOL5l1BO//1FF+NSkpI0nt3cylcsC/3egFw/R
   r1O/9dkV6CfuewxBnHTUW/Uh6rpXjfwnrpkNmFtdTykc1fZvUVjgJuGc6
   GlnJeqIY4kgEE1gGNpBULm+hqsGKgrSQLRK8W67D+S1jsCgc2h99SEv5K
   H8yDoc3N2kgmBEn+zbPkJ7VVIr76dMxom3XW/+iZ2y5qL2EvjspLadt4k
   aWBqYnsbqLh0mvHFOtsb0K+aYub9gdcw/w6NOVJAqoB7hOJhWaM4FeWDf
   f0lyoR3heQUYv/bgtVj579q/8NKRoV90cHp6OIMAT7mAbKvuWH/EWU97p
   A==;
X-CSE-ConnectionGUID: CsouLBQMSCuFQSvmTMoR0Q==
X-CSE-MsgGUID: cOBMSNdJS2CHtvKuNfp2RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79536047"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="79536047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 19:49:12 -0800
X-CSE-ConnectionGUID: sRg+k+U0REeMGihSdfOYbw==
X-CSE-MsgGUID: r/CEX0SoTZaFFQ/22vewIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="197903925"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 19:49:11 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw: shift SSP BT mask bits.
Date: Fri, 19 Dec 2025 11:49:02 +0800
Message-ID: <20251219034902.3630537-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

The SSP BT mask bits overlapped with SOC_SDW_CODEC_SPKR,
SOC_SDW_SIDECAR_AMPS, and SOC_SDW_CODEC_MIC BIT[15–17] in
sdw_utils.h. Shift the SSP BT mask bits to a higher range to
eliminate the conflict.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_common.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 3aa1dcec5172..5390f0a749d6 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -46,11 +46,11 @@ enum {
 #define SOC_SDW_NO_AGGREGATION		BIT(14)
 
 /* BT audio offload: reserve 3 bits for future */
-#define SOF_BT_OFFLOAD_SSP_SHIFT	15
-#define SOF_BT_OFFLOAD_SSP_MASK	(GENMASK(17, 15))
+#define SOF_BT_OFFLOAD_SSP_SHIFT	18
+#define SOF_BT_OFFLOAD_SSP_MASK	(GENMASK(20, 18))
 #define SOF_BT_OFFLOAD_SSP(quirk)	\
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
-#define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(18)
+#define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(21)
 
 struct intel_mc_ctx {
 	struct sof_hdmi_private hdmi;
-- 
2.43.0

