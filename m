Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C833C1992
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027417; cv=none; b=ni39TZ5ZGe+Mg04x67CiZHwCVWQy7wM10hk2mVk5v9egr/xSxkcqtRJPKnmMUpK0V1eRc7HAPGbWiNMb4eTgVULupb10b03Cg+zDisZ23MaQkTV6Uw996D/YNgJEuAHGbaudbgTsNvPitI7BerQAryWGQscS2EG8xWDhsMaeX8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027417; c=relaxed/simple;
	bh=3XeW2PAzGv7iLNR/fqC0H+DP+QDF9VkPReykwiHhbok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kDq80RvK3cgS8BCU5fvYoK2lXkxDWwmm/as41pzcA7J9apQ3YTs1RAHx1I+/eFKBnhU772mFXFBgvuQYgQV8EhzfSpV2ZG63XVmA18ep7GlTwYzOBBdonGyeK4g3KwnnclXP9gDJmC4OYLuM61Pz4NdzXrIuLxdtZiiGD9v3HWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLf1+N6a; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLf1+N6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772027415; x=1803563415;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3XeW2PAzGv7iLNR/fqC0H+DP+QDF9VkPReykwiHhbok=;
  b=BLf1+N6ag34TmMO9jlFMoqtk1igRYSSfemhC1IbyOs8wg76JsS2uyezu
   MO5p9pH2bZqVLFWFOWHHQjVau8t869pG5/MAvjjjRqWX0Qpgm9pED1daq
   iDrhV6+ZUqRl40VI3r2CPmlNOIsqlcGoBPAI0nm8Vl7lgiW8P4oh2JYTh
   isj2Q4b1yFjjw8QFK3DS7egSX/7O1YWn3P/+TFDBeEANcPTTUj2BrIbgT
   rcOLwNWhuDMDg8uj0dib9e4fB0l6qSKjheu48cjulUjBCJlkZAdZcTfvJ
   oK8W86ORXYCQ4Veu85BXPPhxLBY+L5mQzesLy16NrpIw5Sb5G+P6NeY20
   g==;
X-CSE-ConnectionGUID: HwKbQzPFRIqelH97NwlWyA==
X-CSE-MsgGUID: HxS0iiwfQNaShD0I8FskIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73037427"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="73037427"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:50:15 -0800
X-CSE-ConnectionGUID: MnC1C/pTTSCMn8hYzF4taQ==
X-CSE-MsgGUID: XUA6t2qoS1qWLrVO25lL0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="214352122"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:50:13 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	Deep.Harsora@Dell.com
Subject: [PATCH 0/3] ASoC: partial match the sdca codec name
Date: Wed, 25 Feb 2026 21:50:01 +0800
Message-ID: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, we set a predefined codec component name in a DAI link. But
the codec name may contain an index which is not fixed. This series
suggest using partial match the codec name to fix the issue.

Bard Liao (3):
  ASoC: add snd_soc_lookup_component_by_name helper
  ASoC: soc_sdw_utils: partial match the codec name
  ASoC: soc_sdw_utils: remove index from sdca codec name

 include/sound/soc.h                 |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 32 +++++++++++++++++++++++------
 sound/soc/soc-core.c                | 13 ++++++++++++
 3 files changed, 40 insertions(+), 6 deletions(-)

-- 
2.43.0

