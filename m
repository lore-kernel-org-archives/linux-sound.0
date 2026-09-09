Received: from mta1.migadu.com (out-42.mta1.migadu.com [95.215.58.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5255678CA
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963794; cv=none; b=FKftpfrfzNDCEX+dwj5xZAzlK5vIK1EWxyAyS49HxxkkHileJ3KhWAd+aSXl/jPNv4iTY4lVFSRLCwykUEejFIvy/z1XitKf5bzcS7a2/UNjfOe8hdaAhMGlPZlmIwbut+uKsOxoIK4fyauoBV4b3vrJm0zs1apIBJVhvnkq/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963794; c=relaxed/simple;
	bh=5qNtStmj+3AH+WNKTPyRGkViqrNlbQpBm4AblxeoOtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkTq8H/Rwl17QNC+9zOz/VAkFamD9Hy+Ysi7J3cbgHtn7CutBdXJ+33SjJvqI44XBTrf/wwxNPv9zOY/OGx5ttmhbUeKByPVMxhfCiqPakbyJBL40h3+Tr/H+HISR3pjr/Kl1w1+qOB0/rY+OfUIi2ETHBcMZjqQR/FxS/Xojp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vkdWHlzF; arc=none smtp.client-ip=95.215.58.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vkdWHlzF"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5qNtStmj+3AH+WNKTPyRGkViqrNlbQpBm4AblxeoOtU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963790; v=1; x=1789568590;
 b=vkdWHlzFDfEMvyNZqO5uAwep6tiYz22zZvy4DzQGBQabVAfGxMm9y84OPa623JHb6CLuEoXc
 sCfdu0Ov9mfA10TEXRD3DYwM8duf7sVP4YaK9ZNGpRbNcm6VHjL2/0xsaIRR4/m9679vTiZkxpY
 5CBdFVbu+NiFNIcctrlr1TbM=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 98f759705131f4f6;
	Wed, 09 Sep 2026 14:23:09 +0000
X-Mizu-Trace-ID: 98f759705131f4f6
X-Migadu-Flow: FLOW_OUT
Message-ID: <0bb3caad-5734-4524-8a9b-75b3c5e058dc@linux.dev>
Date: Wed, 9 Sep 2026 15:21:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/24] ASoC: SOF: ipc4-topology: Set FAST_MODE for host
 copier in compr mode
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-20-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-20-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> FAST_MODE allows the host DMA to work in opportunistic, free running mode,
> which matches with the bitstream nature of compressed devices.

Does it?

My memory of the 'opportunistic' behavior was that the DMA would try to
use every possible window to send to/from the DSP, so that the bus would
be idle for longer periods of time overall.

That would make sense as well for PCM, no?

Maybe this is the right thing to do for compressed data, I just wonder
why it is NOT the right thing to do for PCM...

> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/ipc4-topology.c | 3 +++
>  sound/soc/sof/ipc4-topology.h | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index 42cf444e847e..566913025cc7 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -744,6 +744,9 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
>  			sps->dsp_max_burst_size_in_ms = 1;
>  	}
>  
> +	if (spcm->pcm.compress)
> +		ipc4_copier->data.copier_feature_mask |= BIT(SOF_IPC4_COPIER_FAST_MODE);
> +
>  skip_gtw_cfg:
>  	ipc4_copier->gtw_attr = kzalloc_obj(*ipc4_copier->gtw_attr);
>  	if (!ipc4_copier->gtw_attr) {
> diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
> index 5e78f3de092e..c2949ff979a5 100644
> --- a/sound/soc/sof/ipc4-topology.h
> +++ b/sound/soc/sof/ipc4-topology.h
> @@ -222,6 +222,11 @@ struct sof_copier_gateway_cfg {
>  	uint32_t config_data[];
>  };
>  
> +/* bit definition in copier_feature_mask */
> +enum sof_ipc4_copier_feature {
> +	SOF_IPC4_COPIER_FAST_MODE = 0, /* free running mode of host copier */
> +};
> +
>  /**
>   * struct sof_ipc4_copier_data - IPC data for copier
>   * @base_config: Base configuration including input audio format

