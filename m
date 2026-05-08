Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3083451B5
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237000; cv=none; b=jqQcH7M7kT/gFXkkJuPKO92WxIL7H2eX93Q2Slv6sCclJ77YOY3hbM1+X+6O3CNM3B3mgZmp7H+7dYMWm8YrlHTFKdKgjIxGl1FUatiQzlubfm3lb8t7+3jUSJByErNVrBy2bNsvss3wa3IedHoUASHBB3slFTRKnX7tPsn/EO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237000; c=relaxed/simple;
	bh=rF1dvTnNowd3ZCoImjhBeZn0Vw6sy0jJ+5AWKG3gL+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WAaNwX0ZPK9vS8nduKpW6hDWkRcHJdpCUlqQ7YibO/af15vkpil6WhHEJRWSxe5qNAQb9/fylW65nWZL9KT304YQvCGr9d/kOgbP2unrIisJ9NrgJcd147RnOhsy9qe9Azcfos6EhytL9sIFIVRU4wTqs2fB+A40pX7BfbNake0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKDZG4xr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKDZG4xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778236999; x=1809772999;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rF1dvTnNowd3ZCoImjhBeZn0Vw6sy0jJ+5AWKG3gL+8=;
  b=PKDZG4xrhKxuDrH+e2g9syO6pBJ56pod+3RA1rOfvyK+ZOVgsUdCOS6X
   0vbSEhx8nrtj83uepShgen42QLclVVwttl7ljZe5YcqPNgiUun2qPKydJ
   7Ci9k5wEV+zbEPNJTi1sFMJBy4EaIr13h1/az4f38mRzGAmtSUM92xeQa
   d1hJssClqvKdQ6685LPRXW93tMyKmulPjA8PWhCrzFqGq++zKxK1XYlVL
   qnrtxDLnZPZwGRnZgOMOg+e8P2Kd5oqS5c2mjjOXEiX88S7A4uWXN25f3
   ukWBWvrIRi2lxHVKgmbonLoEjqxnvso2moQL5b/zfhzQ9PaLZ/f+6FFSz
   Q==;
X-CSE-ConnectionGUID: pwhEKQRxTS6sCPppF8Ik6w==
X-CSE-MsgGUID: P0JeJD9OSJyvIWwjGA8eQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89512077"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89512077"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:43:04 -0700
X-CSE-ConnectionGUID: 1uWrVQkER56y3pQLup111w==
X-CSE-MsgGUID: p/1tvMRmQcOK7m7zwd9RtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236979066"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:43:02 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mac.chiang@intel.com
Subject: [PATCH 0/2] ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support
Date: Fri,  8 May 2026 18:42:36 +0800
Message-ID: <20260508104239.1247525-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add rt712_l0_rt1320_l3 support for ARL.

Gary C Wang (1):
  ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support

Mac Chiang (1):
  ASoC: Intel: soc-acpi-intel-arl-match: Reorder ACPI machine tables

 .../intel/common/soc-acpi-intel-arl-match.c   | 71 +++++++++++++++----
 1 file changed, 56 insertions(+), 15 deletions(-)

-- 
2.43.0

