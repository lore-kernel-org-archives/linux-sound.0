Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732348;
	b=4wBWMn03ufjEnlXCn4xSSp6m+x4gVbndfCe7wkOWlvzCbYrsSPWIeXDDpdxEHQqYxueG
	 Yi5Z1Gcuw6UMyYbZkTZpuNQZ4N96AGM9nvrUTn7W0aUKEvYkKFd3cRKegHx2i72F8QXAG
	 w7ABX2jF4KD/+f/uhGFbi/sfqUrYpwEXOZwuApIacKhPRvWSluI9F15J5Z+ixgWR5FJs0
	 z1rYD9ttp95yBTybtAdWjXADQ40LtGjKAlVU8Iu0ql4clBVMLGu97sWEBCiv3VYfMq4Jq
	 kjnNW3Ia7Sr+BOzbKF1/uWRRNmuhw+v+Wh6fi9FyGaN0TD2wZHHImBujP9D30Vj8XbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
	b=N6YbHHKOQ8/qqlqGqVm0UUfcNPddiNFB6EKhhVxIWk1IvDKvJOj0nUlzCNZsXreC0now
	 ffNh9fzQi5jWDwlImktiYRXyLU9qNbp+/F8r0K1vFCYNmtpyjN5xTbzUm9JveWBjWu+4J
	 vRSw+/CkMXi4CPCHCkPT548dO+c6QPh0jx81Vxs8LMWtAB3Jrrv87bZpMyJdxNOWg8YZp
	 JrvcBGiahDRJYlqu7MCSVhSGeh+oG8aJhOXYlHNp59SeKDFaVYd0oiyMpbcZRNPE5nI28
	 UuWvJ4I4Rga1tfDkfv4PtqCB1p7l6WVfI1LhcrHeCUZyOD/uI9fpIN0J9NOdF/ZHReQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUGv2Kdq;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAF7606A333
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 18:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EAF7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUGv2Kdq
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a17a332ecso6821944eec.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 10:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732347; x=1794337147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=MUGv2KdqugwUjwtDn+5TEs87XsBH6SLTKU2VnuO7MeKo6hr4G5WH4O55wxRf43JXjq
         s4GLbtJziYvCL8aJeaRkPvbVSJRuYcD79RqLOhm3K8WcuWsYcB6Ziudrzsv1CrC07u0F
         eeK0IGODbK1MBN0NyElMx/axzRgFDpbY/f4N1s0bQx8OzhaCbM4C77eijEtz2tK6avwd
         jIuK+W4ysYUA0fCY/zhjI3sP/rkF9QL4GSrBo5192CeRPPyJlisVudQsAqBsfuVbx201
         8WfWRhga3xBSMnG6+AMLIpCzka4/V3h3bqBZnqQBBngmWmeWgvYnwglc9N9f6vswPPA4
         4s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732347; x=1794337147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=L8GVUrT5/LM/QfNhxj/U33JyVuoRMLxEXO8RXzuzwrIuiFsQMksEVDainOQYodtipy
         I47q1DPQmWQOJIw/yc9fzRRRHLLNRJ6frFHTbPUpTHrl6/iyj7VFa9MeBPsCefTV44zt
         l0EPbP1inXoWnkRZDgH+rsLk6ONux9Dlzw4XC358fpicQf7cwODzF4Rs/BiFq8Y8zC8g
         KGodSbohcsr+1uQve7E3xJ3m4djaSiuOZ6Xm7j+BrHiPSw5KH89XOs6a5RnRBLuHisAO
         iINIXst4blV4IgMVLVLWT4CFVGtKgp9gGkheOEawfku+2XcQEAbQwlnuReIxow3lQ18a
         NH6A==
X-Forwarded-Encrypted: i=1; AKwUvByF3GfLccIpHQvDd7eDPJWoRzYA70/SGHTV8NI20x9sTd6Lguxl46ti6soakKS0J9ITwr8nXRCqXypcNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/U2HJLf9NKMA19rr/Xhtgpqsf60OLb4UFSBgvTGIxd/QjbQ3bp
	BXw3+AIlJLxAYlm7aUstuh6/AkH9mgGdISBiaWz46KOigEU7Y5p7chSI
X-Gm-Gg: AYBFou1BweDMZUUXWquw2saGoDgaS0nbkSQ1LaauETzoz17qFJXGy07Eg5AyqOaqhn3
	B+ffq0EgzhN+0mGhtNYcLj2gymXYaf5nJrZ566JOmuT3g9eDwpoq+2fCqeUEGgJtgWGGlXc1o1J
	P0NxO9w6jdtuP3IfIdvNE4F7+h8nqRHIcHMm4Y0T9YRbaK928twEm9xSwM3Hj1WooADT20jCyjg
	uTL1xPluZqtg9Nse82eYR1c8wOzu2+J3PqqgH8C/rNE8se0mJ3SzB1pp5KYtB+JL0wr62f8ekeT
	82ADgJ4vo04l+l2WBd5PAPr0k393h/dSvAvy7GDwaWvJ5B1ggXtwL5WZ3qjuiBX9n6Or9TK0La1
	xYdlKUfpR6hGs7cTW0bT0pZK9SInDW+LBriff/E9m3AdxXgqkaOn4gSKtwa/YC0DFCxJdttTz7O
	OG+Hqr+/jy0iOyXiZRBHarH25o6m45vrlmdYD4bHgflV7VIrKTLBslOUD6Gnv/F9YpWOtpFDWPq
	PICUE4zEovsqQ2nrvQMLIMOxvv8HQ/e9+U6GBD1zQOsris+PmjqKqBt/o0TVzs5ecZl07rS7bPn
	xzo3D25U8rIVQ/QfAkOukVScDH3YWSqzefI+BB9uoh23zRslf9S8hVTARrOZKwDW9SvS
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr30787340eec.28.1793732346941;
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm49159eec.28.2026.11.03.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Date: Tue, 3 Nov 2026 10:58:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-tegra@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
Message-ID: <auou2CBiiR6zA0G0@google.com>
References: <20261102135330.2493332-1-robh@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>

On Mon, Nov 02, 2026 at 07:53:22AM -0600, Rob Herring (Arm) wrote:
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/display/xylon,logicvc-display.yaml      |  2 +-
>  .../devicetree/bindings/dpll/dpll-device.yaml        |  2 +-
>  .../bindings/embedded-controller/google,cros-ec.yaml |  4 ++--
>  .../intel,ixp4xx-network-processing-engine.yaml      |  2 +-
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml |  4 ++--
>  .../devicetree/bindings/hwmon/maxim,max31790.yaml    |  2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml    |  2 +-
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml         |  6 +++---
>  .../bindings/input/touchscreen/cypress,tt21000.yaml  |  2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
