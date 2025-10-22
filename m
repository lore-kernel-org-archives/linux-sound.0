Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD882F9DBB
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118804; cv=none; b=ZGLIWk2PtmURz7uYjuAcvHcFId1TnTRv2WSOLBb351sx/TzpCfsk1QHKB7IQvfZcY9Yz/lWW4IUtkiWMaso9KYJR7Q5AOhZGmub7LALLETIAZj5NjNXH+wwE8vmO7iaPI0PLxo5JRMh9bKyR8INEgkjN1nR5Qs0fXFAMKSk0EQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118804; c=relaxed/simple;
	bh=R5qnRs2N6wyVFTGd9AN0S4IcmdvZ3FbH+6e8OegHPnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXjq6l5E4wrF27vpkHqaJ62GavghmoGxU6HBFbD/TjQbHGE8HODPZB77NwfWMENL5zZwtp8cviSrmXEPkaAp6X+cB/vre3gfRTBLTC3L6hxmSnH6n4DHWHZ8Zn/mLGjPFIx8g++cLMArSLRVyXE0vSwW0bZTQZy7mMWmi236BtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdD6Kw42; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdD6Kw42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761118803; x=1792654803;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R5qnRs2N6wyVFTGd9AN0S4IcmdvZ3FbH+6e8OegHPnw=;
  b=ZdD6Kw42tI6OCqSdaNB3MM82d3iiJyncISwdDnt6bvGRnHMaGW96Gzfh
   +TTM5oZwbM4tFmJO2r1VfB72r1JraMILOmIGNPHdK7lNduLjq/GVHoM9b
   vW8key7awLN1FouZ/jG7l3LiNZxPEV2GOVQSLi991dCmup0wRJxWDsLQa
   2tllRuCDe6IMWQgyhlR4CaQGcXz6zooPoUqBTFt3tvWgrHCp2i75+biZE
   kh+0nIYf0sxEOuRNTxj2B33p0JUPOZYRxAyecb63A3k4ulAzs2XMvUauh
   hmjetWg/e3Q02BcP2YzqcDv//9FCDR5DMvRXwUPBlAU4IZhBJLOqRMs9W
   w==;
X-CSE-ConnectionGUID: top5BJ14Rl+DupYogHco/w==
X-CSE-MsgGUID: Txm3n3NNRqCP+t2fYHAKHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80696204"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="80696204"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:40:03 -0700
X-CSE-ConnectionGUID: Xkf0pyJTR/yp0dkuakAz8A==
X-CSE-MsgGUID: 9LuQflEPSNu/K6/UDP2azg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184581087"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:40:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	shumingf@realtek.com
Subject: [PATCH] ASoC: sdw_utils: add name_prefix for rt1321 part id
Date: Wed, 22 Oct 2025 15:39:52 +0800
Message-ID: <20251022073952.327451-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shuming Fan <shumingf@realtek.com>

This patch adds name_prefix for rt1321 part id in the codec_info_list.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 92e071f6b054..cfa6255be387 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -325,6 +325,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1321,
+		.name_prefix = "rt1320",
 		.dais = {
 			{
 				.direction = {true, false},
-- 
2.43.0

