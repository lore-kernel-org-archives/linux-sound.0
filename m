Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944897;
	b=iHog0ddp4WmTUuGJviPb2YRBBFJHoFeLYc4A8KdPi1QyKfy190CoURmAe6z6+QxqSGwy
	 FA3Ow6M/G7kBhnQJ0YFlvMJ1gc7NEwHGugW0T8TDqpxa54GTx2+qW2SUcAJZM41bAnGnq
	 h2HuC6rHtr84cOTKHh5hu1dHZ2rNsDKOBD8gmw+s0P2AVM+LIJ9nHpo+HlPbZw1g6rmX4
	 XzszMTIK4a0I/6tUiDfy84WQAo1H857RiF+7kyxKP+Obv5+IoFiMTBEYVodblSENdmJ+o
	 Z//rMs1uwOFgtdnC5gNeYIcUpK9dfTWtMOWTSDp72ey8WaVgszWyvl1yihL+ujSA7aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944897;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BpiLW0Gtyw8aB8MRw9BmN1OrAZGAqQ5nvE9QTenCbUc=;
	b=DABv5rTKS8Nyzh2LFPkPDLWU4bbGQmSgif5ahN/cU53K9GcOa5HyqQDlam5gTUM8BjZf
	 RfhqtN/bUMgW3B8K35+Gbo0Zcx2RXtNeL7tMjTESER9QRIx1BXf2XowGU/jq6z6+pligw
	 oIYTfZhXSy5AmD7rHgLu8aZjuiQXzZgBaZGZ0q8U/GegI+TLVJTiXm7Fom1lBD+KauxBU
	 NHBEAe2Uww9j35xFi15Ox1YBaSgWio3Nsqp8vT/WkSZhpsZVK7wZKkojoOjqK4NF0b3gs
	 PdliRgxbmXLADi4xr4MkZEaeIRCT0YglJXeOldVfo8F2FjWKeJhI8Yqw1bcC3K4sGkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJR+Un1+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ABF606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 06:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJR+Un1+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7D71F0089F;
	Fri,  6 Nov 2026 06:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793944897;
	bh=BpiLW0Gtyw8aB8MRw9BmN1OrAZGAqQ5nvE9QTenCbUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OJR+Un1+PRQ3TW0QQBo2rPq4qAtRe3+2PO5qC34cBAsBQ7TloggBerY0k1ZKNfL7o
	 O5jxfl8CoXuruh6fd+Ep7rf+/P16y884housgi3mJsL1dyLcj0MxBY7Rz0n2RQ7WDK
	 v7+acIpEtlYtsB8AKKz9X2KBsusOqe+azTnl4FAbT+wSWR2Xs2blj5ynKthGv8uLm4
	 CvKc2bBFJ4fzmjoDMNzpt1wqfFGw9NbcqV0TiAE+PMbnqi8af2skByrIcT/lMPalvV
	 SfyX3EFX7BfU+7eg7EfJgTtD/SvKnFysotogm3w2JDID2VzjbEjs6vhUkOY44PE1zv
	 nxcTb8Kmq6X9A==
Message-ID: <sashiko-outbox-200876@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: x1e80100: recreate the headset jack on
 card rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tyler Baker" <tyler.baker@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106054333.2748248-3-tyler.baker@oss.qualcomm.com>
References: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
 <20261106054333.2748248-3-tyler.baker@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 06:01:36 +0000
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
- [High] ASoC: qcom: x1e80100: missing DP jack cleanup in
  x1e80100_snd_exit()
--

commit f605374e23a64b3505524d6591f1d001a229a2a3
Author: Tyler Baker <tyler.baker@oss.qualcomm.com>

ASoC: qcom: x1e80100: recreate the headset jack on card rebind

This commit adds a DAI link exit callback for x1e80100 to clean up the
headset jack and reset jack_setup on card unbind.

> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index c81df41ace883..213d7f45198cb 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -68,6 +68,23 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtim=
e *rtd)
>  	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }
> =20
> +static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct x1e80100_snd_data *data =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case DISPLAY_PORT_RX_0:
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		return;
> +	default:
> +		break;
> +	}

[Severity: High]
Does returning early for DisplayPort links leave hdmi_codec_priv->jack
pointing to data->dp_jack[dp_pcm_id] after snd_card_free() frees its
underlying struct snd_jack?

On card rebind, snd_soc_bind_card() runs soc_probe_link_components()
before soc_init_pcm_runtime() calls x1e80100_snd_init() to recreate
dp_jack->jack.  During soc_probe_link_components(), hdmi_probe() calls
drm_connector_hdmi_audio_hook_plugged_cb(), which synchronously invokes
hdmi_codec_jack_report():

sound/soc/codecs/hdmi-codec.c:hdmi_codec_jack_report() {
    ...
	if (jack_status !=3D hcp->jack_status) {
		if (hcp->jack)
			snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_AVOUT);
		hcp->jack_status =3D jack_status;
	}
}

If the DisplayPort plug state changed while the card was unbound,
snd_soc_jack_report() dereferences the freed dp_jack->jack (use-after-free).
Calling qcom_snd_headset_jack_cleanup(rtd) before returning for the
DisplayPort links clears hcp->jack on unbind.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106054333.2748=
248-1-tyler.baker@oss.qualcomm.com?part=3D2
