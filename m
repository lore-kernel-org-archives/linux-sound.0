Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACB64A23
	for <linux-sound@vger.kernel.org>; Thu,  1 Jan 2026 03:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767238449; cv=none; b=B8mTJPRXzhFlaB4ozUjwkbyIfUB3+o/rHOiU4wNx/qVq0zQ36nR0ufqfvk1Wv8zlIlyw21KqUs9DdtHJct35/LrISEu3zEAtUwyY8+EN/VoMRJfFtcAJqfpxnGCXlWkyn/oy7+l01QMbnbxIAjjBlfqsA/6HV+ngwu1i1Tt35nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767238449; c=relaxed/simple;
	bh=xBz7ZJiU8jyQG2ac7XN6Phhv4CMfX8jeIZ17EmezRHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoOvrHX8KJ3EoYoIAGG3o864Vi23cpj8XQWVuETT9Ld0envZp5QvaFxycyvyGK+alGWf8Pd89P9IWuE44NFgxF8mAraUI2iZDJrrClMUfQOM/64sKdD+2UiWG9jjOuk4ohTtRzzgJq+WX/0QRui6i6wPBNf4b/+HC8CllBQS/d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erG/M49b; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erG/M49b"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2d32b9777so1662976885a.2
        for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 19:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767238445; x=1767843245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hDzS8lF/ihFnEf+YS8BsD45TGWc1V+jxA3EyRuuNvk0=;
        b=erG/M49bzClC5qygmuMkJCf8GWD5A8DjsBP7Hcy3TDUh09u0ca2PFeBSsB6Wfr6dXp
         tI6XdzIXVZIHaK1/pV7wDh8/IkWRbkmUmreK7dS8n/SNhzAiT10Z0/26mgL0x47hmO2y
         d+32j3O95QujyIvsmp7Gsuftai1qThdq8k0BWt9ZBugtbw9vEKrkhYUv+3zfRZ5cj75F
         OPApX3/gwlJ3VmAv24qo/OVI2Ou3e955w+YEyEMu2t0IQbDouzM99l9EOZ0aflCDjInv
         hTv/5/L2h8kL7RDUv+AuKneaHo8ky2+nI4Pf0gonmerYbRACQsKH+aBSKTIEatrVvHS0
         eyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767238445; x=1767843245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDzS8lF/ihFnEf+YS8BsD45TGWc1V+jxA3EyRuuNvk0=;
        b=AAMCGftpLm6+BD8+Bill+FNI0FT3jLKpNtUoO0JglFNiJnpg+O3sjf6EjVRFOJpo7H
         0lGkLwLKJMCK8XsMVT229KpOtyiACVc6xcA4qUVtrj4dTAQGl61tmSExIYVjEA+C3I2R
         wRF3NtJp03HHZe8FSuZMWLB5YIQlOk6B5ABg2mNx5YNQoTuhKZ3phBEfoef1Aep1TxGs
         RM59FaV0gkqhQgUJwJjkthpZbu+2b5u8LnbYVvBZVbA7EckEALSjv661vvo3LIPz1Y3U
         GCUHNvDTbI7fVb3jPBUDDuUFY3fhHC6rjQ8ZXAWXOPJTR9BlXVTdlcMeHZTxxsfQQTGg
         uk+w==
X-Forwarded-Encrypted: i=1; AJvYcCXXoXN9qTNODYUbV5hz96t2Ij/ytb+6qyqMj7pekdlM34LQwqubT6BMNjsC3s+uh1icfZvbtfmxffakuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzALLkyecIuii+m5Fq4QkV7H4mNu75gV1t/h3Q5qhycB0iyHq4b
	6P5YS3n6g1Qx3tbUzBab3TUl1EhAOxaOpCjMaq6UKF3Lgtm7uHj5TezX
X-Gm-Gg: AY/fxX6FTIK57UWl/k6NRoIqIJMhMtLxRmZww0RHmCwEcVTXQyJ/tG9eUm5GNSCvyxG
	PL28rCdG18lscGn2y7//8olJPa3JUG94b8D4Fyx4NDirzCR3+v/g5MNNm0ukH33suipGGE7aBHX
	19DGvRzMJ9INhBNVRwBQ4xmD58By1lRYQjFD1RvfE0YuS51Q/9MCJkE679TrnuAf3ncttN/vUY+
	fwkTo7Sn6zrdlY1HjX1acc6T1KKJW15eXPl61/CEZcRXAE4jMgRMu6T82xtBrIHrnpG+ytd9LeZ
	33hYxHYG4SclRAuCD1eHBI+grtcnhlqp2DHE1J/V6pbYe3AsR50d7ONBVPksOGPLBhYUgww1Lvl
	1w+f86JvzUIaBtzspzLqfq8UulN4rgyX3ksatFNskIozrdh8ooejpVR9fOiBWOlFrvQW5wcVvsg
	w3onZGu/D6MQbuOg==
X-Google-Smtp-Source: AGHT+IG+1Sn4yUdqbJL36zzyhITYZUBTgKIKKV6qZ+NoS42s5aL+z2Bht9ZuCGPwJ6UIAqYINyivJQ==
X-Received: by 2002:a05:620a:1904:b0:8ba:419f:c79e with SMTP id af79cd13be357-8c08fa9c407mr5689949285a.55.1767238444932;
        Wed, 31 Dec 2025 19:34:04 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783657sm3336391285a.1.2025.12.31.19.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:34:03 -0800 (PST)
Date: Wed, 31 Dec 2025 22:34:23 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, yung-chuan.liao@linux.intel.com,
	cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, navada@ti.com, shenghao-ding@ti.com,
	v-hampiholi@ti.com, baojun.xu@ti.com
Subject: Re: [PATCH v5 1/5] ASoC: ops: improve snd_soc_get_volsw
Message-ID: <aVXrPzG0hp47hA0Y@rdacayan>
References: <20250912083624.804-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912083624.804-1-niranjan.hy@ti.com>

On Fri, Sep 12, 2025 at 02:06:20PM +0530, Niranjan H Y wrote:
> * add error handling in case register read fails
> * clamp the values if the register value read is
>   out of range
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> --
> v5:
>  - remove clamp parameter
>  - move the boundary check after sign-bit extension
> ---
>  sound/soc/soc-ops.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index a629e0eac..03f74c32d 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -118,6 +118,7 @@ static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_v
>  	if (mc->sign_bit)
>  		val = sign_extend32(val, mc->sign_bit);
>  
> +	val = clamp(val, mc->min, mc->max);

This code path is shared with SX controls, when the maximum would be
mc->min + mc->max. The max parameter to the function can be used to get
a more sensible maximum (otherwise there could be cases where min > max):

	mc->min + max

Also, the Digital PCM Volume in CS35L36 has some trouble with this. It
maps -102dB to 0x4D0 and -0.125dB to 0x7FF (mask 0x7FF). At +0dB,
it's supposed to wrap around to 0x000, then go up to +12dB at 0x060.
This clamping reads +0dB and above (0x000 to 0x060) as -102dB, since it
doesn't account for signed values.
