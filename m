Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944412;
	b=qgukdgUypoYYvFOGhOEQZnvv5jENKOvpT0UAqoZDp4FDlfra3q478hVy4CIssusXyo3e
	 EidNvGMQVSyT4ScqKnHaj9peuraISIIDND4bAZ5kwd4I1sy23lMa+nHDua9FIYar+ut4o
	 bh1FNnOb2OekGxM/Ss3PK5gN3JdYN71PD8fzay92DNa5KqeEUwt98QZGpLpSheyuJulYq
	 YeDIyznM7a3k1KmC0EYgrrMz++sPQHQ+O4gexGEeEJsTTDsYaabXt3yDKqqFz8q20GaGs
	 +sulHshgBr/pH4ACQ+SrP9YPpudv3hXgjujvKchY9JmmDt2iU9NaUul6qd4hrGJDhJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dOli5h5mh2Zr4318xKkoQ/pFT+yqIoSSqnAmb9+dB0M=;
	b=nPB80ui4ZRtYgi9+9N5MwRO6CO5d6NQRcE9uBN63secq/VmpWYSX6hvXzHheLq87/9gg
	 4d6aPRo5ubiCReOjF+bFcOBBHCF6Lvz/rsZYnsUkGTxyhclEeOxiejhwrwdcG4hlimkQd
	 8ZmG6hThX9GHULgnNrPOyhvbrqJgtEHGCIoDpKg/xLlegpCZjbUtZxLLuhPCtScstUvKj
	 8L5yWEge5c0CMeATsh0vcH44ZnUYdmY+8kVose+P1QydS4Icw7XOQsZpuJw8FNSeCssbd
	 TpQBRwNqiFlwJ7+mT9Wz7hH9fisKEg0BhY5Tl4BEGQjjqCnNRPoqP+3m2LdTPlV5mFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fNEy6t7n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066C2606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fNEy6t7n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EA01F0089F;
	Fri,  6 Nov 2026 05:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793944411;
	bh=dOli5h5mh2Zr4318xKkoQ/pFT+yqIoSSqnAmb9+dB0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fNEy6t7nIL/qMJiudfWicn3c6W1hmXmTQ1TQyA7B8w5m8//lCjIgVrLFMbOTggN1n
	 bDKU09Tp7jbj5zYxjCHfKIt1vTI/7o+xo6XU5E+2xm0M0NP/z/Zy8sJRYPYEnxl4nb
	 zJ+AD722KJlnw7Bt1ewR/WgS+JDrzp9x+DqxvhrMfXKKQKeuaINuXfots89zUp4Cxa
	 P1Y2p1e6ww7Yhn/5JofOvv6YbAtBhhyE94EasV2DpBP3BJI6btOHThoHPZzNEduiG7
	 pSneqXXQxqddmHA6SwxOq3lJ/nDzKR8eXFqJ0YJUCKDhu3+uuVxNIJdc+zN73apJa/
	 K4hUOCCZ1qsMQ==
Message-ID: <sashiko-outbox-200870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] ASoC: qcom: x1e80100: Allow userspace WSA RX
 chmap override
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-3-29e06613115f@oss.qualcomm.com>
References: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
 <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-3-29e06613115f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:53:31 +0000
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
- [Medium] ASoC: qcom: x1e80100: channel map truncation in
  x1e80100_snd_build_wsa_slots()
- [Medium] ASoC: qcom: x1e80100: 6-channel WSA playback fails in
  AudioReach prepare
- [Medium] ASoC: qcom: x1e80100: TOCTOU race on wsa_chmap in
  x1e80100_snd_build_wsa_slots()
--

commit 6a0b312ac836c9b0665e198b3ecffb015e2de776
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

ASoC: qcom: x1e80100: Allow userspace WSA RX chmap override

This commit adds writable ALSA channel map controls for the WSA RX
backends so userspace can override the default Q6 slot mapping, and
extends the WSA channel count up to six channels.

> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index c81df41ace883..6a91b3581c756 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -15,14 +15,117 @@
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
> +	/* Userspace-selected SNDRV_CHMAP_* positions, 0 means unset */
> +	unsigned int wsa_chmap[X1E80100_WSA_PORTS][X1E80100_WSA_MAX_CHANNELS];
>  };

[ ... ]

> +static int x1e80100_wsa_chmap_ctl_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int *map =3D x1e80100_wsa_chmap_from_kcontrol(kcontrol);
> +	bool changed =3D false;
> +	int i;
> +
> +	if (!map)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
> +		unsigned int pos =3D ucontrol->value.integer.value[i];
> +
> +		if (pos && qcom_snd_chmap_to_q6(pos) < 0)
> +			return -EINVAL;
> +
> +		if (map[i] !=3D pos)
> +			changed =3D true;
> +	}
> +
> +	if (!changed)
> +		return 0;
> +
> +	for (i =3D 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
> +		map[i] =3D ucontrol->value.integer.value[i];
> +
> +	return 1;
> +}

[ ... ]

> @@ -113,6 +218,14 @@ static int x1e80100_snd_hw_map_channels(unsigned int=
 *ch_map, int num)
>  		ch_map[2] =3D PCM_CHANNEL_FR;
>  		ch_map[3] =3D PCM_CHANNEL_RB;
>  		break;
> +	case 6:
> +		ch_map[0] =3D PCM_CHANNEL_FL;
> +		ch_map[1] =3D PCM_CHANNEL_FR;
> +		ch_map[2] =3D PCM_CHANNEL_LB;
> +		ch_map[3] =3D PCM_CHANNEL_RB;
> +		ch_map[4] =3D PCM_CHANNEL_FC;
> +		ch_map[5] =3D PCM_CHANNEL_LFE;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}

[Severity: Medium]
Can a 6-channel WSA playback stream succeed when prepared through
AudioReach?

x1e80100_be_hw_params_fixup() leaves the channel count unchanged for
WSA_CODEC_DMA_RX_0 and WSA_CODEC_DMA_RX_1, so a 6-channel stream runs with
num_channels =3D=3D 6 on both the frontend (q6apm_dai_prepare()) and backend
(q6apm_lpass_dai_prepare()).  However, the AudioReach media format helpers
reject anything above 4 channels with -EINVAL, and
audioreach_set_default_channel_mapping() only populates 1, 2 and 4
channels:

sound/soc/qcom/qdsp6/audioreach.c:audioreach_pcm_set_media_format() {
    ...
	if (num_channels > 4) {
		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
		return -EINVAL;
	}
    ...
}

As a result, preparing a 6-channel WSA stream fails with -EINVAL in
audioreach_shmem_set_media_format() and audioreach_pcm_set_media_format().

> @@ -120,19 +233,56 @@ static int x1e80100_snd_hw_map_channels(unsigned in=
t *ch_map, int num)
>  	return 0;
>  }
> =20
> +static int x1e80100_snd_build_wsa_slots(struct x1e80100_snd_data *data,
> +					unsigned int dai_id,
> +					unsigned int channels,
> +					unsigned int *rx_slot)
> +{
> +	unsigned int i, set =3D 0;
> +	unsigned int *user;
> +	int idx;
> +
> +	idx =3D x1e80100_wsa_port_index(dai_id);
> +	if (idx < 0)
> +		return idx;
> +
> +	if (channels > X1E80100_WSA_MAX_CHANNELS)
> +		return -EINVAL;
> +
> +	user =3D data->wsa_chmap[idx];
> +	for (i =3D 0; i < channels; i++)
> +		if (user[i])
> +			set++;
> +
> +	/* Fall back to the default map unless userspace set all channels */
> +	if (set !=3D channels)
> +		return x1e80100_snd_default_wsa_slots(rx_slot, channels);

[Severity: Medium]
Does x1e80100_snd_build_wsa_slots() truncate a wider userspace channel map
when a stream with fewer channels is prepared?

The loop only counts non-zero entries in user[0 .. channels - 1] and does
not check whether user[channels .. X1E80100_WSA_MAX_CHANNELS - 1] are also
set.  If UCM configures a 4-channel speaker map such as [FL, RL, FR, RR,
0, 0] at card init and a 2-channel stereo stream is later played, set is 2
(matching channels), so x1e80100_snd_build_wsa_slots() applies the first
two entries [FL, RL] instead of falling back to
x1e80100_snd_default_wsa_slots(), routing both stereo channels to the left
speakers.  Conversely, x1e80100_wsa_chmap_ctl_put() accepts sparse maps
with zeroed slots below X1E80100_WSA_MAX_CHANNELS that
x1e80100_snd_build_wsa_slots() then silently ignores.

> +
> +	for (i =3D 0; i < channels; i++) {
> +		int q6 =3D qcom_snd_chmap_to_q6(user[i]);
> +
> +		if (q6 < 0)
> +			return q6;
> +		rx_slot[i] =3D q6;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Can a concurrent control write race with x1e80100_snd_build_wsa_slots() on
data->wsa_chmap[idx] and cause x1e80100_snd_prepare() to fail with
-EINVAL?

x1e80100_wsa_chmap_ctl_put() updates data->wsa_chmap[idx] under
controls_rwsem, while x1e80100_snd_prepare() reads it under pcm_mutex
with no shared lock:

CPU0                                  CPU1
x1e80100_snd_prepare()
  x1e80100_snd_build_wsa_slots()
    for (i =3D 0; i < channels; i++)
      if (user[i])
        set++;
    /* set =3D=3D channels */
                                      x1e80100_wsa_chmap_ctl_put()
                                        map[i] =3D 0;
    qcom_snd_chmap_to_q6(user[i])
      --> returns -EINVAL

Because user[i] is re-read in the second loop, clearing the channel map to
0 (unset) or updating it concurrently can make qcom_snd_chmap_to_q6(0)
abort PCM prepare with -EINVAL instead of falling back to
x1e80100_snd_default_wsa_slots(), or program a torn mix of old and new
channel positions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-b4-sound-q=
com-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com?part=
=3D3
