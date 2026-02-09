Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E830D34D912
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638564; cv=none; b=O1zAAXhCQfamk5MvYhuRmflpKj3xjH1VsR+QEdQvjHNCI29etVrJK1zVpuI5FaBAQ5mS60qNf+h98Y1pGVuFqEep1AnYm87qQsWCKiq8lVoxci+rHh18BxXnZuRq1qmmwQHX82eDb9eGTxkmXNGPogcTzlhAp4zS2tHWilh8KI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638564; c=relaxed/simple;
	bh=aPjh8LSQJB7KQo81lPa34ylAMFGr2Qt92nr08Azf92c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lbJddNXDa2XCbj9gd9RCQv9mzdKZfL7vQ1RXCWaxoaylDY0qpRdkNZeyz9NFy7U1JFmPp6elV1OfHeX+h3Pr9HWYj1rLnNZZNgeaPK7DGkWscjX0Ir1oLp+COEGbhs2uXsLyYsalEZdF77jlYV+qLOfwADX4calljk94fWp3cbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7y5iwNU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7y5iwNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770638564; x=1802174564;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aPjh8LSQJB7KQo81lPa34ylAMFGr2Qt92nr08Azf92c=;
  b=E7y5iwNUQo7N0QDbVJmlrhUztRr4GuQXldAcste5Mh0NwIoRDWv8azUA
   sIq3kHvkKN4GNzmPm/aTaJFFGYgvCfTZJbwVgyZcdqt01h5dsrzrW2mHl
   AnYvoiMTtgOX6vFbZnPDcF9pYsSl/r6UvxE3bL30mrQpSyEeMcVZHUxTS
   7lDoRI6yXjQzVsro4s4o0oLcKzcx1lGkpi73P7GmfU55ysiaXi7BrNovK
   HfXytx3UemNiP2hwXLTqKTKYJ9vN2W+UJCwWrb8IbJcovYF/ONWkdZzYP
   5qwvmMWiRWAKBNvDb+ipym1Gx+YUXTPady0k8bkPlrsFwPlD1LRsiXvSk
   Q==;
X-CSE-ConnectionGUID: 1J+S8QsPRgmJf+DeE9SPOw==
X-CSE-MsgGUID: 9AbFSPwzTuSQU29UODesDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71648647"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71648647"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 04:02:43 -0800
X-CSE-ConnectionGUID: GckGRykORmmAAEuxOuTQXw==
X-CSE-MsgGUID: QsLL3iNsSk+KyBlAuUGAvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210654889"
Received: from ettammin-desk.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.194])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 04:02:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	dan.carpenter@linaro.org
Subject: [PATCH] ASoC: SOF: ipc4-control: Set correct error code in refresh_bytes_control
Date: Mon,  9 Feb 2026 14:02:39 +0200
Message-ID: <20260209120239.6066-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return -EINVAL in case the scontrol contains more data than the amount of
space available for it to store in sof_ipc4_refresh_bytes_control().

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-sound/aYXvFr-LVHVJSvS7@stanley.mountain/
Fixes: 2a28b5240f2b ("ASoC: SOF: ipc4-control: Add support for generic bytes control")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 0500b690f9a3..596c3d77a34e 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -362,6 +362,7 @@ sof_ipc4_refresh_bytes_control(struct snd_sof_control *scontrol, bool lock)
 				"%s: no space for data in %s (%zu, %zu)\n",
 				__func__, scontrol->name, msg->data_size,
 				scontrol->max_size - sizeof(*data));
+			ret = -EINVAL;
 			goto out;
 		}
 
-- 
2.53.0

