Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C847F2F3
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549929; cv=none; b=eX8re/Qzd3i8o1M7vJCfL8u6PNk2qXFffolk1X/xkPjHMg3k6M1gDnF2M+qXbj9VUHSk95BcuaxXBAL/FkUSzBehMne6Fs6uo3Ejgv2YMFWQ5XVBPf+sAwqbBKT3Uh4UGuNKIsojEfkNYM4NOEZ2PCGbM0CGh6N88ZAZq3iEhW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549929; c=relaxed/simple;
	bh=oGjc1yjeiIqz4fk/uBDQWtGhcY0iItbRMgLP4C00KAw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qEDK81W+R7TyUDpfPDMo9sGLh3Bl83fGjX2Cvg/gwBASkV8ueJA5S7+2QN4hTpSs4L9aMMh7jNBwqQGdJFRMWNwPqs8VIObXdwGFaEqvHAZuCQZoBpU83ZnwdUSsobgFsFGVlH1bGizwzK3b5vrESuLizINCCVXWg5xHhGo5zIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LveiTJjN; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LveiTJjN"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-389f9895c81so34367001fa.2
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 06:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772549924; x=1773154724; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGjc1yjeiIqz4fk/uBDQWtGhcY0iItbRMgLP4C00KAw=;
        b=LveiTJjNXx5hPNvBlBSnvouKNtULsS930y+9lYTIz0ur59YAQK7guIOg6a0J4M4toT
         awLTA2i7sR8LN9EhZvoi5ZnVNxcpk4B1ck1z9aOvPluM1ywHwjMLcmN8FC7lQsu6w4zI
         xTu1DidaNqIdXgj8C3RAERdLJLmjDd8PVaZY3pF3KuQR95d60HDUA4NozaDCq/1NgoZc
         V3uiyI8EaJ172xFb8kc9+L1xswUS2mByrvyuIJqfsTKiP1QMsbtVzL6mpAt9yYnsr8+c
         2r1AEd2/cQhW1bg5BdXdgFy4+dobuUmpoHmRy/aVb1M6h5N7e5dNZViz+9tNR6Z35+CY
         LdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549924; x=1773154724;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGjc1yjeiIqz4fk/uBDQWtGhcY0iItbRMgLP4C00KAw=;
        b=Zd4iFltTlDgNdPYpBx/HPYh9It0/jBI13jp2CvaFjLOsBsP4Cd8B1PpbZLsJL9r8fz
         I5gbRSlSQ2fJ/2IwBATSGaqmhtMVkSjiHYs3XVjKtQK2xwMP1W7uLVb3+GSOtCbuhV3Y
         OYfXqMXHJHOkaQmRjI11VNXTjN0/0zq7q5eKCqd+sB4okOm3BPM+584AgeGK72I9drxW
         H0OOif9sADd3FXcgW2wJ15ZH59bRGJ2upf053iTUbmbDPKhMA4f66WDBeRkDo5Y+YGXN
         OYuAHFllOhQsSUKXV2GLnzkJ0GAxYQZhDSl2/168gswz5TLykHsAvUq7OPshPTzOr8SY
         N2JA==
X-Forwarded-Encrypted: i=1; AJvYcCUgGDoyXU3k5Z2GR8mZl0d+EXOAXJDRgnnSkCL+uvU+v5q3Qy3WuyclQEKEY9g/eAHv8hKuk2zEj2gyKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxArztg6W1eZBe2eqXi0D4+MpXwKv3qcRTe3h/p9Jwa8q/xdeND
	UBGqumDQ273KW7baeFae/GQGe+GsNUzBmsR1Vp8LDjZOA5oEAZnjGnsX
X-Gm-Gg: ATEYQzxg7BJZm1jI3cQEwWzGC6Bm9ZYJf/1LLOy5CoN+KRYEuNhID3QmByaa8B1hTGt
	oNbFvJfFS8C91IA3D3m5MB87EthhUy7fZD/C3ZVktwctvOttKyb48eyEegT1Hy2JjPOuHoCtAGv
	Kmko0kVYJeZx6sSID8as8TzPfJlmXzCaHJn+TfDDeDhR0KOKCiQRbC19kzGggZOlRS3zbr3+/BN
	WWpLaoPVOVqTF5ov8omMklI4qEthivD5b4YdrO8Bij250qaNR0F4cDyupC3s0XMYpbckxtiaUPt
	etaLNkgbbgJ1Ce21823sxK02h5GAVds63NSmfxvTa0B1fJfWD3tc/gDo7byaGATz6OfDi6bcWJr
	Uf185Q4mYZBzrpChJ2Oj9cNanlYTuPKWZl+oXbVrhirDxINe9EioIxbNKclrEfqRRJobHEE8OjN
	aBtQjlSTWq8rD+YI/fXEZFJpxu9psbsvfjnNhCHTAWZthyP0IqHOK12t+Dp/Jfa03HUEySN1R5s
	Bbdk44kMPbJzb0vPPC0sIEmxWB1haL6XolGS3C//338Y6Y=
X-Received: by 2002:a2e:80cf:0:b0:37b:aaf7:f022 with SMTP id 38308e7fff4ca-389ff3644bemr93473051fa.35.1772549923580;
        Tue, 03 Mar 2026 06:58:43 -0800 (PST)
Received: from smtpclient.apple (2001-14ba-437-c00-1991-9ef0-d3f1-621a.rev.dnainternet.fi. [2001:14ba:437:c00:1991:9ef0:d3f1:621a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a124d7fd31sm359172e87.68.2026.03.03.06.58.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Mar 2026 06:58:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH v5 03/28] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20260227135428.783983-4-herve.codina@bootlin.com>
Date: Tue, 3 Mar 2026 16:58:30 +0200
Cc: Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>,
 Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Linus Walleij <linusw@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Wolfram Sang <wsa@kernel.org>,
 linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev,
 imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com,
 linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Saravana Kannan <saravanak@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7575FC9-7D0D-43E8-A477-4DEE79101C13@gmail.com>
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-4-herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
X-Mailer: Apple Mail (2.3864.400.21)

On 27. Feb 2026, at 15.54, Herve Codina <herve.codina@bootlin.com> =
wrote:
>=20
> From: Saravana Kannan <saravanak@google.com>
>=20
> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows =
newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.
>=20
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT =
overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: =
https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=3D9F9r=
Z+-KzjOg@mail.gmail.com/
> Closes: =
https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: =
https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: =
https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@google.com=
/
> [Herve: Rebase on top of recent kernel and use =
get_device_from_fwnode()]
> [Herve: Add the call to driver_deferred_probe_trigger()]
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>=20

Hello Herv=C3=A9,

Tested this patch series with BeagleBone Black and all tests pass. =
bd718x7 driver probes.

Tested-by: Kalle Niemi <kaleposti@gmail.com>

BR
Kalle=
