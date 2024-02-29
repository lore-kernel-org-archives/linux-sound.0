Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313A3715E
	for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 03:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709177145; cv=none; b=boKwVokm8G73zNo/BrcfzVDzy9OgEQTLNLQQAIYZdeEg+Td2AchQiOiv4BSmRa2QKYSQQW6b+M5UTOPyumAxCMNWR/KWWVpSqFojZHsrnD5b/YXBk0C6wAx/S3RRcQWYZ3+MlSBVx6M6gn5B0TrKnhg0k9gSMxRRADEnO2ZX2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709177145; c=relaxed/simple;
	bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQ8LW2NSzGoCe1oyMIRFl1C9t2LpMMLCHGizn4tVV2QjgigXa6Pq4IX7Bq8q74S+/9dbAvxTltrG5UPlAGpK5a12ZHVoQR6BBNy4F9rD6SRROpPW0GGPVwk0xQEZPoqtCka6EGwqZKQUZ7IbQ+1BMyyblTsWy/qt+c8apOhIciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RgV1BZkj; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RgV1BZkj"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d28051376eso5387121fa.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 19:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709177142; x=1709781942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=;
        b=RgV1BZkjLSya3ZJKK+77p4HKafeRWEtwo+V3gZInQ8ZvgpVBuuvoWNty8Vzisz5+EU
         2Ag1uqxZg/w6EWpn2S9YvmKSdAxuu2Uaz0BvPJtEBQdIAQsehoMUUuv7nrI1HwEzzR/A
         j9QSgm/Yfpt+YPTeTI6LGxnEjKO/IPhmSUvTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709177142; x=1709781942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=;
        b=KoTKKauONBgRQD1LFLwM4pTkafXvYf07xPshzGsZnb3nnAvIEqotCYihQvmOlr1VxU
         Z2xZNbCJ+vIJcJQBvX7pgFiMxocIfcVgSSnsqGcpzYIqF1BF43Wmke4Eo9cQDpPiRlAq
         eFz9WZtJ//XkkXsApzA7NKnYSanJqmJh9yfBBbF6R0ggXqz1BGLhp5uBmwIctOmX9i36
         khP7YLMyT7tEYjEBQH7Ulv6KjHu5OZUe4ckmuPLgp0Zdpcy+me9GfN1O9I3q3yI/kGSJ
         wWn9SRQLgCNtPYlu/rWMjWz8RctoLD54NIsV4stOHUVv9E06Kv6edJZYOz3HL8iM2ndN
         fB5w==
X-Forwarded-Encrypted: i=1; AJvYcCXgcwM/PiSKiInYg8djF7janik9iiSBEKyGFsPXHBlmE24MwehPvJJakKp9tajRalfhplRE+ZqGFzUbLkg9NYYCHUWeY6mTPoAtgzU=
X-Gm-Message-State: AOJu0Yy3xcKk9Aty9k22Zx633ptzZT9tm0XGAGDOOxNO1ntTwkX2XoY6
	f+Vy1I98AkQWAcabFzrfK6MHWU+cQaPzbPzqsgZJjs5UAeY9hBXR/TWhSQOpRmVNNNEFr+miLmZ
	QUD0ZkXu/BM6+bWmCIoTpZOxRotVsBuxpfLC9
X-Google-Smtp-Source: AGHT+IF6HtrFqiF4ILXIhOeoglLnKyYMIt97o4GxwpCNIyH7ScABce8rbUiq2DMajV+r4BPBHpxVsoL7H4u3odSmJ9Q=
X-Received: by 2002:ac2:597b:0:b0:512:ba41:51f with SMTP id
 h27-20020ac2597b000000b00512ba41051fmr425568lfp.50.1709177142115; Wed, 28 Feb
 2024 19:25:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com> <20240227120939.290143-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240227120939.290143-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 11:25:31 +0800
Message-ID: <CAGXv+5Hpv323oGAr_t6C=akNybypPUYO31ez2rFD2oCRs3O8GQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com, 
	trevor.wu@mediatek.com, maso.huang@mediatek.com, 
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de, 
	kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com, 
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de, 
	dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com, 
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev, 
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com, 
	ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com, 
	nfraprado@collabora.com, alsa-devel@alsa-project.org, 
	shane.chien@mediatek.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 8:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Simplify the probe function by switching error prints to return
> dev_err_probe(), lowering the lines count; while at it, also
> beautify some messages and change some others' level from warn
> to error.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
