Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6363ACA6E
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511595; cv=none; b=jxRzsHbT7RPEARsLY/wPUu6VaxGDxaKSSJ8bg2xrmy33LrDRLjpMZxIqMYmSiYhYrbBO3PXwL5Qb5DJkLHEqHxQdwvx8OD+Wj/bXEdB5CEYxVWs3nGCEEg9y/KggRq9cON395ls9aZ1UoEzo8I/S+jMwCIVmJFu9O2v5y7f5uKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511595; c=relaxed/simple;
	bh=qwF7RdYcF2nLdCmRCS/VILqZEIUAtNNfM9bq6Ru0TC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ol2EqcjK6pAFJ7MqYcvMtE0mCQr/wT1ORTrUDRQQxkk2XBB2z2AHj1WY751/ggq9eLEDQCw61XBsmjg8KbN1maVElENdP6n4tcZkFtxk1vHIIxemDECDvIcbL6cT/cI06zo9w3jgKOr7wg1dnrbJQCs/hDYFo5lNDeKIlwjXkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lso7asAl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lso7asAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774511595; x=1806047595;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qwF7RdYcF2nLdCmRCS/VILqZEIUAtNNfM9bq6Ru0TC4=;
  b=Lso7asAlz6h1ZdL9G7Hj5i83qGK3OPXosy8v0c9ksFwRYtBX0CNaqxZg
   5AYPEVP8UamoaypBBYpVLK8m+3AMRP6QFZZzeDP3qYbzjzDPab/2PHAXM
   v5MltA43Co9QHTD39Mi5igXilljDT8UcuppvdLCcIPtLvsfwiHCpz5bOq
   RW0COVumVn6ooU14xXRb0NZ01DvH3mSn3RKRZf4wQmIbkc7LKUkl/UIDR
   +Bj75tLEbz331SK9sInDaFxIuJob9mCzNkazj4+qlDx4RX+IOrMpAb4up
   QvyvKcji3IjXTQyzpcm36xW3rhpysHYBmFStum5fqohDePaXIIsUObDEh
   A==;
X-CSE-ConnectionGUID: euxT/b3vRJyIT12EFu8LRw==
X-CSE-MsgGUID: 6s70x+NLRYWbL+wxduE8kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78157932"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="78157932"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:53:12 -0700
X-CSE-ConnectionGUID: 5guKq3HQS8mI0IPX1vEBpw==
X-CSE-MsgGUID: UhRvM9mWQl6aR2WwpTUFSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="220084912"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:53:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	flove@realtek.com,
	derek.fang@realtek.com
Subject: [PATCH 0/3] ASoC: add rt1320/rt1321 dmic dai and fix the wrong name prefix
Date: Thu, 26 Mar 2026 15:52:59 +0800
Message-ID: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new rt722 + rt1320 configuration uses the DMIC on the rt1320.
This series adds support for such configurations, where the DMIC is
provided by the rt1320 instead of the rt722.

Derek Fang (2):
  ASoC: SOF: Intel: Add a is_amp flag to fix the wrong name prefix
  ASoC: sdw_utils: add rt1320 and rt1321 dmic dai in codec_info_list

Mac Chiang (1):
  ASoC: Intel: soc-acpi-intel-ptl-match: drop rt722 monolithic match
    tables

 include/sound/soc_sdw_utils.h                 |   2 +
 .../intel/common/soc-acpi-intel-ptl-match.c   | 100 ------------------
 sound/soc/sdw_utils/soc_sdw_rt_dmic.c         |  46 +++++++-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  26 ++++-
 sound/soc/sof/intel/hda.c                     |  10 ++
 5 files changed, 79 insertions(+), 105 deletions(-)

-- 
2.43.0

