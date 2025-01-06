Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC328F5
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173721; cv=none; b=FpNsnsuo+/mrh4qUVuRde18m//Wa+VZmbMeZBRp31ewUpdZQZ4ct2XsJajDIDnBZ9Rm19aUEwxkVOH2qWcJq6ttyVR70xzhu1vgJe9lcWUQ44YTjYB5CM13buKrG1MCWfD0uFNza3qDy9el3oYOjlz2Z9HS5SWcMtguGpFMsWTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173721; c=relaxed/simple;
	bh=dVplwCMvCFZoBDUovnBLRlGKBRtbSavrQ1mrBRSC7p4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jt/HYlafl29jaFMD4JfbsMnQXbTQE9CUP5T/ph8Jv5FTaZm2vjNomJdW7IeoR92wU48k/nx9yyqmVQcqw397Z61ziz2+NfjRtandIZh3D7IUyskSbRrWWGCdOo9SRupUv86jxvJxLymuD/OyeeeqVibqIGMpvY/iU+3zJmTiFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bGpKys6r; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bGpKys6r"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862b364538so8262826f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jan 2025 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736173717; x=1736778517; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c91yJOlrCLVePlwLxdpALuqEbbz5CUd+3wU+nXgA/qk=;
        b=bGpKys6rYt+ogiMLPobHBInUlWiT+6kdjX5GFfvOB3Kzcb8Ttof6PDo8Bnp9n0eDfM
         QY6rTWCmZ74ppb3U6AfNf4d9YnVm2+pQXfnD2y6meMd7kXt9EeBURvfoamtg/7Fpztea
         OI6IRBS2UL1i4uC8I7YR1LXnGu9H8kxB+eJPeyq707xo4PjWZW4QdQYNkT7nTxZvJaSh
         JenxISJ31JXbj+1hSsjroiXD3NCjMBG//1ypgYMq1clo39k8MbYl0z6u8fjvbxDcjF+N
         cWQY7GTjVE8E5bFlgXDlmVjm0HtRi2LAtldFUfdX9KDXcLnxJB3KnMe90T8gfhVBXU2O
         h8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173717; x=1736778517;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c91yJOlrCLVePlwLxdpALuqEbbz5CUd+3wU+nXgA/qk=;
        b=If2RNuHH3pzu9CZEYMowmrWjV2r33PVRoNioWJcuyu1ZSzYo9iIMyN+13veZ4IrmG0
         eaGW/j2Hs1SbKYIQGkTl5369oLmIpf1YGGnFh++7Gmr5L3hq2/L8QE5wlFP3idMve8ZG
         eT4wBxo9VA+V4BRuvzvvwuE95QjwErbLRK96gw+rX0kz6xBd3kRO2qECi6CxVwEtm8Wu
         5zGaUGz3WXdiecawKTXjSCAMxXzmZfgPC6DhUVZedVUZ+fsEaFTolyyhBay5fm9sLhf+
         FJ1OY0R24Y4amOhC/XGVua0QSY9IKmyRIdoioSMPHTOnxJBP4dyq985qscegbyf+CDxp
         UhFA==
X-Gm-Message-State: AOJu0YxGxn2uA8nGfbA9JE4X9+0VMtlXSRU/7ulQB9k5G8Z5K4SiEPvK
	0+tOQ5rP+LH01CzNWPFT0P3fdIvMc64GBQ9j5iN2E+S3i6Sc8ToF52ewEVWtlUY=
X-Gm-Gg: ASbGnctV+KlZDtSDvAX9/7pffrl29HyPNtWJDSZ6F44Mm20YpicFMIOIWWIE8t+YaLO
	bpfVbvLecX/WILSUExI4NxXQiSFId55Gv71C5mgnBNhWW4ykD5aD9K8h1BT3DQK6zMqcNK+wuY9
	Xr94zrgu2ulwgRP5zOVvQWX3RAMAnw5WN3ge6hWSb3mvGZIg+jDli6ru7CTyY4WvpmpE1dZBOey
	A84LgijzhvfY7NZtEL6iuYxhGIe61QrIogTA8z1gRhQGNWNdwyTA6NA
X-Google-Smtp-Source: AGHT+IEmhPoHQlfS8R2V6q1qOrsCqIouaOZwP7XgeuLkAOs1MO2g84lb5Tcu2XuCg1CN2bad/NfJPA==
X-Received: by 2002:a5d:6d0f:0:b0:385:faec:d945 with SMTP id ffacd0b85a97d-38a22a117c4mr45665927f8f.9.1736173716705;
        Mon, 06 Jan 2025 06:28:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1fa2bdfbsm47230712f8f.102.2025.01.06.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:28:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  s.nawrocki@samsung.com,  lgirdwood@gmail.com,  broonie@kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
In-Reply-To: <20250106141316.375984-3-martin.blumenstingl@googlemail.com>
	(Martin Blumenstingl's message of "Mon, 6 Jan 2025 15:13:16 +0100")
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
	<20250106141316.375984-3-martin.blumenstingl@googlemail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 15:28:35 +0100
Message-ID: <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 06 Jan 2025 at 15:13, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Codec driver can implement .hw_params and/or .prepare from struct
> snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
> callback has been called.
>
> On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
> (sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
> codec output because further digital routing is required after the
> backend. The new DRM HDMI (audio) codec framework (which internally
> uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
> of the hdmi-codec to be called. Implement a call to
> snd_soc_dai_prepare() so the .prepare callback of the hdmi-codec is
> called on those platforms.
>
> For platforms or sound cards without a codec-to-codec link with
> additional parameters (which applies to most hardware) this changes
> nothing as the .prepare callback is already called via
> snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
> dpcm_be_dai_prepare()) on those.
>
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for working on this. Overall it looks good.

Not sure if the call the .prepare() should go at the beginning of
POST_PMU, as done here, or at the end of PRE_PMU ? 

> ---
>  sound/soc/soc-dapm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 99521c784a9b..ac8eef217dc4 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -4013,6 +4013,13 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
>  		break;
>  
>  	case SND_SOC_DAPM_POST_PMU:
> +		snd_soc_dapm_widget_for_each_sink_path(w, path) {
> +			sink = path->sink->priv;
> +
> +			snd_soc_dai_prepare(sink, substream);
> +			ret = 0;
> +		}
> +
>  		snd_soc_dapm_widget_for_each_sink_path(w, path) {
>  			sink = path->sink->priv;

-- 
Jerome
