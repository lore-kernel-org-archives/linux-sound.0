Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D183B8BB2
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949293; cv=none; b=fLHBlN9bvFXPs/l8fQLHFCEN8hvakZ2qcpUHvwc5wyeZsnA3aj4yGB/bbbddc53VrfV94JrNUHRt904NQ00i2YijEdiQ6CFXciqMHMfy+N4xTQuq8iUDmxJFuBN1UO1WPbUfzHUlfwCusgZlTPgfOCST1DG3Zs8Qp/NlUuKWVNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949293; c=relaxed/simple;
	bh=ahtsNw3WwXq9S09RrOdIM8LRm8M8WtK8OI61BQa0h98=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=GA3i7Wj2vGqNwP3GMSpf3KKHyRWh3YKw+GR1xE18jbPZh9KOCBjPbqyvGHkH5L8+hwuGUD5pZ81YvTQoyGllx6TDAlRDc4L6Klq5EjfvVrgcMdIxaynlQnD0v2+X4I7WwXdGSoR1SzuSTzYxknKX/t8Eid9J+yMb2vuSQu9kitw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YZMNZf7i; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YZMNZf7i"
Message-ID: <76827f27-1a27-422f-8e83-5f5e5ae0f7ef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776949285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ICiiAeLpcVAT8mFv/b7TRxZMfV/M0NBEbhNn7PiCX8A=;
	b=YZMNZf7iXP+dBnHku1HsUr1s0iTzrauLCNVMncGw8u7oso0rl2QuH/3mxD6X9ofbSngZ8l
	awuiWvuElN+nEaflIeEQXAySCXd5o/gxhpPKz1q/cLwZj1Gbq3mrhSWIrSl0IuFqKUCbSg
	BjkwmLmkYanX/wmYx2mgaHHKKjQrhLs=
Date: Thu, 23 Apr 2026 15:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH] ASoC: rt722-sdca: add FU06 Playback Switch for speaker
 mute control
To: Aaron Ma <aaron.ma@canonical.com>, oder_chiou@realtek.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260423101338.1040131-1-aaron.ma@canonical.com>
Content-Language: en-US
In-Reply-To: <20260423101338.1040131-1-aaron.ma@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/23/26 12:13, Aaron Ma wrote:
> The rt722-sdca codec driver exposes FU06 Playback Volume but no
> corresponding mute switch. Without a user-facing ALSA switch, UCM
> cannot attach the speaker mute LED via snd_ctl_led, and PipeWire
> cannot drive hardware mute.
> 
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  sound/soc/codecs/rt722-sdca.c | 77 ++++++++++++++++++++++++++++-------
>  sound/soc/codecs/rt722-sdca.h |  4 ++
>  2 files changed, 67 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
> index 79b8b7e70a334..23d2f63d68ef3 100644
> --- a/sound/soc/codecs/rt722-sdca.c
> +++ b/sound/soc/codecs/rt722-sdca.c
> @@ -517,6 +517,61 @@ static int rt722_sdca_fu1e_capture_put(struct snd_kcontrol *kcontrol,
>  	return changed;
>  }
>  
> +static int rt722_sdca_set_fu06_playback_ctl(struct rt722_sdca_priv *rt722)
> +{
> +	int err;
> +	unsigned int ch_l, ch_r;
> +
> +	ch_l = (rt722->fu06_dapm_mute || rt722->fu06_mixer_l_mute) ? 0x01 : 0x00;
> +	ch_r = (rt722->fu06_dapm_mute || rt722->fu06_mixer_r_mute) ? 0x01 : 0x00;
> +
> +	err = regmap_write(rt722->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
> +			RT722_SDCA_CTL_FU_MUTE, CH_L), ch_l);
> +	if (err < 0)
> +		return err;
> +
> +	err = regmap_write(rt722->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
> +			RT722_SDCA_CTL_FU_MUTE, CH_R), ch_r);

IIRC you can mute all channels at once in a FU (Feature Unit) using Control Number 0.

If both channels need to be muted/unmuted it's better to do so in a single command.

