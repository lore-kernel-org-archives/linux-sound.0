Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7E72192F5
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901128; cv=none; b=j05MKTRVAwU/gt0XPnkgagcJRs8yvwbYzZklAL5mkf1MDzMjkaziQ1AoHFP+veCp5y6+YlW4BqH+seL6AHCb/KVztakJ8EsEhJj3SRWQAkinr0w9b4br+xExL2YDsGEL7pr6jwoOAZUKEmaUoyCjwNiHkvRhHA5rzh7aLm6YjnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901128; c=relaxed/simple;
	bh=NYbl8HJcgb3R5SVJ9GXGI/Jq2+mOIag8w0HzHBPHPoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8Clb+2b2Ov7wYC79t7Sc2zlAZv1IAiWIhombP6uhSawvncARIJT1KcJpUWx5HEZ6mfR/JyHYW8o3xvxsC+lM+53SndvRpFMHAIalBvvkKNPk3o3I8AjlVBaD0gBqUswgipv3LrLV085Up0z8zUwqjvH9tiGur3Nhrde9EPze7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ecef02647eso15540181cf.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 01:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901125; x=1762505925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQVVX5c2GB+a2QgL3UYe6DKU+bmVaydohzEFkpxq/1c=;
        b=M9DPHptq8YA1dY1Ws7VGVwj0px35+MHHe4K7RhxTXikGsWkUzZXblT+8JqcqdF6gDF
         9AI1lGKB4mAbAoVy1QMjUmUE1mJfTLwqLFp/awSgIMoXq77H9T5oUAarvrcvt/hCzRUn
         yKdxQP76zyhEe58TmIOngqN7AlM+LJDLmZYSS11S7OFvkTKKDb9HA8ci9niCUmC2n8+d
         ZRv4FsjIQLxkbubiMDKYT7ZSIlVCdkVMR5K2F8X6BwnWKAHdK5leNxlpHcLilJvqqnUY
         V7pwKgh3+kK+RLes8zrSKLbS0iIStICnE22w9w+AtkM7Ya38BVevzmVMkiFeJXBli9xE
         HBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm7AUC7AYKhRX7oXWbN//dlIjnUTfYnRwOxIu/Nqw8a4hTNgiLcyL74Fz3YkJC8CoftXqFCszbILQYeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA4Yuu0JBdcwSQLDS7WwHGXosURxcWrevVQSpac8VZIE90+3vI
	vb6NzgAkLykjckLm6Fizy6bQxeVDDxhtA1Yaa2yY/tt4eBgFy0IexxM85qicgAzW
X-Gm-Gg: ASbGnctM/fmk0G36lJmvODGDgYG2N15Kqys2WDwEystQKCkAS+h3+N/YWVsti8H8CTp
	Scfyt3/xMaAZo/cvgcyvIM9Vc9cu2d2EozERtEJUv2NdQSi6yuQ6X8+a0UFgsxiXgz6/apWIj6w
	H0Zf49TnZJxwK5WmWiD4ywpSHmKdYMXPmh4kJYq0uBw9vhmxqKOFTT1/7Qcc+RpHyd5JtwE+s2s
	ZQaLfCzhLu4h5SgGvh2qBBdnKqZvzGu3dOAD3qoSwKajFv9iBngqFScCHCuHMo0lKX3ILcFKRjs
	jjz271XHWmCf2fGNbHXcDJxUiHS9K69QAg65098Or1ArVegUkDfCRqD6OO8EJzIDw/PQef4niBi
	NC8Lw5uPjfvyd4pams4O5giv22iT6msVHHkrR8Wwbr7Gy5CnBhmyXcoMlMtCsySkRHXKkiD4Tvc
	fptAZX5fE/Qq1onpBrJ8us4PKWxXBeAbaRxOVoOvIPYp91WxLd
X-Google-Smtp-Source: AGHT+IEJanriscslWxalviFm2M6W2bfrATFpM2gNfpDgPgF5PZmaWkfwthOOYhRN5oOmqjfnEvkvMQ==
X-Received: by 2002:a05:622a:5c13:b0:4ec:ee56:f5a0 with SMTP id d75a77b69052e-4ed310a76famr33833481cf.78.1761901125456;
        Fri, 31 Oct 2025 01:58:45 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac005b1551sm76324185a.10.2025.10.31.01.58.45
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:58:45 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-880255e7e4aso13977656d6.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 01:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhuIDxacVU3vZdVzWLlYBLndRJ3QTteJI4hEIhu8hEWhtKtMaDWLLOF2j1pAxaG0ddjGZ5aUjQnALCZQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5d5:f6ae:38c6 with SMTP id
 ada2fe7eead31-5dbb136ecc7mr717064137.37.1761900747573; Fri, 31 Oct 2025
 01:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com> <20251015071420.1173068-6-herve.codina@bootlin.com>
In-Reply-To: <20251015071420.1173068-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 09:52:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
X-Gm-Features: AWmQ_bm5vGlc5XXZic8RvnXrZNNcCRnf0-7M9Km7uh4sqx0Aign1FjKoX2MZmow
Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
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
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Wed, 15 Oct 2025 at 09:17, Herve Codina <herve.codina@bootlin.com> wrote=
:
> A Simple Platform Bus is a transparent bus that doesn't need a specific
> driver to perform operations at bus level.
>
> Similar to simple-bus, a Simple Platform Bus allows to automatically
> instantiate devices connected to this bus.
>
> Those devices are instantiated only by the Simple Platform Bus probe
> function itself.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/simple-platform-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Platform Bus
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  A Simple Platform Bus is a transparent bus that doesn't need a specifi=
c
> +  driver to perform operations at bus level.
> +
> +  Similar to simple-bus, a Simple Platform Bus allows to automatically
> +  instantiate devices connected to this bus. Those devices are instantia=
ted
> +  only by the Simple Platform Bus probe function itself.

So what are the differences with simple-bus? That its children are
instantiated "only by the Simple Platform Bus probe function itself"?
If that is the case, in which other places are simple-bus children
instantiated?

Do we need properties related to power-management (clocks, power-domains),
or will we need a "simple-pm-platform-bus" later? ;-)

FTR, I still think we wouldn't have needed the distinction between
"simple-bus" and "simple-pm-bus"...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
