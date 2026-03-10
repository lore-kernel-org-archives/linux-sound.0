Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF23033FE
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155048; cv=none; b=mm+fzZzfJKr5VGjbBbnMrq2UGrbLfFEZzodXt+D3OXPVui8Eb3B1YSsYgGe+d/rlaGcYF88X1aUAAosQIL4TWc3f1PtgnQ5CsRZPQVrTcELYL/etzMfMVNt02kfuVXbtb74w/xEwRGKUnlMfNVL5udJPfXBYR5G4uuSurixMgNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155048; c=relaxed/simple;
	bh=QEW3lhhJANPdrCVBmAIqH1dXUDPD23689ylzZ5dnJco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHFknIdwXmsk3lWdYmR/pBX5IQhpNzTgGWZPX2fG1U00bKC5hKo2pXTEr7fviBTpsTNoSV8LvB3aqLjEhqjp5gj4cfnM2dLLdZawTX7ctY7RxPweY7KvkRbEU+HYW77KIyLqjsTPK+oup8ZDuZspaLgj9O6La6sekcOMbez5yKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94dd687e040so2815579241.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 08:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155046; x=1773759846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ru18n38/qbgrYN5XhGLEd0K3IukQ/mw6D37X8x0z/qo=;
        b=BUu2yVFpKi28NoOp5xdsrjUlAGWOtps6vDS4l42ilpWaUIlDV7skwxjme4hd59juSY
         r7zuMvgdkmgbl5fqu5H5dRHQOs+WdVvS7ORXHVaKPu4ItSxOwK3iBmW1KW7kgGo0YTbE
         /fns+84XGHbGNYME5Pmlbx/592pVhXE8l6jnC077cBbB74Npj/HyYdKWwiI+HlVIw0lf
         XCd8/lahJrv48JkIKRc5n3Rbui+iRote6xF4hlNUR64Cq3iboZ246/7ugoWJJnHJ62gg
         k3daSKK4TKaN0sWcndFQFnsAaBl4wev8iwld33VE8AZ1XwJH6+Q6isMHGkYYE07ECA2g
         4+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWJRSSFNUroh/5E7e46/APxqr/6EtQ0J8ymmMhS2OnmRUlAnQFUKsAePRkUPu9/2/KJ0AtDNhCgwJgYlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6mlgXxpHqGJipxqKO81C0sfaadtQHs6YfnN5JPmH/YpV8Bn6
	ckGCHliHcBCZjnooWJP4iHwSbKeMxZLOS2zGhwKoU9j/OMsx28vrsbt3mCCW7Jtt
X-Gm-Gg: ATEYQzyuISJrlABnWYxVnQoe9rAAg3K16Lx9WvTmigVEvyUEtb+nwGxmbbPBEond9HA
	8AI4+ngYlYrIsxr6091UD7NanNwcYS4Kj++Xz5hViHm2ReIJDIgAek+K0YaVENRkxkgiGfs60s2
	yFXikqQ+2BqZG0A3vu/A08BijbB73/OxljmVUzHjGwzjjqfMy50/vADFzzWElRgdea6OvukbIPR
	Mrm9+ugOus1I8VfHUOEcL0pmI6iK0AGakPbAKvmekAJGnHttWmeRZ87yJT+5A0mdD97juSN9j72
	lmLju6KlKv3C0k68NzlUIhXnZaPE2tmQE3miTJpu2vZgoRYTSHOZlZzR/FMd7D7IacT+akGJCml
	d0lYhV7xVAbrBfSJuMaoYmY8FuBBFaK/G7uSMOLpyP/X4lYYhBD2SIGmFmVa8MeyT/mBVEdu3dJ
	lFl5cCZZvUH3bQgBgsjbx3a0yU8zmXHLssDLrb2U5Vx6ziAQMMNBtQGOv3cTzy
X-Received: by 2002:a05:6123:128:b0:56a:995d:8a55 with SMTP id 71dfb90a1353d-56b07e240d2mr5312275e0c.12.1773155039640;
        Tue, 10 Mar 2026 08:03:59 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b6ac44sm11186502e0c.19.2026.03.10.08.03.58
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:03:58 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffc1e25d6cso1435073137.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 08:03:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgjdNM3/cl/EAPaJGWy6QY03CLmUlXU9wDui/99RyYoyOaEe2ytK+Ys9yNNbTbqAcAz/loqTVAhjyKkQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:5f1:70fe:3027 with SMTP id
 ada2fe7eead31-5ffe6121c90mr5181206137.24.1773155033187; Tue, 10 Mar 2026
 08:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com> <20260227135428.783983-3-herve.codina@bootlin.com>
In-Reply-To: <20260227135428.783983-3-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Mar 2026 16:03:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
X-Gm-Features: AaiRm53b7liJL7XJhyMA-JPl81LkjhC0Orfn04kAcG7__Cf3-wDY5cIOlphhcC4
Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> wrote=
:
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
>
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=
=3DiEkKPNbNOccYmA@mail.gmail.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

FTR, one more user of get_dev_from_fwnode() appeared in commit
9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
in reset/next.

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
