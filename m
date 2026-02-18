Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928A73191BB;
	Wed, 18 Feb 2026 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448593; cv=pass; b=l7kp0AKhbshS8sNTgkr9a35zIhltVaYFlOVLnGKWEMpLrhFOnOhcTnJlLWquNUctRALxrrVeOcM40Pf3LNW4L6hf16uv89Wz89yVQXi1HAWDvRUerE9+xOEIst5ycY3yCfaVLvEaNx5PLRBlLdFpvR/HYKX6Q1pxFTiCb0gE+kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448593; c=relaxed/simple;
	bh=K+VWNuKm0Xgad/z/W6mQDaGXG95Y1ucZYAl7qAdHe5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZOMUJNCyPTPQNmBmTFVRihXyqqt1nrCKsi+8+ulVJC1TirmRQQaQ4nzsaAF+WK4NsE22fiKtNIBywQsr0JMxJ2OPKsqtRFl0Y0/u+LSwWq/n8govCNYoP3hBk9ggNAlUgk2DHAeBggiECZ5W5dhQUdLv1sZsyJxsdjyPBAmFxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Dhb/M57I; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Dhb/M57I"
ARC-Seal: i=1; a=rsa-sha256; t=1771448560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fLoug58uduz4BkdTeT08qTKsz+09n3ggNU7/yF1jCzugZqnDAmbZSRS605Ad9XWsvkSKaTMe4P73VaI812fDDUc0kfjkzVZdxnusgYtowZyive0jhivO1QsiIxbeKysISTT/xE5CF5nNf/LAfxe4B4P7dW0c4sjhRCwioaI/JEw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771448560; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CZvRA+oMFDnzO5kJBkporl84uyLR6ayPPrDSuzdNaAg=; 
	b=Hif/eRewK5dy0bS6Qgqbu635Nl49HbwU4pxTyKN7IzvVef/N280A+y2hxPZ0/EKLx6RbLn+XUES1zjo4OQMHmbQtaUvUXlnhoMQ86AGUhnY6y23/TFGdpFmmNBDCoEWxctqczEQxIt7ruoL6tk4eetr6SXYBSN0rkj5gHmKRHtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771448560;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CZvRA+oMFDnzO5kJBkporl84uyLR6ayPPrDSuzdNaAg=;
	b=Dhb/M57IaKINfTxPYAnPQ7yyHqmL9cQsoQWtbn2mu22+Uk0B1CzhVAOFLOq7i0vb
	EmExVJc/J6Ky4OuC5uGXv4ijrD5n5Pyo9kaeUiJpWWI5JmBJ/H0OHmGWrH2LertUAhL
	GHOJGN/acIzBCPVrLIYNoZB5U6H40xHpAjChwH0Q=
Received: by mx.zohomail.com with SMTPS id 1771448557465284.83992249039545;
	Wed, 18 Feb 2026 13:02:37 -0800 (PST)
Message-ID: <a024ba9c-f2d3-4bba-93d3-33c0d0bd868b@collabora.com>
Date: Wed, 18 Feb 2026 16:02:35 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
To: linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20260218201834.924358-1-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

This could also use a

Reported-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca, feel free to add your Tested-by as well :)

Detlev.

On 2/18/26 15:18, Detlev Casanova wrote:
> Drivers will not always call set_sysclk() for all clocks, especially when
> default mclk-fs can be used.
> When that is the case, use the clock rate set in the params multiplied by the
> default mclk-fs.
>
> Fixes: 5323186e2e8d ("ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   sound/soc/rockchip/rockchip_i2s_tdm.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 770b9bfbb384..fc52149ed6ae 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -22,6 +22,7 @@
>   
>   #define DRV_NAME "rockchip-i2s-tdm"
>   
> +#define DEFAULT_MCLK_FS				256
>   #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
>   #define MULTIPLEX_CH_MAX			10
>   
> @@ -665,6 +666,15 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
>   			mclk_rate = i2s_tdm->mclk_rx_freq;
>   		}
>   
> +		/*
> +		 * When the dai/component driver doesn't need to set mclk-fs for a specific
> +		 * clock, it can skip the call to set_sysclk() for that clock.
> +		 * In that case, simply use the clock rate from the params and multiply it by
> +		 * the default mclk-fs value.
> +		 */
> +		if (!mclk_rate)
> +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
> +
>   		err = clk_set_rate(mclk, mclk_rate);
>   		if (err)
>   			return err;
