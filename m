Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794210021;
	b=tIphVtpqAS/6ClZEmIbZOmIJzWvEBhCwU21q9HGV0vybFF0Ru8lAfktljnsnZfj9LL3C
	 vgZqHczAoTUhd/mpTamWfgb+GvcNehzlFhJHpAe21V/Cut/DVJjir7xOk0FGs+yG3hXvs
	 53QdeU0hdPvmDASfSjkDlXe1JmH+ZGsVekEGxCaP7E1ld1mhUHvrtrmwkqcgvaCQBYC6q
	 cZ3tvuFFzewh3oFhzgk6nTTHPwPooldoFHQl1A1wLnKIrRTzDUzgl+MwaTkzJDu/L/lA5
	 2tJ2k7dGZus44ZNyliRPvfj9/h6jVxR811JTph8Nca8uc54zDMyqJp7ezWi7lfHNdmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=YM5afPKj0CxVgCKzM9dnYuxhevHjS1v1HWXkDOYAgqfE2qhhPN5/f753H/en6oPZc9BW
	 WfeoBD095NfWNGhWc0g6V7qa0B5LHxLHKnS09+Ut28VRls/wpiB5bDTmI1qZHJRFTEXso
	 Z9AK3VqN0JsM+/l889+VnZSw7Cb1MHw57Gc7EOypKA7lE5Nk8VwTRupS+RkkZ+ttwn3py
	 yLugr7Jjnv7Y0+/MA2SQGQiQpy5tjQhknJPh8z336/wK03t3hFap1R+/GHHvA4ox/14Zt
	 BJPGVKfAv9oWdk4Se/IWKChzLaOPQHCZAcP8EwRMlFffcqSHgIexYRI3u+eMio5gDnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB;
	arc=fail smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66697606A323
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66697606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so265483a91.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=jDDLnmEDsGu0adUo/8c5hEso4TgBqjlZkvbIMIbDKpGb6D67ZhubLpw9kfQXb4mp+N
         H/kUuZdJkjjSEoSsJyh2uMejxmcYj9EbaNVde6/jZsITLL01UH6+TOm/dBLELCWu8tqG
         NQugoP5T3ICJfbC3kcsuYTtE4lFD6WwTJl/ykun1MkZ9Rz4vZpL0iVMABQ1hmCJAfBt5
         on/cir+aKxlnzPeglaTNDTuAuRRyG6BJIbQ1VAJMJjGIIdHDSo42D2BEIc6TXRo5x5t+
         PrWWd+EIW2HTUUzvwFy9z2Xx2oEpClXwKIvESkwPqq2qJ1KAxxLPRDfHRa0XTXIr7njg
         stgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=22hf9/dzd6e1+bFdkadL5SPvQYGKKLvEGFWUOsPuIOQ=;
        b=WvExfydPcEelmM8rmg41ZqXBHjxnHokAJGNheuGYC1j1oXdLGlMYBNYxQYRzjaacqe
         c+McHaUjHByRGOWuu/5jTljL0YzAs94zpXt/QXq6T9loalpWk5TUJBboKshOCmHCp9ZW
         c4l/m8icp2rChy+ScGnJ3aXCzr8JwpCNYfEmsm1JBY8iiP4JZwzvaBtGinAEsQF43WLW
         mVq2ox1focmmZ6PYJ68LCetDCCIMTd+qlZg+M4yFaWDfGm6bdNln896tyuSis9oszACE
         T+gjVRLwsbgGZ0PhKZr0bFrWF2f4MgYyJqdffy9CLpKIkZSWPX+Zx4r7R2zqF01O5ecP
         bqTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=Fw1HJ3eBrEG+YcG2OfXIKNyXLbtxL6pFyShNR64xnTBicLVJTLcqI70PP7XlmXPNx6
         VWmQ662eksYGc8vJo+lcMpjTIaYcJB9aokKPIxavS8OWhjpOs8W89bix1ozwYvKeb3b4
         M7C1Y4n+R7cdsAeFDh3I3fT0WNvzf0CnRZWDlQZYC+5M2rSyX8wMQx9uS+vQs8QSo0d/
         2FLip2Uo0zLuYIubK7TNTBZ4sl8ZrZ+JeHk7SDm/ZlHHFtWu1M3YyNEi+YttPBGWC2RM
         X/hXAhXzRlZNf20NwByFmIPl+GnzmQCqAB4nehLzmm3jWxLA5k3xC+msTg/JbR6XvUqv
         ep4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=2aJt9F33idtEdS3aUX61yGu01u8j6otSY4LUDyd79SQV+nPOhR3a/WykRclQxR3VRR
         9QFg87TcMusSW8NqSeyJflDWtDD5ssdUezL7/HpgF3moR7aA5uOmtKHB2lINHgyh4i+F
         jkN2xZOVXf0IHJ0BMZIxoQKt+iE1nLc/5jvF6p9ZFaXkPrxGzUuS4qa5jxuCZhlHu28G
         ikZS/0BhtnpHoRYqeYHwFzTY9c7F7hbPSmyfgL6x7A6W0vNZ9QD8P0jVV0D1p4dnyvvN
         UcSoWmYn2IWqpMA8XE9BKJABLubF5b1TplZv1UVY2YnGvHkRIHutuK5SnbB2gS0uaG7D
         wh3Q==
X-Forwarded-Encrypted: i=1; AL+hErGixo51rI+gmijqo+SPSabijwICfYF8Bf0saaKQAuMZ3uRUn5wRKBjw1BVfVvKVw0GkuJUG+shZqXS2Xw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8p7s39a0MFGuWhFqBgYhDUtbfkf3lL1teMoCAGX7oaZluFWDHH
	ABGZ8l5YlsQXoIK/Me9V5Y8KP4MzMNGUPw73tdQAT+M5q+C9eSTwEVieznWlbqjJa8HlbMF3IYm
	ltL4qSMwMenwR9QKQigEZl0b/I3G+/5I=
X-Gm-Gg: AYBFou15iMOYk5Hzbf0UHhhXBob/tc19Sksm+i8htJuOEB37ZGxL6zNmHwbOGSkMDgF
	IIearP7/oeA629LFoHyeSWTnM07oFi2K97Z+ay6Uw+1adXDfKzO//48c4Opmi4ioZDAWN83VfXZ
	hnFIPdHPI2r42IYX4fp/2iq7xVccmmnixqsjt0yIc4Ddt995rMrqePbXsq1iEKnhQd0LAJlrUtM
	OvPEqZ8/7/9ROHlviRvzviXA3EAi2ag7k2KUFHz4W/nJ1OeXAKmR7pZHgLCUN3c2aMMyielPmqU
	jIcko+NqZeTz95hDQ8q6Rv6b6JeqXMYpCjFMJ9rOg2u+W3RPkMfEZprcIC/23xY8j3q4h7xIc+q
	E6ZhfYAZ8XHsVt7Cqlwb/YQ/NERVUZN/OHJ0=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
