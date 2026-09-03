Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E930D3EF
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421944; cv=none; b=pw/7ef7uUiJvODCQfbqdwcTGHP2CWkpcNqA8dKGBpw/IecaAC9jM9EaXnyQDmn49vJKNz+LXxXGU38CJLdfBasFiymXwzDq38iz4tK6gysAM8bMzahGUCehq0pkx6sV+of7MxTrC7yNwKedv6CYg7S6HbfbxQqzqssJ2DQlD+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421944; c=relaxed/simple;
	bh=nq4O++xaROnr1zsg44LzJxOz0a+KGcZ94nDgsDtUxWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpueBzmHFjMKJJUXt5inipBets5DIDZpEDU1Q9ILi7G6iP/v0Ncsy/Vl9C8rQyv2L0z5H+q+AyJ3YOP413oHL+MHENyDRd5eJdGIoCTZRybypAzrumEasMb3Ca5G5fkQWBZzqRkewmPHav9xD1lsypYkurTQXg73tIVn2frptnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=joLzwY2N; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=joLzwY2N; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="joLzwY2N";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="joLzwY2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1788421386; bh=nq4O++xaROnr1zsg44LzJxOz0a+KGcZ94nDgsDtUxWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=joLzwY2NBJxAB6E/zbcNiZNT5zZF0pAWp8A7qFlhxfaorMu/4M8UAVyr9Hhfk+TmE
	 tP5nWMLJQekoeROi3s7eZurB8SkkzRm1VEJ78uIvFmBWYv49LxI7aBKcc572tgJyH/
	 DcvRHo0RLBnQDRLRm93RnYglTwC8x+rH2prCSyjlWPO40QTaxhBvq3kH8rnbf5NRlg
	 f5fjlLD0RB7TJvkJScDuTrdGko2+XtsXFj2fo9s+SpuP7bwkySsn0e35AHPqKo4Vpf
	 RIi5p6/K6W3/EMLT1dOmeerdfrsq6Y1yd7Dn397ponFpBnYLk35cCf015MicpNO0HF
	 qS3sADbKed3VA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9790885352;
	Thu,  3 Sep 2026 07:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1788421386; bh=nq4O++xaROnr1zsg44LzJxOz0a+KGcZ94nDgsDtUxWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=joLzwY2NBJxAB6E/zbcNiZNT5zZF0pAWp8A7qFlhxfaorMu/4M8UAVyr9Hhfk+TmE
	 tP5nWMLJQekoeROi3s7eZurB8SkkzRm1VEJ78uIvFmBWYv49LxI7aBKcc572tgJyH/
	 DcvRHo0RLBnQDRLRm93RnYglTwC8x+rH2prCSyjlWPO40QTaxhBvq3kH8rnbf5NRlg
	 f5fjlLD0RB7TJvkJScDuTrdGko2+XtsXFj2fo9s+SpuP7bwkySsn0e35AHPqKo4Vpf
	 RIi5p6/K6W3/EMLT1dOmeerdfrsq6Y1yd7Dn397ponFpBnYLk35cCf015MicpNO0HF
	 qS3sADbKed3VA==
Message-ID: <1ffd338b-2879-4314-b306-88f28a833784@mleia.com>
Date: Thu, 3 Sep 2026 10:43:04 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] ASoC: fsl: use .auto_selectable_formats
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
 <87wlt3yw5b.wl-kuninori.morimoto.gx@renesas.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <87wlt3yw5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260903_074306_638897_4252843F 
X-CRM114-Status: GOOD (  14.72  )

On 9/3/26 04:13, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/fsl/fsl_audmix.c      |  7 +++++++
>   sound/soc/fsl/fsl_esai.c        | 13 +++++++++++++
>   sound/soc/fsl/fsl_mqs.c         |  6 ++++++
>   sound/soc/fsl/fsl_sai.c         | 17 +++++++++++++++++
>   sound/soc/fsl/fsl_ssi.c         | 13 +++++++++++++
>   sound/soc/fsl/lpc3xxx-i2s.c     |  4 ++++

Acked-by: Vladimir Zapolskiy <vz@mleia.com> # LPC32xx I2S

>   sound/soc/fsl/mpc5200_psc_i2s.c |  4 ++++
>   7 files changed, 64 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index d4140e170edf8..b66a5669a3cbf 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -311,9 +311,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>   	return 0;
>   }
>   
> +static const u64 fsl_audmix_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
> +
>   static const struct snd_soc_dai_ops fsl_audmix_dai_ops = {
>   	.set_fmt  = fsl_audmix_dai_set_fmt,
>   	.trigger      = fsl_audmix_dai_trigger,
> +	.auto_selectable_formats = &fsl_audmix_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   static struct snd_soc_dai_driver fsl_audmix_dai[] = {
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 4a530a6c33f07..e49386f8d7d33 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -789,6 +789,17 @@ static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
>   	return 0;
>   }
>   
> +static const u64 fsl_esai_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>   static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
>   	.probe		= fsl_esai_dai_probe,
>   	.startup	= fsl_esai_startup,
> @@ -797,6 +808,8 @@ static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
>   	.set_sysclk	= fsl_esai_set_dai_sysclk,
>   	.set_fmt	= fsl_esai_set_dai_fmt,
>   	.set_tdm_slot	= fsl_esai_set_dai_tdm_slot,
> +	.auto_selectable_formats	= &fsl_esai_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   };
>   
>   static struct snd_soc_dai_driver fsl_esai_dai = {
> diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
> index 901f840df9047..39129f970c3f5 100644
> --- a/sound/soc/fsl/fsl_mqs.c
> +++ b/sound/soc/fsl/fsl_mqs.c
> @@ -187,11 +187,17 @@ static const struct snd_soc_component_driver soc_codec_fsl_mqs = {
>   	.idle_bias_on = 1,
>   };
>   
> +static const u64 fsl_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
> +
>   static const struct snd_soc_dai_ops fsl_mqs_dai_ops = {
>   	.startup = fsl_mqs_startup,
>   	.shutdown = fsl_mqs_shutdown,
>   	.hw_params = fsl_mqs_hw_params,
>   	.set_fmt = fsl_mqs_set_dai_fmt,
> +	.auto_selectable_formats	= &fsl_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   };
>   
>   static struct snd_soc_dai_driver fsl_mqs_dai = {
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index d232c8f530615..4dce1a43b2b43 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1026,6 +1026,17 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
>   	return 0;
>   }
>   
> +static const u64 fsl_sai_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_PDM	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>   static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
>   	.probe		= fsl_sai_dai_probe,
>   	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
> @@ -1036,6 +1047,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
>   	.hw_free	= fsl_sai_hw_free,
>   	.trigger	= fsl_sai_trigger,
>   	.startup	= fsl_sai_startup,
> +	.auto_selectable_formats	= &fsl_sai_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   };
>   
>   static const struct snd_soc_dai_ops fsl_sai_pcm_dai_tx_ops = {
> @@ -1049,6 +1062,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_tx_ops = {
>   	.hw_free	= fsl_sai_hw_free,
>   	.trigger	= fsl_sai_trigger,
>   	.startup	= fsl_sai_startup,
> +	.auto_selectable_formats	= &fsl_sai_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   };
>   
>   static const struct snd_soc_dai_ops fsl_sai_pcm_dai_rx_ops = {
> @@ -1062,6 +1077,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_rx_ops = {
>   	.hw_free	= fsl_sai_hw_free,
>   	.trigger	= fsl_sai_trigger,
>   	.startup	= fsl_sai_startup,
> +	.auto_selectable_formats	= &fsl_sai_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   };
>   
>   static int fsl_sai_dai_resume(struct snd_soc_component *component)
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index dc022976c9823..02ce112faf2db 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -1151,6 +1151,17 @@ static int fsl_ssi_dai_probe(struct snd_soc_dai *dai)
>   	return 0;
>   }
>   
> +static const u64 fsl_ssi_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_AC97	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>   static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
>   	.probe = fsl_ssi_dai_probe,
>   	.startup = fsl_ssi_startup,
> @@ -1160,6 +1171,8 @@ static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
>   	.set_fmt = fsl_ssi_set_dai_fmt,
>   	.set_tdm_slot = fsl_ssi_set_dai_tdm_slot,
>   	.trigger = fsl_ssi_trigger,
> +	.auto_selectable_formats = &fsl_ssi_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   static struct snd_soc_dai_driver fsl_ssi_dai_template = {
> diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
> index c65c17dfa1747..ea521647129ba 100644
> --- a/sound/soc/fsl/lpc3xxx-i2s.c
> +++ b/sound/soc/fsl/lpc3xxx-i2s.c
> @@ -257,6 +257,8 @@ static int lpc3xxx_i2s_dai_probe(struct snd_soc_dai *dai)
>   	return 0;
>   }
>   
> +static const u64 lpc3xxx_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
> +
>   static const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
>   	.probe	= lpc3xxx_i2s_dai_probe,
>   	.startup = lpc3xxx_i2s_startup,
> @@ -265,6 +267,8 @@ static const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
>   	.hw_params = lpc3xxx_i2s_hw_params,
>   	.set_sysclk = lpc3xxx_i2s_set_dai_sysclk,
>   	.set_fmt = lpc3xxx_i2s_set_dai_fmt,
> +	.auto_selectable_formats	= &lpc3xxx_i2s_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   };
>   
>   static struct snd_soc_dai_driver lpc3xxx_i2s_dai_driver = {
> diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
> index c024a38e3b9c7..72db83994e8e1 100644
> --- a/sound/soc/fsl/mpc5200_psc_i2s.c
> +++ b/sound/soc/fsl/mpc5200_psc_i2s.c
> @@ -124,6 +124,8 @@ static int psc_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int format)
>    * - create/destroy dai hooks
>    */
>   
> +static const u64 psc_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
> +
>   /**
>    * var psc_i2s_dai_ops - template CPU Digital Audio Interface
>    */
> @@ -131,6 +133,8 @@ static const struct snd_soc_dai_ops psc_i2s_dai_ops = {
>   	.hw_params	= psc_i2s_hw_params,
>   	.set_sysclk	= psc_i2s_set_sysclk,
>   	.set_fmt	= psc_i2s_set_fmt,
> +	.auto_selectable_formats	= &psc_i2s_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   };
>   
>   static struct snd_soc_dai_driver psc_i2s_dai[] = {{

-- 
Best wishes,
Vladimir
