Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8D1E519
	for <linux-sound@vger.kernel.org>; Sat,  4 Jan 2025 06:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735973308; cv=none; b=Giaxy41aqWQ/pTsl0GgpYs5UtSSdZhnAla6zLACVjhn2P8e/k88Udt56lr0/zqEyNw1kWEsNG3RHUGedkKeDgl68fYGYDmKDrvrGUVxn1yBN2Vues/GrfbyE5bmQefLsnZik6aFE4cUYyqvezwgkw/Spu5vpPo8kXkJrfjZbP6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735973308; c=relaxed/simple;
	bh=stYUOuwyY4dfWVz1xVRhq384EFrSnfu5en26KjDHAUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOLYriIQIAKfxYMp2NV/s1X8psWlm3XaGxDfyufOWgSXHzTepR5SG3auv2w41GnNC6LRw6TCbDOFaAyKVKaGG7JTRVQgsCdaf+wN3y2ZBqSS9nQM1YMwyrRFN0x5Gmk/mE4wc0M7+QYNNLFlShDc2AfNTG4nF2zEnAnIvF47uJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NoE2vrUs; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NoE2vrUs"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3c47434eso13390644e87.3
        for <linux-sound@vger.kernel.org>; Fri, 03 Jan 2025 22:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735973304; x=1736578104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL2v2cgbonvN/57biijzRWsX5GH+mP+xPVPcn+nnd/k=;
        b=NoE2vrUspJuoJu3DzjK5OHQ/zqCl46EZy/GwuhfijsyVCgdMwN7uuSl4VD7bW+IC/1
         qezVBz5orQfNqzuwbgwCI1MAIld5KJIpViGAzVPFW5kj+eTqH1W7tpHc7/jYuM6bP6Gm
         WPrQi5SEX0UpumlKRIiK0yCDB+LfJBHakRzYg5+OM7KaGIEvd5K/3zkwnEcGBEwQoO96
         e28CtZQIX5Q7fJJPtBmeqRQurtUAjj0kVAiAMFLzaDRqDmibwabtZmm7B+AwnYeM8qCF
         +x1kiFUs5eEvOZYGpKK84O+I+rwKPr3X/4O81qLdWl7Dp4wdSJoCi8J+R8MrcgsySj8E
         mACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735973304; x=1736578104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL2v2cgbonvN/57biijzRWsX5GH+mP+xPVPcn+nnd/k=;
        b=pyVRIHE7+UUneewRcRinkjWB0CSDsXqB/6Dle54PMTiLY+1cnOSTo9d3minEjLlFv8
         keP2olfejQDSnzWuokynmvfcLFoI3ublfGqK2jwoBFG6eSCqrHLF54OQRfrhS2WIFAVn
         frJciqQZVBUfgwOKM8yCxG+HpuVTtc2EmBYpV1PoRBBTrYh2439ffDfCalDGmoUG9xwO
         Rb/XW8+zFbxb2DZAUv+g0uBJQVenNKQxqVounJy/P3Vv+eAf4uJb9awdyFxb7EiCHeUO
         lUBNfeQocLYfx4QWyaA/oldgS4LA031khusR/j9pdDHKV8sORvsfyCPK1XB+6iHAaac8
         2Omw==
X-Forwarded-Encrypted: i=1; AJvYcCVbZK8i1DMiqgzxkrmylWlG/KOpfDNR2Jb86EsrJugXHcFoxmCvD8s+JQBFPabkaYXvYqFsMu9QNdLAOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaBm50lFS5S6vYX776y0aaCmW8veHPYPYv5EBge3r13WweDgSA
	8/8940iS8atA89JfY/UYo9RpLwt0gB3lscNHNDil0J4jEuGtjpaXhYziaKQilgU=
X-Gm-Gg: ASbGncueJ1Wa2UdaZ3Fr8hr2RnjEJhrEiHn5gHcN9AI9NTey7qGKflghmwPa7zrNXny
	6W9mxvgE40lfuNIiLWabdJz7nZlJsW6JAFCG+4sVETfuiaI8kHyAiztc6eQeaCszeseymG9Z0OO
	noeLDA7lt/bdj5l5chsWngR5EDZvIxajGaD63Dh2nBV6lApNz4tpBC18W+mQgYZ2MMVRKsJydSN
	QQCsyx5IDcyloGPJLXgLuBZ2UnG+dnc6yvcbRqPkoFubuoDRxg7Q3qf9VvsWXdGeBJAf1V8EeHY
	9W8vfY+hwWY0gxzlA0NL921F
X-Google-Smtp-Source: AGHT+IH3b8Wrusc5F4Hb8fKgaj49rA+Ki+WtT2vpjNm4L2ymezTReLIBxE1xf5KxHdrS/65tedN1lQ==
X-Received: by 2002:a05:6512:1114:b0:540:2fbb:22cb with SMTP id 2adb3069b0e04-54229533aeemr14027670e87.13.1735973304217;
        Fri, 03 Jan 2025 22:48:24 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223825f3csm4213238e87.226.2025.01.03.22.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 22:48:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 00/10] drm: add DRM HDMI Codec framework
Date: Sat,  4 Jan 2025 08:48:19 +0200
Message-ID: <173597328997.875472.12782462213120017264.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 24 Dec 2024 03:47:52 +0200, Dmitry Baryshkov wrote:
> While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> framework, I stumbled upon an issue while handling the Audio InfoFrames.
> The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> there was no simple way to get the drm_connector that stayed at the end
> of the bridge chain. At the same point the drm_hdmi_connector functions
> expected to get drm_connector instance.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] ASoC: hdmi-codec: pass data to get_dai_id too
        commit: 6af45d7df1099ccac634b36f8cdfa32fbca8c1d1
[02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
        commit: bb1d67bf82fbd2c550fa637e0b8a966ee81a293b
[03/10] drm/connector: implement generic HDMI audio helpers
        commit: baf616647fe6f857a0cf2187197de31e9bb17a71
[04/10] drm/bridge: connector: add support for HDMI codec framework
        commit: 0beba3f9d366c6df10e5b080fc99c45ac17248ed
[05/10] drm/bridge: lt9611: switch to using the DRM HDMI codec framework
        commit: c054aa1bf529a2fa13546b25231d16bb0fd87ca2
[06/10] drm/display/hdmi: implement hotplug functions
        commit: ab716b74dc9dd4903b9006f473137e1aa624af56
[07/10] drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
        commit: 4b5a79d7f4d5c34120c6f2e8836bc8ad3a43594c
[08/10] drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
        commit: 9640f1437a88d8c617ff5523f1f9dc8c3ff29121
[09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
        commit: b4fa0800760c20fe34318a1079687526fc323572
[10/10] drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()
        commit: 2ea9ec5d2c207a41d523f8804053cee00fe50763

Best regards,
-- 
With best wishes
Dmitry

