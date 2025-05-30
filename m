Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831486F099
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613231; cv=none; b=uh5LTv5ScSg4vNutW1TXrwGilnqJXGUiP6tWYcrxLX2L7XEaoRfXFHPREQSwTnReY8I+mtvcqfWfD3lcbQqIdViY4Yew3gmx9jj48C51Xt96zt+fuVFJd61hHfOz86csYpcHVW1gKTKF7c2o2+RyAIj9y2wNthx05hyU1TRGOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613231; c=relaxed/simple;
	bh=GMiH8KzdukebsQxBYxF3ZoStyhV1tf5ur2y8aNjSJGM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=L27QmT5RKhScUhmd0Y0O+q//1Xr2A8S1xkHvXlrQTtHhBg+16C4HJHH5VeVDSxzHdv4tMGMuJ3NbGnJpFUL16blzOQ28UOv4/8lJwnPCBr5vw2GHTMS5ikSKOEbIf4iJ+9+Py626l64aFaptsa2ydLXNh+PVIeV51P0oNSnYOSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6rf68EQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6rf68EQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613229; x=1780149229;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GMiH8KzdukebsQxBYxF3ZoStyhV1tf5ur2y8aNjSJGM=;
  b=N6rf68EQF9kiAZy/7LQFzfQS3gaqNSBC1gpHP+uMJlUpOpDt5EvKIeib
   paCkFMhgVn8mMgYUs39py3jtM6W7FFwcC4GlYebbxtezCj2Bo+mS/5uLg
   ovg5+4SfhsnyZhuelqo9YQVntDXGh6halGdwhdOUPbKCCNyhxni+bJ5xA
   qeKUO7ttdCAzkttClc/zXqoU/bJzoJ+FcIdLrv8JVLhVPp0SnkZgKMBJm
   Rmq1gLP6BC1HzCu/a23lokvlV03CCTJ84QRsbTPw5A4HxUAbtVynG87ws
   YO1iolNvqwjDfRmvhu9nfXLDzsiP262QY4rXwOvrBfXdWKsA+Tv0gH4o8
   Q==;
X-CSE-ConnectionGUID: 8urlCRj8SZeMD7SAmQIF6g==
X-CSE-MsgGUID: 9MMvgY/gQ+eLUVN+xFoB5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256162"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256162"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:53:48 -0700
X-CSE-ConnectionGUID: A67P0PPHSuCJ1qMl8ucqQw==
X-CSE-MsgGUID: iIrmgErJS0GHRh7+VlPUjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763286"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:53:47 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/9] ASoC: Intel: avs: Set of functional fixes
Date: Fri, 30 May 2025 16:10:16 +0200
Message-Id: <20250530141025.2942936-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Medium range of fixes all avs-driver related. The most important fixes
lead the way:

1. For ASoC-hda codec driver, existing RPM manipulation in
hda_codec_probe_complete()'s error path is superfluous and leads to RPM
usage count underflow if the probe exists early e.g.: build-controls
operation fails.

2. Resolve deadlock when DSP-recovery is a consequence of SET_D0IX IPC.
The procedure handling IPC timeouts and EXCEPTION_CAUGHT notification
shall cancel any D0IX work before proceeding with DSP recovery. If
SET_D0IX called from delayed_work is the failing IPC the procedure will
deadlock.

3. LINK format (PPLCxFMT) calculation is incorrect.
HDAudio transfer types utilize SDxFMT for front-end (HOST) and PPLCxFMT
for back-end (LINK) side when setting up the stream. BE's
substream->runtime duplicates FE runtime so switch to using BE's
hw_params to address incorrect format values on the LINK side when FE
and BE formats differ.


Below three patches address problems found by Coverity static analyzer:
  ASoC: Intel: avs: Fix possible null-ptr-deref when initing hw
  ASoC: Intel: avs: Verify kcalloc() status when setting constraints
  ASoC: Intel: avs: Verify content returned by parse_int_array()

While unlikely in runtime, it's good to keep code resilient. The last
few patches are readability/cohesiveness improvements.


Amadeusz Sławiński (1):
  ASoC: Intel: avs: Fix paths in MODULE_FIRMWARE hints

Cezary Rojewski (8):
  ASoC: codecs: hda: Fix RPM usage count underflow
  ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
  ASoC: Intel: avs: Fix PPLCxFMT calculation
  ASoC: Intel: avs: Fix possible null-ptr-deref when initing hw
  ASoC: Intel: avs: Verify kcalloc() status when setting constraints
  ASoC: Intel: avs: Verify content returned by parse_int_array()
  ASoC: Intel: avs: Simplify verification of parse_int_array() result
  ASoC: Intel: avs: Include missing string.h

 sound/soc/codecs/hda.c                |  4 ++--
 sound/soc/intel/avs/board_selection.c |  2 +-
 sound/soc/intel/avs/core.c            | 20 ++++++++++----------
 sound/soc/intel/avs/debugfs.c         | 12 ++++++++----
 sound/soc/intel/avs/ipc.c             |  4 +++-
 sound/soc/intel/avs/loader.c          |  1 +
 sound/soc/intel/avs/path.c            |  2 ++
 sound/soc/intel/avs/pcm.c             | 13 ++++++-------
 8 files changed, 33 insertions(+), 25 deletions(-)

-- 
2.25.1

