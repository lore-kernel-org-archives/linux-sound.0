Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861666;
	b=Q5LafPn+YiZdqnxteew6wWAaowM/Lm1ijuNnTr8M5Dz4/rtSvmxLdgqgptiDC24OYC9i
	 3Q+w7yv8ZDuThMw9wGB8WRXzSchi4HnjBoHd4oQwvY92R0/Bcb+II5+a16cpG1xmiAQIY
	 yPTq6KIuhs6Pz3HXZ6z0xH/zXWms3J+DoDXigNVY/87uMHJacqjKw/8P/+v9SmC4P1VZB
	 /3hcli4LDwa99EO96Rhmo1elMH3jlI4yMD3uk6kFW6EHxdWDvAovoeCiCTKIPVw/W6vaI
	 L/gzT1MOaeNB6KIi6Wp2UCt66UTOczSH9tTtbqvl/iEI2jfRHqIwnBPjL6CuEsvB5WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861666;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5DbAov0XRFTd1fDQTl1wxtq71IOWp/jxea8e/6PSGcw=;
	b=hn2vCTf3m/O9mA8+/Po4vbAqnsD+kX4eA1cajbcUKmJPORgg2A7SXWBbHcCyilOWPinK
	 2bg9mUmhGS4X6UUtU9cVoEpiurX5B7DlBAZ71VgQ091PKAmwOYL54h511RVPAHBA+TIzk
	 hzlX9oPvOkqxuK+i7eOR+lfz4pqFkCJ+xRF9+pbiJBZA6Oo4DBovUrCr6jUdRnFYG2BdN
	 wmb5KJoxYG+oB58N0cbLhwJq/bL/O/icB95kP38OlI90FLewuNSWTKQzr062MoTfplJEv
	 WTDwvckRFaXTcrEdtit8UGrjGEmYWMkLpUF+kFKSe/jLY1D07qWBvn24bd9FrwcsFNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5gBSWFJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB41606A89D
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5gBSWFJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D631F000CB;
	Mon, 16 Nov 2026 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794861666;
	bh=5DbAov0XRFTd1fDQTl1wxtq71IOWp/jxea8e/6PSGcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5gBSWFJ5GBDC0oWfi5rsetnUxnAeG4ZU7Rdq+oMYGMxtVS3XdNKaqHpRP+BLLuOg
	 svuDbDV/geOl1qYs5zhl2rrJmtSgkPPbGMpDU/7B2b4GWJi74shxZia9+vEIB046oo
	 9nCD+d/3EDeeJ1WhfEA6Z/zgZO5HCZSxSdewyJ6BGxZeSsPVzTfH2Utl/pmc9WJIQb
	 1f5j8ZZnSZOWAa4vOAFhtxSJQwU5F3Tp4SDOuVzQWu8WJee0tU0LHPjsbtzCmiwBIN
	 6aYbQnZyryt3tgpnuV/mi41KJ5yjLrHWkSDR6MuAUfzQFRm+OtmxlNvxgirCZ7LVmy
	 i5yTKUbh0JcNA==
Message-ID: <sashiko-outbox-217669@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: apply volume changes to a
 running graph
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Herrero" <marcht@proton.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261116-q6apm-vol-live-v2-1-fbeba4402984@proton.me>
References: <20261116-q6apm-vol-live-v2-1-fbeba4402984@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 20:41:05 +0000
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
- [Medium] ASoC: qcom: audioreach: race in
  audioreach_put_vol_ctrl_audio_mixer()
--

commit ddae8fd71fb67b8ccdf92f805eed45f2ce14176d
Author: Marc Herrero <marcht@proton.me>

ASoC: qcom: audioreach: apply volume changes to a running graph

This commit sends volume updates from audioreach_put_vol_ctrl_audio_mixer()
directly to the DSP when the widget is powered and its graph is started,
holding the DAPM mutex across the check and update.

> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 8e3314a2738c0..034d42edde22c 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -839,6 +839,19 @@ int q6apm_graph_stop(struct q6apm_graph *graph)
>  }
>  EXPORT_SYMBOL_GPL(q6apm_graph_stop);
> =20
> +bool q6apm_is_graph_started(struct q6apm *apm, uint32_t graph_id)
> +{
> +	struct audioreach_graph *graph;
> +	bool started;
> +
> +	mutex_lock(&apm->lock);
> +	graph =3D idr_find(&apm->graph_idr, graph_id);
> +	started =3D graph && graph->start_count > 0;
> +	mutex_unlock(&apm->lock);
> +
> +	return started;
> +}

[ ... ]

> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topol=
ogy.c
> index 612d8f03e6e98..956f8e9e6a762 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1322,11 +1322,33 @@ static int audioreach_put_vol_ctrl_audio_mixer(st=
ruct snd_kcontrol *kcontrol,
>  					       struct snd_ctl_elem_value *ucontrol)
>  {
>  	struct snd_soc_dapm_widget *dw =3D snd_soc_dapm_kcontrol_to_widget(kcon=
trol);
> +	struct snd_soc_component *c =3D snd_soc_dapm_to_component(dw->dapm);
>  	struct audioreach_module *mod =3D dw->dobj.private;
> +	struct q6apm *apm =3D dev_get_drvdata(c->dev);
> +	long gain =3D ucontrol->value.integer.value[0];
> +	int ret =3D 0;
> =20
> -	mod->gain =3D ucontrol->value.integer.value[0];
> +	/*
> +	 * The PGA event applies the gain when the widget powers up. Hold the
> +	 * DAPM lock so the power state cannot change under us: either the
> +	 * event sees the new gain or it is sent here. The DSP only accepts
> +	 * the parameter once the graph holding the module has been started.
> +	 * Keep the old gain if the DSP did not take the new one, so that
> +	 * writing the same value again retries.
> +	 */
> +	snd_soc_dapm_mutex_lock(dw->dapm);
> +	if (mod->gain !=3D gain) {
> +		if (dw->power &&
> +		    q6apm_is_graph_started(apm, mod->container->sub_graph->info->id))
> +			ret =3D audioreach_gain_set_vol_ctrl(apm, mod, gain);
> +		if (!ret) {
> +			mod->gain =3D gain;
> +			ret =3D 1;
> +		}
> +	}
> +	snd_soc_dapm_mutex_unlock(dw->dapm);
> =20
> -	return 1;
> +	return ret;
>  }

[Severity: Medium]
Can audioreach_put_vol_ctrl_audio_mixer() still race with
q6apm_dai_prepare() or q6apm_dai_close() because graph start and stop
do not hold the DAPM lock or synchronize start_count under apm->lock?

CPU0                                  CPU1
q6apm_dai_prepare()
  q6apm_graph_stop()
    --ar_graph->start_count; (0)
                                      audioreach_put_vol_ctrl_audio_mixer()
                                        snd_soc_dapm_mutex_lock(dw->dapm)
                                        dw->power is 1
                                        q6apm_is_graph_started() -> false
                                        mod->gain =3D gain;
                                        snd_soc_dapm_mutex_unlock(dw->dapm)
  ...
  q6apm_graph_start()
    ar_graph->start_count++; (1)
  ...
  snd_soc_dapm_stream_event(START)
    /* dw->power already 1:
       POST_PMU does not run */       <-- DSP keeps old gain

When an active stream is re-prepared (for example after XRUN or stop),
q6apm_dai_prepare() stops the graph while dw->power stays 1 across several
DSP IPCs before restarting it.  A volume change in that window sees
q6apm_is_graph_started() return false and only updates mod->gain; because
dw->power is already 1, SND_SOC_DAPM_POST_PMU never fires again, leaving
the running graph at the old volume while mod->gain =3D=3D gain blocks retr=
ies
of the same value.

Conversely, during shutdown, dpcm_fe_dai_shutdown() runs q6apm_dai_close()
-> q6apm_graph_stop() and q6apm_graph_close() before
dpcm_dapm_stream_event(SND_SOC_DAPM_STREAM_STOP) takes the DAPM lock and
clears dw->power.  If q6apm_is_graph_started() returns true just before the
graph stops and closes, audioreach_gain_set_vol_ctrl() fails on the DSP
(-EINVAL) and discards the new gain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-q6apm-vol-=
live-v2-1-fbeba4402984@proton.me?part=3D1
