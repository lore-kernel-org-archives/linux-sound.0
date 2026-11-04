Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760950;
	b=dNNg81n1mQFOxzY7IbT2Ea3H21iKFgdg5PNUa2btDTWFuLRcFFHARhzwTBD4LQo0FOfe
	 yD0BVMedKHprvyxTr3Kk/ZVKnrFiwJJ7mtfMZwpq2tc2B/xaA1qw0yHsXifQAeTXItwfr
	 qJONeXqGclLQ6QPO1X5qHaIk2xtMo2j1RRtenDqukho7Wr/hu1+5SkN+bCjUYeQmDGFIs
	 RJEi5J4oFfS4An5sPBn7o9QHBdXdRPJF8rPRM2TsOGWgNiY7r+7GfrvXN9iKhlzN7lCxb
	 5nUFm7EW+e6eB+mjA41DCusb86sRllTIUBlWSBbD9Tku9IuTXLaEFmbv4JKt6TeS+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8r/sTKz31x9VxvGA6N5AFFzKcZfUHdsFawH7Xm9Bcy0=;
	b=diqCIzkDyxRL/50M7utfqf1kdL5ihgOZMoU6nFDMXymavSX0EDvMH0hH7q4mIhaaYlEd
	 OuFt9VGDel3PwJXk21L68uysWjrfPHf7kSBO8UgGId9j5nCxS5xptyo/3ufja+AzfIZOE
	 6myTeaZKN98hrFZfrBRhpEK4BRU+aQv7+LGv74pWuSHKluR0jdLa+BICWAWX7Se9+l+nh
	 +lr23BtyV7PDRf1bBVf7Ja2OZWvxPAxL5Jzft5lRhl3shleHI+6V7a40CPMUf7pHjVbSC
	 2dV4RW71wqrv5j9X6jQjNCGbuBZ84UQ57b/1N2VB41XUuKYoOLLyOG0wOmvcFKE7Pbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmgGwa7Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E8606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmgGwa7Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335C11F000C1;
	Wed,  4 Nov 2026 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793760950;
	bh=8r/sTKz31x9VxvGA6N5AFFzKcZfUHdsFawH7Xm9Bcy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmgGwa7YHtdE+dN/bXXX9pJoCr7kNO2qnXOaN62yERO22LZ9rRY8WBHu8zgJ3FRhk
	 RC8Ys/8O5oDNWS8anVKDncFWVDYYJI6kmPAmtzycImWYXW+xokA4G0g+oMbyWP70tX
	 a4Llj/OtoiOk0DceEsluBgwgyIFHYy/N0fQGFan3U3jFH1zkenIyqCSPdixBb2/lf4
	 y+XgM4cyPO1htsXYCKnf6lTo87MQxsmYwcZrSEaN498h1NJwxEIFVtimpMOdg6bSdI
	 zD/mF0Jhk7shZLhsUL+zcvw0xN0hssY0whieJ+2ks057Ig8vakumiZU5Ps/QwNEubv
	 zRNoicbdKdzdQ==
Message-ID: <sashiko-outbox-196547@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: samsung: i2s: release the runtime PM reference if
 config_setup fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104024050.1508669-1-vulab@iscas.ac.cn>
References: <20261104024050.1508669-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:55:49 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: samsung: i2s: double pm_runtime_put() on failed trigger star=
t in i2s_trigger()
--

commit 1c9f9f4fb51c6368b6950d91e87f392b539a7a79
Author: Wentao Liang <vulab@iscas.ac.cn>

ASoC: samsung: i2s: release the runtime PM reference if config_setup fails

This commit releases the runtime PM reference on dai->dev in i2s_trigger()
when config_setup() fails during a start, resume, or pause-release trigger.

> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 442e70b107dac..d2060c3ff6e8b 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -924,6 +924,7 @@ static int i2s_trigger(struct snd_pcm_substream *subs=
tream,
>  	int capture =3D (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE);
>  	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
>  	struct i2s_dai *i2s =3D to_info(snd_soc_rtd_to_cpu(rtd, 0));
> +	bool failed =3D false;
> =20
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
> @@ -935,8 +936,10 @@ static int i2s_trigger(struct snd_pcm_substream *sub=
stream,
>  			priv->fixup_early(substream, dai);
> =20
>  		scoped_guard(spinlock_irqsave, &priv->lock) {
> -			if (config_setup(i2s))
> -				return -EINVAL;
> +			if (config_setup(i2s)) {
> +				failed =3D true;
> +				break;
> +			}
> =20
>  			if (priv->fixup_late)
>  				priv->fixup_late(substream, dai);
> @@ -946,6 +949,11 @@ static int i2s_trigger(struct snd_pcm_substream *sub=
stream,
>  			else
>  				i2s_txctrl(i2s, 1);
>  		}
> +
> +		if (failed) {
> +			pm_runtime_put(dai->dev);
> +			return -EINVAL;
> +		}

[Severity: High]
Does dropping the runtime PM reference here cause a double
pm_runtime_put(dai->dev) when config_setup(i2s) fails during
SNDRV_PCM_TRIGGER_START or SNDRV_PCM_TRIGGER_PAUSE_RELEASE on a non-linked,
non-DPCM substream?

When snd_pcm_start() or snd_pcm_pause() runs on a single substream,
snd_pcm_action_single() sets substream->runtime->trigger_master =3D substre=
am
in pre_action, then calls do_action which invokes:

  soc_pcm_trigger()
    -> snd_soc_pcm_dai_trigger(substream, cmd, 0)
      -> soc_dai_trigger()
        -> i2s_trigger()

If config_setup(i2s) fails, this patch calls pm_runtime_put(dai->dev) and
returns -EINVAL. After soc_pcm_trigger() returns that error to
snd_pcm_action_single(), the ALSA PCM core invokes ops->undo_action
(snd_pcm_undo_start() or snd_pcm_undo_pause()):

sound/core/pcm_native.c:snd_pcm_action_single() {
	res =3D ops->do_action(substream, state);
	if (res =3D=3D 0)
		ops->post_action(substream, state);
	else if (ops->undo_action)
		ops->undo_action(substream, state);
}

sound/core/pcm_native.c:snd_pcm_undo_start() {
	if (substream->runtime->trigger_master =3D=3D substream) {
		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
		substream->runtime->stop_operating =3D true;
	}
}

Because snd_pcm_undo_start() and snd_pcm_undo_pause() invoke
soc_pcm_trigger() as a fresh SNDRV_PCM_TRIGGER_STOP or
SNDRV_PCM_TRIGGER_PAUSE_PUSH call with rollback =3D=3D 0,
snd_soc_pcm_dai_trigger() does not check soc_dai_mark_match():

sound/soc/soc-dai.c:snd_soc_pcm_dai_trigger() {
	...
	for_each_rtd_dais(rtd, i, dai) {
		if (rollback && !soc_dai_mark_match(dai, substream, trigger))
			continue;
		...
		r =3D soc_dai_trigger(dai, substream, cmd);
}

This enters the STOP / PAUSE_PUSH branch of i2s_trigger(), which does not
check whether the stream was actually started and unconditionally calls
pm_runtime_put(dai->dev) a second time:

sound/soc/samsung/i2s.c:i2s_trigger() {
	...
	case SNDRV_PCM_TRIGGER_STOP:
	case SNDRV_PCM_TRIGGER_SUSPEND:
	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
		scoped_guard(spinlock_irqsave, &priv->lock) {
			...
		}
		pm_runtime_put(dai->dev);
		break;
}

Wouldn't each failed start or pause-release trigger therefore perform one
pm_runtime_get_sync(dai->dev) and two pm_runtime_put(dai->dev) calls,
consuming the runtime PM reference held while the substream is open and
underflowing dev->power.usage_count on close?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104024050.1508=
669-1-vulab@iscas.ac.cn?part=3D1
