Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846399;
	b=klTWMnIObd0Uy2/blv8MQ99JjzBO4k9a+/hwXPAUdyfRa/8fSMwVzq+dfpUBbdpRguTy
	 x1JrOHtAaJzlDLGPfHY1Awr90td8axS5nrYpvznL09KVRp+xsMP+7SguZ+K3CpEx3lDGy
	 iAa3mD/n+iv4KBGolriimHYCGVu8VU9C1NoQSpNVPgDMGBDLELUYaQBkq8fV9uoHq/xH5
	 oOXWmvw0rfSVZcB94yzCrxYF2/4Y2y0LkKU9omz8l63udKGAeUq4fVtDsvmYw1uoHxsPp
	 xYcMd92xkSCvX7l0kv+NUPcBwpbucKBYS51MX013Q1KUqOFT9McF3oCMvnAHxDpSRmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846399;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=fibm+xWnVTFk9WOStSUQoCIhPd9MbuCjEtpwWphpRYsrQTMH6GPkftKU/+QNA3g/M/rX
	 GJ+yirUNkqd4FbKywA5AqbhNdCtczoO8QAwmUZfMmsfX97H7JMuIfP5BLM7c0gQCQPAwD
	 D0RU0cQkOsn+DJ/8fN/HL8ng+7vddl6Vjw5wZ5TphcbtHB7XTo8cc5RjzGEQ+ZIrTFDHM
	 /C1qzNbke96Ui7tlCIhgLfRt08R9nT5Jlg5+iJJ+0QlpPPsfBy2PTqKE3IOqvM+XJOT0B
	 AUheJf1DPxksTmj90RTkwMtDQpw1rS4yaKsHKMPzv7tSs7YO2D98FrgceMv53ytB8aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KM6jG51j;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23D606D813
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE23D606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KM6jG51j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846388;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=KM6jG51jfXUoSCb57V4cpBGaTQ+dTrgtvDKc7ult3QhPfcC4XqYOot3xI8+s56T5F
	 4p78QdFKgK1wTJxD2na7iIGYuuw6fGfVhGkO0ZdIlBOgi/OtzDf3u8aEo1FEXJiFys
	 Y9/rnd3Z+0HSwmDAR1GMB01LNKfhtvmSxzyyVA4M=
X-QQ-mid: esmtpgz10t1793846385t6136daee
X-QQ-Originating-IP: IrrE7DTEsIRvvtlccHe5axB50UnPsAkjVM2jboneXdg=
Received: from mail-pj1-f53.google.com ( [209.85.216.53])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11059102742118949027
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso697639a91.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByj+GIUFpo0NVlPQB7ZqJx2DhhkK0TpbnvqwcA+ZoC2oW/fDnAvM45EKFZyLKL0uxqvDXxvKscTdnD6Eg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8z0soH0dUBTrpYEr/hE6/OF5raPSUDnLPlrdf3wkuNhHq2RA9X
	wosDWIU4eyrYAgHDlSymUvGXgO0rIXgmBACPinoTwMHO4cPakZJO20wiEZqA8dcTNeyR8J40mEw
	dBSwDuacvlh2LdjprC2APbDdzqCQYppQ=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N+GHbCqZfe8MkvVx/RKbAiL3qduOs8T5/yLIPXPgldEzrcQb2p6Br4X3
	5glBtpNHWMuphtu7Zw8PrXY9n88XVFumnqQujq/0gqnVW8Z2hWkxcrVoxGJKNZuopRK5yS8
	b68E1nbEhFcTCDn0fBHQThatwNBOdZWmkAqE9BYlPArzHitVe6ITzkrtkoOkwifPDz1h643
	4xNyjHQAYG4K8e71Kr3h7F0tC87qcNTnbOAyDgpkEoE1Q8PxpW4dr5HuS2RT4wJNwq9Pflo
	R+2cWBks4RNj4rAH4uQ8zmCC7DRfrR67ioCyyEO/+Wm4ZFaDHW9nPJiXYn1qOHUZ9+ZJnNo
	nAFdrAJLe4+uJ5E6FaRN4sQi69cYW8rLgkF13hluJLgUEpAeRh6skf89SNUKQ9tIO/7VQUA
	FlyFv/8D5gCHxrXl4nH9jrc4Aa9EhGRMYHzZosIFhah9UTDKhuLoH/IgK0xM0p9KJJtLN4S
	DwQ3hokwXDnzV+CJhpz19H7Q2xNedwDSUzRxFQIOqIcMCYfciBYHMFdvRK1OexBdFQLZKKY
	o224a6Jk7y/BFBa4A/hu0B/GIyogOLfHzeUtEqAKz0hP5TlFxEEaIlBwo/w3TsvzXFk+/Hn
	GfvZmf1QVVVkLz/DXF1Fghw/xOcVo8vc4TIA/9YqVRpG6Zuuz8iDBOVu4uMu+CU+noO6Uo/
	vXvknZMpCr0Ecu4t+Jyv1Pml8xrqhEu0959Arldh2KBLS6UNrHJVyQkIjAPqbCByzd+Lex3
	3l7tlpwkg5v5xE+Q9DdtShs32PlqiECF1hPQxj6SijU85zmUWW6lGvTqNVKjtor0qZJ4SQe
	TiKV+hsxV1XtuUaImeul6JLK3rsx/hTRJsmZzvPqKYA6tOeS7j2C0BKpyfmv93n3EkFI61l
	2ZFRxJIMiF+s9xFiUX0XZPmsl8xwDk0UXBJind3pvp4QdzdRi3Hw55OHLm4hzf33pSBBLgG
	xMNPL6pceFk8eZkWksxYZYpgiinyPyAo6plI35bHMXxFeKNNlLR1wh+48Ri+0iDcLhtTmIq
	lvVtrh9LgukXceHVxu/EzSfAP7/BflBw5pGD+GBYPexcYQMCNp
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
