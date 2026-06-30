Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C123019A9;
	Tue, 30 Jun 2026 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782802498; cv=none; b=IgWSFh7/NhTmTs1IrzwV2nesuB6CZNmFgBhIYKpFhA/0GIu56VsWeZo0ADuGZ7FK2MHOqlP51uOvZE2yLdIRAP2542SWVcDihnwNhU0nfaMsYLXV2NGST183ASThtMp2c9e37KJq4HC8Hz63SMisl3BsHSIJgNRVsRQDSs6K2nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782802498; c=relaxed/simple;
	bh=y3DkgpE/xKHOP0+3rkDBVCpOOaZc9o2nQXMHrqK5ZKU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XrRax1WXzRzMx/fxDVTvEBzinpy59dz5Rpt8Yh9lpdpmOJa+tUFatzSgG9JbA5qhQdZoYnYuzBH7SdcyNp5fPqTCEk7p6/0OK82D8kSNQCBXOmIblC3IR0p1CTp3RGLflu/u5gaifUpKoD8bt17VA960Lx21pi7PLJsB3vKXQDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z8d/49Ey; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z8d/49Ey"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 061CE1A0D57;
	Tue, 30 Jun 2026 06:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C712560233;
	Tue, 30 Jun 2026 06:54:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08518106F1C24;
	Tue, 30 Jun 2026 08:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782802492; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IyZqIa5MSoFJjLuTNcs1EIIWqpAU9hip3sA0H6a8zU0=;
	b=Z8d/49Eys89RVLsciixPBotekygSHb1peRZ8C1zf/KK6JdTXPV58v3pivGMR9KWAM/SHDd
	V6eyfhgpYfmiSK/ta19YL/n/Lthu3O2PWazx6BfBzSHA/6FinA7MVx9dxz5OG5iqBSkgLk
	5UxQvx3mRqvcxCeuRYu3HIZvBzN5H9cmx1tuGBG/rD5zbKjuZYRBGj8C9wLZEHqCtNA3Ep
	HyVtnjWABpiHBs1iK06Y82Qh3FLa8k8TuMdNCh+BCe1a5sNyozuoRpoVPIxileLwL5zQEa
	rqfZSyv/R3YFfmkKW7mwuSV/dmBBQlika2iqYfeLoZE/Gc9Fphjy+8ni9N2xZA==
Date: Tue, 30 Jun 2026 08:54:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Nick Li
 <nick.li@foursemi.com>, Support Opensource
 <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com,
 Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>, HyeongJun An
 <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Qianfeng Rong
 <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 16/27] ASoC: codecs: peb2466: Use guard() for mutex
 locks
Message-ID: <20260630085439.2483f232@bootlin.com>
In-Reply-To: <20260630063449.503996-17-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
	<20260630063449.503996-17-phucduc.bui@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Tue, 30 Jun 2026 13:34:38 +0700
phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/codecs/peb2466.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
> index 2d71d204d8fa..5a1ed02abb84 100644
> --- a/sound/soc/codecs/peb2466.c
> +++ b/sound/soc/codecs/peb2466.c

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

