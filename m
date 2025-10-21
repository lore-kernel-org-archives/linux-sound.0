Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF732E6A6
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043045; cv=none; b=ef8N7RNNddk84F8qLyCqbTpt7QWqCczTfd7ocucFvrTcrvNsgrLuo+qLML8UY3iiOHV+aB3nVc465hquS1kvAOObwWPH3ZFBQ4mW8D/z+HezK0KlubdKZzChCMD/nap7jWLZ2DpwVgfrH696YNOYAO1FvJ1Ly3PmelLPovR8/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043045; c=relaxed/simple;
	bh=jY85f0BTm4xZQJc0duQtrHNO8Jvd21YwmPqak4eZGgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTmcdQu0fuayg6au78qtjWTSxKkZIV9GutUsIPfFZoLBoEsSKPvbIWuFBcLM0fRedDfTQpyv0l6C3pJteMqz5HW0w9KiZHbc70Mzu6J2cSMCkLE5n2AHNu6c/xklw0Ft3EJGXk48C3vfaURl7PDfaNskic7xqfqGpjzdMvUDkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AGShXXRu; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGShXXRu"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7847f4265e3so31363537b3.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761043041; x=1761647841; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/A+ENDDOHSgvE5iS6/3zjzMWUCCsA0O3Bo7N+5kZEq0=;
        b=AGShXXRuJ5ITWwpLzZJQ1VXWyVfQymzdKhuGNk25riiEfXTuHcL4EPvn7WHIF3kH8x
         OhnKKvNizFxKrcRYmouNm2QzTLg9F6U6J1RI+oX2GED2eZgbASnNHqfEOqrZ3TtI9iPF
         J5p310mP9UUOexfReXcEVrhGi5lqK3bZr2ur3ZtTX8FB0jcsNJtRSxI/NCjnUrdGeVLy
         Rc0DkmPO2AB4WidOkKeisoVL7e3xqpHy96K6x11xdTr9NJgOLXMVhbEhXVg9VaRRC5mY
         qnUdIVVTDcJ6Dl1jgkN3+L8UZR4GCsuyyzZd3iqsSfgDUEoErOhqbDjsu9V2mbDNm0CM
         qEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043041; x=1761647841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/A+ENDDOHSgvE5iS6/3zjzMWUCCsA0O3Bo7N+5kZEq0=;
        b=H86dhUY6+Rj31crvC+Vr9pYSHDsZHgClmf8vBXRLqg9kyeqoboqALUYDj9IfeQ45A2
         COuABbiMksJpe25JGlZ5ixQGt0SdXzUCux7vwmBJNm0L6/Ns1fwFKyVaMeh+K0vrvqaF
         /YiyWXVbceHwVAS/XAflzmBSj4QEgcfr4j6gDYeba6UsGUd5VjmfR3MMa1t9aEwidaYF
         6C71UpE08/k38WhqRSdNcwWlYReK2rC1VWBCc7YbfX7osNtDjnUYSlshAxTQAzw+YuqS
         6ZQQgdUbyTBBq9tZCpcbYpqQKw/3UPsTGsEUura4NdLQ9Oc19HJaOpO6Z+36BjK3Vtl8
         R+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs4nxvnl/fx1Cx7im9gXa7YYdH0DfJN2vMBqqYtHZGML+yZtRGIYo4LZXWnmCDalEHQA8KcivN+TndtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwkwVURfj98tUIlJx7/BkvFUnF9B0qZTphuJEqOXCCFalIp9hh
	tk503NHkCktJUpCrwvWR9fojBWWwTPWWADZO1nrfBBeXABTvVZ391EVGkjh7aS+iEgsyRte25JY
	T43y1Ba/SZ1Ffk3UBgHinH4uxYmKqGnDY5ZZxJWpAzw==
X-Gm-Gg: ASbGncs3CZYeuyx80bKdBn1IWPbK1Vbc1HqCrtql4ZdMrctx2r1wO3+yzbttmMdcczs
	WM6EboxYPP7HPUYhqS5u+JLUP3OYPAzuIzTHkNwrEyO7+wM4DHGmDtnhUxNHiWIq+Hyb4zfQYSi
	i3Iqq+pN/bsatfDxTaeC9jQTPCdGd3kfBsAg7ngy0360dv7Iaov5uILoiACe0pafrW5YnAFGh2V
	PNoNYk991yiUwNQhdDw9IN45i6WyPJgSem/pdXT3plStEmRhL3blHKbn711fw==
X-Google-Smtp-Source: AGHT+IHoJvOW0/D6MieN+AKPcyEQMvpsuZMp0uNhFRTQ30AAyYSDWJV0Zne8KGeUusjjnlwIFn81QpMo/9iO3PYky6c=
X-Received: by 2002:a05:690e:134a:b0:63e:34ed:a11f with SMTP id
 956f58d0204a3-63e34eda840mr5668133d50.27.1761043041095; Tue, 21 Oct 2025
 03:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com> <20251015071420.1173068-9-herve.codina@bootlin.com>
In-Reply-To: <20251015071420.1173068-9-herve.codina@bootlin.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 12:36:44 +0200
X-Gm-Features: AS18NWD7omNxrmhFqrJYVWmQS9VjywGnfIZM0lhZMuwUv9gCSC75_xRcZL7iDfA
Message-ID: <CAPDyKFr8C2VifsPa4YRPBEt4iAtM3eqnpH+C6wdSASF10fMO0w@mail.gmail.com>
Subject: Re: [PATCH v4 08/29] driver core: fw_devlink: Introduce fw_devlink_set_device()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Oct 2025 at 09:17, Herve Codina <herve.codina@bootlin.com> wrote:
>
> Setting fwnode->dev is specific to fw_devlink.
>
> In order to avoid having a direct 'fwnode->dev = dev;' in several
> place in the kernel, introduce fw_devlink_set_device() helper to perform
> this operation.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  include/linux/fwnode.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index a921ca2fe940..a1345e274125 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -231,4 +231,10 @@ void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
>  void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode);
>  bool fw_devlink_is_strict(void);
>
> +static inline void fw_devlink_set_device(struct fwnode_handle *fwnode,
> +                                        struct device *dev)
> +{
> +       fwnode->dev = dev;
> +}
> +
>  #endif
> --
> 2.51.0
>
