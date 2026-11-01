Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546865;
	b=LiDKC6hfceH+NNblv+rENV+t127t3vo+X0B0PcNSaGKy6a7Q3nSR8nLeTT77JDZfmSID
	 tOT9A6aXKBxf9O2X31kwLgrf3vAOB87C6JsBCVrkwcKlKoKvCoHREXY4AcuTxcSjVgoH+
	 7SIeyqzs8xpR+VyWWXvoML9qImrLB3HRgWQqdJMd7cs0fxr8o8CViuKZ91VCS7wOzM2HG
	 LxChqJne8BCoV6l7PjfQyPdX2lOkXwhiJdvO9Cz0Uej31yv0C3yBlXoPw8jFKsb0pMB6Q
	 5alTmiscgqni4PaB+SzR2rPfU14G+Su5HoCL1XlmFEU4ASZcv3JrZjIjpccWtjyPTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546865;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qQpA9tzrfc1MY6TOTF3afRoYZc8oN/zB5p3F/VUHBew=;
	b=iqXlEujAFKoEgoR96gX7HGws3md0zYd9Qu1upOGkIimu59l2QIyZCf+HHxj5t8RiMjRT
	 L65biDDK/8vMh26GoA33ey5zZoQhZQDRUJxINkrY/HUBgj5RX3HeVMEn0HsmTw7OAKdpm
	 yzodWwO0YUym4BzZfVl+/sDIPiNO1g09jGlL3k4bBeRfLvXwsKIBa0FECdhWsz0EjHXXy
	 52Xs/CFdEaG/Ss2wkUU2gJqbVeyMihXiGkRuHggOexcnAd/9+wEZNikGGzj6u7wk2L/Ay
	 IrbWMs/yGm0I7vZwIIaY1G5KHld7TyVEc/hfgzjMiJZLpSL3NkNBzMrDKpO7lv6nfxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMc6NOVV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E6D606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMc6NOVV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728921F0093A;
	Sun,  1 Nov 2026 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793546864;
	bh=qQpA9tzrfc1MY6TOTF3afRoYZc8oN/zB5p3F/VUHBew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TMc6NOVVqfvUM7xmY0M+xloCESZkMBIJuYZGcBrmtPHS6qTK4q9qetCYHzwvX7nyD
	 i55rva7WlQejJSgQGxa//KhyDOUR8lJpNeje0ZiBkz5E5rp0qJ/5+drWmvwjzV7hkI
	 +qPSvZM4TabtknzhuUP5OZwowC8A7RUlkJUp9Wdro+KTMheMuy7W8dO024N5BIH0OF
	 Ly+pd37eBoS6FCk5F8QMvmwBRVa1Eq9cflF2YcmIu8U/fjL/ARnQ9gdYTVOBqcabLj
	 8zuUF08z/iFrNAJA7d2RIPPYrJM00iYuAtVqMmpWczHd8EMn09uitx+rBBDn33/UM3
	 GWakMpV09INLw==
Message-ID: <sashiko-outbox-192468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hdsp: allow sample rate changes from hw_params
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael Gago" <rafael.gago@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261101-hdsp-sound-v1-1-f39f185400b5@gmail.com>
References: <20261101-hdsp-sound-v1-1-f39f185400b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 15:27:44 +0000
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
- [Medium] ALSA: hdsp: race on other->runtime->state in hdsp_speed_change_b=
locked()
--

commit 6c483175b4a8f7fb76733a5685d3d140f485defd
Author: Rafael Gago <rafael.gago@gmail.com>

ALSA: hdsp: allow sample rate changes from hw_params

This commit updates hdsp_set_rate() to accept the requesting PCM substream
and adds hdsp_speed_change_blocked() so that speed mode transitions from
snd_hdsp_hw_params() are only blocked when the opposite substream is open a=
nd
past SNDRV_PCM_STATE_OPEN.

> diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
> index 7dce548b9f363..a3dfa937d7e54 100644
> --- a/sound/pci/rme9652/hdsp.c
> +++ b/sound/pci/rme9652/hdsp.c
> @@ -1095,7 +1095,35 @@ static void hdsp_set_dds_value(struct hdsp *hdsp, =
int rate)
>  	hdsp_write(hdsp, HDSP_freqReg, hdsp->dds_value);
>  }
> =20
> -static int hdsp_set_rate(struct hdsp *hdsp, int rate, int called_interna=
lly)
> +/*
> + * A speed mode change moves the channels to different DMA buffer slots
> + * (hdsp->channel_map) and changes the channel count. It is only safe if
> + * no substream other than the one asking for it (if any) was set up with
> + * the old layout. A substream of another process is already turned away
> + * by snd_hdsp_hw_params().
> + */
> +static bool hdsp_speed_change_blocked(struct hdsp *hdsp,
> +				      struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_substream *other;
> +
> +	if (!substream)
> +		return hdsp->capture_pid >=3D 0 || hdsp->playback_pid >=3D 0;
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		other =3D hdsp->capture_substream;
> +	else
> +		other =3D hdsp->playback_substream;
> +
> +	return other && other->runtime->state !=3D SNDRV_PCM_STATE_OPEN;
> +}

[Severity: Medium]
Can two concurrent snd_pcm_hw_params() calls on the playback and capture
substreams race here and switch hdsp->channel_map underneath a substream th=
at
has just finished snd_hdsp_hw_params()?

When a single thread opens both directions, hdsp->playback_pid and
hdsp->capture_pid match, so snd_hdsp_hw_params() allows both substreams to
proceed to hdsp_set_rate(). In sound/core/pcm_native.c:snd_pcm_hw_params(),
each substream only holds its own runtime->buffer_mutex, and runtime->state
is not updated to SNDRV_PCM_STATE_SETUP until after substream->ops->hw_para=
ms
returns:

sound/core/pcm_native.c:snd_pcm_hw_params() {
	...
	if (substream->ops->hw_params !=3D NULL) {
		err =3D substream->ops->hw_params(substream, params);
		if (err < 0)
			goto _error;
	}

	runtime->access =3D params_access(params);
	runtime->format =3D params_format(params);
	runtime->subformat =3D params_subformat(params);
	runtime->channels =3D params_channels(params);
	runtime->rate =3D params_rate(params);
	...
	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
}

If one thread calls snd_pcm_hw_params() on playback at single speed (for
example 48 kHz with ss_out_channels), snd_hdsp_hw_params() sets the
single-speed hdsp->channel_map and releases hdsp->lock while
playback_substream->runtime->state is still SNDRV_PCM_STATE_OPEN.

Before that first thread reaches snd_pcm_set_state(), a second thread (or
forked process sharing the open file descriptors) calling snd_pcm_hw_params=
()
on capture at double or quad speed (96 kHz or 192 kHz) will still observe
playback_substream->runtime->state =3D=3D SNDRV_PCM_STATE_OPEN in
hdsp_speed_change_blocked() (which is also read without holding the other
substream's PCM stream lock or buffer_mutex). It will then overwrite
hdsp->channel_map with the double-speed or quad-speed map while the playback
substream finishes snd_pcm_hw_params() with runtime->channels set to
ss_out_channels.

Subsequent transfers on the higher channel numbers in snd_hdsp_playback_cop=
y(),
snd_hdsp_capture_copy(), or snd_hdsp_hw_silence() will then look up
hdsp->channel_map[channel] =3D=3D -1 via hdsp_channel_buffer_location() and
trigger snd_BUG_ON(!channel_buf):

sound/pci/rme9652/hdsp.c:snd_hdsp_playback_copy() {
	...
	channel_buf =3D hdsp_channel_buffer_location (hdsp, substream->pstr->strea=
m, channel);
	if (snd_BUG_ON(!channel_buf))
		return -EIO;
	...
}

Would tracking whether each direction has configured hw_params in struct hd=
sp
under hdsp->lock (and clearing it in snd_hdsp_hw_free() and release) avoid
relying on other->runtime->state across the lock boundary?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-hdsp-sound=
-v1-1-f39f185400b5@gmail.com?part=3D1
