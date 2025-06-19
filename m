Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDAF221F26
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335083; cv=none; b=BATZKKia9CUC//bu67APi9QMg+oPMol0lD57v+bmQZgamIZoZtwfmXprDKG3IemXmTE+icG4uznD95HLXnTJ0eGNwFLF0EWZdMR8Qs6skylzJmTBMC1FpYV4LRfGFLiT6ekm9Crz3szL2qYsmTN7Hf2tu0tbHgbFulvlzpenOVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335083; c=relaxed/simple;
	bh=wEeNsKXtKZAGevrVn4OriMFDx+EfhQqPPMggZ21vf58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kCCEO46OfLJAbO7KyV8V2baWm0Rr8SIXoJFH3h96Y1GHNDGZqzJOtn3o9RzuXJ+7V1Fcjq9eIeCnCpt1MYHOpsq2fcdIeKqNhX7T+Zchvna+lJD+1n/Bx0zFUZrxDvbldQXYUSAzuArsj139VzXshpSog+Ql8hquTbjeqIW0STg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHYGX1vx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHYGX1vx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750335082; x=1781871082;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wEeNsKXtKZAGevrVn4OriMFDx+EfhQqPPMggZ21vf58=;
  b=mHYGX1vxrHPsBvFxzLQ1fALOI3lGXAFc4TqFZN4o8vsRGGjYI8vhyovO
   iSjxnyYYNWgB6OR9v7sxkgAXpTjeg3Qqe6Dz+gM72J9fMTnWhMuCWAWrK
   Lav4GooXK2i3hJnJsn/QacY6EfilOdnbAok14OLPxaJnvSSHqqUtDqZbT
   /FFHUxvaVjwG4DPHSZrOEMS1aotaJhafPGm/5S5qVmZJe5Lj2U3nT7Z3b
   4bZ0Fmf1UpJxEKDKnmVhLCD0qhiVVDEC/LAbZPOsjZHUf+Z0oBMfytQNt
   7v9q3xvhzI0ReOUo1B7TXgEdhest66K4Q5mtlB3tbrWDw20HzapZh+5Pn
   g==;
X-CSE-ConnectionGUID: jyVwIIsDQKW+89mRP5dpUA==
X-CSE-MsgGUID: Ue8GsdNmQzWDajtVyH0r3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52555676"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52555676"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:11:21 -0700
X-CSE-ConnectionGUID: SExaOB23RIKQRkLtg/xY8g==
X-CSE-MsgGUID: 4o+rm8VURsS1P5A0nIX2pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155013339"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:11:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 0/3] ASoC: SOF: ipc4-pcm: Harmonize set pipeline state dbg prints
Date: Thu, 19 Jun 2025 15:11:18 +0300
Message-ID: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

The series harmonizes the debug prints for pipeline state changes.

Currently we only print readable state change for single pipeline
changes but when multiple pipeline's state is changed, it is omitted.

Use human readable information in both cases in a harmonized way to aid
debugging. 

Regards,
Peter
---
Jyri Sarha (3):
  ASoC: SOF: ipc4: Add sof_ipc4_pipeline_state_str() for debugging
  ASoC: SOF: ipc4-pcm: Pipe instances to dev_dbg in
    multi_pipeline_state()
  ASoC: SOF: ipc4-pcm: Harmonize sof_ipc4_set_pipeline_state() dbg print

 sound/soc/sof/ipc4-pcm.c  | 27 ++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-priv.h |  3 +++
 sound/soc/sof/ipc4.c      | 25 +++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.49.0

