Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444083161BA
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 10:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764845860; cv=none; b=P0CPCZg2/c984FkqEzF3CKpE3t5CMEH0FLzuUDwiBp8qvuWFOnMyGyWKbtgLUQEfIc7XuOceX+BLlGInQmrp1aVKB7lznYPKUPyXbrn+Q8AEdi6UZDBs8ACJ7N0NUO64uhqfKGCLSuEP95hA4kMZeWqtbOw84xDsjLL3bsbdHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764845860; c=relaxed/simple;
	bh=6slcK3EQrAXupPVJr9jM3Pcmh+QTUwh+iVFWsaKxXWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzzISmbkoAUA0BGb6hPEEqpTO/4mprU6y4yRsxGrRFsEiPPf2aSs4ZbZO2SuPv7jfnk8NpfW+CKlVd46HDdg78Y0yHYiYc23jMVzte59ADijkGfgo1sBL5QLP9uxEDSLaFNk1m3SalUTYItuuNLoZRQGPs9IkBUhBM7iZISnE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so885778b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 04 Dec 2025 02:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764845857; x=1765450657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gfnzYJnOAkS7SHNqKKzIeFzoFbDZmoEYIAPmuyxm7j4=;
        b=Y6K1Evl2U6/zSklpx0x0M9rdzF7lQLQHvuDJiI1oqJHlRJSUuRgTmFZov5vG/tvsAt
         nP28CvlYfwg/b42Z0wUzpGcD+wZhxl13S1TT3cKTcZqsRpndiX3TSEe+es5HZKJfBW40
         V8myhKq23I+Bejuto2V598UMbxSwy8ZvYPXYdJMZDSkr7o+1r+p+qfSNyb+SaQi6R6y5
         FaQjcFdJVAZYyD1B7AMRyrpCkTewd0wOyRWGEUmBrRwDIDXyInv/TgcjFOyv+OGyzWW+
         eWl/gNx74H7oFLrGanmTqpl4nkwmvqKxjEFBlJHkKrhvsPNmmdrctLt+NVV6lW5jXI+X
         +J9w==
X-Forwarded-Encrypted: i=1; AJvYcCXyEQFaZEaq6eJ0xvfT1JspTnDKwxmBbiKMzLFXlsxTzWJqmlu9q/tIs2xA0hCu6zA/pyCp0LO0RcFTGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/P6xeoheGV8vL8RbmnMGDVG0fimetnvYGp8ZjVVagh5TEYUu
	q3HC/kjpVhprfT4ylHpMSH5hZLjHbfiMCcoN7d8eslErpuLsaEAVF0775PCoRGL0
X-Gm-Gg: ASbGncu8yUpqJH2TU2eGGIVeCUFkyN0AFd9039l4thBEnM/hlIK067FnSV1pT/bHOm/
	cStKPLkrCBF8ARbDJ0G4GCb30+mQZAHv+cVndAOeCp+R1JRzLFMRFI+2MgVi/oE/3epIZSz7Kuk
	bIA9mEWkJpV099LjRPRgnurIuEyjc5l9RTC8gZmjfUC7hJnB0kwLIgS9ao4d2Os+PBspfL0e0lB
	VFvSiEkaY6Ho5SadIYJzgxamHMZzM0eSR7Y9JXYkLAKmzHts1ASbFBD8yZGvsyqghQSBEAxq2Uy
	3vmktwt2/cHVssFeFnCrdN5ag7YWHsV3TZR4imVaRh0+iBC5hAHbIA9xNyFHw048pGDySDm0BcX
	4+eLBiPNzU5IIPAMV8BA7zGyT+7zziGHc3HZFL8aGoHjkRkLcJGGsvCzQ5RLNY8AB/h8zpWAM3Y
	a1vCN2x3zQf44MZRoGa+x7pOH0PPj8CSZjjteVSseGBcnkrEWp0JV+
X-Google-Smtp-Source: AGHT+IHB89tB95eUubIevNBQn0xXghuvBfgjeLaA6ib7qg+mjI0qMMZfU7Lf2JKVhVxhM+P/+uyhcA==
X-Received: by 2002:a05:6a20:6a23:b0:34e:63bd:81b4 with SMTP id adf61e73a8af0-363f5cef89bmr6600295637.7.1764845856526;
        Thu, 04 Dec 2025 02:57:36 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a081587esm1847775b3a.27.2025.12.04.02.57.36
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 02:57:36 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so885759b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 04 Dec 2025 02:57:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVYH8HESzLSVQPdZ0N81bMTj8XOVwGtHcv2IMtZ5uWqaczORgCeYlxvycWdEYfyFkaHiiNjEEq+mSdiw==@vger.kernel.org
X-Received: by 2002:a05:6102:6889:b0:5dd:b69a:cdce with SMTP id
 ada2fe7eead31-5e48e28ea62mr1665640137.1.1764845364523; Thu, 04 Dec 2025
 02:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com> <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
 <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
 <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com> <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com> <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com> <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com> <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com> <20251204083839.4fb8a4b1@bootlin.com>
In-Reply-To: <20251204083839.4fb8a4b1@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Dec 2025 11:49:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
X-Gm-Features: AWmQ_blMXTXWTKLb__jRgM2vj510G0Mh23mSqsI1Cojt34ffki3w4wmdXTg_pQg
Message-ID: <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT overlays"
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Thu, 4 Dec 2025 at 08:39, Herve Codina <herve.codina@bootlin.com> wrote:
> Indeed, Kalle, Geert, I don't have your hardware, your related overlay or
> a similar one that could be used for test and also I don't have your out =
of
> tree code used to handle this overlay.
>
> I know overlays and fw_devlink have issues. Links created by fw_devlink
> when an overlay is applied were not correct on my side.
>
> Can you check your <supplier>--<consumer> links with 'ls /sys/class/devli=
nks'
>
> On my side, without my patches some links were not correct.
> They linked to the parent of the supplier instead of the supplier itself.
> The consequence is a kernel crash, use after free, refcounting failure, .=
..
> when the supplier device is removed.
>
> Indeed, with wrong links consumers were not removed before suppliers they
> used.
>
> Looking at Geert traces:
> --- 8< ---
> rcar_sound ec500000.sound: Failed to create device link (0x180) with
> supplier soc for /soc/sound@ec500000/rcar_sound,src/src-0
> rcar_sound ec500000.sound: Failed to create device link (0x180) with
> supplier soc for /soc/sound@ec500000/rcar_sound,src/src-1
> [...]
> --- 8< ---
>
> Even if it is not correct, why the soc device cannot be a provider?
> I don't have the answer to this question yet.

I have no idea. These failures (sound) are also not related to the
device I am adding through the overlay (SPI EEPROM).
Note that these failures appear only with your suggested fix, and are
not seen with just the patch in the subject of this email thread.

> Without having the exact tree structure of the base device-tree, the over=
lay
> and the way it is applied, and so without been able to reproduce the issu=
e
> on my side, investigating the issue is going to be difficult.
>
> I hope to find some help to move forward and fix the issue.

Base DTS is [1], overlay DTS is [2].
Applying and removing the overlay is done using OF_CONFIGFS[3],
and "overlay [add|rm] 25lc040"[4].

I assume you can reproduce the issue on any board that has an SPI
EEPROM, after moving the SPI bus enablement and SPI EEPROM node to an
overlay. Probably even with an I2C EEPROM instead.  Or even without
an actual EEPROM connected, as even the SPI bus fails to appear.

> Saravana's email (Saravana Kannan <saravanak@google.com>) seems incorrect=
.
> Got emails delivery failure with this email address.

Yeah, he moved company.
He is still alive, I met him in the LPC Training Session yesterday ;-)

Thanks!

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git/tree/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git/tree/arch/arm64/boot/dts/renesas/r8a77990-ebisu-cn41-msiof0-25lc040.=
dtso?h=3Dtopic/renesas-overlays-v6.17-rc1
[3] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git/log/?h=3Dtopic/overlays-v6.17-rc1
[4] https://elinux.org/R-Car/DT-Overlays#Helper_Script
[5] https://lore.kernel.org/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=3D9F9rZ+=
-KzjOg@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
