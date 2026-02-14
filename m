Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558872FF148;
	Sat, 14 Feb 2026 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771051395; cv=none; b=JxTfXTtVaDbRNPE/FFyogqCw7kvszYZBrVIlSvXFontPYxV7EXCkuqemAJG0unjkAZfZkL7k2Q4/1EMz0+K98o6mGEiq3T+Fey1YM497xV9UOw/JkvYFS3m23yD1lK0jEPqnllV3VuQ3jEijsLa7Ba6AQIIv5i9yD4V9HsEmaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771051395; c=relaxed/simple;
	bh=jbGZRvS/YveVOKOBX+xrvzIyR+axjmOyxHQhuuUQHY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EtC+J0/NBccSL1BGiAcCBdJzqB8mohM11o+vJ8qdbvUyMxyyS9WFUJHjtWhPwUwn//Znu0leI9vfyN+MBn3pVieWjEqTC6keTIUwCMAUKk6vR/S9G8lMwPSR/fKtnb7GOsro0YSezCvbkYco6qhogGEfTeOhWikTFnJA+YFan+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH 0/2] ASoC: SOF: Fix IPC reliability and post-resume SoundWire init
Date: Fri, 13 Feb 2026 23:40:52 -0700
Message-ID: <20260214064054.19961-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for SOF IPC4 reliability issues observed on Lenovo ThinkPad
P16 Gen 3 (Arrow Lake-S, CS42L43 + CS35L56 over SoundWire):

1. Replace the broken delayed_ipc_tx_msg mechanism with a bounded retry
   loop. The old deferred dispatch silently drops messages during D0i3
   transitions, causing 500ms+ hangs per IPC chunk.

2. Add a platform ops callback (dai_link_hw_ready) so Intel HDA
   platforms can wait for SoundWire slave initialization before ALH
   copier setup. Without this, the DSP enters an unrecoverable wedged
   state when userspace opens a PCM before slaves finish re-enumerating
   after resume.

Tested on ThinkPad P16 Gen 3 with repeated suspend/resume cycles
and concurrent audio playback.

Cole Leavitt (2):
  ASoC: SOF: Replace IPC TX busy deferral with bounded retry
  ASoC: SOF: Add platform ops callback for DAI link hardware readiness

 sound/soc/sof/intel/cnl.c            | 17 ++---------
 sound/soc/sof/intel/hda-common-ops.c |  1 +
 sound/soc/sof/intel/hda-ipc.c        | 17 ++---------
 sound/soc/sof/intel/hda.c            | 44 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h            | 14 ++++-----
 sound/soc/sof/intel/mtl.c            | 17 ++---------
 sound/soc/sof/ipc4-topology.c        |  8 +++++
 sound/soc/sof/ipc4.c                 | 17 +++++++++--
 sound/soc/sof/sof-priv.h             |  3 ++
 9 files changed, 83 insertions(+), 55 deletions(-)


base-commit: 2687c848e57820651b9f69d30c4710f4219f7dbf
-- 
2.52.0

