Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C90182D7F
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712660442; cv=none; b=oHFAM3yyfCPskL5c6EB6YFyd6gWnlRKnm7TaOgbq/DZuVEYfbZ5UUkErhENK3Hd0O6+zE/uctf/9Qu3z08kT/Njo2O3AUspDcax3jv9akg5LkmVQSNVBRTbzFBus1Ngbot3P+ygCQTDTe7glVA9Q5P05AjQXgnlC5Y9ZYeW1ZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712660442; c=relaxed/simple;
	bh=6ycI2G+16tYgczPc+tPn0B2oQ0H85WE9j+VRFkBEZqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3jg7S37U6FczNpI01FFlQHL9xaUTbK+fM0zS9W3AT7Q1m5Slp8IQHKlaRxbnCChRZ4tTi4h2ofrB0QMCDu2YlkvAXCAo78Y6kzoECLaF23dKQk52rQ0dLM5JflaKedhgXIX5I5ze1KdvCrR44CIwg/nysyuUSHPK26gqHGtSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSfNYQkO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSfNYQkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712660441; x=1744196441;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6ycI2G+16tYgczPc+tPn0B2oQ0H85WE9j+VRFkBEZqA=;
  b=JSfNYQkOdh/XkZ08199ZAGwMroLbNdL2/XIMW11DUC4JXTkf54us1jG/
   j7RVNP7+rVAyARF8ElAVLvLlD9Kc9bXfDL2vufAGdnPNgziKe29agahc5
   U4BKDbmiEG4jdx7R3CaISAFmn/DRRPPj8Cn7+pZaReThRcacvhtEPrFAg
   qJeFr0vT9WgDRnDtBkxVJc5bfNp1p7CZoSgHgdpVLaa0FDUK2PPiH9XVu
   QjO6LNHBKVfsp/jtqe+ZO4orytuZ0eHeC5JoWmShWvlf0zMymHn8XIZZ2
   0ycP2PbiOpDn2GsDX3rSccpqWs8PNaen0BOZBWgXjSEb8ogh6cj/6P/PP
   Q==;
X-CSE-ConnectionGUID: hc1zN56PRfatLnFaHJn71Q==
X-CSE-MsgGUID: rPBKmTinSyavT25Pe9G3Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7812995"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7812995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:41 -0700
X-CSE-ConnectionGUID: lkWl6Sw2RcqspzDCydH1tA==
X-CSE-MsgGUID: /z6PpSK0QIi72saLh0onHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20309760"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:38 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 0/4] ASoC: SOF: ipc4-pcm: Do not reset ChainDMA if it is not allocated 
Date: Tue,  9 Apr 2024 14:00:32 +0300
Message-ID: <20240409110036.9411-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The current code will reset the ChainDMA on release unconditionally which
can result the following error when the CHainDMA is not allocated:

ipc tx      : 0xe040000|0x0: GLB_CHAIN_DMA
ipc tx reply: 0x2e000007|0x0: GLB_CHAIN_DMA
FW reported error: 7 - Unsupported operation requested
ipc error for msg 0xe040000|0x0
sof_pcm_stream_free: pcm_ops hw_free failed -22

Background:
Pulseaudio and Pipewire on startup opens all available streams and
closes them without triggering a start (after probing it's capabilities).

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: SOF: ipc4-pcm: Use consistent name for snd_sof_pcm_stream
    pointer
  ASoC: SOF: ipc4-pcm: Use consistent name for sof_ipc4_timestamp_info
    pointer
  ASoC: SOF: ipc4-pcm: Introduce generic sof_ipc4_pcm_stream_priv
  ASoC: SOF: ipc4-pcm: Do not reset the ChainDMA if it has not been
    allocated

 sound/soc/sof/ipc4-pcm.c | 115 +++++++++++++++++++++++++++------------
 1 file changed, 79 insertions(+), 36 deletions(-)

-- 
2.44.0

