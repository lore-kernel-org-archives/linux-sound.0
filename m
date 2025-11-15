Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CF61C84D7
	for <linux-sound@vger.kernel.org>; Sat, 15 Nov 2025 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763228760; cv=none; b=UvjCjQOklSogTxzLteY/2Nd6b37o0Wogyhm23doS9F4tyQdXW7vQc7+G0jfB4ZYQxh8knU/f7Ly8aGuiPAt/8yJdZwHdL7Q+hfGpB7fH9bF/OjyNTikIPh5/zLDV9TB2K73dqOfBo2zE4MpqfQmVaRNCrbqXPwHcc0WTBIGrizo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763228760; c=relaxed/simple;
	bh=DZlK0TVrdasPcCnp3k3zgt/mNuM+dceQcSUpE4rLO6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YpWVAsZwFR+ZstToJ1ZRCCgoVY3Bx3YVRunaQmaG6etCLdXiOVcPvuHP1L9tZR+QuJPVLy76oZpCX/wyRwFJCqVHYMpxRJtaykXExTaekyxHq7z+E00OWIhk9pFPkCYTyr7CtcHQorgRBL/V+3LF+GlcABQ8YFnTZXJuSteYC1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rr7JaDCN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rr7JaDCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763228757; x=1794764757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DZlK0TVrdasPcCnp3k3zgt/mNuM+dceQcSUpE4rLO6I=;
  b=Rr7JaDCNUyry8CQLhEZuA+Ishb496oSFAp6WYFOFiwtkc1bRrtHf3JBR
   LwWZL6zsiwIp5/sDELUMvscG2u9fm9BdicSF2hYY6FpxSnue0+lfH77tp
   n4xs+JFt7qBbmS5WadVtyUMal9rFo8V/chXa7m6B3XusStGurzyGvaxQv
   PuB6qWJMyImm2rVXBWCCdVODWWByVPLaiyIiDYdUgcANlK0gY2ZyIdUlB
   61FHPvhuR32HnlWRG4tsJmyiqBY9wnlsWaoLS6zWF28YCjOHAOMdyS4DY
   /BI0E9/NOljq5f6UuwSv8WqJYbaLsY70vwZPlxrWBMITw0qK7r6/8SksS
   g==;
X-CSE-ConnectionGUID: 6dXShaH8THe5XbSzt+vDsQ==
X-CSE-MsgGUID: Gw3ezPfDSvqZn6G5fyJ2rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65228298"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65228298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 09:45:57 -0800
X-CSE-ConnectionGUID: wGvvvWLsSV2snNkZhZq0pA==
X-CSE-MsgGUID: ShI/DD8ETaW4MF4VkDGAVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="190099167"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2025 09:45:55 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/2] ASoC: Intel: avs: Allow for NHLT configuration override
Date: Sat, 15 Nov 2025 19:06:25 +0100
Message-Id: <20251115180627.3589520-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Small set of changes providing new feature which the driver is already
utilizing on the market - for its Long-Term-Support (LTS) devices.

The goal is to cover systems which shipped with invalid Non HDAudio Link
Table (NHLT) - not just the descriptors (headers), but cases where the
hardware configuration is invalid too. The table is part of the ACPI
tree and forcing BIOS updates is not a feasible solution. With the
override, the topology file can carry the hardware configuration
instead.

From AudioDSP perspective, only gateway-related modules e.g.: Copier
care about the procedure. To ensure correct order of operations when
initializing such modules, the overrides take precedence over what's
currently there in the NHLT.

Cezary Rojewski (2):
  ASoC: Intel: avs: Allow the topology to carry NHLT data
  ASoC: Intel: avs: Honor NHLT override when setting up a path

 include/uapi/sound/intel/avs/tokens.h |   6 ++
 sound/soc/intel/avs/path.c            |  13 ++-
 sound/soc/intel/avs/topology.c        | 113 +++++++++++++++++++++++++-
 sound/soc/intel/avs/topology.h        |   8 ++
 4 files changed, 133 insertions(+), 7 deletions(-)

-- 
2.25.1

