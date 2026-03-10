Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC223B27ED;
	Tue, 10 Mar 2026 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144775; cv=none; b=HZG1o48kCZY/o3kpanEblPD4UYb6QN+FhCG651Tew32ljC1gDDJ2QDIjKAs3rXC3/U91wZr5xXpwgls+hk47IwA1uyFjZFnlJiqYKQ09Wj1MY+IIANJ4O7dDo0sW3oje3jb9K1h+mHm7YXYRcx3lCFmDReRDGc3TwdWG5rH7UgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144775; c=relaxed/simple;
	bh=6ByHyO2hJadY9pwNelbPCf0NhsiuZsK+9ToEgM8ZunQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shJi2dPBepzEp3cz+gVbAN9sPMgJh2Qr97koiFFkoh9B0sOU9Wry1DdFYvLcu52URFZXSSAc5n5GqO861vpj33glenJuLF1j+hqxUWbxzcu3T/YkCKqBPEuz63GAHgbqr28Bj6qOt0KGHXr7GCEveXs/ru7A2Iv7hXj1GTFx/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvm5c4ri; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvm5c4ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773144773; x=1804680773;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6ByHyO2hJadY9pwNelbPCf0NhsiuZsK+9ToEgM8ZunQ=;
  b=hvm5c4riXy5JkQSrQq5tzq9N/ZRRUX9pNyP9lcW4BemfsBJh3+oWxxei
   Cd3eWfiKNrJfD8v2YnjFRwcOiQbcTHnMbTPNiWHAIZbqCmj+vI0o4a3I2
   xkJuJ+PmCbWpixb7ehiMa/RUhg7mfURM18zlZFqB8E3S25NcRB3QYy506
   HNXB65HPn4tAzwpeOlzhlIqEVZ/5sIe0FL5LFAewbWNQzvbicdjDIn7pZ
   BDTIBM8j3Gf9Ne5SOXMzLK0vHcutmmcvfe2cVsqBB5Vgpl/FZEX35w7Cn
   e+EVsqHlabkabY60o55Gf4YZuKbDDM1voU1PY7IAC+hqt4846wxsrNV+r
   Q==;
X-CSE-ConnectionGUID: t+NHmNMPRJK/ni63lwwVuA==
X-CSE-MsgGUID: DgIkjoxCSiOfBgXhG5kFnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91761314"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="91761314"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:12:51 -0700
X-CSE-ConnectionGUID: a0/zI6/RSgiBLj47QgqdCA==
X-CSE-MsgGUID: UYXCpO4RTdG1HeO29mRGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="224264540"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.5]) ([10.245.244.5])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:12:48 -0700
Message-ID: <0626d36d-75b9-4a37-9483-56a25b6ece84@linux.intel.com>
Date: Tue, 10 Mar 2026 14:13:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: sof-audio: pcm_id is __le32
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-sound@vger.kernel.org,
 broonie@kernel.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 sound-open-firmware@alsa-project.org
Cc: linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
 kai.vehmanen@linux.intel.com
References: <20260310114025.148639-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260310114025.148639-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/03/2026 13:40, Ben Dooks wrote:
> The pcm_id value is __le32 so convert it before passing to the dev_dbg
> function to be printed. Picked up by sparse prototype for variadic and printf
> function checking.
> 
> Fixes a large number of sparse warnings, such as:
> 
> sound/soc/sof/pcm.c:84:25: warning: incorrect type in argument 4 (different base types)
> sound/soc/sof/pcm.c:84:25:    expected unsigned int
> sound/soc/sof/pcm.c:84:25:    got restricted __le32 [usertype] pcm_id

I do wonder how this could worked over the years :o
Can you update the patch to fix the other instances as well?
sound/soc/sof/compress.c
sound/soc/sof/ipc4-topology.c

Thank you, with that please add my
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> v2: fix missing __le32 conversions
> ---
>  sound/soc/sof/pcm.c       |  4 ++--
>  sound/soc/sof/sof-audio.h | 11 +++++++----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 5b598d0940eb..16c194b4851b 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -361,7 +361,7 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
>  	ret = sof_widget_list_setup(sdev, spcm, params, platform_params, dir);
>  	if (ret < 0) {
>  		dev_err(sdev->dev, "failed widget list set up for pcm %d dir %d\n",
> -			spcm->pcm.pcm_id, dir);
> +			le32_to_cpu(spcm->pcm.pcm_id), dir);
>  		spcm->stream[dir].list = NULL;
>  		snd_soc_dapm_dai_free_widgets(&list);
>  		return ret;
> @@ -652,7 +652,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
>  	}
>  
>  	dev_dbg(spcm->scomp->dev, "pcm%u (%s): Entry: pcm_construct\n",
> -		spcm->pcm.pcm_id, spcm->pcm.pcm_name);
> +		le32_to_cpu(spcm->pcm.pcm_id), spcm->pcm.pcm_name);
>  
>  	/* do we need to pre-allocate playback audio buffer pages */
>  	if (!spcm->pcm.playback)
> diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
> index 36082e764bf9..cf6499464a64 100644
> --- a/sound/soc/sof/sof-audio.h
> +++ b/sound/soc/sof/sof-audio.h
> @@ -641,17 +641,20 @@ void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
>   */
>  #define spcm_dbg(__spcm, __dir, __fmt, ...)					\
>  	dev_dbg((__spcm)->scomp->dev, "pcm%u (%s), dir %d: " __fmt,		\
> -		(__spcm)->pcm.pcm_id, (__spcm)->pcm.pcm_name, __dir,		\
> +		le32_to_cpu((__spcm)->pcm.pcm_id),				\
> +		(__spcm)->pcm.pcm_name, __dir,					\
>  		##__VA_ARGS__)
>  
>  #define spcm_dbg_ratelimited(__spcm, __dir, __fmt, ...)				\
>  	dev_dbg_ratelimited((__spcm)->scomp->dev, "pcm%u (%s), dir %d: " __fmt,	\
> -		(__spcm)->pcm.pcm_id, (__spcm)->pcm.pcm_name, __dir,		\
> -		##__VA_ARGS__)
> +			    le32_to_cpu((__spcm)->pcm.pcm_id),			\
> +			    (__spcm)->pcm.pcm_name, __dir,			\
> +			    ##__VA_ARGS__)
>  
>  #define spcm_err(__spcm, __dir, __fmt, ...)					\
>  	dev_err((__spcm)->scomp->dev, "%s: pcm%u (%s), dir %d: " __fmt,		\
> -		__func__, (__spcm)->pcm.pcm_id, (__spcm)->pcm.pcm_name, __dir,	\
> +		__func__, le32_to_cpu((__spcm)->pcm.pcm_id)			\
> +		, (__spcm)->pcm.pcm_name, __dir,			\
>  		##__VA_ARGS__)
>  
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)

-- 
Péter

