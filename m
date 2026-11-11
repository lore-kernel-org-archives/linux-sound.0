Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406827;
	b=XLfgGQhxRVAs2OnYdkMike+L4yfNkYnxstodQcXNW9WxYxsdzSm42w2zrnRBD6pIQPEl
	 hBt4GCsJLJRe4XyhQPYLjzuYGqXm7CU0N+/opOnmDizp+iCxqPU8EHRfkxAQqPqz9NkBQ
	 3VugAQLdAFlWymqT24dv7dbzH7tOrY/++oJeXnuPQLT88FlgFniidOxqn5LnQAlDg3fWb
	 /YEMV1OOxyqQrr32FzNv38RGAVbeGoP5kKnPIHHUPwZopXI8Tcq6mZBSVc26vhsB23iqy
	 evjJPjMADcCQkvUd0pBzmeUKpU65/jybcSR27SJPCe3T6u3Ylj+fRk5IzVQ0FMyaGvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406827;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5rd/ZgaFry67M6PLWTcPSLzgcLzvVQNRPREBMrMuuas=;
	b=3xKHtDRP6tSMMg2g5Al6IWdwaZyB0p/iaaZND2wEy+gQ64MatWn1oGj66eHT6AK9hDy6
	 jpgY68zxrh82OPc0Xsi4vspvelkO1KyGCNnoBavOwDqiYByaBHDbmGo5vYfD74aRv5+ZV
	 MyYojfWc88d4x2dNLR6TdHJJkcB8eSvaHGFmxy/03im8vGZTUtpcadshXyyRXspefuipp
	 PvqTHgACm5xNWGVdtgIqx9SyRjs52n3IH/ZiZI57DPU/uzZHOMdg23SmsZyxSBr/H6Nnz
	 gzIUsw0JFz+hs4P0Fjo8JbC0HilVvwLqSQPQYQe0585PY9ljJLveD4QG+Jj99v/eUtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isCNWcJh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4B8606A330
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isCNWcJh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FFC1F00A07;
	Wed, 11 Nov 2026 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794406827;
	bh=5rd/ZgaFry67M6PLWTcPSLzgcLzvVQNRPREBMrMuuas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=isCNWcJhCy2EY8ua5LlEkU2HEiHn2tmlHNYVycvKMlciQfhsabypnPF1iCRh/OemO
	 HSrRR7vy1+TBNouFrcoHl61WuAh5ovLhS+c903I9l/6RmA/qpLhN46JHcK5ChyNnqD
	 ATdPFVgoDblgpA1Do8Wv3i22PhDwM1qw8TWgUvR9d2ZFMgtSC84TUcRrP/6I7ubHGe
	 e6XDnkeJtx0PWneefJWcV5kCOqaEJzH8YoxcOYFUs+iu7HifXa0lZnl+GcIvbkuWjk
	 pYZDrtLpgk135VwYYBPmAW9ckAy1AmXYaLn0EcOlUANQd63Ttijr+JiFi1QOz+4zV/
	 XGp6qLi9pYlnw==
Message-ID: <sashiko-outbox-209146@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: qcom: audioreach: apply volume changes to a
 running graph
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Herrero" <marcht@proton.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261111-q6apm-vol-live-v1-1-be85eef649c1@proton.me>
References: <20261111-q6apm-vol-live-v1-1-be85eef649c1@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 14:20:26 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: qcom: audioreach: unchecked error from
  audioreach_gain_set_vol_ctrl()
- [Medium] ASoC: qcom: audioreach: unlocked dw->power and gain update in
  mixer put
--

commit dc9672b8329eabe445c390fc81928bbbadffdb8a
Author: Marc Herrero <marcht@proton.me>

ASoC: qcom: audioreach: apply volume changes to a running graph

This commit sends mixer volume changes to the DSP immediately when the
DAPM widget is powered and returns 0 when the requested gain matches the
stored value.

> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topol=
ogy.c
> index 612d8f03e6e98..5b3378fd29fce 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1323,8 +1323,19 @@ static int audioreach_put_vol_ctrl_audio_mixer(str=
uct snd_kcontrol *kcontrol,
>  {
>  	struct snd_soc_dapm_widget *dw =3D snd_soc_dapm_kcontrol_to_widget(kcon=
trol);
>  	struct audioreach_module *mod =3D dw->dobj.private;
> +	long gain =3D ucontrol->value.integer.value[0];
> =20
> -	mod->gain =3D ucontrol->value.integer.value[0];
> +	if (mod->gain =3D=3D gain)
> +		return 0;
> +
> +	mod->gain =3D gain;
> +
> +	/* The PGA event only applies the gain when the widget powers up */
> +	if (dw->power) {

[Severity: Medium]
Can a volume update race with DAPM widget power-up without
snd_soc_dapm_mutex_lock(dw->dapm) and leave the DSP programmed with a
stale gain?

snd_ctl_elem_write() calls audioreach_put_vol_ctrl_audio_mixer() under
card->controls_rwsem, whereas DAPM power sequencing runs under
card->dapm_mutex.  audioreach_gain_set_vol_ctrl() writes the passed vol
argument into the packet before q6apm_send_cmd_sync() takes apm->lock:

CPU0                                  CPU1
dapm_seq_run_coalesced()
  dw->power =3D 1
  ...
  audioreach_pga_event()
    vol =3D mod->gain (old)
                                      audioreach_put_vol_ctrl_audio_mixer()
                                        mod->gain =3D gain (new)
                                        if (dw->power)
                                          audioreach_gain_set_vol_ctrl()
                                            q6apm_send_cmd_sync(new)
    audioreach_gain_set_vol_ctrl()
      q6apm_send_cmd_sync(old)  <-- overwrites DSP gain with old value

After this, the DSP holds the old gain while mod->gain holds the new
value, and retrying the same target volume returns 0 without updating the
DSP.  Taking snd_soc_dapm_mutex_lock(dw->dapm) around the mod->gain
update, dw->power check, and audioreach_gain_set_vol_ctrl() call would
serialize this with DAPM power sequencing.

> +		struct snd_soc_component *c =3D snd_soc_dapm_to_component(dw->dapm);
> +
> +		audioreach_gain_set_vol_ctrl(dev_get_drvdata(c->dev), mod, gain);
> +	}
> =20
>  	return 1;

[Severity: Medium]
Should audioreach_put_vol_ctrl_audio_mixer() check and propagate errors
from audioreach_gain_set_vol_ctrl()?

audioreach_gain_set_vol_ctrl() can fail with -ENOMEM when allocating the
GPR command packet or with a negative errno from q6apm_send_cmd_sync().
Ignoring the failure reports success to userspace and leaves mod->gain set
to the new value while the DSP keeps the old gain, so later writes of the
same volume hit the mod->gain =3D=3D gain check and return 0 without retryi=
ng.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-q6apm-vol-=
live-v1-1-be85eef649c1@proton.me?part=3D1
