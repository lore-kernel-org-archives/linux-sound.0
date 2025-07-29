Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4916C10E9
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793135; cv=none; b=GQXtP1YveGyLbcCwdA3OhveVdmsgYK5aaddnIxb2beuI88/m8xdDWoqdJS+jOre8EbkogwLHMDhifz+gQOTiWzq0caPOP/iodQndnOIziJcxWbualTsB+yc4O+e1CKKGTVVtyouDl+0mGfWzvaRcKpRvRkn1GjPg+QoemzNDeOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793135; c=relaxed/simple;
	bh=LJ9o2SWARUwuVG+8+fYVauds/RHOdjQjE0e8s84EAss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HkBBo3DzVCxN5LtKb91+a9m6wV7VDUrxLxx23AnIC9U+H80hrAjqzxBdgCosLcn8gxjlS2Wtf3/XcBFVqlsYvAaGDVVXwha74oQxxCuP+VzdG9GwxzcTbb+0jjDJSskVMmygsa29ZO+NN64F42YYsU4ipAlNM8aPeDBcTwCN/8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEBMWdg2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEBMWdg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753793134; x=1785329134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LJ9o2SWARUwuVG+8+fYVauds/RHOdjQjE0e8s84EAss=;
  b=HEBMWdg2vKRQ/EIlvkntIDOcICQJ77ouZcnTZmnvtU1qZfbvfjYfdlF0
   D/czw6roPCcUXptbhnhl8vUmcXd+8ylgixa939d2QRCYDjvLTAniXNYkk
   OjnYxhgtmorkd7Hgi6REBhIgFxWS0AH4jvgVQrVev7STkFAO1LTm4Eww+
   3K+1ww2nGcNhGgAm6W5rvINyvldAml26lckM87fLhCmUxeAumYskR1J6c
   gIKsvaYUK4UR/HIbRsv7vKuOsxv6j1BXQkoU2zWGdJK2YLWCiQYTz/tru
   cIvWP8ncianlz1+8qmCiHN2csvSkdnMUleQv508AFQIJzvK6qz52pKpDD
   A==;
X-CSE-ConnectionGUID: diywcM/DRKK62pfbHMp3WQ==
X-CSE-MsgGUID: kQq1SF4bTmiczNtAd1lW5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55922857"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="55922857"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 05:45:33 -0700
X-CSE-ConnectionGUID: pOvSGrZeReCSQpc59fYz5w==
X-CSE-MsgGUID: 8npXKN8mQF+w8rvRpBKhzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="193682131"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2025 05:45:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/2] ASoC: Intel: avs: Conditional path support
Date: Tue, 29 Jul 2025 15:06:31 +0200
Message-Id: <20250729130633.310388-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The code presented here is a lighter version of what was initially
discussed in 2021 [1]. Later, we've had a more general discussion [2]
"what if the feature was part of the ASoC core instead?". The discussion
turned towards leaving a simplified version within the avs/, so here is
the final outcome.

What's removed when compared to the older [1] version?
- conditional path priorities
- conditional path overriding


The background:

Conditional path (condpath) helps facilitate modern audio usecases such
as Echo Cancellations and Noise Reduction. These are not invoked by the
means of userspace application opening an endpoint (FrontEnd) but are a
"side effect" of selected PCMs running simultaneously e.g.: if both
Speaker (source) and Microphone Array (sink) are running, reference
data from the Speaker and take it into account when processing capture
for better voice command detection ratio.

Which PCMs are needed for given conditional path to be spawned is
determinated by the driver when registering the condpath.

Two patches implement the feature:

1) update the topology parser to acknowledge the new tuples
2) update the path-creation and functions that participate in the
   PCM-runtime e.g.: run/pause.

The runtime update is needed to keep streaming sane - all the path
operations shall be synchronized when a condpath is being spawned or its
status is about to change.

[1]: https://lore.kernel.org/alsa-devel/20211208111301.1817725-21-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/linux-sound/20240821101816.1494541-1-cezary.rojewski@intel.com/


Cezary Rojewski (2):
  ASoC: Intel: avs: Parse conditional path tuples
  ASoC: Intel: avs: Conditional-path support

 include/uapi/sound/intel/avs/tokens.h |  15 ++
 sound/soc/intel/avs/path.c            | 267 ++++++++++++++++++++++++++
 sound/soc/intel/avs/path.h            |  13 ++
 sound/soc/intel/avs/topology.c        | 110 +++++++++++
 sound/soc/intel/avs/topology.h        |   8 +
 5 files changed, 413 insertions(+)

-- 
2.25.1

