Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093532032D
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740193; cv=none; b=Fnaagv/mdCvMfz1jmNg8F6hy3DstQ6hRsKb4mDrGg+mtd54hT2fN+stfKFeMBJo1kSV5WQN09kgZQcOL+PptQorlRoAh9CgxUyGOPs39baikoqJZggPHM6NLpJTTUP2OHMm1O59x9Y19Tr2dkmoAsNeK5HXqVgNc6k0JzC28Mvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740193; c=relaxed/simple;
	bh=XGbGjVFtiZtoTIh63m8GRVBgtmUdRtnGM33RrPeY0+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VT0PqiJXqjmex1fSX94fYBOU5t9GkVbK5vO8NMY/eECsUqqMwsolsNCsimwFmFREQtIAy2m4C66w0pnsR2LWY3ceQP0AnvizlDjphEkOxLb0A8sbFSSkTE/q7Zi3kgwF9o52UGIEmX08WMWg5EedoEmVkEfTzdNhfYpVwDN+lLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKCAe/7E; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKCAe/7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779740192; x=1811276192;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XGbGjVFtiZtoTIh63m8GRVBgtmUdRtnGM33RrPeY0+4=;
  b=NKCAe/7Ec44H/JqysBuJe5aloEIhQKUd4ByPWSllIJDz4O5S/31C1zi9
   Lot/eJ8/46vj/JXNS1vowtLplWyOd70xpI/m3RT3QRdWAHYe0mMF+qAMm
   zENqkhxbVuR5dYX1Dnne9fHLSm19q4NTFeSYAHIKrh0xcd9DAeDR3nOA/
   OcS5C71F+1Ojr5ZRJa9GgggfTtOCbQiO5SF7qQLekuD/jdAp7IbU4xaOF
   it7GLvvH5YiF1rEIO1z665SgmSExK8Fg5SxWeRVfmVHcS226+IqnW31T2
   b1GugQJpsyIL+GUsVHO5soemhxtKzwr2cNNl9ydKMFTN36GwYw+eyuWHm
   w==;
X-CSE-ConnectionGUID: NDQUJsQJSe+Z0EZ+rREJyQ==
X-CSE-MsgGUID: 0mjoeeHVRGCyXNIh+hKDfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80745432"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80745432"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 13:16:31 -0700
X-CSE-ConnectionGUID: IbnrndD/RBWQXdffU3dRAw==
X-CSE-MsgGUID: KaKp6ZOcTSGsyiAu8vlnlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="245981179"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 25 May 2026 13:16:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	jiada_wang@mentor.com,
	linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/3] ASoC: codecs: pcm3168a: Fix and updates for power management
Date: Mon, 25 May 2026 22:17:58 +0200
Message-Id: <20260525201801.1336936-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set of changes composed of one fix and two improvements.

The fix leads the series and addresses "unbalanced disables" coming from
the regulator core during S4 (hibernation) scenario.

The SLEEP_PM_OPS are unset for the driver.  Hibernation (S4) causes no
resume (skipped thanks to smart_suspend=true) yet still performs the
suspend sequence unconditionally, see device_complete() in
drivers/base/power/main.c.  In essence, we end up with double suspend
(double disable) and thus the warning.  Exemplary stack:

unbalanced disables for regulator-dummy
WARNING: drivers/regulator/core.c:3244 at _regulator_disable+0x161/0x270, CPU#6: kworker/u64:2/120
(...)
Workqueue: pm pm_runtime_work
RIP: 0010:_regulator_disable+0x161/0x270
(...)
Call Trace:
  <TASK>
  regulator_bulk_disable+0xe4/0x220
  ? __pfx_regulator_bulk_disable+0x10/0x10
  ? pick_next_task_fair+0x36f/0x11f0
  ? __pfx_regmap_unlock_mutex+0x10/0x10
  ? regmap_unlock_mutex+0xe/0x20
  pcm3168a_rt_suspend+0x57/0x90 [snd_soc_pcm3168a]
  ? __pfx_pcm3168a_rt_suspend+0x10/0x10 [snd_soc_pcm3168a]
  __rpm_callback+0x69/0x200
  ? __pfx_pcm3168a_rt_suspend+0x10/0x10 [snd_soc_pcm3168a]
  rpm_callback+0xbc/0xd0
  rpm_suspend+0x225/0x960
  ? __pfx_rpm_suspend+0x10/0x10
  ? __kasan_check_write+0x14/0x20
  ? _raw_spin_lock_irq+0x8d/0xe0
  ? __pfx__raw_spin_lock_irq+0x10/0x10
  ? pwq_dec_nr_in_flight+0x63/0x4f0
  pm_runtime_work+0xd0/0xf0


In regard to the improvements, both aim to drop redundant operations.
One targets pm_runtime_idle() - no need to fire it manually,
device-driver core will do that for us - while the second replaces
preprocessor directive with pm_runtime_status_suspended() check.
No !CONFIG_PM dependency equals better code coverege with default
kconfigs.


Cezary Rojewski (3):
  ASoC: codecs: pcm3168a: Prevent regulator double-disable in S4
  ASoC: codecs: pcm3168a: Drop redundant pm_runtime_idle()
  ASoC: codecs: pcm3168a: Drop CONFIG_PM-conditional preproc directive

 sound/soc/codecs/pcm3168a.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.34.1

