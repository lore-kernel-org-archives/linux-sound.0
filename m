Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2EE39A04C;
	Tue, 30 Jun 2026 07:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804522; cv=none; b=u3LG40gVF2plDhR1viGNj8Lr92jBYc8VFjW3T1B8BQ3Uv8wITqH30MOYvqxcXH9DflvEUMRLh7Rf8pX/G1Fvvs+HCsFQahaPzzIz7WdAensrdsbvX24vxm40hUalH3FwC7PLrLJiVhxGaQ9TzdR+0ah8hmbrQvjbcijmE5R09p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804522; c=relaxed/simple;
	bh=n98DbZAfEwyiL+IrGWqjessjvYIdtAj8qzQ9fzvKBCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bLiP7M/Q0EsdnPqPA+mJv+PTClJYkNo0vgB8N1pf2734fjxBZJl+UT9DtBehLc4AOm5sdlk4YEYI+vPUR6jFrRn0pLZAETsBEKchlHUm37hTRUqzcYv9Piz2ftA8sWXqXvHBggVQLh49xjS43wWz088ZBbZfYm17cMsWNZ1UrsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tSh8o5EX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tSh8o5EX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0C78DC5CD4C;
	Tue, 30 Jun 2026 07:28:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F20560233;
	Tue, 30 Jun 2026 07:28:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8717E106F1C5E;
	Tue, 30 Jun 2026 09:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782804516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eOZmL/ZJF5PXVjklkVc8tdOX8zn3v66j7gUpnXwBMhg=;
	b=tSh8o5EXJRoEvFUH6ROnUDpliRhoQOuyFThGBrwMz5o+Uaev3sXnLLUFJfgN2KXDmlhafH
	xV/ryJcugRS3EQmEPltw+d3e2PK7DmkmT4G9XguWKGY0bo7yRfyh9SXh0EBLNFxF/rvDlI
	NtTdKRdfaM2v0thCtXBlM16Y8UGnSysZ1mS6ViaPsWeyuZKbsaZ2PZ0dQT6+GS4l6jqD7a
	dHBhIoUSpE2Mi+hqqD9X9se27YimKgaL6+xmb/kFHcB0Dhsg8wj6s/BHsKQRI4WTuNik7w
	VM2g65RwO6ApWeZLs7d9AtEXBf8878QwBZynGzSr7dSc2yGSYKPIitXXjZhVnA==
Date: Tue, 30 Jun 2026 09:28:21 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Nick Li
 <nick.li@foursemi.com>, Support Opensource
 <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com,
 Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>, HyeongJun An
 <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Qianfeng Rong
 <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex
 locks
Message-ID: <20260630092821.650c30ec@bootlin.com>
In-Reply-To: <20260630063449.503996-10-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
	<20260630063449.503996-10-phucduc.bui@gmail.com>
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

Hi,

On Tue, 30 Jun 2026 13:34:31 +0700
phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/codecs/idt821034.c | 121 +++++++++++++++--------------------
>  1 file changed, 51 insertions(+), 70 deletions(-)
> 
> diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
> index 084090ccef77..078de6c9c395 100644
> --- a/sound/soc/codecs/idt821034.c
> +++ b/sound/soc/codecs/idt821034.c
> @@ -6,6 +6,7 @@
>  //
>  // Author: Herve Codina <herve.codina@bootlin.com>
>  
> +#include <linux/cleanup.h>
>  #include <linux/bitrev.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>

Alphabetic order. Move <linux/cleanup.h> after <linux/bitrev.h>.

...

> @@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
>  
>  	ch = IDT821034_ID_GET_CHAN(mc->reg);
>  
> -	mutex_lock(&idt821034->mutex);
> +	guard(mutex)(&idt821034->mutex);
>  
>  	if (IDT821034_ID_IS_OUT(mc->reg)) {
>  		amp = &idt821034->amps.ch[ch].amp_out;
> @@ -466,21 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
>  		gain_type = IDT821034_GAIN_TX;
>  	}
>  
> -	if (amp->gain == val) {
> -		ret = 0;
> -		goto end;
> -	}
> +	if (amp->gain == val)
> +		return 0;
>  
>  	if (!amp->is_muted) {
>  		ret = idt821034_set_gain_channel(idt821034, ch, gain_type, val);
>  		if (ret)
> -			goto end;
> +			return ret;
>  	}
>  
>  	amp->gain = val;
>  	ret = 1; /* The value changed */
> -end:
> -	mutex_unlock(&idt821034->mutex);
> +
>  	return ret;

Instead of
	ret = 1; /* The value changed */
	return ret;

Call directly
	return 1; /* The value changed */

>  }

...
> @@ -521,7 +519,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
>  	ch = IDT821034_ID_GET_CHAN(id);
>  	is_mute = !ucontrol->value.integer.value[0];
>  
> -	mutex_lock(&idt821034->mutex);
> +	guard(mutex)(&idt821034->mutex);
>  
>  	if (IDT821034_ID_IS_OUT(id)) {
>  		amp = &idt821034->amps.ch[ch].amp_out;
> @@ -531,20 +529,17 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
>  		gain_type = IDT821034_GAIN_TX;
>  	}
>  
> -	if (amp->is_muted == is_mute) {
> -		ret = 0;
> -		goto end;
> -	}
> +	if (amp->is_muted == is_mute)
> +		return 0;
>  
>  	ret = idt821034_set_gain_channel(idt821034, ch, gain_type,
>  					 is_mute ? 0 : amp->gain);
>  	if (ret)
> -		goto end;
> +		return ret;
>  
>  	amp->is_muted = is_mute;
>  	ret = 1; /* The value changed */
> -end:
> -	mutex_unlock(&idt821034->mutex);
> +
>  	return ret;

Instead of
	ret = 1; /* The value changed */
	return ret;

Call directly
	return 1; /* The value changed */

>  }
>  
> @@ -629,7 +624,7 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
>  	ch = IDT821034_ID_GET_CHAN(id);
>  	mask = IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT821034_CONF_PWRUP_TX;
>  
> -	mutex_lock(&idt821034->mutex);
> +	guard(mutex)(&idt821034->mutex);
>  
>  	power = idt821034_get_channel_power(idt821034, ch);
>  	if (SND_SOC_DAPM_EVENT_ON(event))
> @@ -638,8 +633,6 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
>  		power &= ~mask;
>  	ret = idt821034_set_channel_power(idt821034, ch, power);
>  
> -	mutex_unlock(&idt821034->mutex);
> -
>  	return ret;

Instead of
	ret = idt821034_set_channel_power(idt821034, ch, power);
	return ret;

return directly:

	return idt821034_set_channel_power(idt821034, ch, power);

and remove the 'ret' variable (no more used)

>  }
>  

...
> @@ -771,7 +764,7 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	u8 conf;
>  	int ret;
>  
> -	mutex_lock(&idt821034->mutex);
> +	guard(mutex)(&idt821034->mutex);
>  
>  	conf = idt821034_get_codec_conf(idt821034);
>  
> @@ -785,12 +778,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	default:
>  		dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
>  			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
> -		ret = -EINVAL;
> -		goto end;
> +		return -EINVAL;
>  	}
>  	ret = idt821034_set_codec_conf(idt821034, conf);
> -end:
> -	mutex_unlock(&idt821034->mutex);
> +
>  	return ret;

Instead of
	ret = idt821034_set_codec_conf(idt821034, conf);
	return ret;

return directly:
	return idt821034_set_codec_conf(idt821034, conf);

and remove the 'ret' variable.

>  }
>  
> @@ -802,7 +793,7 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
>  	u8 conf;
>  	int ret;
>  
> -	mutex_lock(&idt821034->mutex);
> +	guard(mutex)(&idt821034->mutex);
>  
>  	conf = idt821034_get_codec_conf(idt821034);
>  
> @@ -816,12 +807,10 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
>  	default:
>  		dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
>  			params_format(params));
> -		ret = -EINVAL;
> -		goto end;
> +		return -EINVAL;
>  	}
>  	ret = idt821034_set_codec_conf(idt821034, conf);
> -end:
> -	mutex_unlock(&idt821034->mutex);
> +
>  	return ret;

Idem here:
	return idt821034_set_codec_conf(idt821034, conf);

and remove 'ret'.


>  }
>  
> @@ -897,11 +886,11 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
>  	int ret;
>  	u8 i;
>  
> -	mutex_lock(&idt821034->mutex);
> +	guard(mutex)(&idt821034->mutex);
>  
>  	ret = idt821034_set_codec_conf(idt821034, 0);
>  	if (ret)
> -		goto end;
> +		return ret;
>  
>  	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
>  		idt821034->amps.ch[i].amp_out.gain = IDT821034_GAIN_OUT_INIT_RAW;
> @@ -909,23 +898,22 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
>  		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_RX,
>  						 idt821034->amps.ch[i].amp_out.gain);
>  		if (ret)
> -			goto end;
> +			return ret;
>  
>  		idt821034->amps.ch[i].amp_in.gain = IDT821034_GAIN_IN_INIT_RAW;
>  		idt821034->amps.ch[i].amp_in.is_muted = false;
>  		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_TX,
>  						 idt821034->amps.ch[i].amp_in.gain);
>  		if (ret)
> -			goto end;
> +			return ret;
>  
>  		ret = idt821034_set_channel_power(idt821034, i, 0);
>  		if (ret)
> -			goto end;
> +			return ret;
>  	}
>  
>  	ret = 0;
> -end:
> -	mutex_unlock(&idt821034->mutex);
> +
>  	return ret;

Instead of
	ret = 0;
	return ret;

return directly
	return 0;

>  }
>  
...

>  
> @@ -1079,23 +1061,22 @@ static int idt821034_reset_gpio(struct idt821034 *idt821034)
>  	int ret;
>  	u8 i;
>  
> -	mutex_lock(&idt821034->mutex);
> +	guard(mutex)(&idt821034->mutex);
>  
>  	/* IO0 and IO1 as input for all channels and output IO set to 0 */
>  	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
>  		ret = idt821034_set_slic_conf(idt821034, i,
>  					      IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN);
>  		if (ret)
> -			goto end;
> +			return ret;
>  
>  		ret = idt821034_write_slic_raw(idt821034, i, 0);
>  		if (ret)
> -			goto end;
> +			return ret;
>  
>  	}
>  	ret = 0;
> -end:
> -	mutex_unlock(&idt821034->mutex);
> +
>  	return ret;

return 0;

>  }
>  

Best regards,
Hervé

