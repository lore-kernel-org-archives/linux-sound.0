Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF724DD09
	for <linux-sound@vger.kernel.org>; Sun, 25 Jan 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769339929; cv=none; b=WJIILP7634cM5bfD7czAUFoA5QuGoVnNHTS10bEF9u4dJw/5yQxjje+FWE3E7uWakEeBQ+pR3Qks55n7t0jFLRSjHmC52PpHjiA6RzHSNLKmupb53n3vk9X7Lir4O8zDHjsSn7p6qD/ZGL1r6oJvRpSSTQYMQZ6gc9iw8CAXRWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769339929; c=relaxed/simple;
	bh=BmWpRV51/ru4ZxAFZdbhzDEqW87TPDWWIagmwxzzw48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K3XOVx7VLlBH9cvYFsQMX6IwfCHTxaeQSU9E4ri99CcIry+hwIvzOihoI/nsDVrIK5StxJSBfgot0U9ca/NE62hldYXGwp8u7BB6yGRQLPveKz/+CSrydBhULpJ+wa0G1OctOoha37isjsY0ciuTH3cYcabj7Z44EQGKm1y1or4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVeFF2Oj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVeFF2Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769339927; x=1800875927;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BmWpRV51/ru4ZxAFZdbhzDEqW87TPDWWIagmwxzzw48=;
  b=LVeFF2OjCmMenYlfP3JW5MHm+EPE0XI64lGGgag3Owc0Eay0Sct5baHm
   +HrEjH2OPBt42nualQFWYHvcwNHLIrgHgVtZDLAuSJC41rWc+kiQvXRoy
   C8oRxh7WViBXzzgGZF551k0t4/WmHbgvFWMJfbv/TUjnSHPvcq/QaUrxe
   KzjjmAdlS7eLUw9m4kaulOpxzedo4KrvVCXqYlPbK9AkJozUdL+op4DLM
   wTYrXIS0xyaUiFsYg7EHuaO8Ns46Cly6MNwzszc4+VqAi1QgzO3L24o0U
   YL6wiUv1Te0s6pXpD/wjFI423X2ZVnUHb4njpP5h/Du6aMFiXYjPAn/Rp
   Q==;
X-CSE-ConnectionGUID: fSmtmcgzQA2NKGw4vcX7kQ==
X-CSE-MsgGUID: 4mU+am0rQ1edSt3j5Vy69g==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="58110662"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="58110662"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 03:18:46 -0800
X-CSE-ConnectionGUID: rSUeIIiqSuyC4gFmqZp78Q==
X-CSE-MsgGUID: VO49QuuhQaim+PQ47Sg+Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207327974"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 03:18:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: sdw_utils: Add quirk to ignore RT722 DMIC DAI
Date: Sun, 25 Jan 2026 19:18:37 +0800
Message-ID: <20260125111837.2386530-1-yung-chuan.liao@linux.intel.com>
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

When the device uses the host DMIC as the capture source, add CODEC_MIC
quirk to exclude the RT722 codec DMIC DAI link.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 2f3c9698a0e8..0e67d9f34cba 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -506,6 +506,8 @@ struct asoc_sdw_codec_info codec_info_list[] = {
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

