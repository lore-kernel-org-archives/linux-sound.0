Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D311CBE
	for <linux-sound@vger.kernel.org>; Fri, 15 Dec 2023 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnCwEBA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702628243; x=1734164243;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d/UFN7/8AalQK0n9GB2UuQqy3A7AniJdphdUSY7SGrw=;
  b=TnCwEBA1BwMxR7OWqMGUWbHJWb6Jh01hj4xBzzf2QuGa+JP4CKbvU5x9
   f0tTf0bxYV5B67yv+ta5DGdBot2MDyv0FhpZ7oFecNE0aG4BTVemNftsI
   27+ltypA62JYUCCrPSQQjsRY+oQ4+5Xjn5BG8RrklmoLPsa2HldWNH9Be
   jATXLi5tERFD3w8IrRJs0E9nfgyAYU6TEIedz1SbcrUv5bhFA9RgQYIdn
   SMtzz2YhA9Owj5IB5vJH9+LSokLyYpy13PW+4eziTW0iK62Kp2wIX/cjz
   Pd6gLDXuE0B2+7K31Pd5+Kyhl4wOeBg25ZopCuIgzYkKdpYTvFVrgEyYf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2414121"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="2414121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 00:17:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="16206810"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 00:17:21 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/3] ASoC: SOF: query FW config to reload library
Date: Fri, 15 Dec 2023 16:30:59 +0800
Message-Id: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We should query FW config if context save is supported, and no need
to reload FW if hda->booted_from_imr and ipc4_data->fw_context_save
are true.

Rander Wang (3):
  ASoC: SOF: IPC4: synchronize fw_config_params with fw definitions
  ASoC: SOF: IPC4: query fw_context_save feature from fw
  ASoC: SOF: Intel: check fw_context_save for library reload

 include/sound/sof/ipc4/header.h  | 6 ++++++
 sound/soc/sof/intel/hda-loader.c | 5 +++--
 sound/soc/sof/intel/lnl.c        | 2 ++
 sound/soc/sof/intel/mtl.c        | 2 ++
 sound/soc/sof/intel/tgl.c        | 2 ++
 sound/soc/sof/ipc4-loader.c      | 3 +++
 sound/soc/sof/ipc4-priv.h        | 1 +
 7 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.25.1

