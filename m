Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C71F257851
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925641; cv=none; b=YFrU+5tPm0u4UoVrat9d8umP17G2hoob+dXptvoVrEFwm+kL4ZehPkady3UJKgUPwe0HKOfMOJCxcABTF6lDeQeYUFDYbBF4FH5r91DzFPw72Ke8DXTMpxXnKI0G9Llfe4Izdd+6RkBTAZL6nYjweJxc2MCRi2SkbU3M2zcWaoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925641; c=relaxed/simple;
	bh=Bon+Dmysgii3asON9lBY0s54LKyVdERR1dEZg0KoQ5I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M7fIJnCVA4y9VfxHciiydI9WR/qRSIpk5XBWYM4+fakm26w3dp0exCl8Ku1WqKcSQyOl45gRqqDItzaCRynVKlDEKJZYio20ItJw2xRFwHBiX2p4cYWZv/XyJ2lirZBzshNr2JDNi8/IOEaQLi6bHDvA+rPaV0lTLM42vc8KxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1KFdAKIk; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1KFdAKIk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F127DC5147D;
	Mon,  8 Jun 2026 13:33:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8F4E5FFB7;
	Mon,  8 Jun 2026 13:33:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10203106A292E;
	Mon,  8 Jun 2026 15:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780925638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jBjpJlDiLQCiuyGgasTVQYBGcnszao/lW3BEq2QC3Ps=;
	b=1KFdAKIki4Eq6Gs8oVqR67rM1ylD9jZyhed4m5X5vuuQLORC37XVdk/vhTUeCCJ6YAlvui
	owRmEv0zdmzcnLTAo6ScJ9JSSnK7HcFaJcNtwqh+Iaf96iuEPy44m1B/2TCgAe+UxUie0V
	IMwVUaB/YApuimFhpredfV5A1Gjk9VyF4AZVF/jr9fJn+yzhi0z6iLG5P4NjxTr3s3DI7T
	Jhmr6b8DkN4Ogal2+pkiO0Vb0PD2DMGCGJW3ERv4zIX1P6cSg+PYXpN9rsMdcVROjVMbZW
	ywvs6veXeQLfB1ePZEMVQyKJQHJuRQ7XB2BWMJePS8QfuR2xHy1JgcJEmv3etA==
Date: Mon, 8 Jun 2026 15:33:51 +0200
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
Subject: Re: [PATCH v2 3/9] ASoC: codecs: idt821034: don't use array if
 single pattarn
Message-ID: <20260608153351.73d34e0a@bootlin.com>
In-Reply-To: <87se6xetm2.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
	<87se6xetm2.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, 8 Jun 2026 00:57:57 +0000
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
>  sound/soc/codecs/idt821034.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
> index 39bafefa6a186..084090ccef77a 100644
> --- a/sound/soc/codecs/idt821034.c
> +++ b/sound/soc/codecs/idt821034.c
> @@ -860,18 +860,17 @@ static int idt821034_dai_startup(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> -static const u64 idt821034_dai_formats[] = {
> +static const u64 idt821034_dai_formats =
>  	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> -	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
> -};
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
>  
>  static const struct snd_soc_dai_ops idt821034_dai_ops = {
>  	.startup      = idt821034_dai_startup,
>  	.hw_params    = idt821034_dai_hw_params,
>  	.set_tdm_slot = idt821034_dai_set_tdm_slot,
>  	.set_fmt      = idt821034_dai_set_fmt,
> -	.auto_selectable_formats     = idt821034_dai_formats,
> -	.num_auto_selectable_formats = ARRAY_SIZE(idt821034_dai_formats),
> +	.auto_selectable_formats     = &idt821034_dai_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  static struct snd_soc_dai_driver idt821034_dai_driver = {
