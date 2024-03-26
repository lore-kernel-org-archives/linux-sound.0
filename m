Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CFD13C91D
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466030; cv=none; b=qa6ljQ/o/FLvHscYK9d96O+4Accg8BhhoPaobrG0I1KKXLdYoTHcPjJIh1RGlHHYzP5+zskDz7N8RfdfOb4ku0o8eNaCUdNF65ZekOCBCV+GAPUVGYj8RJVjWe0SMMbjxbOSzwSAln/GrNa5RT/CSdxANecJ4h/VKGRtsCMCxIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466030; c=relaxed/simple;
	bh=3gXKT6njw2omMEaAzNf2JprBTRNJLMuF9mO6Lmjgq/s=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=G1vIdey1opwKMqt/3sqj+53LGmXsoZPj/5iOpOV+y7f9dMECo/zZWKwl7ofWbL8VQiZOYI3QR/tFMtccz1cbozx1aR0iY4KFpIIUzvzo9UxZ+6wUb12Umu6dazGqI5pSBdvA39K9ApOtHcIaX2VYdLVlb1QIIOxjIJBzwpZ7Cz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nkcbxTWA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nkcbxTWA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34005b5927eso3950115f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711466026; x=1712070826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K91MeUI92QSNqtrLE2UhY+c3/vxq+M1n6BAajR3fU8=;
        b=nkcbxTWAzyjw2iuLWwizqiHIX2C9oHIZCD2Yb55U1AhFS/AJZqbIXVTOKRmWb7if6Z
         wFirSCmqVZWkto/gzSjAOW0zvUN/RoAv1KcI4472xlvCNa0qXFkpaqeT/1YqECiLWwJG
         fy0gJFOOS8UDlp0/+2bapf46FxojvIkdPyyrdJxKSkdtrHqG6DuGgwnswRZa/OJRW7U1
         fVPFnUtZmRkWAiQtKMK99d1tR28I98dhG+ZbOg72x7MiGwGeHBr2zU7HNS3DiGb9X0ta
         q85eaaxS2d93fOwIM6dn60QaYfyZTEqbmgYGnQDYiJ/CS3q+EuisSoCNgLZe9QqArs1v
         UaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466026; x=1712070826;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8K91MeUI92QSNqtrLE2UhY+c3/vxq+M1n6BAajR3fU8=;
        b=PgiIPvvrpm1bwW4n5XBeVX/ZIh5YbDaioQ/poaPmFNqX6kVWzzkJNmFcmgtYwoxqGo
         SyM4oiVuI+CMa0RkugO8AxP8qKupg7EuaFp7ERJIxkJ2On3J6L72067LbwOypojvR2Rp
         hrgSK2THbMnIlNdHcLmQvK9zovuvJ7TbhL+frwYmDl825UEFgk9sf3bmA6VJeIQuYITg
         NvXnuLjY2buHY6rwGShCXEYjRA4jnzvZ879DrHHRNnjUXbvgSnrM2o4SR+er3GrbVw3h
         0vL4Tty7xcJ7607f0PWCbOKXHZZUc+IoPm3dksbT6xAX6v5ukTKErRsjBsIeRoshm3UH
         wBVA==
X-Forwarded-Encrypted: i=1; AJvYcCUTHaR8NEc66XiBGLcmEDVhNqUN2R2XCFk5sB/QdO5QyHu3rpAGfEU/7dPl5Q8RQrwncSxHMC1pnuHYMxn4u25GvYUZRu/X7ttoGyc=
X-Gm-Message-State: AOJu0YzsYfTeuJEUCJgjSFSkDiAlrM5/2gp1Rccv48siIdx+1moKfw+t
	ijLmSY4usooY+kmBIoIJv+OLYfGUMDLLacHZiCzg9HR7pePFC/BGX3ronb1T+vA=
X-Google-Smtp-Source: AGHT+IG7juK6Fs9BqzuZzCmGJd8YvjlgEl/Mjp8jyHt2HJpd+O8407YSUES9NqM6v17Ag53YwrSUMg==
X-Received: by 2002:a5d:6d09:0:b0:33e:bdea:629e with SMTP id e9-20020a5d6d09000000b0033ebdea629emr1525056wrq.37.1711466025887;
        Tue, 26 Mar 2024 08:13:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:97a2:bb9f:463a:6468])
        by smtp.gmail.com with ESMTPSA id m10-20020a056000174a00b0033ec9ddc638sm12480834wrf.31.2024.03.26.08.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:13:45 -0700 (PDT)
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi
 Yasak <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
  Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam  Girdwood <lgirdwood@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 15/15] ASoC: soc-pcm: indicate warning if DPCM BE Codec
 has no settings
Date: Tue, 26 Mar 2024 15:58:06 +0100
In-reply-to: <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Mon 25 Mar 2024 at 04:37, Kuninori Morimoto <kuninori.morimoto.gx@renesa=
s.com> wrote:

> Historically, ASoC doesn't have validation check for DPCM BE Codec,
> but it should have. Current ASoC is ignoring it same as before,
> but let's indicate the warning about that.
>
> This warning and code should be removed and cleanuped if DPCM BE Codec
> has necessary settings.

Hello Kuninori-san,

I'm not quite sure what you mean by "should have validation" and what
setting exactly we should validate ?

I know I should be able to able to understand that
from the code below but, somehow I have trouble deciphering it.

Could you explain it a bit more ?

I wonder if this going to trip over the same corner case as last time:

Where you have a CPU supporting both direction and 2 codecs, each
supporting 1 stream direction ? This is a valid i2s configuration.

Maybe I'm not understanding the patchset correctly.

> One of the big user which doesn't have it is Intel.
>
> 	--- sound/soc/codecs/hda.c ---
>
> 	static struct snd_soc_dai_driver card_binder_dai =3D {
> 		.id =3D -1,
> 		.name =3D "codec-probing-DAI",
> +		.capture.channels_min =3D 1,
> +		.playback.channels_min =3D 1,
> 	};
>
> 	--- sound/pci/hda/patch_hdmi.c ---
>
> 	static int generic_hdmi_build_pcms(...)
> 	{
> 		...
> 		for (...) {
> 			...
> +			pstr->channels_min =3D 1;
> 		}
>
> 		return 0;
> 	}
>
> Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linu=
x.intel.com
> Cc: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index ac42c089815b..9a54d5d49b65 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2796,7 +2796,6 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
>  	struct snd_soc_dai_link_ch_map *ch_maps;
>  	struct snd_soc_dai *cpu_dai;
>  	struct snd_soc_dai *codec_dai;
> -	struct snd_soc_dai *dummy_dai =3D snd_soc_find_dai(&snd_soc_dummy_dlc);
>  	int cpu_playback;
>  	int cpu_capture;
>  	int has_playback =3D 0;
> @@ -2817,24 +2816,37 @@ static int soc_get_playback_capture(struct snd_so=
c_pcm_runtime *rtd,
>  	 *	soc.h :: [dai_link->ch_maps Image sample]
>  	 */
>  	for_each_rtd_ch_maps(rtd, i, ch_maps) {
> -		cpu_dai	  =3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> -		codec_dai =3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> +		int cpu_play_t, cpu_capture_t;
> +		int codec_play_t, codec_capture_t;
> +
> +		cpu_dai		=3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> +		codec_dai	=3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> +
> +		cpu_play_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_playback);
> +		codec_play_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_=
PLAYBACK);
> +
> +		cpu_capture_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_capture);
> +		codec_capture_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STRE=
AM_CAPTURE);
>=20=20
>  		/*
> -		 * FIXME
> +		 * FIXME / CLEAN-UP-ME
>  		 *
>  		 * DPCM BE Codec has been no checked before.
>  		 * It should be checked, but it breaks compatibility.
>  		 * It ignores BE Codec here, so far.
>  		 */
> -		if (dai_link->no_pcm)
> -			codec_dai =3D dummy_dai;
> +		if ((dai_link->no_pcm) &&
> +		    ((cpu_play_t	&& !codec_play_t) ||
> +		     (cpu_capture_t	&& !codec_capture_t))) {
> +			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
> +				      codec_dai->name);

Taking one codec at a time, would you trigger a warning for the use case I
described above ?

> +			codec_play_t	=3D 1;
> +			codec_capture_t	=3D 1;
> +		}
>=20=20
> -		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
> -		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +		if (cpu_play_t && codec_play_t)
>  			has_playback =3D 1;
> -		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
> -		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +		if (cpu_capture_t && codec_capture_t)
>  			has_capture =3D 1;
>  	}


--=20
Jerome
