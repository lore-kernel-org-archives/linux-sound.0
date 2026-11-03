Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689538;
	b=w7pIhTLEC7Hh5VFC61k6KJAnG49Sbid7Owi04eRVhg4EjwEM1fMt5TRcK5hNHKxgIyTg
	 O+TaIOtHNTiY1hsG9X9BKpHjNdSYJeM3XTMTaAZieNqGLESY0AQDoBzj3ZTz6GebOU/vn
	 MMX22ua9UV49p7QbU/9MOo9CxFM6aRo7zgiUo1wTm/OnlZuRy9s/fZQMfpGfGTEgyOPxP
	 KSPha1TjDidyp8XTQZhuuyRFU4r5RbMFJvGJo9uWmwR5+zzIDIyyKLNZ/cDDsTR9muaCK
	 mnqj1HuDoLyi4PNl2LFH0bwN7Pikqvg/JeGcDdZie7CaUJpYaLtt37Xhmc7ALcvsKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689538;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b+1r9gLi57K+E9a6gov2FmCNSqgrtqoQvYMl0hImDj8=;
	b=UgHNdc7O+oo9NcFUAngfVx/lzTyf9t1oV2cIp0Vpc3RnBi1c9i8X4jAfLcsVDtvg4diz
	 nXJYyJENEcph05gdXpnR3d9r5LFTDDeJ/8FEhcVxd890k2eUdtPRAYsFdyfnI3RvCasrP
	 af+P2qI+8WHIPMbK7nsQUDHlDhum4QpEGGrMRQwGKYpAUmEGK539koeJTYsCj14BTgaU0
	 MRH61OmcX4ZYJ8vn4k6HhYYLTKPHWvNZX6aojV7keh0lObH0R6g/S5QIgKNi/bloOt51g
	 AuTd4f5iP+mD4B5B8Pw9uPFlqMgegSB4Ene/uVykpjVaeg//VWz2UaIEcF05ucl5fvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IhcbJGA0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CCF606A329;
	Tue,  3 Nov 2026 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IhcbJGA0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DD51F000C1;
	Tue,  3 Nov 2026 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689537;
	bh=b+1r9gLi57K+E9a6gov2FmCNSqgrtqoQvYMl0hImDj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IhcbJGA0MevPOfAe22ldsgewa6VtaZmZ488ytoCCojaMYOtEa5jOtS/t0oQjlF1ZP
	 vYJFmm1iTltpYovSVfSAxSCr8p0Q0x6PpzbhwfohsMBkgqrqRcvlpO8yMmDFnljo6J
	 L83ZH7zcDCKB5UgvXIxSG6VcFEVVXbrzvijwNheoqCl2yE3SUVf5FDlsSg6X62Yo+4
	 3vSwbUwqUiqup6OSvCtJBpa0b+37U0BMz6IYBGw61/KAhGTPq2i3JotVCrpJmGF9m+
	 sBFC1w2thJHHsW+u20d7UESVh7IvDtBiQzEJsOYAQK/MexNFmTI5gbmxmQx+EiMqJU
	 Xv+2aM++jR60Q==
Message-ID: <sashiko-outbox-194692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] media: i2c: it6625: add I2S audio capture DAI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-upstream-it6625-alsa-i2s-v1-4-bb91e2879b01@ite.com.tw>
References: <20261103-upstream-it6625-alsa-i2s-v1-0-bb91e2879b01@ite.com.tw>
 <20261103-upstream-it6625-alsa-i2s-v1-4-bb91e2879b01@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 07:05:36 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: i2c: it6625: it6625_dai_shutdown() cancels active rate-se=
ttle polling
- [Medium] media: i2c: it6625: it6625_audio_refresh() in DAI ops skips V4L2=
 ctrl update
--

commit 1dfd81c0e8bfaba0b855fe94b881d239f6f65287
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: it6625: add I2S audio capture DAI

This commit registers an ASoC component and I2S capture DAI for the IT6625
and IT6626 HDMI-to-MIPI bridges when #sound-dai-cells is present in the
device tree. It constrains capture streams to the currently observed HDMI
audio status, stops active streams on status changes, and polls for audio
status updates and rate settling.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 6f12a0e760178..f1bd42ad15eda 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c

[ ... ]

> @@ -2001,6 +2158,369 @@ static int it6625_v4l2_init_controls(struct v4l2_=
subdev *sd)
>  	return 0;
>  }
> =20

[ ... ]

> +static void it6625_audio_refresh_work(struct work_struct *work)
> +{
> +	struct it6625 *it6625 =3D container_of(to_delayed_work(work),
> +					     struct it6625, audio_refresh_work);
> +	unsigned long flags;
> +	bool rearm;
> +
> +	it6625_s_ctrl_audio(&it6625->sd);
> +
> +	spin_lock_irqsave(&it6625->audio_lock, flags);
> +	/* every run uses up one re-check of a settle budget */
> +	if (it6625->audio_settle_polls)
> +		it6625->audio_settle_polls--;
> +	rearm =3D (it6625->audio_substream && !it6625->audio_block) ||
> +		(it6625->audio_settle_polls && it6625_audio_settling(it6625));
> +	spin_unlock_irqrestore(&it6625->audio_lock, flags);
> +
> +	if (rearm)
> +		schedule_delayed_work(&it6625->audio_refresh_work,
> +				      msecs_to_jiffies(IT6625_AUDIO_REFRESH_MS));
> +}
> +
> +static struct it6625 *dai_to_6625(struct snd_soc_dai *dai)
> +{
> +	/* the I2C client data is the V4L2 subdev */
> +	return sd_to_6625(snd_soc_dai_get_drvdata(dai));
> +}
> +
> +static int it6625_dai_startup(struct snd_pcm_substream *substream,
> +			      struct snd_soc_dai *dai)
> +{
> +	struct it6625 *it6625 =3D dai_to_6625(dai);
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct it6625_audio_info info;
> +	unsigned long flags;
> +	u32 gen;
> +	int ret;
> +
> +	it6625_audio_refresh(it6625);

[ ... ]

> +/* also called on rollback after a successful .startup */
> +static void it6625_dai_shutdown(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct it6625 *it6625 =3D dai_to_6625(dai);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&it6625->audio_lock, flags);
> +	it6625->audio_block =3D true;
> +	spin_unlock_irqrestore(&it6625->audio_lock, flags);
> +
> +	cancel_delayed_work_sync(&it6625->audio_refresh_work);
> +	cancel_work_sync(&it6625->audio_xrun_work);
> +
> +	spin_lock_irqsave(&it6625->audio_lock, flags);
> +	it6625->audio_substream =3D NULL;
> +	it6625->audio_running =3D false;
> +	it6625->audio_block =3D false;
> +	spin_unlock_irqrestore(&it6625->audio_lock, flags);
> +}

[Severity: Medium]
Can it6625_dai_shutdown() prematurely stop rate-settle polling started by
it6625_audio_event()?

If an HDMI format or audio event occurs while a capture stream is running a=
nd
leaves audio present without a valid sampling rate, it6625_audio_event()
performs:

  it6625_audio_event()
    it6625_s_ctrl_audio()
      it6625_audio_refresh()
        it6625->audio_gen++;
        queue_work(system_wq, &it6625->audio_xrun_work);
    if (it6625_audio_settling(it6625)) {
        it6625->audio_settle_polls =3D IT6625_AUDIO_SETTLE_POLLS;
        schedule_delayed_work(&it6625->audio_refresh_work, ...);
    }

Because audio_gen was incremented, subsequent calls to it6625_dai_prepare()=
 or
it6625_dai_hw_params() return -EPIPE, so userspace has to close the capture
stream to recover.

When userspace closes the stream, it6625_dai_shutdown() runs
cancel_delayed_work_sync(&it6625->audio_refresh_work) and does not re-sched=
ule
audio_refresh_work after clearing audio_block even when
it6625->audio_settle_polls > 0 and it6625_audio_settling(it6625) is still
true. If the bridge raises no further interrupt once the rate settles, won't
ctrl_audio_sampling_rate and it6625->audio remain stuck at rate 0?

> +
> +static int it6625_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) !=3D SND_SOC_DAIFMT_CBP_=
CFP ||
> +	    (fmt & SND_SOC_DAIFMT_FORMAT_MASK) !=3D SND_SOC_DAIFMT_I2S ||
> +	    (fmt & SND_SOC_DAIFMT_INV_MASK) !=3D SND_SOC_DAIFMT_NB_NF)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int it6625_dai_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct it6625 *it6625 =3D dai_to_6625(dai);
> +	const struct it6625_audio_stream *s;
> +	unsigned long flags;
> +	int ret;
> +
> +	it6625_audio_refresh(it6625);
> +
> +	spin_lock_irqsave(&it6625->audio_lock, flags);
> +	ret =3D it6625_audio_validate_locked(it6625);
> +	s =3D &it6625->audio_accepted;
> +	if (!ret &&
> +	    (params_rate(params) !=3D it6625_audio_fs_to_rate(s->fs_code) ||
> +	     params_channels(params) !=3D s->channels ||
> +	     params_format(params) !=3D SNDRV_PCM_FORMAT_S32_LE))
> +		ret =3D -EINVAL;
> +	spin_unlock_irqrestore(&it6625->audio_lock, flags);
> +
> +	return ret;
> +}
> +
> +static int it6625_dai_prepare(struct snd_pcm_substream *substream,
> +			      struct snd_soc_dai *dai)
> +{
> +	struct it6625 *it6625 =3D dai_to_6625(dai);
> +	unsigned long flags;
> +	int ret;
> +
> +	it6625_audio_refresh(it6625);
> +
> +	spin_lock_irqsave(&it6625->audio_lock, flags);
> +	ret =3D it6625_audio_validate_locked(it6625);
> +	spin_unlock_irqrestore(&it6625->audio_lock, flags);
> +
> +	return ret;
> +}

[Severity: Medium]
Should it6625_dai_startup(), it6625_dai_hw_params(), and it6625_dai_prepare=
()
call it6625_s_ctrl_audio(&it6625->sd) instead of calling
it6625_audio_refresh(it6625) directly?

Calling it6625_audio_refresh() updates it6625->audio and increments
it6625->audio_gen when a status change is observed, but skips
it6625_audio_update_ctrls().

If an audio change that raised no interrupt is observed by
it6625_dai_startup() and causes it6625_audio_check() to fail, startup retur=
ns
an error without scheduling audio_refresh_work and without updating
ctrl_audio_sampling_rate or ctrl_audio_present. Similarly, if
it6625_dai_hw_params() or it6625_dai_prepare() observes a change and returns
-EPIPE, and userspace closes the substream before audio_refresh_work runs,
it6625_dai_shutdown() cancels audio_refresh_work and leaves the v4l2 contro=
ls
out of sync with the sample stored in it6625->audio.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-upstream-i=
t6625-alsa-i2s-v1-0-bb91e2879b01@ite.com.tw?part=3D4
