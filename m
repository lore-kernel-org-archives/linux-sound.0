Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591E3CA4A8
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363024; cv=none; b=NunL+LwMM3pXqCE4PLFwEUdlrF3Xspae8vGU5zMtHWKALsjm4U3GVyotnxSPrr4rZZ3goNGTHJb/b3dEYX6Mw5j4/AGTmTWSix14HPZlebrQjKFrQzEafUSjOGBzz+jA+myx6v80smgDydPdy0T6wQC4m47kquODy8Iks+8dUZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363024; c=relaxed/simple;
	bh=w8T2nnODptD82j4rzyRFroS4ZSgLcUF608uaxtIQI/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNKNUJUL+F4hFMrPG7ASYIwWZOizUrmvgV/+iqEvBzJsZH1uQ4tEnt6kgGvRPxVMa8Sv8LVp+hLrXQpTZouTw1hSmaWZVU5qaSAjc4wLePPUwVyJjkYXeOsEz2Noa+9hA+vm3bzAwYqvlOvnlFB3m/H/H85T3QAm55hmPF8ZdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rl4x/q+7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rl4x/q+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363023; x=1822899023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w8T2nnODptD82j4rzyRFroS4ZSgLcUF608uaxtIQI/o=;
  b=Rl4x/q+706K9JiHZTV9Ypgm2iQ5F8qJpXhkGQKTqZeDRygLK1qd/qxia
   YQrhsO139+eIqkdiI1zZcGJiUl0FXFxE2s7zmBCKQJzPbVGaTgh1A1A3p
   q5UhnAaDPSVdYKJzYOckUYdvoiHLi53A+n8IcPWVT+tkpnzkbBtSAMR5y
   9njeWBTBTV1smisy8xAreyZUAAlciVhnD3ZDrtvDsn48AIXKX1puiv5Kb
   A/yeSMMbYN2bhRAC7abV6n8nKD/yUExKnVQ/rUcrbh55jR2KKxThmjyKB
   d11Zef90QAhPZ2+WizY1ZyM8MV805ad4jyXT6mVok1ISWKv5YwbKib4Mq
   A==;
X-CSE-ConnectionGUID: UDwe8X/CRFel6MHrk0U8dQ==
X-CSE-MsgGUID: 4GjAEPrcTQG2AxWF9KND8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113974"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:23 -0700
X-CSE-ConnectionGUID: boLod1m+RGObXcWUVkyVdw==
X-CSE-MsgGUID: JViFtqPzRZ2vaUyRqJmAyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670705"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v5 15/28] ASoC: SOF: intel: hda-stream: Clear the current position when releasing stream
Date: Wed,  7 Oct 2026 11:49:42 +0300
Message-ID: <20261007084955.1256-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

After the host DMA ID is released, reset the curr_pos to 0 for a clean
start for subsequent stream starts. This is not needed for PCM streams
but for compressed streams.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c95230487a1b..5097a497188d 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -317,6 +317,7 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
 		if (s->direction == direction && s->stream_tag == stream_tag) {
 			s->opened = false;
 			found = true;
+			s->curr_pos = 0;
 			if (pair)
 				link_stream = hext_stream;
 		} else if (!(hda_stream->flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
-- 
2.56.0

