Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542254;
	b=QLTCikP1GRY/gRzhSCt7eS7BaU2TFzMPniMnR/q+MdoK9g5UjeE8l4yKRRFdBfLNPg3v
	 8UNDDewg7f9ikQFT6Gxth+GnsyC0tEHcLi0HkOQqDQP0MlLg1kj5hv3MjH7pPywY84sj6
	 T94bVmt02ULNv6tdQxgNYctEZrMIwe/h3Q1u0PcebNnAtMJLsJtgbbK2Iz21CG0DcF1Hp
	 40rnROclvXhmJGHcFtcEZTZtcM8CEybd/VKn+rhtS3chs4SsyjHQpyQvFowGZ2nZthVry
	 Fe4GAT5MHGKGH6omTW8qVMg2ytSxY6Woy5mjciyKQy4/A4a+jn0l+jtNdPrMznjHNvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542254;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HKhR6OHiklx1bX+p3KGyuPjKjODk61dLp6EanlfmzcE=;
	b=l591FawwbQWXHE7fMCL3XGSOU1e57Fcc1/7G1y1JgOsp0gHqRuz8AdMM9sycVH+doS0+
	 KNqIXGZFQqfUkxhqvfEm0W4NsiB3bamP5xm/VggU9Gji25LPSrtQIM4eLNGWza+DXTUFy
	 BRs8RQ/yAyb4f7Fr/4hx2wCt+HJNP1YCmbLt6xAJo1UsEgLaM/qgIw0ICcustIvTWYqdC
	 W//p7hFefAto1B5VMZw9PYarqJvvaphHsUXaSQamClZnMmD7YUCoeNOvU/prso2KU8AsU
	 v4gdUH8Whs0Znqek76WhJbOMp8ROkIdrN3S1nZp1Q4YqIGn82MyWFZClyMzZvanBCTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJ29cXaY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D6606A339;
	Tue, 24 Nov 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJ29cXaY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6D61F000C0;
	Tue, 24 Nov 2026 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542253;
	bh=HKhR6OHiklx1bX+p3KGyuPjKjODk61dLp6EanlfmzcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJ29cXaYv6HUliyjiizrk23flhFKv4V1ZKP9Qv+KxAlkx6hkDeO6wja/roc+Z0eD9
	 HI71wQ0tVYL/v2nQ9MVdP/TLhnQjj7ZW+M6tTe4Nl0sUutKDLE4is7Ik+suHSPoRR9
	 wsJK//vBZ2RP2x/8UdJhNP1ruxqAWt+ET22Efr8PjIDJOZEKLwjypvYmahfIlaKHIP
	 4q/gcafpsoomrEod6DTpCRKgThrLFXVUd20pcambSXhKB4nqM/MR6wdoClYQa0/zBN
	 D/AGI7amPhsVuMkBDD/UcRZtwb8T81iIRqbNUNPPA1tmdknPBjRhpwbxvMiAPuj3I8
	 F3HIHhfj75CBQ==
Message-ID: <sashiko-outbox-231736@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/19] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-topic-sm8650-el2-v2-10-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-10-174e159f0f69@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:44:13 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: qcom: unchecked clk_prepare_enable() in
  lpass_cdc_dma_daiops_startup()
--

commit b77682a3d9ba3fc802985eb7a7f2cb05c5db3350
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA

This commit adds WSA codec DMA interface handling to the LPASS codec DMA
driver, wiring up the WSA DMA control handles, interface types, and
codec_mem1 clock in DAI startup and shutdown.

> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dm=
a.c
> index 2dc8c75c4bf08..d7f85a4f9d999 100644
> --- a/sound/soc/qcom/lpass-cdc-dma.c
> +++ b/sound/soc/qcom/lpass-cdc-dma.c

[ ... ]

> @@ -184,6 +211,11 @@ static int lpass_cdc_dma_daiops_startup(struct snd_p=
cm_substream *substream,
>  		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
>  		clk_prepare_enable(drvdata->va_mem0);
>  		break;
> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
> +		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);
> +		clk_prepare_enable(drvdata->codec_mem1);
> +		break;
>  	default:
>  		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, da=
i->id);
>  		break;
> @@ -205,6 +237,10 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd=
_pcm_substream *substream,
>  	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
>  		clk_disable_unprepare(drvdata->va_mem0);
>  		break;
> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
> +		clk_disable_unprepare(drvdata->codec_mem1);
> +		break;
>  	default:
>  		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, da=
i->id);
>  		break;

[Severity: Medium]
Should lpass_cdc_dma_daiops_startup() check and return errors from
clk_set_rate() and clk_prepare_enable() on drvdata->codec_mem1?

If clk_prepare_enable() fails and startup returns 0, the substream opens
with an unclocked LPM memory bank, and lpass_cdc_dma_daiops_shutdown() will
later call clk_disable_unprepare(drvdata->codec_mem1) on close, either
underflowing the clock refcounts or disabling the shared clock while
another WSA stream is using it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-topic-sm86=
50-el2-v2-0-174e159f0f69@linaro.org?part=3D10
