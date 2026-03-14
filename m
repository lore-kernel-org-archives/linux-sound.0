Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E659B1A680B
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 02:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455564; cv=none; b=Lhreqy5yuVMyRBTDsbmYBru7MSwNlQN4go4EPFLkgP2zRHi6XupccHE1N+HRnTtfa24Ip8QPySxU0yMfmlKGwzm1HbftTVjh7Sof9T5VKbMAJyIqwunCgmChUwJybi42mgXL5vhuTqfkDwI7nVy6UAX5+i9P+IPLD6Zh3mwg3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455564; c=relaxed/simple;
	bh=VoXeC9IHasi/UAtluQskzXJbdOFysDaXJJx65ggrMMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IceeQ/PKyHnkeq+4S5fcFMLnmVzVyNOO4v1eogYzIimrbDyDBYxUdjjOldCR3AcADdgRA1XNiw2blEd09rU63t5Sa8I9ZRvvAcvDjMaiq3dxxsAUVn7rg7JxIKspE4wOVCs2Kid9B0qmZdlNOm4La8TmlB9N9UmKcmw3d+yBV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaPh32x2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaPh32x2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab232cc803so13610915ad.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 19:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773455562; x=1774060362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXws6LkfRc01I28IbH0KBFSnQLO6Cva5ehRLzaS0ijo=;
        b=TaPh32x2C2PPjVi51SR3q9oEfIiZcUM4QOe0xvRNY79z804WsNw5fXXl65BmZ5lwmM
         4HLkHHFB/Qrqko3BihJf6w0dFbKh10rqO4wLJIw5Crf5QgGoRIatHrbmm6GH3MNiDfrk
         TJARaEqXHk6Pyb7AUlSBdjN1ljsYvnkq6xdgCo+Dt9sBgx8yGVJDfWeBLd9350HQe4vI
         O5c5/BrRxghEis/l+C5SJN5eIPpRWCuz2z64cNPkv06JMAqo9AyvrskGickRVZxMFaXR
         58tOFbEbf5c5a0G/fEWzxDl2jnHNqjcaWqa+DRYCN3mzIlL32i22ILJjLz8QshRZff6s
         yeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455562; x=1774060362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXws6LkfRc01I28IbH0KBFSnQLO6Cva5ehRLzaS0ijo=;
        b=DWDHDUJmorbAtAVqEbfCquTzeHg3ZmpdtnUQqcU+CLcj4LFpv/iuJKRfkl0g4U1gwJ
         AJvY5fxqiGwVv3HcnOtLESFhbufqxZJ5QZ9Rfp709lKndrSMviAfeL96VUG+7c/nxeBY
         7qkpeJjAgPbMt3biPCTvFvDfAw1PHrjvC/qr0TBkirglNif3icl3zFH0Cl3CjJQwpWsY
         hb/jTXnSMs3IxUgnZL+X8z3JawZVmUwBo0lmtb6Lim4X3lbFlSPL1QTZodGChhq9GCSm
         /iln9WbktuGd6gcLxuet/StbDkeM4I8/gUfRziaCWjbIv664hGgqinuSYPorKYaaQ0l2
         +YXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPNMVrPyk8prThlAZHCp8M6UMYAKH/bK9YFyqm5UT0LPVw+AYNNtwrhuKNoXMjJNqbI21UEpJawfiYYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XhveU7KNB9hhv00s+IgqV/Ecqx1p9qJbU9bRLjoMsge0+vh/
	TQNHC6sJoxq6Z8QeqafbXTTNMHwY+/vR+Sr2qaATE/f7c3gRebKHYuX4
X-Gm-Gg: ATEYQzyF0jHIbHrkTSznA6Kfj2/FXCEvpGMu617WPuVU3xTZrypZ254djcY69ssY/U1
	YizMWXosK/unygfvpedsW7GAF1Q+lGn8Bgmpq3IHOh1QZUCjKKDsmKl7L0qljTftMjEWtzjkGJQ
	jsYi03hu3rVp5nt4zvUJKAGuEiFy0nvmWRblG2wzHNa22YCy6C7yUNxJuT36zcxjyGtbPMfCRbh
	rYtClrmBubDQy4ktMeN36wsnkxyjR82/i8fuBuh0KlhFDvS9cMyXaABr7nevgyP0gFU8bcKkqMH
	f5dddU5wCuar2h2NbNIMy+dGnekEmJ7loXUU+cFpwGHNA0M9VQJl6gr92k+CkDYmiWMp9AoGilU
	+1P/XrVigY2GUxbGZfXgwXUN8RN3vqHafOmww7tyLTvKqBwuiFZ6hPiGdqcBeppcT3B3apqFuCM
	K21KzrCVnCAkK8Ytl9PsjKlZsW0Bw+NOx/bo0m5+TcfEO8/MISrx1OG0w6oKr04iMObg3vUTjXm
	8DkT/CQ210i74/uWHSQPdggwBgF3wGg5zo3c0nKPuGKvBc0N1g+60FHbA+N6/i76zv+pl4BIEtF
	RGKmvVkgSz6c0A==
X-Received: by 2002:a17:903:28f:b0:2ad:edc4:1796 with SMTP id d9443c01a7336-2aecaa4d681mr54393645ad.39.1773455562268;
        Fri, 13 Mar 2026 19:32:42 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8093casm35373165ad.61.2026.03.13.19.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:32:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Frank Li <Frank.Li@nxp.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject:
 Re: [PATCH v3 7/7] ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle
Date: Sat, 14 Mar 2026 12:32:26 +1000
Message-ID: <5796105.LvFx2qVVIh@setsuna>
In-Reply-To: <6a3cc78a-77bc-473e-bfbf-caffbe8f25bb@sirena.org.uk>
References:
 <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
 <6a3cc78a-77bc-473e-bfbf-caffbe8f25bb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 13 March 2026 12:33:05=E2=80=AFam Australian Eastern Standard Ti=
me Mark Brown wrote:
> On Sun, Mar 01, 2026 at 06:05:26PM +1000, James Calligeros wrote:
> > +static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
> > +				    unsigned int tx_mask,
> > +				    unsigned int rx_mask,
> > +				    int tx_mode, int rx_mode)
> > +{
> >=20
> > +	switch (tx_mode) {
> > +	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> > +						    TAS2770_DIN_PD_SDOUT,
> > +						    TAS2770_DIN_PD_SDOUT);
> > +		if (ret)
> > +			return ret;
> > +
> > +		break;
>=20
> This and all the other cases only updates the bits it's specifically
> setting for the mode, so _ZERO and _HIZ don't update the pull and this
> doesn't update the _KEEP/_FILL settings.  Not sure how often anyone is
> going to change this at runtime though.

I didn't notice any side effects caused by not explicitly turning off
the weak pulldown, but it makes sense to do if the consumer has asked
for a mode that is not pulldown.

> > +	case SND_SOC_DAI_TDM_IDLE_OFF:
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> > +						    TAS2770_DIN_PD_SDOUT, 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG=
4,
> > +						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
>=20
> Actually this does _KEEP but not _FILL.

_KEEPER is the important one. _FILL just controls the behaviour
of the bus keeper (zero or Hi-Z) when _KEEPER is set. If _KEEPER is
cleared, the bus keeper is turned off and the value of _FILL doesn't
matter.


