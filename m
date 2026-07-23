Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3228C3DDB18
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790348; cv=none; b=RXpBFCwfnTE+WdGmRr0MrziBTJjAz4PnH52cckvXIT75xNkVTq8WOX2BtIVw0dgSRolF/jYsYkKDbSaNh2v4SDRoDRy6odj14G8qy3EeG4LWUgDVkhkiTGlDbxrmoFT/mjJqMfCGNli1mj8rz1/70GGn0plmIGop/G4aTDYZ0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790348; c=relaxed/simple;
	bh=dSg+B8wJu0JfR7XrMoZdPz1/mKaK4IjJJnoJY24r17s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JGRTzgHUWVS5Xh/JuKWjrA6dhKKPAac/6QmcRndk/q35uOqQX0FXgrJMnXX3zo4JADuI0eYpCa6zeaSrcqytibOYTYj2fy2+a8nKPfWHwM6mgQZq7r4V2ZbqkM2O7jG1aArtz4fPZ4srh2PdqYJGPhmY3b8IWBfhtEvgg8fEVDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cL7U6T5d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cL7U6T5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784790344; x=1816326344;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dSg+B8wJu0JfR7XrMoZdPz1/mKaK4IjJJnoJY24r17s=;
  b=cL7U6T5dU6KkBYBXSjgC4hSwmBF2ok6NqXbvIBZE8lYce13ZmGoy8VOf
   i8Lg+Kl0LHy2Z0DovccBfdChXbvuYh5PaL4rRIbMtzJR405cjm1BLeT/l
   6nwL6kPvlHY1kDdEWz0bLKbDjnbYTkrRlTDXOqGSzrfq1M+X7WoK/rVnV
   1AsT78hcdBROPjKzULr/4KGYO+SX1tVGzDRWIdnNQFsejVyT14N/nMkWf
   XAThWNpxw6ilnDX8ToF761NaSXcIZbQsdEJmbrxmTS0UXZiRPednbe5GY
   bNvAfE5gjRs1dRbEZqB+7fdz7sofrM/xVpxj5FQOQPpvoX7Y6AVw1C9rc
   g==;
X-CSE-ConnectionGUID: XUXcAr9dRyiRfYEKE4L6VQ==
X-CSE-MsgGUID: IkhjzzZcQCWwPQ7hU13qxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96095041"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96095041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:42 -0700
X-CSE-ConnectionGUID: c1Nf0J0+Rf2Xeji4KwCnQg==
X-CSE-MsgGUID: 0fqr3yw/QJmt+2fIg20yHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256522037"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/6] ASoC: soc-acpi-intel-matchs: use function topology by default
Date: Thu, 23 Jul 2026 15:05:15 +0800
Message-ID: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit c84179a1d36b ("ASoC: Intel: sof_sdw: append dai type to dai
link name unconditionally"), function topology can apply to all
SoundWire codec configurations. Set .get_function_tplg_files callback to
use function topology by default. If any required function topology can
not be found in the file system, it will fallback to use the monolithic
topology.

Bard Liao (6):
  ASoC: Intel: add snd_soc_acpi_intel_rt712_vb_no_function_topology
    machine check function
  ASoC: soc-acpi-intel-ptl-match: add machine check for machines can't
    use function topology
  ASoC: soc-acpi-intel-ptl-match: use function topology by default
  ASoC: soc-acpi-intel-lnl-match: use function topology by default
  ASoC: soc-acpi-intel-arl-match: use function topology by default
  ASoC: soc-acpi-intel-mtl-match: use function topology by default

 .../intel/common/soc-acpi-intel-arl-match.c    |  3 +++
 .../intel/common/soc-acpi-intel-lnl-match.c    | 15 ++++++++++++---
 .../intel/common/soc-acpi-intel-mtl-match.c    | 18 +++++++++++++++++-
 .../intel/common/soc-acpi-intel-ptl-match.c    |  6 +++---
 .../intel/common/soc-acpi-intel-sdca-quirks.c  |  8 ++++++++
 .../intel/common/soc-acpi-intel-sdca-quirks.h  |  1 +
 6 files changed, 44 insertions(+), 7 deletions(-)

-- 
2.43.0

