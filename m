Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3360A35964
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 01:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736819128; cv=none; b=J0HQFKFK8u9i3/YU1J5BrB+Tp0+RF5wqV9WHzvcxqietDbY5f46tDxiWgraaUDxmWtrvbbO+7Uka39ad7jsJDXwIZYFkLMJmRkZmlEJsGFCLpUbd4FwTwb09dJ9evkcp8MXkm+JeWfj7jvl+MnLENY9TeSukMkEQL767TviuSLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736819128; c=relaxed/simple;
	bh=8qCaCSt4CoqQaIzxSrPBfhSLyWDhw17eSm8QRaz5Uwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVNZme6g8PcX9vWXUgZZBC/zB50m4zMaOyR9CSR0GjN+ASdcsZzzvTVuz+he9p8K+4TKARA0PbTGz0AXt2u4GRAKEmnmnY+GfN+PtBMB5Ne24hAgImOmUZWep3W0V7GA+e0COYmX8SmnmcnmJ3RbPNqU+CLCmU7gTplXcHQVkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALpd0eEW; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALpd0eEW"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e461015fbd4so7117456276.2
        for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 17:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736819126; x=1737423926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=;
        b=ALpd0eEWVX7IMZigddzhJqImikQD79yzGN7r9/L7muq0kWdqPHYG/WvedTwZnPvsho
         nMup1nm8VoWJCWMH3S2yzzeAMGJzIUD+YZMa4oPt21w1iXMBqupW2ycVGygfmCpTlGPp
         IUj9XnRMQHJrZ2DNYomg1HCLU+61yre9Wu66WsawIznpHQFTLbV1mppLtsXXKYY8oSIJ
         /S1kaYvLfq0w58vJM6wRKIvdF4DUBub+rsFyASzMiwmE6/EboS5MCfT68rUXIy00hYYc
         Qeh0yFO4wbcfr+e1Pg9VmWlSuL5aIYwInVt2HOSRP5l/EAnbwbb+S4epCSWtpxTCziZP
         K+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736819126; x=1737423926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=;
        b=BXUZOLTR3IPf8k42a28UoyWpXb58LoqGhJoLzLh4oQRqBZGrzmc3oGuInEScuSA3ny
         krbVb5D1+ds0G0f2pAy7WHtAKyhRE+qd+2/obwZP67/EZ8ip+dyqi7oTG2kKFcp2SlBn
         oX+3jOVsn1qS4zbcRpA/FlmRuBcHJpQPkOyJVDv6ic3Yjjq6WGCHhYQoavdlivIewjcM
         5FUZiv67MIkz93zaHfbO1b8rHOVKH7U9o6RaHqqbwVlxV/BP/n2OjLQ/xDz76jxzJQCq
         JVJrQPBH0I58l19UHau5w1qN2ttLgEX8tq6Q2GMNihx/HmfTPFnaeEyfOD++2dxprN64
         Wovg==
X-Forwarded-Encrypted: i=1; AJvYcCVrrQ0QkBQ57AqJvuq5JJwFYOYYxUSlHWKHmeneJmkeG/QiOGi4aegvR4YSuVv4g2z8FDnzMAS5XW6FbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPtObcw8pPf8Zi6Ygi9I/qc77BHDIFsEczH5Rzn/HAZRRDh3w7
	vfQ2yQZn2G9AULT16QHb40Y7nLl4dWsGgbdio3wvIFHpmg7hGU5VcYFiMz4NzgdXHKgRm9pj1qA
	Bh1NEXDpqt3q35AI2SlxlTcmSZibJOtPR709oSQ==
X-Gm-Gg: ASbGncvptz7L1yWLB3pdqaevyPWOkQFhMWNStXbSo3ochMssZTa5QNT4rBzDQu9uRuU
	S5Yfoh3PpaoMOlRsG5mhk8rr8UF0gCCXAYsc5raps1EoadEPOFOYiKJa7ZtEhZckjxlB3YA==
X-Google-Smtp-Source: AGHT+IFw+8EJH3+sYLytBcSM829UVF01V8OV1UAI+CzwsaCh0PJQpMGC1iXxd5V1WhnvSyXdw+9iFPxRIV5QmN5E1YE=
X-Received: by 2002:a25:2055:0:b0:e39:8482:5d5f with SMTP id
 3f1490d57ef6-e54ee2026femr12527255276.46.1736819125705; Mon, 13 Jan 2025
 17:45:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org> <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
In-Reply-To: <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jan 2025 03:45:15 +0200
X-Gm-Features: AbW1kvZk-xrGSPiMdguMFD_hc9SYyHKa4i2bZt-kcCNVjxqbFCr5K6kr1tPBECs
Message-ID: <CAA8EJprDaOTEOYf5JHC7UYwqRn2vXUH9FT==HjZg1QNfDMmBcA@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] drm: add DRM HDMI Codec framework
To: Mark Brown <broonie@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 00:16, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, 24 Dec 2024 03:47:52 +0200, Dmitry Baryshkov wrote:
> > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > there was no simple way to get the drm_connector that stayed at the end
> > of the bridge chain. At the same point the drm_hdmi_connector functions
> > expected to get drm_connector instance.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [01/10] ASoC: hdmi-codec: pass data to get_dai_id too
>         commit: a8e792d3f0bbecb87ab05e9592cadf0b178ab952
> [02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
>         commit: 5b0779ae13de345b405a67c71cbb63705cadb295

Mark, they had your Acks, so they were picked into drm-misc-next.
Would that be a problem?

>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>


-- 
With best wishes
Dmitry
