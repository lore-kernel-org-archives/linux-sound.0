Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792462258;
	b=mhKprwIXfOIkbwwIGq8kuwPcjQ7rN9D1t+D0/UK9RSIbkVnTZiKLrKfGxvqOSfWjeefx
	 l47k599sdqfi7ZBao7+VYwh62B5z8Tfcr9FaI4rjaRY7TjyonaaF5kdypczmwUnOrRp21
	 7uYj+6lp2qAeIjv3SGXqvUCy0k+GpQChMgBFZCkM7MoAUyheigYrvcykSZxwK52kidXVd
	 HHYJ39L2Y4obBM4X/hh0K3BbalBEBND5KfUxZw9nIPzPH0rQP8YOCQXh88y1PFHwY7y6B
	 sw2/NW/pQpNWZlmXHDppReajiRwDFqx5dt2ece64aAn+0/75c3ymwgHJlHxXsNlrsvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
	b=LFejIVJXKBqV217Ytg1SQpPRPpO6i7bFLffx1mTMXbp+vcWWL/ZLbMAa/iFTTXxgIPhz
	 WlNoR2hoGk18V4tbFZo4y3vlTGqzat6R3UnVrWkoacCHOUPjPv4Ow9cU91UzRJBlHVj9G
	 DYw1tGgea8TkhxNBrgpcDaVkNYHWQS/Xg+XyN6cIOZkkG4q/3tceysk04fMBtv12N9Q/D
	 zgI7l/kCTTgOqCopo6TOMSdWp2O5Y3Bl7SuH0i+V4M1zLa+M3ugmpEVeteYXO4gHOLwEw
	 VefCk/Owk9DAbwJTpruKDqVGroWqQ21SgDBundgrq7oIr1uNu38U6JO5SmAOF0G/aAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hb/UPhHW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EC3606A319
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 02:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EC3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hb/UPhHW
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e987a2ba0cso22636805ad.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 19:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792462257; cv=none;
        d=google.com; s=arc-20260327;
        b=iQDzx94ZPx9b98wr90DV1Av6tRSR20FlfIX/b2pUGrLUbiFwnBT656kU7iFA1svAVg
         DzLEGtcuYshIoUPEyUs7a6On5ARn4OJaqVnMA5R1YhQQ+JJRaOByrI0BtyuRpzbBmWp7
         UsqgxLWgO+vERztpZiUyG7/XHhkuha1YEZCsFWc3d0hazs2SppPbTyWX3iUnS8U/O6fy
         5mVdrtwyME0cJOUC73xTdexRq96QazwXKDCYSSkLjIRMavAZWX8rZ5uO2DYKMqqFV2D8
         K/iubzN2joXeOF4IIhaXmeOBG9en3K3jkEpaIBrlAV0/zh6jmRBysSdgyq4UWzEWrdcS
         2OVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        fh=WE3mKtTBkmt6KtvYlNSNfXKbdfXrsWN/8ZNVp4uRIHs=;
        b=nlGfUIuiGzS2mnhwz7BtKbO4SckeXDVhUOtmKtaqv1OxWJa/6WdC2+ZhLcjARM4OuP
         606AQsG99U0jGQ0IglfH1IUC1rDlwT+0NsrmnjzcPtLZODo1Goan1QxFWSAK8oJ7fhfv
         AQcZu9y5ZH827jBQ3ccY9j5BUFtLL6zcXURlMmu+OV4Sw0VU4FrOygK6YV2MQp6bzH5H
         GWxZYjCeqN4W5klaHRmWF0vmX2GUVWCO0ifI2IwtP2/S30pKo0lVN7LVh+dRwGWa3Ww8
         VU44rB48L6KzkLUJLi5DtYDspES8mpK057k2JBSr1l899+iuySC7OZpbp9lS54b/qTDa
         v4Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462257; x=1793067057; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=hb/UPhHWEbBTw2Sv0j1Br3zlb1tF0v5WNhFa7htWdgnfMrEBEzsiE5hXvp3vrKt+TP
         A1iM4KW0YJYwxzG35H7vcpjnRx2CJW00YJ1JPRskO4JBnOwdM8+j0JMiVuFyDKqXxQqy
         IF8QO+DA9VVJVKNwvZA4wSa1LLQcm+FQ/mH3rTdFwZ2L0UY5SDtbjxoZ7bHzWztur0R+
         tgiWKShd9eA8WOCLKzI5UqagnrkJpCgp6xz+od/Wjdw1NYd1wkGPa32hCxCPRPI9iuRq
         vcv4YOonUtpCVRDWpIA6S8UcXFNuTSGHu3Bn+qGsMIkZDz0VzJrSfO3VjllcABlIUTXL
         UR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462257; x=1793067057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=f4Q16CJ12WmZFrlB8anS1X7M3BN7B9D9ehEWCxvoFy06W0TyjRSmlOutzttgQuHv6e
         9Au8OmKXFkCok7DSf7qRXB1Ide25h+QBtvy+aLQ/YJfeICc51/mI5DZxtnqPfXQ32fd8
         UEtdUqN1aRmG8ldeH+H/2rNDLSjYn9r8CtNgZJ8imeE3uA4ADGOSoNP6Ncjfb3PEIzo/
         BJrN0Mq5WUbcXWu/d3UK0R4KaGNeb2UKY0H6VX8YUKVFY0V3wR2EoQ5hu0WkTrkRHkUp
         hpJQRjXQZ/HyCDDsyHG2pbMOimfwZp87rcWDvN849XGJKR5/ZopSHOEkddoCboZvRnYX
         Dsjg==
X-Forwarded-Encrypted: i=1; AKwUvBwSmms9C9/Rx5DSuPD6+AYQfpJlMKykB8IPp69A0FpYpzkuJ5KhEUgUSRfQ/clQ7l60iemuefTOSgFAJQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKYnWXHt/3+T2W0GF8SZ7Y+Sr+8HIJK29Z0D+aTQNehCkCJ44om
	M/ugDAhWQZo+T9+LQuHeDndP3HDjC641O5mkP8a9709Rg7uB8tVMyxvX80ZNr3xujWQx6JWLDMt
	ASgO/lG9NqwqS8tp+LNsg4MAZMhi4QCE=
X-Gm-Gg: AYBFou3zns3bgUNKV1XZHSoegiO+9y0WjSuLzaResNMvDBXMRCLHZtpTUDGlnvcGgwi
	cA0BX/jlL5ryvSHUd1rHYCNtii1g6zzrLOwdWbprwsCsU9djPtqbZfGXlOozkbHYwXuUB4qVlZG
	PiU1rrmQbbDBW+rwoaUE0lc7q4A2KPLA+7b6UFn2yOG/x8aqOeoK/cxnZd0K19QH99pcPYUYwVq
	+gWe0/tT1TLRmiDZTw1eJ6HqnGVUD4eoCw/j3Sk33Hgz5B1M3DkSyzwZbiWjab+lnBoqJhmtgKM
	8orfHUc3rCCw/DIl787dQKTo6qBamvILlqVErV+yK+Pj1EprGKOrFdLU9cGsKxf2lc52xE6Zti0
	JF5Ne1DuVID33BiK7fT3YgVZmaLJO1e4eh8G5eO7nEXUOLY5BEY2xuVzTBiT9+eDP+jg=
X-Received: by 2002:a17:902:e547:b0:2e8:93b5:c555 with SMTP id
 d9443c01a7336-2e9a6e5296emr76192995ad.61.1792462257434; Mon, 19 Oct 2026
 19:10:57 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com> <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
In-Reply-To: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 20 Oct 2026 09:10:45 +0700
X-Gm-Features: AclHuK-OxoOqEZe9QHO9PQT5BaN1GB4IUM0kwzQZDjYp5iThqBCJWYOaobvziFs
Message-ID: <CAABR9nGOmx6zvost-Y9Zd2nzQa+ZMYxt2PtZ8xYPLZqZVGHegg@mail.gmail.com>
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,


> > In DMA mode, the generic dmaengine PCM component already applies
> > the integer PERIODS constraint in snd_dmaengine_pcm_open().
> >
> > Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> > the redundant component .open callback.
> >
> > Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>
>
> FTR:
>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>

Thanks for reviewing and testing!

Best regards,
Phuc
