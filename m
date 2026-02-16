Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7337292B2E;
	Mon, 16 Feb 2026 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771260098; cv=none; b=OIEZugy6DMsSH7hIAZXiUl1iPWnL2CYbKGc9Fuc5vAhBzuvRRARaPbxIYz+vgu3I2QY7rlHtfHXFPZWgQzSR+jf9M+mtde2x5B6ICF/HBY3AYrerbXEP0q5J5Ts89pkR00OhjSJYLzOBh2olJPRngP+llEMWSQJc1AUqPDPNMYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771260098; c=relaxed/simple;
	bh=pZDkaiOCapzGtvb/AGC+h3k+k4ojuwVCBQzfy5JVkwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0hKdCftj1UDer1AwAv2oJITc1MjGt6bSZylBhGIyJDJGHRNORJzakPphGFFlVSdQMXCVN2q63YP+YUKrJ3lQSyv6pDlXK4LE4YzyfLPBdqsUN/4vKyHGWmNMDGlwoN2Vz8NUS9WSs3PWOOXpShgGGaQV4TuSdoB1JCDxtrIyBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYeoIKEM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYeoIKEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771260097; x=1802796097;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pZDkaiOCapzGtvb/AGC+h3k+k4ojuwVCBQzfy5JVkwE=;
  b=EYeoIKEMkvNGUh/M88Fol7YALeKjaI4Dk9cR0Ux/f/cCjxvK3SPnee4b
   NUF6D3lkF35nwCaIsFSv2sDvZaLQPwF75Cllz1aZFQWf16rjFJyy6TyoC
   R3njRJJJ2zONcUXWLTULlOCfJIbLizzqCmSeOv0ZOXz2ExgY0o1F8d1ej
   ejw+QAn9z1n5Sq9kzUDIpSXi29CBEwD5aZy0zGTm5sj4lBie+asCxoe8Z
   C8CKxKmdpOl8cPb5RnN9+I3XJDQDIVcj6z5IQuw5WL2X2BINn1URTeC1h
   5aWqGscx/DYgQVcpeGwNmEHjXAUB0z0vlOC3Chd7cqW+LTCJP6y0rSp1X
   g==;
X-CSE-ConnectionGUID: f+ghlwRkSE+K8bTsl0KxOg==
X-CSE-MsgGUID: K7x1C8/JT429p9VO/zw+DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72052546"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72052546"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 08:41:36 -0800
X-CSE-ConnectionGUID: qDrD01sARvqOmjMfgviE5w==
X-CSE-MsgGUID: x062OOSoTjec92oBu96JZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="217802942"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.251]) ([10.245.246.251])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 08:41:32 -0800
Message-ID: <cc238c2b-1a76-4da1-86ae-8accf235f265@linux.intel.com>
Date: Mon, 16 Feb 2026 18:41:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: SOF: Fix IPC reliability and post-resume
 SoundWire init
To: Cole Leavitt <cole@unwrap.rs>, Bard Liao
 <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260214064054.19961-1-cole@unwrap.rs>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260214064054.19961-1-cole@unwrap.rs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Cole,

On 14/02/2026 08:40, Cole Leavitt wrote:
> Two fixes for SOF IPC4 reliability issues observed on Lenovo ThinkPad
> P16 Gen 3 (Arrow Lake-S, CS42L43 + CS35L56 over SoundWire):
> 
> 1. Replace the broken delayed_ipc_tx_msg mechanism with a bounded retry
>    loop. The old deferred dispatch silently drops messages during D0i3
>    transitions, causing 500ms+ hangs per IPC chunk.
> 
> 2. Add a platform ops callback (dai_link_hw_ready) so Intel HDA
>    platforms can wait for SoundWire slave initialization before ALH
>    copier setup. Without this, the DSP enters an unrecoverable wedged
>    state when userspace opens a PCM before slaves finish re-enumerating
>    after resume.
> 
> Tested on ThinkPad P16 Gen 3 with repeated suspend/resume cycles
> and concurrent audio playback.

This issue is a new one for us and we would like to understand what is
going on, can you create an issue at
https://github.com/thesofproject/linux/issues

and include the full kernel log with sof-dyndbg.conf in place like asked
in this comment:
https://github.com/thesofproject/linux/issues/5517#issuecomment-3233283263

with kernel (Most likely 6.19 based on the base-commit), sof-firmware
and alsa-info.sh output version as well?

In the second patch you are pointing to fw boot timeout issues, which
makes me wonder what is going on.
It is possible that the codec drivers prevent the DSP power off and on
next boot we obviously fail to receive the FW_READY since the DSP and
firmware is in booted state already.

thank you for the help!

> Cole Leavitt (2):
>   ASoC: SOF: Replace IPC TX busy deferral with bounded retry
>   ASoC: SOF: Add platform ops callback for DAI link hardware readiness
> 
>  sound/soc/sof/intel/cnl.c            | 17 ++---------
>  sound/soc/sof/intel/hda-common-ops.c |  1 +
>  sound/soc/sof/intel/hda-ipc.c        | 17 ++---------
>  sound/soc/sof/intel/hda.c            | 44 ++++++++++++++++++++++++++++
>  sound/soc/sof/intel/hda.h            | 14 ++++-----
>  sound/soc/sof/intel/mtl.c            | 17 ++---------
>  sound/soc/sof/ipc4-topology.c        |  8 +++++
>  sound/soc/sof/ipc4.c                 | 17 +++++++++--
>  sound/soc/sof/sof-priv.h             |  3 ++
>  9 files changed, 83 insertions(+), 55 deletions(-)
> 
> 
> base-commit: 2687c848e57820651b9f69d30c4710f4219f7dbf

-- 
Péter

