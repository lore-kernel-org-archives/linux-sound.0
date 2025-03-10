Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4584E1C
	for <linux-sound@vger.kernel.org>; Mon, 10 Mar 2025 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741593893; cv=none; b=Ph5iBLbEUwi2Lam8OaJmNiua4Hiepqd7ui43HBwhUOQD8OWxQeoGocnn3SpygLLIc8Ct2gON12tM5MltRhvLxwTrl6cUaYdSH3H4Yj0HxAxpI3U1J1jVxXtzagpqlzWJNIz78mWwrCnx+mgDlzMko5v1UTEG/Dblr2IzF4P5PNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741593893; c=relaxed/simple;
	bh=Wnv8haqNeTzLhJ4NwrMRUuhwhw7pLNAy25qAxMpLcB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UpfU6+DJrNty4DPruxuc/Gl4EM2+aZvC90NHUB3+/kEmAIZiB8qfEOl6K5pWo2mL4SketVyLAk1OotFI/cTDj2MlX1wLfqsqS7Hv0jW4sDJ+9+xmGXpf3EmJoRR/KhwHbHXzbeDVlx7Sc8aUP+PxwvWj373Xyl/odIgpuaLUZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9aen6aS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9aen6aS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741593892; x=1773129892;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wnv8haqNeTzLhJ4NwrMRUuhwhw7pLNAy25qAxMpLcB0=;
  b=E9aen6aSCGzqt2vxvYjMa/OzNczyuhkrRE/6/MXqVWfhCkeiSvclHA39
   AQ5fRdck+QYCuomMMVYVfRRtKGPMb4qTsEirC+FiuOdK6YfmmNNVacmNI
   CJoelxbFE5Sod07rgAsyj9f7c7g4YcXcCTm3Bq/O/FJ//qTsP3bzpujtz
   +k7gUrTbFXT6YsLhJMPrOO18lkgQ+5E1T91ExVPh5rxZUBFXSabh5vIEk
   Q3H7OCtY7K+B0wMF1ik8/qvwqmaYUaoe+gYtWfofVztAqmmHBsVgeOVy8
   52DJetWFhQ++sfxXd8AHKeb7FIPC+kq0WVDpOqDasNjhj/feDaF84N/ON
   Q==;
X-CSE-ConnectionGUID: nv2ihvnzRO6K+OjsQqcvRQ==
X-CSE-MsgGUID: rdMT96fLSGGKxZYoWy8r2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53202680"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53202680"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:04:51 -0700
X-CSE-ConnectionGUID: mb/ineZvR/KVc3s61F3C4A==
X-CSE-MsgGUID: byp+IForRm6FJzmNo8KDBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119761107"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.85])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:04:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: rt722-sdca: add missing readable registers
Date: Mon, 10 Mar 2025 16:04:40 +0800
Message-ID: <20250310080440.58797-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_FU15,
RT722_SDCA_CTL_FU_CH_GAIN, CH_01) ... SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY,
RT722_SDCA_ENT_FU15, RT722_SDCA_CTL_FU_CH_GAIN, CH_04) are used by the
"FU15 Boost Volume" control, but not marked as readable.
And the mbq size are 2 for those registers.

Fixes: 7f5d6036ca005 ("ASoC: rt722-sdca: Add RT722 SDCA driver")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 7a38fcf63143..543cb32c2463 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -104,6 +104,10 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 	case 0x6100067:
 	case 0x6100070 ... 0x610007c:
 	case 0x6100080:
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_FU15, RT722_SDCA_CTL_FU_CH_GAIN,
+			  CH_01) ...
+	     SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_FU15, RT722_SDCA_CTL_FU_CH_GAIN,
+			  CH_04):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_USER_FU1E, RT722_SDCA_CTL_FU_VOLUME,
 			CH_01):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_USER_FU1E, RT722_SDCA_CTL_FU_VOLUME,
-- 
2.43.0

