Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C6B264A86
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860314; cv=none; b=lhYFpKwjl1vjI/YlYCWQBtmpYC23fVtpO4fbqB6sjRwGlSIImshwqr3Syqv8Q8ada60opkRpXMmC4m9PCCLEMhhSbcqVKGk1Bu2MWSZi9Nbmhtp5pk+S8Xvbo0Da0H//fz/69+8h43PKRIESxAlml6tV8UNXWhh7g5+aR4HuiSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860314; c=relaxed/simple;
	bh=GK6ecZ3shMbD4DGHiJevSAXTFFTKkSm01J7YGpUtPF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lVls+YkNqKAdYFbbMKeTiuQwPNAfwIHrkDk3DFdd+chGlWsAPU4JQTqwHKEX6AIYu4B0z4/yp/DWSNnF7MhmH4XfmBcbm24qyyr+B+UqbVXvUxDmtVxN8+dX9dwRs2wxo1TjrgoHmYU7RY/Dp11cgfTDIDZk75emZDjlfgoSaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYnwMhou; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYnwMhou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750860313; x=1782396313;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GK6ecZ3shMbD4DGHiJevSAXTFFTKkSm01J7YGpUtPF0=;
  b=UYnwMhouuoJKevtXmvgPBgU22W7nxVc0oStvVq3xmsA/iZctau0pvUfY
   W7s3ETClMcim8nRhF64hzaqkrdWwXGbKMdmLN0dAlqi6ZfoBsAcCLnfzn
   hAtvFR1UbzyFKegFuW5AVP/1Bf7VJkr8/NTNLs1AUxI3whXJnvE9JbhO9
   Lk/n1VKRu1l6b4RE5ct0d5iJpLT+frsvAufJ7gaQ+iYgQIXTpGGnrIOgy
   JhfqJmBvYTL7P8Q6HnSb6ZgbGI6v6iqtyR/9Nhj8IeMtuDbw4x6MCtTj7
   x2IrhdAaRwZIYK4Pu2TW3DfnkOQ1FycAyMUF7NQw40/UNUbd7/TZlMtVc
   Q==;
X-CSE-ConnectionGUID: +SEztNsQTXaL0fcugbVbuw==
X-CSE-MsgGUID: +58Dq4dmS8CW73CW6bDy6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52248800"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52248800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:04:40 -0700
X-CSE-ConnectionGUID: FDilI3wzSYCI8o6l0UBpBg==
X-CSE-MsgGUID: +m2u2Bt4SJ67HmgSfce1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="175873488"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:04:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: sdw_utils: generate combined spk components string
Date: Wed, 25 Jun 2025 22:04:27 +0800
Message-ID: <20250625140430.311865-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series adds support for combined speaker components with one "spk:"
tag in the card->components string. This is a UCM request.

Bard Liao (2):
  ASoC: sdw_utils: add component_name string to dai_info
  ASoC: sdw_utils: generate combined spk components string

 include/sound/soc_sdw_utils.h            |  1 +
 sound/soc/sdw_utils/soc_sdw_cs_amp.c     | 10 -------
 sound/soc/sdw_utils/soc_sdw_maxim.c      |  9 -------
 sound/soc/sdw_utils/soc_sdw_rt_amp.c     |  6 -----
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c |  7 -----
 sound/soc/sdw_utils/soc_sdw_utils.c      | 33 ++++++++++++++++++++++++
 6 files changed, 34 insertions(+), 32 deletions(-)

-- 
2.43.0

