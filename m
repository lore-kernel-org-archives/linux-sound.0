Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024E277C81
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925591; cv=none; b=ZiQd3LO11xy+bR9YTpTE4gXR5HMnDL9lxlxTUo0fkRfzq3eypaLcGOpmanLMtq38XrG+zujRItnDg5UmWF/tDvjpaHA2eoVNiXX0TYBKmE2ha3uBidYjsKZV7kh0t7APqt4kWyTazLK067HWpWIp2w88Ea5fRnkUXKSSMF50OlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925591; c=relaxed/simple;
	bh=PTVPJgdc0hdko9keSzgGLFydDJc2akRSQOX+aAoasoE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E923JcoOQYMgvbQAWNvKQf0ng5Moy2FVReK0Aoypzhoz0lt3sXZl5lse3Cr8y/Td6WQi+UcSHuAqeodtZe87hu92GnxNgp8mGvU3gLozYIbB72iE/tzQxGw9q6QniAhPtOrY5o246O8hvuTt6w5TMH5uAsvHrvy/JHs9AZg5Qsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V67/243i; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V67/243i"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48FD2C5147D;
	Mon,  8 Jun 2026 13:33:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 374745FFB7;
	Mon,  8 Jun 2026 13:33:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33F87106A28DA;
	Mon,  8 Jun 2026 15:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780925586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IayoaX4vgbqiMo/9z7zreC2uglc2mQYI7GH1v4XskNw=;
	b=V67/243i3E7niSGXVDClqxQAZtQmrnMJOmO1+pJ8wT6ZBeeUsVQtXeI3Oq4djb1PE1nP+S
	tpy/xICdagMRNNwmOeldi/BEEyZ4nCjaSfPPOlkwJ2L9XPHiCKRwggNApp0PrqM0+uhWmr
	ddeYQgU5Gw7G4UWd4kEhWOIvSeUzwnB87r5ardsoGbyT3C3LlaA25qNNIxqaOpqn1qe9Q4
	Au5oidboVZ3BHQU+Q6DXcygR+aIBEuJwCQBdxrgzGynvXYvFU6aKOQGFHbBOUFgA6bZYoM
	t1AHOruhEf1AkZMqvM3klFSxVUa//T508RyjeoqdVO0JCApuNBySb5d30LylQQ==
Date: Mon, 8 Jun 2026 15:33:00 +0200
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
Subject: Re: [PATCH v2 2/9] ASoC: codecs: framer-codec: don't use array if
 single pattarn
Message-ID: <20260608153300.19716542@bootlin.com>
In-Reply-To: <87tsrdetm7.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
	<87tsrdetm7.wl-kuninori.morimoto.gx@renesas.com>
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

Hi Kuninori

On Mon, 8 Jun 2026 00:57:53 +0000
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
>  sound/soc/codecs/framer-codec.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
> index 6f57a3aeecc89..a87a78390172d 100644
> --- a/sound/soc/codecs/framer-codec.c
> +++ b/sound/soc/codecs/framer-codec.c
> @@ -238,15 +238,13 @@ static int framer_dai_startup(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> -static const u64 framer_dai_formats[] = {
> -	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
> -};
> +static const u64 framer_dai_formats = SND_SOC_POSSIBLE_DAIFMT_DSP_B;
>  
>  static const struct snd_soc_dai_ops framer_dai_ops = {
>  	.startup	= framer_dai_startup,
>  	.set_tdm_slot	= framer_dai_set_tdm_slot,
> -	.auto_selectable_formats     = framer_dai_formats,
> -	.num_auto_selectable_formats = ARRAY_SIZE(framer_dai_formats),
> +	.auto_selectable_formats     = &framer_dai_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  static struct snd_soc_dai_driver framer_dai_driver = {



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
