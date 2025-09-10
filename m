Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE77831077A
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494059; cv=none; b=kBCVGrMme3f2VcPwgPKETrY6MRB+rythBaR2KfIKWe2UAk5b74MS4Hd7DPnd+rLMNde4HwiXLDofD2HetuE02irJ2Ys6MyDBJ9GB/nLvmcHiTPA7trmasda+CJ8/DI48yJC5V4LJhdtUZdixBWtgfjrQ7XrobRv2SLGSXn/ePs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494059; c=relaxed/simple;
	bh=CIY1ZOyCi7Vntr6gLU7k6WsPufwADhY5TJzrT9NVEu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wu5FIARaCiAC+b8rxsXju/byAl9R1xUhjRBsDcXUaTW8u0u7zSwrh058QqJfxPJyMVmZk8qD/ecdXFr4zPziGOkXqOwhq9Bt0c3I1j69j9zm173MKQhdh06tGcUAgqZVOm5joha68MnKGeQne3CM+2La5RyVwnqUzjnuXW5YM5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77800C4CEF0;
	Wed, 10 Sep 2025 08:47:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH 1/4] ASoC: renesas: msiof: Use guard() for spin locks
Date: Wed, 10 Sep 2025 10:47:36 +0200
Message-ID: <20250910084736.3336686-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87jz291yrr.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz291yrr.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Morimoto-san,

> Clean up the code using guard() for spin locks.
> Merely code refactoring, and no behavior change.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rcar/msiof.c
> +++ b/sound/soc/renesas/rcar/msiof.c
> @@ -372,10 +372,9 @@ static int msiof_trigger(struct snd_soc_component *component,
>  {
>  	struct device *dev = component->dev;
>  	struct msiof_priv *priv = dev_get_drvdata(dev);
> -	unsigned long flags;
>  	int ret = -EINVAL;
>  
> -	spin_lock_irqsave(&priv->lock, flags);
> +	guard(spinlock_irqsave)(&priv->lock);

You want to include #include <linux/cleanup.h>, as it is not included
implicitly on all platforms.  This applies to all patches in this series.

>  
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
