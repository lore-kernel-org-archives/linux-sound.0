Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE4811713
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973730; cv=none; b=o7HFkZAN8WFd6CKcdFIeukk/GJ61cphH72ZjEdOmQgi7i4dkyFgren0hl2u5mYq1NwwmzqYJQjSsbZURxOdJYWHuLWSkc+ZflQkBQsr7sGGOEmK7Z2zusLPDUhvD+/GfbD7AcA4IzSWSBdX0PR2AICx4ktMK5pfcL64wjBTMe1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973730; c=relaxed/simple;
	bh=gPvRZfW0MnsAl0Vjamkg5Ta/3qW2t/Y7c3XqvyYIucY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0SoiMT44u2mOVUIS1jkqDkSKIVgtPnvVl3Px5nXwncwYL29CeD3SYi9xi4w8mpSzp+Bnr0zs3dfnb7D9ye5wk3/+MBgq8J26wc627us00jR9pFmdxFWk05n5p4WlPfwQVUvQnOtOp+nqHULyIU4T+d0Al3BGHLY0Q+HLIKknDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/8P+Fqx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/8P+Fqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730973729; x=1762509729;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gPvRZfW0MnsAl0Vjamkg5Ta/3qW2t/Y7c3XqvyYIucY=;
  b=U/8P+FqxGlrUIzv5qvhywioL3uEjcDe3I7C5oYfLGGl3ACfOzCC+h1tg
   pYNlLhs8ZEc+HVpkf6zBwfZx798JDF0UhlrCbiIrUb5AMRGyPMW0hYF8l
   eNP3ZDrLTqPrTw/jmx1R2ewKgJcjBxH1ySrnFICTYeYbjn4THK45qaHjL
   2lm8YgO9lRSVd6QKPGPX+J32Eh0gJRhGYqTS5dHIlS9Tftktj/39PccKU
   6CSrFGIJ269tjMlw22RDTdb4/SwaLQ6aGEa66+By5ia/4Y/3HReu/0DRt
   1uRFHmx2Kj/IPx3tIk+1IoddAX2hGp929llgMJAJygVPKveR+1pnON++4
   w==;
X-CSE-ConnectionGUID: yFi8G+OESP28Qsrj9lv1Bw==
X-CSE-MsgGUID: e6l2nuUfRTy7wtCLjrMXaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30213253"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30213253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:02:09 -0800
X-CSE-ConnectionGUID: XjzSB3l3SfGEfdmlhZTyng==
X-CSE-MsgGUID: RQ5PLX0rREOaXaMS0dnEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85425766"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:02:07 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 0/2] ASoC: Intel: Fix Kconfig for ACPI=n
Date: Thu,  7 Nov 2024 12:02:02 +0200
Message-ID: <20241107100204.24952-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A recent attempt to fix a missing symbol when
CONFIG_SND_SOC_SDCA=m and CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS=y
caused unmet direct dependency warning with randconig.

The reason is that SND_SOC_ACPI_INTEL_MATCH is needed to be compilable
even if ACPI is not selected, modules have dependency on exported
symbols from it.

The only solution for these kconfig dependencies seams to be to
only select SND_SOC_SDCA if ACPI is enabled  from
SND_SOC_ACPI_INTEL_SDCA_QUIRKS.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: Intel: Kconfig: Only select SND_SOC_SDCA if ACPI is enabled
  ASoC: Intel: Kconfig: Revert make SND_SOC_ACPI_INTEL_MATCH depend on
    ACPI

 sound/soc/intel/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.47.0

