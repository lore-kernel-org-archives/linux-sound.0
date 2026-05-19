Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD3F481FA2;
	Tue, 19 May 2026 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192273; cv=none; b=pgsq3mVnOm+EG+R2QBr1NXjpKbf7mkLI3DcHMbMdhd/5MhAxR5Tlzw2GcFM9Se8/RnnUl0NLkgdtp8X72tJZy01Ko/OtmYJEI0pUQWJWAAdhXJhm1LF0iDkDnC7vPsSZlSV9N6oF4jLZezdQETBzYsgvm1zfNT8FhBhEQEc2JeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192273; c=relaxed/simple;
	bh=TaSRgb/sGjWgR1Luf1FYVU7mpj1M4W6Fsj/TXwhBr7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o360Wq0g+NI95wHoIWNFDG38YhzrGr9nLLMuEzKp53s/vcJOYnYfnjs/aWP1Jdz5dbWlzKtPnlYUVQwVw5uFfmfhk2OQCVWflWerYvNooG5MOM6yFhWKRmcHndWNdyGWjcOCmqauWr+r/02OxbL0OQGOcEH82geX11KnO8Fc7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJi5j0aa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJi5j0aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779192273; x=1810728273;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TaSRgb/sGjWgR1Luf1FYVU7mpj1M4W6Fsj/TXwhBr7w=;
  b=VJi5j0aaAcUDsiSHh082TKlzk+qVViYvw2rBUE065KTT7vG43t+3lXpu
   NBugmkS5dpqnVx1hmESQgQq+Qu7uVLWS4mymJt515NgG0tT0kmQd2dUwq
   3RzPsd3pAbUyN2vojehPrTlZPKdjXOmd/qFM1iFzdtwkNMjEFrQM/wYmm
   JcW8TizEOJ0miyUM7DeVHhK2RoOhhbpoSyjdajP2zZuRo7MgHi/zpkbHH
   21DIr54I2wLbwATq2dhr+riW1cmDaUvH7ZhTQqXz0nH5n7NOkpbpxmzE+
   6T4htUkh2Comba538B6SNqtjeGBamtQnIr2VxviqnAvAH6BzonDFvyWi1
   Q==;
X-CSE-ConnectionGUID: 3k6qi4CWSsa4U1hnzPvEWQ==
X-CSE-MsgGUID: zMp1o65aSQWL9Z771UMBWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91172913"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91172913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:04:32 -0700
X-CSE-ConnectionGUID: QfbMbINgT2a4lxlXEXw9Ag==
X-CSE-MsgGUID: HIMlsKDlSZKG3S7H4dTtbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237135945"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.163]) ([10.245.244.163])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:04:28 -0700
Message-ID: <fbd56200-c854-4e6f-a6aa-d5ab7585403a@linux.intel.com>
Date: Tue, 19 May 2026 15:04:38 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Use flexible allocation for control data
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260519004749.627581-1-rosenp@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260519004749.627581-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19/05/2026 03:47, Rosen Penev wrote:
> Allocate IPC3 and IPC4 channel control data with kzalloc_flex()
> for the trailing channel-value arrays instead of open-coding the
> struct_size() allocation.
> 
> The existing scontrol size field continues to record the payload size
> used by the control paths.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/soc/sof/ipc3-topology.c | 6 ++++--
>  sound/soc/sof/ipc4-topology.c | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
> index 8c37c0657315..9597f619fbe4 100644
> --- a/sound/soc/sof/ipc3-topology.c
> +++ b/sound/soc/sof/ipc3-topology.c
> @@ -1826,7 +1826,8 @@ static int sof_ipc3_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof
>  	/* init the volume get/put data */
>  	scontrol->size = struct_size(cdata, chanv, scontrol->num_channels);
>  
> -	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
> +	scontrol->ipc_control_data = kzalloc_flex(*cdata, chanv,
> +						  scontrol->num_channels);

I don't think this helps at all.
We need to calculate the size anyways, so it is better to use that, no
need to do double calculation.

>  	if (!scontrol->ipc_control_data)
>  		return -ENOMEM;
>  
> @@ -1857,7 +1858,8 @@ static int sof_ipc3_control_load_enum(struct snd_sof_dev *sdev, struct snd_sof_c
>  	/* init the enum get/put data */
>  	scontrol->size = struct_size(cdata, chanv, scontrol->num_channels);
>  
> -	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
> +	scontrol->ipc_control_data = kzalloc_flex(*cdata, chanv,
> +						  scontrol->num_channels);
>  	if (!scontrol->ipc_control_data)
>  		return -ENOMEM;
>  
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index 76812d8fb567..9fd04a7857f6 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -2863,7 +2863,8 @@ static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof
>  	scontrol->size = struct_size(control_data, chanv, scontrol->num_channels);
>  
>  	/* scontrol->ipc_control_data will be freed in sof_control_unload */
> -	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
> +	scontrol->ipc_control_data = kzalloc_flex(*control_data, chanv,
> +						  scontrol->num_channels);
>  	if (!scontrol->ipc_control_data)
>  		return -ENOMEM;
>  
> @@ -2905,7 +2906,8 @@ static int sof_ipc4_control_load_enum(struct snd_sof_dev *sdev, struct snd_sof_c
>  	scontrol->size = struct_size(control_data, chanv, scontrol->num_channels);
>  
>  	/* scontrol->ipc_control_data will be freed in sof_control_unload */
> -	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
> +	scontrol->ipc_control_data = kzalloc_flex(*control_data, chanv,
> +						  scontrol->num_channels);
>  	if (!scontrol->ipc_control_data)
>  		return -ENOMEM;
>  

-- 
Péter

