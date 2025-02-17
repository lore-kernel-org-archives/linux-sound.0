Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD147216E23
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786844; cv=none; b=Oj8DebRI5KjTvggpPkmU3fPC4C1FCM+1VllYwi82W9Msbs+F6EMW5XsSG8zzXTAvArru7b1+qrVwkxnAWQGaVAEvy6X0m3m+h0SnJINoVxjDcKREEV+CyhWlMgbMLxZlQDgPQVDFxbO7HaRw+2693uzRJyX0OjKaqj3hDq8RAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786844; c=relaxed/simple;
	bh=FV9cbmIx56h1/SRRM7S361jrEAUP1f4SMT4sOmnfVnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aVTMMQJLmcWoYa6u9wyZYeDgmpmr/H9/ZT55ACnNscr7c78pTUT/8ccDiQPwqNtkEYKJkzGjd9KMmEQYlWSAvRwCQieWk5AvAuDjJGlKRPi7DtBDXBO2mP7kktI0LpcC/TtNPo5rMqRKDqElNsDO2frX1FPOuwUg63Qc0jVbuVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGQcsQqe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGQcsQqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786842; x=1771322842;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FV9cbmIx56h1/SRRM7S361jrEAUP1f4SMT4sOmnfVnc=;
  b=hGQcsQqeP98hVmDBs3yrvgfnHcFr3/YKJPAItNyrpriQJs8IDdeVgl2S
   fU8tu7tBYlcsht3alh6C6yUghhxGfQNqKG7PhmndnGE/FZsq9gaafYSK+
   8P3IyLcAC2qubFz2zPcPwgM+Efu+APwIk4OZtsAEiEDCKtsUco2/rBkf6
   RweM9es75L3jA4nBNRu6UK3Z74U1hKDq7GIACSJfARQHBeO5BYxVv9DM9
   VS0DOXwV78eqGcAKT6LEzBIaLDbB1/WsZl8APF/C5vJoXTjB/oAbm7bhM
   ll4FTqEJ+SfvlJkbIz6jQAqQ3DGMnWfKF4WXrEefCXlqUX11GTdLxv4Gh
   g==;
X-CSE-ConnectionGUID: yIXfIoAEQ4C+i0/uluYD/g==
X-CSE-MsgGUID: UaNOWPYmTwOdm6dDMLMV6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818280"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818280"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:21 -0800
X-CSE-ConnectionGUID: PMzzgAQ/ToepGrgY+/ONBA==
X-CSE-MsgGUID: DtNtbwO1QE+dJ/DkiFMJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219045"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:20 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/10] ASoC: Intel: avs: Mute and multi-channel controls support
Date: Mon, 17 Feb 2025 11:21:05 +0100
Message-Id: <20250217102115.3539427-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Note: the patchset DOES provide functional changes to the ASoC
framework.

Current kcontrols loaded with ASoC topology allow for mono or stereo
configuration only. To expand this and provide support to up to 8
channels, first address the limitations found within the ASoC core and
then update the user (avs-driver) so that it can utilize these new
functionality. The 8 channels max stems from SND_SOC_TPLG_MAX_CHAN
constant which is part of UAPI - asoc.h.

For the ASoC side, two changes are made:

- drop the ambiguous usage of ops.info when determining the kcontrol
  type
- save the num_channels value which is already part of the ALSA-topology
  but is currently skipped by ASoC core when loading mixer controls

For the avs-driver side, merge PEAKVOL IPCs as there is basically no
difference between the handles and then do the same with the control
operations. The merge for the latter is done is two steps: first provide
new implementation which honors the multi-channel controls and then move
to it while dropping the now-duplicated code.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Add volume control for GAIN module
  ASoC: Intel: avs: Add support for mute for PEAKVOL and GAIN

Cezary Rojewski (8):
  ASoC: topology: Create kcontrols based on their type
  ASoC: topology: Save num_channels value for mixer controls
  ASoC: Intel: avs: Make PEAKVOL configurable from topology
  ASoC: Intel: avs: Update VOLUME and add MUTE IPCs
  ASoC: Intel: avs: New volume control operations
  ASoC: Intel: avs: Move to the new control operations
  ASoC: Intel: avs: Honor the invert flag for mixer controls
  ASoC: Intel: avs: Support multi-channel PEAKVOL instantiation

 include/sound/soc.h                   |   1 +
 include/uapi/sound/intel/avs/tokens.h |   4 +
 sound/soc/intel/avs/control.c         | 180 ++++++++++++++++++++------
 sound/soc/intel/avs/control.h         |  12 +-
 sound/soc/intel/avs/messages.c        | 111 +++++++++++++++-
 sound/soc/intel/avs/messages.h        |  24 +++-
 sound/soc/intel/avs/path.c            | 108 ++++++++++++++--
 sound/soc/intel/avs/path.h            |   5 +
 sound/soc/intel/avs/topology.c        |  47 ++++++-
 sound/soc/intel/avs/topology.h        |   5 +
 sound/soc/soc-topology.c              |  55 +++-----
 11 files changed, 440 insertions(+), 112 deletions(-)

-- 
2.25.1

