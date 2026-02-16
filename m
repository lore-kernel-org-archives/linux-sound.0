Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12392989B7;
	Mon, 16 Feb 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239133; cv=none; b=ZYSb9iD5oHpXKXdBF76/ftrUnm54qfpL/YT1bFR+oAgRv4MY27Q5q7EI1m4O+UBAkbYLvb+c4yLiu5AP5NnuJ8ODMUED9CTgiTk6mpzOcfqCOg9yN2/sZYP6MXy1WLTcnGTmYhBCWunaR9ZUglQLNLR3RhVIMn19PwPXGlgMMFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239133; c=relaxed/simple;
	bh=l6WIyFAl88eYmeH8xB/81QGUqBkfU1WTL9XVmBkEZaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDDG6y/y/YxNIWohxiJYYpYC4rdS03hFGHLJz+vMV1XNNwqzHSDSh2R6IYvLIJksrUNBJATfrJKqCYzaoXCVnksCSMvNpiKoOoXpjTEFpsIDSVDaPQf5yotC4htby81Uc8EYP4C67T6mmUzO7M8pfUNr/9XkNSUAPi0IsQMbUHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDkujrvF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDkujrvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771239132; x=1802775132;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l6WIyFAl88eYmeH8xB/81QGUqBkfU1WTL9XVmBkEZaA=;
  b=CDkujrvFz9fsgcBHhzExr9hwa46SugCu2V+GCsOwcX6mIU3yh4Op4qL3
   +tor+ObKM9+Ej945TRooryluaAf4UBuu4xUWeRVtuX26WIraT6bjdXO1m
   ewiBJFinTpVL8ni9h11ACgfTwL3O39JWVe1qxkYd/kgbqu42G/OreOgPA
   VjOnjZ3UBzlOaEEqojErok12AL2r0cy0Gn27cimZk1+O55WIXdsWB13KU
   /nK9T+4DMzG0Y97kwladXg1ZOK/IytsP3BZKesxAYnm41Vu7FXN+5T94c
   kccWNHTHV4pcxeDbUC2NglHA2/d9ysVRasbT8NpA+PDr6vH2opgJsLcHX
   Q==;
X-CSE-ConnectionGUID: ERlWTFSRQcGAvBbo6RMnWg==
X-CSE-MsgGUID: D+9jDMszSKGk6WfgDZOARg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72217005"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72217005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 02:52:11 -0800
X-CSE-ConnectionGUID: 1/IRFxPrSEeFvMfMn9noZw==
X-CSE-MsgGUID: 82ZW6RK6QlODdOm93KVCkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="251236115"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.251]) ([10.245.246.251])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 02:52:07 -0800
Message-ID: <4c38fd83-485e-4423-a394-ee7dcf0bc159@linux.intel.com>
Date: Mon, 16 Feb 2026 12:52:11 +0200
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

Thank you for the patch, I have sent them to our CI for testing:
https://github.com/thesofproject/linux/pull/5671

With a brief look the first patch is really nice, better than the
admitably handicapped delayed message workaround.

The second patch is a bit more of a layering violation at first glance,
I'm not sure if I would like code dealing with soundwire nuances in SOF
code itself.
This would need additional thoughts.

> 
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

