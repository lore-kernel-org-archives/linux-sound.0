Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1609A33FD
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931809; cv=none; b=b/1SXf982GIjbNoNs2FB1y3Ai1njsM53s0cCjayDEj4cdNrqisXsN/A5ciXaPf8UEJBVV92Po9Fl5iPn1TJuq+Vzu/JxRk6q0o2jHPb8W5pFuTDhYu01u9btAVeCzrWxhA+v3pMhPUNkBl48yTS7amWcQN2prcN++XfXEi9KhrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931809; c=relaxed/simple;
	bh=FWsUyZvqccYFq2RMLJXKX14ANzy2Fp9s+hMtyIlHGO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGVBbG6i1D20lyWg7M3Ba/VUAuT5l2SXguU+IFtgu5CA4G3UsGVnZxNxNz3xMeAWH7kT17RZAspte80+hrWXIa9dtKOUtRPYZaFkpfSQqj2woTrSBBizgYvIrBCJmGIKTdRJyQ3wlijnS37lVOINUDr57Q9yygIyuRJIVoA++ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUu9fkvb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUu9fkvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738931808; x=1770467808;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FWsUyZvqccYFq2RMLJXKX14ANzy2Fp9s+hMtyIlHGO8=;
  b=KUu9fkvbWLVuijBTi4ZqQX/A+p30XcRIbWSrd5KlvjjrJs0/6XDAgp7F
   JmHc+wkVwIiWEBIQHbsWJpXDEe6FvoL9U9O+JhgXMtdhxcsABVP/ixe+E
   weH3lQq6NPgGAfVDWEBdbdkbRlLMo4+nSa1jTZ3yGkQzPM4a7T2rdEZE/
   8whAf1DL5LtgpCtYtEjr6tjQpBwEoUev4WtsoiQlXl3VEwwsDI10tPq3H
   wtyo2vlef+txakkT8nImxjEMtMxmF1I4XVBR/3xcgieiSXmDuClrSGCdB
   syaz3UfH3X0fo9WtfXZLxAqlMQ2TfWncffI+p1RjyjGYtwA55QBmwkuiK
   A==;
X-CSE-ConnectionGUID: 3UYKGc8tTm+FSSb+KRiYXw==
X-CSE-MsgGUID: XrC1pI0NQPmO80c9Bb4Dpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50959172"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="50959172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:36:47 -0800
X-CSE-ConnectionGUID: FVWThmZCRkmtD9xudbFriw==
X-CSE-MsgGUID: /fGWe5+iSFCxc+vzfJERKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111364291"
Received: from johunt-mobl9.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.223])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:36:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-ptl-match typo fixups
Date: Fri,  7 Feb 2025 20:36:35 +0800
Message-ID: <20250207123637.215320-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix copy paste of lnl into ptl.

Peter Ujfalusi (2):
  fixup!  ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320
    support
  fixup!:  ASoC: Intel: soc-acpi-intel-ptl-match: add
    rt713_vb_l2_rt1320_l13

 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0

