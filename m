Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E023603C1
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395055; cv=pass; b=ShzcePV3w5nmfsQ0sBIX07EKreQrbxL+KtmWydsSSHi9olcetJYVo3w9n5V1IGnwteKswgzshNIl7BIRp0FUmg7MXvUK1XmmTkryl9cUK0AkpS7VcOkTCcuS7/fP22g8IsztdlQyd6w4RPmKP7wQTjANJymCyCDZ7a3V24yQuRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395055; c=relaxed/simple;
	bh=a4PkyDJIX7KyCPscZwhkhXLXTwGONJMI97/AnswuOLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNhCfYu0te5rT3smnSILya2p9pwPy3GU5pH4Ig+dcchzUVoe3+9YFF0n5bnpzrX9fdLLTbhhZwUCxU3LowfDL4288M9pgNkk/E7BsS1yptsPn8gqra6kmYKFKvqtFiGdqrLLXc8wBOQzqvBkb10ETtKPAl2wl+BeLe2xNH/xEFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVJB0EpM; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVJB0EpM"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a12fbbd9d2so2670117e87.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 02:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773395051; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFJwEPbOR7iwLyHxDzGIoeOBUGNUUNfoHTEmOVAafQ4RS+gdSdPpseYdi8JrIoSVFn
         IF/7LAXUd3U0+/pI0PdoGADKlw3oUjtE7TkMxzubDElXXMyO7kCL0d9joqzf8tCY6MmQ
         s6vUfkoUdU1OiuHV51MtVt5icsrAtwK06bHpy5yRJsoZ1kr5hRUHhSZIi/WRJtlckEpg
         8lL1FMCli/0hPJWJ7+28ICS5+JFTINgBM6p3NOH2RIdGxa98yD+9gXsj73HTZKpZOl+O
         leYmKOEPt8ykNtZ7gknPs9WaorcvdDyTgY/lZ55OHUBKJlKQFw6R5SJpBX+kj4jAKhwA
         bMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        fh=r1WMHuv4NP+8tPsf3Zo7BK2oJ5iqve3tG8bFeVjkcAA=;
        b=J53PXfKv2V97dBDYll6H4jjWAnGbx3E2NhHaV5aAAymKFXvYHyZ3U9ptdtxLqIb3tq
         KuCSOXZobDh3+tt6QbSM+4S4QyeMHJx1y9Ygbti2czM0qawwtV91zGmwAEPgtCJJmkQI
         qnPjBkMN5lMtsmTl8bsjSs1/0UNioSxWfFr3yZXJUsOKkiYeOHnW/D+S0E2nU1PPPoK+
         cnhvSIUKjfrSyvlfD8o6BmPK8Eia6abj5YaLtG6lYhXyhrlbUf7Unvfaq0TJ1UBqD5Dg
         XaBXTDYbU+DFQ4rZDtE1uqOFGGyeU9O+CjpFS8+pB2HWwAszfalXqkX2VE6dTCD3M8FK
         WQQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773395051; x=1773999851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        b=CVJB0EpMEVa6sLzbpbpZgC6oxzg2jOtTdosOr5xZNtsl8bsqrxagaYbJB1fdwaFsDi
         MU38WYuy9AWHvdgCpCuHaIpr0k74xYGQOeELdWDSwcfyzs8cqYkIXiRIRrqyxiibpEVP
         wMrz3HxyzbyPSSjmSzWbKbBJgizyZo+BgjwH4r+2CXA44MTS6E41EE0YnfUJRp2yUitr
         rl9LQ9jslbZWwEoeHXtCnBIpFBQl7bMUoyyvJJ1DVrzW8G12l73vTupZQjGfuJkAAf20
         jQIIgy05OQGFnn5ib4SoM+EKD7qPNjwSuIvoucoWtcAxJOQaShYcNfKbcoRIEG60ZMKr
         agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395051; x=1773999851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        b=jA+Jem4vEYFITGz/s+/JoydcVYVgEcoVcmoBQUjELz6MrI7Qafg/Tke5PS4xem8YGj
         oKIgopCfUzgm7uEdLQBwegMQ7qZnw8tdGrMDsCDl0ouAHwUYXLaqIEoLdq4QBtjI5PU+
         qUxjrJgxBt+cv30mU5aEZAKe2CzswBgALWBRvJa4n4s6wTeY2nItjCHylVj6vkInW0po
         daRUxLqrKtGUzOlxnBp/eEe0ZUhx1H2j/2sgsXyr72t0Uy+TqR1rdCVy4i/HBQbI+x02
         Bfv+C+EC77UOY30EbxiC3GylVyDo6NAXRXl6ALk/hcwAMZzaOq4NuD9eMivcQoB0/1iz
         7g7g==
X-Forwarded-Encrypted: i=1; AJvYcCXh+P53hLN/2oeO1nRiGEMDzNiWBhZ5iWtN1EyKFeApGy1CdmqnwdPC+HbANl6tbHE18x9+gxDWtNWJTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJNuX0DXqvDIIWvFVglSsafZNCDQiGqs47JjyZ2BYLDDq4x+w
	Cj9rC/s6hDvuNEJuzZCxmoSpN3hK4eojAahWK56qV0l88SaGSRZLykgTXSuBQaUL+kAJTjFmEEu
	NSSr3AYJWNUJRxvS+JxSAnMiKDqLZ5Uj7JaaP7dUa1w==
X-Gm-Gg: ATEYQzw3I6po1pNpgUiAQKSg4S1c3UWk2bccf9KBKqtGElCNdTHdopwKHnOnWlhcCdK
	yHsdAJRGvFjPD6MhPsDc6lXvcFhji4FD0iaKKctmPbVOV24cdhLczwmkgWoxFQism9aVWYyJy7a
	J+SKnm0rICLPTIzpWZIfwA8cea9Dt/9yPrYEO679/hu61/RyoLZfkZwkWu23tDbgHZENkw0COEl
	xjjNX2EZxyqptHW4xUB1IWI2COc6i/dwYZIHwJCchCxHjW7SV6QTRN4Ur83ofPBtMDk0LZeB9Yo
	Guq2vPLJ
X-Received: by 2002:a05:6512:1589:b0:5a1:381b:fae2 with SMTP id
 2adb3069b0e04-5a162b0d32fmr863539e87.33.1773395050576; Fri, 13 Mar 2026
 02:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-3-herve.codina@bootlin.com> <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
 <2026031242-debug-aviation-19b8@gregkh>
In-Reply-To: <2026031242-debug-aviation-19b8@gregkh>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Mar 2026 10:43:33 +0100
X-Gm-Features: AaiRm535RzzFrlMRqNsLHd1XM8yzn674dd-38MKB2CsmserIvJfHsK0fUYGtRYw
Message-ID: <CAPDyKFpX3A3r4s72PNjBz5QaZUsq1xaGhn5vXwegue7Tyh_Zew@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
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

On Thu, 12 Mar 2026 at 16:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 10, 2026 at 04:03:42PM +0100, Geert Uytterhoeven wrote:
> > Hi Herv=C3=A9,
> >
> > On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> w=
rote:
> > > get_dev_from_fwnode() calls get_device() and so it acquires a referen=
ce
> > > on the device returned.
> > >
> > > In order to be more obvious that this wrapper is a get_device() varia=
nt,
> > > rename it to get_device_from_fwnode().
> > >
> > > Suggested-by: Mark Brown <broonie@kernel.org>
> > > Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aY=
SV=3DiEkKPNbNOccYmA@mail.gmail.com/
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Reviewed-by: Saravana Kannan <saravanak@google.com>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > FTR, one more user of get_dev_from_fwnode() appeared in commit
> > 9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
> > in reset/next.
>
> Ick, that's going to make this hard to land anywhere.  This is a rough
> series, perhaps it should be split up to make it easier somehow?
>
> thanks,
>
> greg k-h

I fully agree with the above. Renaming the function isn't necessary
for the $subject series.

I suggest we simply drop this patch from the series - and if the
renaming really makes sense in the end, we can deal with that
separately later on.

So withdrawing my ack from this one.

Kind regards
Uffe
