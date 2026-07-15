Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6F189F43
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127354; cv=none; b=kDOEwCJtKbqzNeSwU60kB7nKdRVxYLPrlIWjs+E1Oce8TYdDUa8KCQt1FL39vhjH/w76XAfPawLiC0EEA+9w+RL2ZO1D4cZ0SnjR13CrtefROhnxA0sTExNQrxnvzqg+IOFUmuU0YZTxIViMLBuQw2XCl5xbAj8bSRAcHow60pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127354; c=relaxed/simple;
	bh=Ot+mkzy97NL/CsqY0rSsvtS6zFCj6FDV5nN9Lq+EnEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUZ38QYOPg/DgcadF0LgZWhJMs4PmZEzPeUEqyMSh2PrHMP2DB9s+8FHBgNgPWlsNe2UkRkKTJOzOaJI4oGFzCzZ3GSB1et9CZUp62WBvqUJFwdzR5SUhuU0TUMXb6BcjyoBn/e8/OouSNyIxJxguIa1fOSFbLgVMiido9fueBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfPyQBnM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfPyQBnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FB51F00ADE
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127353;
	bh=Ot+mkzy97NL/CsqY0rSsvtS6zFCj6FDV5nN9Lq+EnEA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=bfPyQBnMrePgS0gsls84e5NymQoU9NI2k8eIbUXBcnCc/PN0MBsMY0eyzNrGywcjN
	 woIPBL/ZrgTFZxn1Rwid8Ob0hbYXDZums21U87ngVyZh4GGB9qNf3M8856b+SekyGh
	 lghmvhyu7KU9Fa99c+Q0kN5F2DyB59V04xyALAXwYuAytmrRSo0KmUGYD+tKYZjnON
	 qNN4KHzdojKVSjLwUwmhAX91uqAskuvouX52JXMIS3Ivwcaeli+Mx9QbyhppuWUT53
	 TfUgsV2gDIuuoTQQVdNrxmvt5fkJIPFhbezsFS7Dxx14ftB5DXZy/nq6Jk7CHbvurm
	 yznH4IQbvR73w==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b015532f7bso6161622e87.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 07:55:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RruUdHYffOdGFMkougffYzpbLyXCf1SX90rfLD+ABIjly8+IFHzctZ1BxtrtnhACqkzfasy2Gbc/wazPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFOK+FXIZSk1dW5vGh3zhYnCiUdw54E86sktBpTooWTupu9Tg
	JZ4v0NSBFX4iBZGdRi7dsy4N6oXmTvRi1/gfQJM5yPjBmvaBo+N5/Fii93Gl1xmN2mZim4mUoZ6
	ANr3x6ydoZulrPEjrItQsNGonraBBWew=
X-Received: by 2002:a05:6512:66da:b0:5ae:bbcc:7a55 with SMTP id
 2adb3069b0e04-5b15d76a23fmr548738e87.7.1784127351426; Wed, 15 Jul 2026
 07:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-2-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-2-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 22:55:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v67piCB3y=Pzvq9QZi0=zs6299UAxRdU6O2kukSW+JqMqw@mail.gmail.com>
X-Gm-Features: AUfX_mxcQ3YqNDO_ieBbHpUkaQUkcwRm2R6d1PkTwYWjPGrm2EyNbVKGbYPMcj8
Message-ID: <CAGb2v67piCB3y=Pzvq9QZi0=zs6299UAxRdU6O2kukSW+JqMqw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: sunxi: sun4i-codec: Use dev_err_probe() for
 probe error handling
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:55=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Use dev_err_probe() for probe error handling to simplify the error paths
> and handle -EPROBE_DEFER correctly.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
