Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE11B6CE8
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084675; cv=none; b=HolYy8gC5Wd4npuwpJ++yEkU1h23W1yq9EYPKCBCbba8LdWyR4NsqUg+2jM39o0C7CeamFgZEfZ6GbWFpuMFN9VGNuIzOXTl+3bIfdVuPG9shY0nk+bNcABLmEVVIsj3yM7ZXo5PvvsPeE8yn56/DNyZTKrjd3tDj9ggsunv2ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084675; c=relaxed/simple;
	bh=MXXekR5TFRVcjX3CjCjGfdOfv4V/Wvov1EsfT/FiPr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDQEA9tImsBmUNLPxt/VeezyNcCFFnRkf98VDaCgpfbuJEvVw2yATO2XJPOlGFwkTqCwCT+V0By+o1b3Wm3jJoef6dbcZ/uafLdJRAaXNjISQEgEE6zyLEdKbCONM14cV37EKOsKldIC07jUt31QVcdrF6jU5/rCGiyI937dSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jL6GUqjL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jL6GUqjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734084674; x=1765620674;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MXXekR5TFRVcjX3CjCjGfdOfv4V/Wvov1EsfT/FiPr4=;
  b=jL6GUqjL6QnqvdTa33T4G4s31vU252bC34kHuXLdH/lj8Jy8/YCDwMzP
   +75D4dfIckBe0uC9ufCYzNVe9PzrWrqpU06WMMwyuyoI7QOcRiUBzzQrL
   gq37AwQvn3tYojk+3wdRude3A0ZJyu1U6mbyTMuCnQARL3KdzX0NfYFp/
   8Uq9LfF9ZiUULAVN118vZsEE5sgUctIeAmEC+2rv3RLBtSQtb/s+NiAMW
   rVK59qKZMlpPezRQy5b5/mhtWMAVSt3dQfx1alkWLhsq+TAHpQLfmZ4zb
   NkwrNGJtC7vMZVHON7KRZR2GJmqjGknEV24bQR+uxIk1o3A0sG10Nf9B5
   w==;
X-CSE-ConnectionGUID: uKAX/2OXSPOZWUwmWZn0GA==
X-CSE-MsgGUID: J0iEyj+/RlGOFlSgpj+BEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34263338"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34263338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 02:11:13 -0800
X-CSE-ConnectionGUID: 28nR6IqLQKaVgFry6tnPMw==
X-CSE-MsgGUID: 3diqo4XaRPOO0JQ4YUX7UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="96570732"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.190])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 02:11:10 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/2] ASoC: SOF: core/Intel: Handle pause supported token from topology
Date: Fri, 13 Dec 2024 12:11:21 +0200
Message-ID: <20241213101123.27318-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A new set of tokens have been added to SOF topology to indicate that the pause
operation is supported or not on the given PCM device.
Pause is an optional feature that depends on pipeline, topology and modules
used by the PCM.

Add a pause_supported flag to snd_sof_pcm_stream and use this flag in Intel
platform code to keep the pause support enabled or to disable it.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: Add support for pause supported tokens from topology
  ASoC: SOF: Intel: hda-pcm: Follow the pause_supported flag to drop
    PAUSE support

 include/uapi/sound/sof/tokens.h |  2 ++
 sound/soc/sof/intel/hda-pcm.c   | 15 +++++++++++++++
 sound/soc/sof/sof-audio.h       |  1 +
 sound/soc/sof/topology.c        |  4 ++++
 4 files changed, 22 insertions(+)

-- 
2.47.1

