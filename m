Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E292161310
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716839105; cv=none; b=mVfDg1seP15YMkYI7WlnoGVWEjYiRktPY6UmE/wnFGA41mmmlbj/Q3lUauHHBNxe1Btmkp5v3dOV3MYXZWNGH2pwEpJ7b0qN+mbUmxoZ6Cp17JmwUTKkISR1N2HpzmduvDxcGdPsq+Nc2dfHHj40pnK/feDYTetUVsLmBFidxu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716839105; c=relaxed/simple;
	bh=g6ehXmb+MxBrSwhLcG3A4IbL2l2zT+9EQAgfCA1Rtac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cm7IaI+9SZwVo1ZewhB6pfHzx6lMD3cilpSLAdvjel0pKX55leoj4oODiQtYi0n1L87VaIzGvBiFL4i1lwjQ6y4GHV9dzk8FCfhzfpERlTJwMyJ1BsfH9wIdCeJDztwAv7Jdy8mHUBUWwmQ+akaOQyHlMEEnzkI7FBIU0pdCyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RL6wKpVw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RL6wKpVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839104; x=1748375104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g6ehXmb+MxBrSwhLcG3A4IbL2l2zT+9EQAgfCA1Rtac=;
  b=RL6wKpVwp5eC8betW8gYfODWCHDPuTYQTBynY8+3pk9g3XbKCo/oMzsg
   Wv4jpoG11V/MQNFyqwqHbm6AswaYrEs2lRkUR8/SaOhLOKH3VjDqf6k0t
   GksmP6zabrSKQIHl6ywTC8+zHottmpWsavBKMhIPjT8KUxn/U169UUpod
   IeIh/i7nbSxzX4XeCafqRqsU+IPVPwMLbl8+d8b1yDf1BWmK7gesPchJO
   yKPTXMh8TTbtEDkOHsxfDC+wW+faLLGzM5xsAZeG2hWzcsjKaVYGvXkk/
   QKFcMUBdNODQGAPfCws+FQ/l/meR3hSdUX5nNnZcrzTUtFr2WM5dHbW+K
   g==;
X-CSE-ConnectionGUID: mfDnOFuvRam1vinuyb7hOQ==
X-CSE-MsgGUID: iBS0wT80QyGDd+R8hUZRzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679480"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="30679480"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:45:03 -0700
X-CSE-ConnectionGUID: n/n1pM2ARvGlWwbW3vYxYA==
X-CSE-MsgGUID: QyjO9/0+T6WP68UcP/pZFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39280542"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:45:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
Date: Mon, 27 May 2024 14:44:11 -0500
Message-ID: <20240527194414.166156-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This file is part of the snd-sof module, there's no reason to re-add the
MODULE_LICENSE here.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/stream-ipc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index eb71303aa24c..794c7bbccbaf 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -125,5 +125,3 @@ int sof_stream_pcm_close(struct snd_sof_dev *sdev,
 	return 0;
 }
 EXPORT_SYMBOL(sof_stream_pcm_close);
-
-MODULE_LICENSE("Dual BSD/GPL");
-- 
2.43.0

