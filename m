Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519188;
	b=P7kyeJlycHLJCHAH+1w9Wf2NMkowJ915CHKB7tSHD/68T65dHg6vPprFDde6KFs7eeIY
	 vgUOBpd28GD8qldHLh9qGtyTaf6mEeLWNiveKv1/e7Li108gzpgp5mIMcO8sOmAPDeSgP
	 RRC00krmy+YgLFBT2wJyu7QJtGio+UxMu6eQG+aSxiNIFncH1/8c2MGtaQLNJoMPV0yOc
	 NaZdE99FT97sLd8iwNPn5LKAh01EoS9IZkKk1raLpR5QlWCN0kNJJTEf6AhTjWE+r7cQx
	 /4K6v5kIEjhKGuvDBrZDvqfCpyPv4VkfxGIgqdek8OZ1WeDovZgiB5STUCu9XcjvwOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NFr05gBo4qqcg0phi0Ajp/SX8mCHAtGJ/pmxcb2dels=;
	b=jiLYg2vyQedd/v+5xEzakfJlszfBfCf72Ld4UZ8LxP9+arP/7CoDtiiYfJVisNpWcGHk
	 uk7O8MyXKvbmIDRvPLuimN8Xr2jMY+7UWlB9lEHqe4B9h/4JcKDEZwSXkFGliS8kK0NJb
	 v4aX30jM/ds3j+7B/v+7CR041NhD/6vHjplYSZeA9DS9nKe8A/o5tw48sZt6PTNZd/0pR
	 B5z2ebs/sqF7AiA9rtbyDfcQrGFr6nTT16FFyyBtwIDrni7zjsV2xTRhlrjFmrNcuYmLM
	 GYKm4B289Wt6KTcVzt7h3vFt5bJ/6yQcV/1B63P99BTl9MVqzbVt+RSBIPqlfEhfXwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nRGrL15P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FEA606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nRGrL15P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21321F000CF;
	Tue, 24 Nov 2026 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519188;
	bh=NFr05gBo4qqcg0phi0Ajp/SX8mCHAtGJ/pmxcb2dels=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nRGrL15PeGWhKHOIQcL/Qjjm6Q6mZHxGOua+Dok5I2BOtBHyOkrPVxBbWq+PhRn/o
	 y7Kp7SgiT3+A/rw2i+DOdah0nmwBkJsP1QQZiFos+IJZly+NcJKz/91ioqobklIZoV
	 cmnRYbfaiHZaYbPFwou0GWgAWhTnFZDap8liZZ0ZEBSXIRxMyoQZmwiDHjObOKSOxt
	 VTWOQKOTv9HGJsQVeboQGMfZWBVf2wXtdRrw80tvzGYmTgLNpjJV1y02pRtlccFYRA
	 96y//3Od3mw88mFt1gwdPfj6pzB+PRVY3R2dEwIwzFtW6ZwPLzOit8XojO9RovoDeg
	 6liz779OmFRVg==
Message-ID: <sashiko-outbox-231036@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] ASoC: qcom: x1e80100: Allow userspace WSA RX
 chmap override
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-4-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
 <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-4-1197ac8eacd2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:19:47 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] ASoC: qcom: x1e80100: wsa_prepared left true on
  x1e80100_snd_prepare() error
- [Medium] ASoC: qcom: x1e80100: 6-channel WSA playback fails in
  AudioReach prepare
- [Low] ASoC: qcom: x1e80100: unvalidated 5-channel map in
  x1e80100_wsa_chmap_ctl_put()
--

commit 4f20a2b7a20905953c2178f9804669a43500020c
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

ASoC: qcom: x1e80100: Allow userspace WSA RX chmap override

This commit adds writable ALSA channel map controls for the WSA RX
backends so userspace can override the default channel slot mapping, and
extends the maximum WSA channel count to six for Glymur.

> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index c927672eaede7..4fe86ec062c40 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -15,14 +16,151 @@
>  #include "qdsp6/q6dsp-common.h"
>  #include "sdw.h"
> =20
> +#define X1E80100_WSA_MAX_CHANNELS	6
> +#define X1E80100_WSA_PORTS		2
> +
>  struct x1e80100_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
>  	struct snd_soc_card *card;
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack dp_jack[8];
>  	bool jack_setup;
> +	/* Protects the WSA channel map state below */
> +	spinlock_t wsa_chmap_lock;
> +	/* Userspace-selected SNDRV_CHMAP_* positions, 0 means unset */
> +	unsigned int wsa_chmap[X1E80100_WSA_PORTS][X1E80100_WSA_MAX_CHANNELS];
> +	/* Channel count of the last prepared stream */
> +	unsigned int wsa_channels[X1E80100_WSA_PORTS];
> +	bool wsa_prepared[X1E80100_WSA_PORTS];
> +};
> +
> +/* Default WSA RX channel maps, indexed by channel count */
> +static const unsigned int
> +x1e80100_wsa_default_chmap[X1E80100_WSA_MAX_CHANNELS + 1][X1E80100_WSA_M=
AX_CHANNELS] =3D {
> +	[1] =3D { SNDRV_CHMAP_MONO },
> +	[2] =3D { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR },
> +	[3] =3D { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR, SNDRV_CHMAP_FC },
> +	[4] =3D { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL, SNDRV_CHMAP_FR, SNDRV_CHMAP_R=
R },
> +	[6] =3D { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR, SNDRV_CHMAP_RL,
> +		SNDRV_CHMAP_RR, SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE },
>  };

[Severity: Medium]
Can a 6-channel WSA playback stream succeed on AudioReach?

x1e80100_snd_build_wsa_slots() only uses a 6-channel map when
substream->runtime->channels is 6, and x1e80100_be_hw_params_fixup() leaves
the channel count unchanged for WSA_CODEC_DMA_RX_0 and WSA_CODEC_DMA_RX_1.
When a 6-channel stream is prepared, q6apm_dai_prepare() and
q6apm_lpass_dai_prepare() pass num_channels =3D=3D 6 into
audioreach_shmem_set_media_format() and audioreach_pcm_set_media_format(),
both of which reject num_channels > 4 with -EINVAL (and
audioreach_set_default_channel_mapping() only populates 1, 2 and 4
channels):

sound/soc/qcom/qdsp6/audioreach.c:audioreach_pcm_set_media_format() {
    ...
	if (num_channels > 4) {
		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
		return -EINVAL;
	}
    ...
}

[ ... ]

> +static int x1e80100_wsa_chmap_ctl_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int map[X1E80100_WSA_MAX_CHANNELS];
> +	struct x1e80100_snd_data *data;
> +	bool changed =3D false;
> +	int i, idx;
> +
> +	data =3D x1e80100_wsa_chmap_kcontrol_data(kcontrol, &idx);
> +	if (!data)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
> +		map[i] =3D ucontrol->value.integer.value[i];
> +
> +		if (map[i] && qcom_snd_chmap_to_q6(map[i]) < 0)
> +			return -EINVAL;
> +
> +		/* Unset positions are allowed only as a suffix of the map */
> +		if (map[i] && i && !map[i - 1])
> +			return -EINVAL;
> +	}

[Severity: Low]
Should x1e80100_wsa_chmap_ctl_put() reject a 5-channel map?

Because x1e80100_wsa_default_chmap[5][0] is 0,
x1e80100_snd_build_wsa_slots() rejects 5-channel streams with -EINVAL and
falls back to the default map for any other channel count.  However,
x1e80100_wsa_chmap_ctl_put() accepts and stores a 5-element map, causing
x1e80100_wsa_chmap_ctl_get() to report a map that can never be applied.

[ ... ]

> @@ -109,29 +247,43 @@ static int x1e80100_be_hw_params_fixup(struct snd_s=
oc_pcm_runtime *rtd,
>  	return 0;
>  }
> =20
> -static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
> +static int x1e80100_snd_build_wsa_slots(struct x1e80100_snd_data *data,
> +					unsigned int dai_id,
> +					unsigned int channels,
> +					unsigned int *rx_slot)
>  {
> +	unsigned int map[X1E80100_WSA_MAX_CHANNELS];
> +	unsigned int i, set =3D 0;
> +	int idx;
> +
> +	idx =3D x1e80100_wsa_port_index(dai_id);
> +	if (idx < 0)
> +		return idx;
> +
> +	if (channels > X1E80100_WSA_MAX_CHANNELS ||
> +	    !x1e80100_wsa_default_chmap[channels][0])
>  		return -EINVAL;
> +
> +	scoped_guard(spinlock, &data->wsa_chmap_lock) {
> +		memcpy(map, data->wsa_chmap[idx], sizeof(map));
> +		data->wsa_channels[idx] =3D channels;
> +		data->wsa_prepared[idx] =3D true;
> +	}

[ ... ]

> @@ -143,13 +295,14 @@ static int x1e80100_snd_prepare(struct snd_pcm_subs=
tream *substream)
>  	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
>  	struct x1e80100_snd_data *data =3D snd_soc_card_get_drvdata(rtd->card);
>  	unsigned int channels =3D substream->runtime->channels;
> -	unsigned int rx_slot[4];
> +	unsigned int rx_slot[X1E80100_WSA_MAX_CHANNELS];
>  	int ret;
> =20
>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
> -		ret =3D x1e80100_snd_hw_map_channels(rx_slot, channels);
> +		ret =3D x1e80100_snd_build_wsa_slots(data, cpu_dai->id,
> +						   channels, rx_slot);
>  		if (ret)
>  			return ret;
> =20
>  		ret =3D snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
>  						  channels, rx_slot);
>  		if (ret)
>  			return ret;
>  		break;
>  	default:
>  		break;
>  	}
> =20
>  	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->=
id]);
>  }

[Severity: Medium]
Does x1e80100_snd_prepare() leave data->wsa_prepared[idx] set to true if
snd_soc_dai_set_channel_map() or qcom_snd_sdw_prepare() fails?

dpcm_fe_dai_prepare() does not call dpcm_be_dai_hw_free() when backend
prepare fails, so data->wsa_prepared[idx] stays true while the stream
remains in SNDRV_PCM_STATE_SETUP, and subsequent writes to the channel map
control via x1e80100_wsa_chmap_ctl_put() fail with -EBUSY until hw_free or
close.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-sound-q=
com-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com?part=
=3D4
