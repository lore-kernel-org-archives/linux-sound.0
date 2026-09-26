Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EAF2D249B
	for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428786; cv=none; b=UzPUiCiWcNI1icsyZq/AB4VLGwSjRRjEuQ9OIq8XQGeGfqiOzLXUvQ3oLh7yEgEKJq+yPRu/YwOMvs9usdsjQllznfcCWpczRsLlCypnFILKMLeXkGpFOgi84z8w6DVGz1KcpJg9nNRUGA1AaoYGd2azqaufovhlzISlultV8N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428786; c=relaxed/simple;
	bh=RjoEqXLjxq93HwjNyWQIaPTDo0YhISB9Ja4xipmLNaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBuNgZ07fq+ACKze9eDw+kGz0nBWOWeamb7PhnUuPTZEWCv72PyWoTFXRHBLs/rsRYcsLCeIBZgqiKWDhv734pTSloAyEzWxNO+32b5nhqHor5MH7Zswb8wD21fPOhRFzrdOUiiFq8WJTC1JKDrY0wNQDZ2/LBcJI4AfCdRDMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBwyk0vK; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBwyk0vK"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48881a62e09so799432f8f.2
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790428783; x=1791033583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KxBdd5YtiikdA2EB3RaEsDlyXLxZtzJpIW7hxYmjpy0=;
        b=UBwyk0vKD/u1DIN7x697Mg7qao8dMQwQGI3fzcaBcZgQh8lxba1zmWZSybXK8WLlZy
         pLKm2bKkOgtHU45GyyTTxBrZntS1L/ZHcFYFt59T8KiTGR98u5tXnUyLzOk7i9eO/SKI
         6kB8oOePCKWzC9kZEnZr5fhRRSIr2iBAuMmRJwBxnuUJFFAPxMyK9RdKmQ4w1vASAzdU
         tEC16IGKMpMcIkafYBN8t3tBHrqv6y88l8vF2c8cDxXtN8wLuGF6YGr8YIWMEvodzLDX
         we5yooJWX5eSm5mjFYEgQIwDxI7xFq4uhdSDMZ6tYTF8BI+cUuwvKsVZSATnFVmVYKXT
         bljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790428783; x=1791033583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxBdd5YtiikdA2EB3RaEsDlyXLxZtzJpIW7hxYmjpy0=;
        b=XvcQ+KScecVBhO1D4ABeXLDjAumM+AU7KhFaW9ypDjpvTnJzgJgolxqAXmz+a3rCK/
         BvkE+gXvRuh2yrt4yjeJJcPLemabuoWEUzDXe4w1M4i5pTq/ou39fJmqxO4Xruzr/sB2
         Fx7pjv0mdcAml7MI3JUTVgWAYv9ZWf1wMxJRJFcht9kQBzCi6PrvTWR9+cDisK383/KI
         GvrQIqMr6W7ZsZsvw34Sj3wkmxlvS0/EK8CVURcQIejCYhkP8w/8mPxxgYc03De0GmiW
         2tXMCL6YtEYdBQyYI5EDkE+YF5QL7+SwaNTSOGabifRaL3Jf90f7fqa7XumczFNr6bkp
         DjPA==
X-Forwarded-Encrypted: i=1; AKwUvBxE+8Mmfpp9q9h/sXNTo4ynXoQjD6T8yGPMR4xjwCdtJccM+JcEFR0qa9kjXre479Zm5ytHCRwP/qz4jQ==@vger.kernel.org
X-Gm-Message-State: AFuF++njrJX9f0iVDv9dmduz0BDaTLgCmAY9NctDOdz+/rarkSyBX52g
	ecNN1JfLUnu2hEM+0f3Ab4fK9dkKUt/a0lMpdIexI9+19lPaMSC6RShd
X-Gm-Gg: AYBFou2FWgYnJ38Zfr4t0eHwTgHeicDwcJ9OEX+3kaHp1K86kEetgdwTLktkaKuP2lO
	ClGpQ2lTbIimiqSBwUnSjnd4E3UxiabuvO58TDosgHTbbWVgWnORITIx7D46FM0uyTYoZqzRgKI
	4FMMKPAXbwIwCUxHpNig3pDrZDTczU4zX4R5H513aBPBOsbI9fVUDuEMCShFw+lQvOhvOXIHEz4
	JP/REMGTULI/CIEu8YuRuDU6lD6zkD2U13/2kKHJ2efLNBquNOmKQPKqLj/Pb/bmIFkdpMN801M
	y+obaSHt4/CJHTBzBcgs2Xsae+Hbaxs3M0epqBOK26U2o/hx4HiuLGh9eKV/nPRT108Gs4XcXi5
	fqn2Ib+rQOyEQTvzxLqmZ6XMMDxlqD2FfQEe1FYUnQMiWEMiqm8uFXKrLVKonFGadLjPyE499p0
	fpFz8du1dpd2UJWcsZVE7SptVndhRaOi7l8gHJXuXaFNHNNY/kM3eslmf8WEPV4zg8Z1Y=
X-Received: by 2002:a05:600c:1391:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-49fe670af91mr159689215e9.34.1790428782920;
        Sat, 26 Sep 2026 06:19:42 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm13861406f8f.37.2026.09.26.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:19:42 -0700 (PDT)
Date: Sat, 26 Sep 2026 16:19:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	festevam@gmail.com, nicoleotsuka@gmail.com,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_asrc: check the second front-end DMA channel
Message-ID: <arfGajXmMUeew0fr@stanley.mountain>
References: <20260913125147.109920-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913125147.109920-1-bolin.liu@seu.edu.cn>

On Sun, Sep 13, 2026 at 08:51:47PM +0800, Slavin Liu wrote:
> The temporary Front-End DMA request can fail independently of the
> persistent channel acquired earlier in fsl_asrc_dma_hw_params(). The
> returned NULL pointer is immediately used to read its private data.
> 
> Check the temporary channel and release the previously acquired
> persistent Front-End channel on failure. Clear its slot so a later
> hw_free cannot release it twice. ASoC marks a component's hw_params
> only after success and skips unmarked components during rollback, so
> returning an error alone would leak the earlier channel.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform drivers")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 2f662bdf14d0..64f2b0612274 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -248,6 +248,11 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  
>  		/* Get DMA request of Front-End */
>  		tmp_chan = asrc->get_dma_channel(pair, dir);

The ->get_dma_channel() function pointer returns error pointers not
NULL.

    sound/soc/fsl/fsl_asrc_dma.c:254 fsl_asrc_dma_hw_params()
    warn: 'tmp_chan' is an error pointer or valid

sound/soc/fsl/fsl_easrc.c | (struct fsl_asrc)->get_dma_channel | fsl_easrc_get_dma_channel | 1
sound/soc/fsl/fsl_asrc.c | (struct fsl_asrc)->get_dma_channel | fsl_asrc_get_dma_channel | 1

regards,
dan carpenter

> +		if (!tmp_chan) {
> +			dma_release_channel(pair->dma_chan[!dir]);
> +			pair->dma_chan[!dir] = NULL;
> +			return -EINVAL;
> +		}
>  		tmp_data = tmp_chan->private;
>  		pair->dma_data.dma_request2 = tmp_data->dma_request;
>  		pair->dma_data.peripheral_type = tmp_data->peripheral_type;
