Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30A7241665
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285308; cv=none; b=VVLTlpVVEpCdeSlNgS3XHHrg1gX9kQJmEVhSlBqAKLzdLRmer201b7IOHF118vSNCgh+mGJ2KG2Rd88loGuuAuBhMnZ3NPgaVzpSYRBJYNcLBsKJ6FqafuSifT5Rdzp31Hnh6/7GsAsCcoKwr4pkTma9nz1EJ1F1o8XhGItm82w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285308; c=relaxed/simple;
	bh=/IfwntrmFKIYgHe5Gzk/NVZPfpuj3zwJyi5WeoeJUgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TaF225dvtA4/HIQQGf07W/k17ra3BbN0TgV0wOaUjEeeDEssY/nixxNPROqvIAZjtgYM1IdnA2LZIQP7kF+SGSLOE//gtudPnU66rvajtJN1coUaF1n8HcjQSNJ5J5OtdeEKFyIFoMO2IW2VOBFXXoyI8aYFbYxSlO+4Nb+MZqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADoyOY4j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADoyOY4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779285307; x=1810821307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/IfwntrmFKIYgHe5Gzk/NVZPfpuj3zwJyi5WeoeJUgE=;
  b=ADoyOY4jIuKIE6NqqGr8JoUoAL6LftysjdOWuuoRQFjWCp9JVaI0+Xqp
   mMQjVISSPlOEdUGNg/PZnqUJJ/u212bslG4nlFhiVE4NirDkyUki00Fq5
   Mobtxis2RRgCaWRSFwkRqWZaIppB6bviL26/7vFhJ8QqioCflu6Xef8Nt
   agRaLTBprTwSniQiLXqK2fveWZ5GT2UO5TsgXm2m2Pzhare+EmayNhCR8
   OVaxiQPPgFOOx0E6tEMC5x9JbVs33dlAI2yBusH8d2jJBheAVgax+ZsO1
   k80zDO6i2L3gdQ2PrecChFKk4OSW6eYyJg7ziY1pzwNdYjuL4ZvuIPI0K
   g==;
X-CSE-ConnectionGUID: J10Y7MAvRISfUMGSIwP+sg==
X-CSE-MsgGUID: UJqGYyR/Q1S3ZFzNpHYWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83800392"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="83800392"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:55:06 -0700
X-CSE-ConnectionGUID: VTpWpzXdQoOScm5P6T7fTg==
X-CSE-MsgGUID: tm8AHPE1QJmJgfI/ZT7OAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235757624"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:55:04 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/2] ASoC: SOF: DSP core count handling updates
Date: Wed, 20 May 2026 16:55:12 +0300
Message-ID: <20260520135514.32720-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The series address developer facing issues regarding to how the DSP core
count is handled:
IPC4 code ignored the DISABLE_MULTICORE flag, fixed by the first patch.
The second patch does a validation of the core index from topology
against the number of DSP cores available on the booted device, which makes
generic development topologies usable among different DSP variants without
failure.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: ipc4-topology: Handle SOF_DBG_DISABLE_MULTICORE flag for
    pipelines
  ASoC: SOF: Validate and correct the core id against the number of
    cores of the DSP

 sound/soc/sof/ipc3-topology.c | 10 +++++++++-
 sound/soc/sof/ipc4-topology.c | 11 +++++++++++
 sound/soc/sof/topology.c      |  9 ++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.54.0

