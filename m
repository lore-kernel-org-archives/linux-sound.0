Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973122DE6E3
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925683; cv=none; b=V0zlMAlTDsBIkdK+l9M2syx+Ogf6lQdOfmS/uxY9jApRotKFu8vUaQSNpOLDYQxkhAMU/IPJU4csYI68LMRxXHRerwhDDybvo8raV/X0k/tw+L4ozuuQ9NQ/iLbQOU/Bmq9nqlEuYPlSi4Kx3KD69mclbtW5qJdtEWILORUv0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925683; c=relaxed/simple;
	bh=q34jk5uONBQBsS2aDRwWgLAJpkUzXmlYc0kM2JrfGm8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZRCyWGmIVip6QFMOuas496WVNqWwnCYGkovkhkaYQjK+58oSBnWkNah0SNKvXfywoTeQy3RohkWAxovr0vhwqRoxdY5+bar0fm8J4gKX+nbLAGtMPxZ4g25GFcsDPcvqzLccJpnWPvlYvHZUJIj2lSyEDf8/wi+NbfADjjLCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B597D1bU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B597D1bU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F6FC1A37C8;
	Mon,  8 Jun 2026 13:34:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 035045FFB7;
	Mon,  8 Jun 2026 13:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED952106A2936;
	Mon,  8 Jun 2026 15:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780925680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v57XaXmJXMErMTljYIETnaWJLjGdGOU2U4HHhiHV42Q=;
	b=B597D1bUIc4tzELE6Fpu+CFwRwFWDFbEUr/cftDDqrowq8O11Fn3TfnKJahct9izcTUQRA
	4A6Hy9vFAesZTlLzAQOuAVHnXVLgryT5DIhN2gwfQeRhJQaTLARIO3r1PaXR2yuolx6KVt
	uxIq/jsa7xgl5osL/AMEve/XHX5SbsN786uXv4b2UBfTeeS1e84gHMCPJwS1bOWTfwKYtx
	ZF5cClAuYLjoyV1Hgq74fCHuDhiw43rA9JcY1ucqILL1nCBIBd62x6Oddoqu7apBUra//0
	+o5aA7q+kUJhm6hCricBFGL4XBp0zHLAEjLdAhub9laPe5eztRmvPdUAvUdRCQ==
Date: Mon, 8 Jun 2026 15:34:35 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Jaroslav Kysela <perex@perex.cz>, Kevin Lu
 <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sen Wang
 <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, Support Opensource
 <support.opensource@diasemi.com>, Takashi Iwai <tiwai@suse.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 4/9] ASoC: codecs: peb2466: don't use array if single
 pattarn
Message-ID: <20260608153435.1734706b@bootlin.com>
In-Reply-To: <87qzmhetlx.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
	<87qzmhetlx.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Kuninori,

On Mon, 8 Jun 2026 00:58:02 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

Still the typo in commit title
s/pattarn/pattern/

Best regards,
Hervé

> Because it is confusable during debugging ASoC FW update, tidyup
> auto format style not to use array if single pattern case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/codecs/peb2466.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
> index 2d5163c15d0d1..2d71d204d8fa2 100644
> --- a/sound/soc/codecs/peb2466.c
> +++ b/sound/soc/codecs/peb2466.c
> @@ -817,18 +817,17 @@ static int peb2466_dai_startup(struct snd_pcm_substream *substream,
>  					  &peb2466_sample_bits_constr);
>  }
>  
> -static const u64 peb2466_dai_formats[] = {
> +static const u64 peb2466_dai_formats =
>  	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> -	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
> -};
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
>  
>  static const struct snd_soc_dai_ops peb2466_dai_ops = {
>  	.startup = peb2466_dai_startup,
>  	.hw_params = peb2466_dai_hw_params,
>  	.set_tdm_slot = peb2466_dai_set_tdm_slot,
>  	.set_fmt = peb2466_dai_set_fmt,
> -	.auto_selectable_formats     = peb2466_dai_formats,
> -	.num_auto_selectable_formats = ARRAY_SIZE(peb2466_dai_formats),
> +	.auto_selectable_formats     = &peb2466_dai_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  static struct snd_soc_dai_driver peb2466_dai_driver = {
