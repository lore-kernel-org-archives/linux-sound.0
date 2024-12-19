Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C8223705;
	Thu, 19 Dec 2024 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606383; cv=none; b=Pn0iV0u28/LaahKZlJWveBsqKRACoF2DRqK51hNGXcSWuXAddJTWMNujhS+lESw+9Xy3JSLr0/AyYtQaQunU4qnn3z666ibWnMJlj+A7sPCmfG7buBMCTD+KeUsgtaCklUr26HaBRs1KJytbepm4dV2sH93Qy4o3qdzpdIkTJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606383; c=relaxed/simple;
	bh=zwsUAHNP7mrQdPFLP5AhvVLR+6YT1CQM3OFvTb1Ql8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzGK2itvVv6EFHeX2Ptx3oj7NY4Cl9VSG6LB9sJ7n1xPun17cHRqBCzbXv3EbKAx+4PnLzWatP6WG7rJMdev9kXo9uGgphBevClQJpB8GxuIDD7gxoHf7ud1QFWE/SN7L2TrKGLzCaYRqDMjgRx/3YXwqIUwmFVBI3rVlsrzHw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fggRZSnG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fggRZSnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734606379;
	bh=zwsUAHNP7mrQdPFLP5AhvVLR+6YT1CQM3OFvTb1Ql8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fggRZSnGMRdhrKMfWIMQE1xL+eTQ5Ut26nb6qBErlYM/PuCcIM4qbmaQVhWqqecX2
	 Jzu+P1PAMYCNnFP1f9EASn5uBv/FvzZOUB2owHyAtQZXJ4wZuICaM3pT9k1t+eIj+L
	 0PpXbITs8y2KKL+4h21+yNiY2YJ1EZf0yOy7XOYMjKyv/0cTWAjAGnwOCYkfIV6ha8
	 VliONy4DMO2VUvl0hKjDjNTB29oCUvrHmUfkgG4VaAwmiDXf3J8EBFnRz0vx7ZsHvM
	 EvIlxjkskCdF6ADLbQ0hlcwCVvGx5qW8kJ63/y5d9G/V8y22+/3PqkrZ/eXb2cgNO6
	 CLriejP/R12Pg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0308F17E3614;
	Thu, 19 Dec 2024 12:06:18 +0100 (CET)
Message-ID: <e208a265-cd4a-4781-82a6-a7f4f2c47448@collabora.com>
Date: Thu, 19 Dec 2024 12:06:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: disable buffer pre-allocation
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 treapking@chromium.org, yuanhsinte@chromium.org
References: <20241219105303.548437-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241219105303.548437-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 19/12/24 11:53, Chen-Yu Tsai ha scritto:
> On Chromebooks based on Mediatek MT8195 or MT8188, the audio frontend
> (AFE) is limited to accessing a very small window (1 MiB) of memory,
> which is described as a reserved memory region in the device tree.
> 
> On these two platforms, the maximum buffer size is given as 512 KiB.
> The MediaTek common code uses the same value for preallocations. This
> means that only the first two PCM substreams get preallocations, and
> then the whole space is exhausted, barring any other substreams from
> working. Since the substreams used are not always the first two, this
> means audio won't work correctly.
> 
> This is observed on the MT8188 Geralt Chromebooks, on which the
> "mediatek,dai-link" property was dropped when it was upstreamed. That
> property causes the driver to only register the PCM substreams listed
> in the property, and in the order given.
> 
> Instead of trying to compute an optimal value and figuring out which
> streams are used, simply disable preallocation. The PCM buffers are
> managed by the core and are allocated and released on the fly. There
> should be no impact to any of the other MediaTek platforms.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

No there's no impact on the older ones, it's fine and I agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> index 9b72b2a7ae91..6b6330583941 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> @@ -120,8 +120,8 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
>   	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
>   
>   	size = afe->mtk_afe_hardware->buffer_bytes_max;
> -	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> -				       afe->dev, size, size);
> +	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);


