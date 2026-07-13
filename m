Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED23CA4AD
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932437; cv=none; b=Lw/3sjxbnJ56tqFx1bvFhkE6I27yC/Gk5bxbWPkkVk/LeXJHtg4m5/K58p0v+6XvPn9vFPr6t1tub9UU0UXt8cQiVfDFTwzkmjrm4Csm9KC5qhRWeW1IrbPhj3bZRNStVbtNDV9ei3ePxfImOLxaJAUYAyHodRGNh+AOynj0Mjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932437; c=relaxed/simple;
	bh=fwRSytg4g5nQh12HpDdLLBRLnXayp9TWagMPj5hFCE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fF/HMkS42nwNEKDBcGIzPgt8kgTcEsI2plubxOwhbSESGoVUjeKpGd7VejE77rAf37ESaLGmLKuJqHhtNSwYRLonooMrJSl5lQeBhBLjOoDygINE0HpvGoaFGohRAo9gEkEz1kcLn3pi0yOY9zdbzCSaYdhbt5ilE8dQXuEew8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BD0MrJZ6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BD0MrJZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783932435; x=1815468435;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fwRSytg4g5nQh12HpDdLLBRLnXayp9TWagMPj5hFCE0=;
  b=BD0MrJZ6wiqdKH2gnLyrnD8T4/oQMr4Ku/qWznMctScH5KMHljK2OpEv
   9wu1pdJsRk8wOIWyD5XiSoCweUiG1JDCLCtqKTQ5vtY4knl9JjxSaZXSM
   3OuXvIUqausG93P9oAMDEXbcFibNiy4RcO4CObSWHSC6MqgHmewUn6gMu
   111vpn7y/VCTr00Gn7gvSU+cY9jPST511azWHsaSG32+7KTJxO0y+/4EE
   3tKO1XLD7I+suNqXhxlB0LTWNdtNFItl/SuBPTRLZ+IjxuTjenFEKu8fg
   sn9kF5M2RFlUnFSBAfv4W1YcM9ze91gkZYzx9CGPcD7j/eXaCyiXGOmOk
   w==;
X-CSE-ConnectionGUID: gcfY3VlSQ2++VUfRn8mGCA==
X-CSE-MsgGUID: FY3gkDacRUmMMRoBjoJ/rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84554475"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84554475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:47:13 -0700
X-CSE-ConnectionGUID: GW8MMF7pTEm1jLEVBrhVwQ==
X-CSE-MsgGUID: cdgPsmGBTd6kc5a3llm8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279905355"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:47:11 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 0/2] ASoC: SOF: Intel: reset spib_addr in stream cleanup
Date: Mon, 13 Jul 2026 16:46:48 +0800
Message-ID: <20260713084650.4138172-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The spib_addr register indicates the current position in the buffer
being processed by the host software to the host DMA. It must be reset
before being disabled. Also, add the missing disable call in
hda_data_stream_cleanup().

v2: Check is_icccmax in hda_data_stream_cleanup() to avoid disabling
    SPIB in ICCMAX stream.

Bard Liao (2):
  ASoC: SOF: Intel: reset spib_addr before disabling SPIB
  ASoC: SOF: Intel: Disable SPIB in non ICCMAX stream

 sound/soc/sof/intel/hda-loader.c  | 11 ++++++-----
 sound/soc/sof/intel/hda-sdw-bpt.c |  2 +-
 sound/soc/sof/intel/hda-stream.c  | 15 +++++++++++----
 sound/soc/sof/intel/hda.h         |  5 +++--
 4 files changed, 21 insertions(+), 12 deletions(-)

-- 
2.43.0

