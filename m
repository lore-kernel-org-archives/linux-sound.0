Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738F20EA46
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730986780; cv=none; b=VXa/FmDvr5/kbpoBklQFdNzSaKnwXX+2HI/hUmCoJ3AtBpxccDsLoPaCWjdJFr3EnvH1kzFCayCHM1IoG6PHDtHel20WAPBH/s8vx7e53kDgFmTskh6CDATqwI6AjzbqY+QrC5QfCgmO4ZUp6X184zPvGmsGiqJx5Y2Z5br5eOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730986780; c=relaxed/simple;
	bh=ag+znpwmOcqDZGRhio9GJHcwQ8K7TkKdTzhBUr/Af4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bD4K6qWYLFc/brsOf/5gXwxsyfOavCGJUKsaCubJT559ZfHg085SZRa/7aSR5u0wOylClkW29mJeATEISgDfgHduMmvxlGn/z6ztTCTDxJ1dSgFqEqaZyQz4ArpU9WUQmOaUo6gJPkcwjTXA8NHEXYSkQ2qtgZN5012UHUlgkhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDMGjO/l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDMGjO/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730986778; x=1762522778;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ag+znpwmOcqDZGRhio9GJHcwQ8K7TkKdTzhBUr/Af4w=;
  b=JDMGjO/lWocz475y4Zq7KIpGlSgAmnaV2WLfFFBPeIbygkBxCUZsiUZe
   eeGq3VZahhT8N3gRI1q7ZOyj1GwzhdFLXRKEMDKIAGBBCiwW8miEQqNM9
   r7XifQ2q81XXYMec6+YuhEejwHW5RshdqVo75hTFFpY+XIr3hNl1MtRb3
   YqBTti3sVtBwFXiJeEQyU+OIPLucTuEePlYBqnz+LL7aaXU+9xPEV8O6b
   jUEDb7mAd333u8dx0i6Eho4iufapFP79g6yfyHYA09IduQTUrNF5ADLIg
   b9lDYZh5NZS4SJHpRep55XlPF81jtJTCY4cR5z/ILy79nC+udrFPMP8U1
   g==;
X-CSE-ConnectionGUID: eef/TxIuS52xWYFpDSGtKA==
X-CSE-MsgGUID: pjZsHUaRSPqVCo8c+D8Mcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30711587"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="30711587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:39:38 -0800
X-CSE-ConnectionGUID: +f+3jf8BTServiMDcQct6A==
X-CSE-MsgGUID: 27gMstsTRKarewS1s77lng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="90205088"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:39:35 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	cujomalainey@chromium.org,
	daniel.baluta@nxp.com
Subject: [PATCH 0/2] ASoC: SOF: Correct sps->stream and cstream nullity management
Date: Thu,  7 Nov 2024 15:39:30 +0200
Message-ID: <20241107133932.23252-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The nullity of sps->cstream needs to be checked in sof_ipc_msg_data()
and not assume that it is not NULL.
The sps->stream must be cleared to NULL on close since this is used
as a check to see if we have active PCM stream.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: stream-ipc: Check for cstream nullity in sof_ipc_msg_data()
  ASoC: SOF: pcm: Clear the susbstream pointer to NULL on close

 sound/soc/sof/pcm.c        | 2 ++
 sound/soc/sof/stream-ipc.c | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.47.0

