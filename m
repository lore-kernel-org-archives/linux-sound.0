Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1374E56CB
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562097; cv=none; b=naJ0DhAu02PObxqwmlD/vJhWwHbdU8TahSSun4ZyfosF6o637o+8uoPdqhWA//9CDqppVBn74mMlTy1k1unwfIl9WxZqKPr19eUtNkNRVOZCOa00g8/DGV5RuOfgnzN/ozgJ7wSKMyy1EbHgr9/2kRfka7cSHqBgHi+WYgTEePg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562097; c=relaxed/simple;
	bh=J2mnMneTYDIrpgB5k5VIkuxwj0BCnLfl7kCAK1Mrvtw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=am+3FUxmXGsW46Qrbkgdb8WSV8uQIAOq2dAw9h8+nogUal1Hh0BKnEtGCNlAXd93X9RP5z7uZi8ABwQ9Vhwkfh5cwFYZ5sjo4Xo3HJ7zhDbdmLHeLLJwElIld1VFTScUhDSL76ogq3iB/TJgDmx4RKbGaU53yjE9SMLxs6E/ZzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiEpCa7W; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiEpCa7W"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso8565325e9.1
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789562088; x=1790166888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmytOkW2R/xIUqZXV3QPl8yko/uu1lEG9yR+JJLsZQc=;
        b=DiEpCa7Wo/uFu4wx5mcsUKYPkZ+X2biNDLoeA3nmLjhZNInCEkGAD1WNRz9tC6YP1Y
         DEAp3VKAyLfWQoHSrZOf8Ja0Xuv70iEVom1UwOm+bg5a77B+Us672pSSJhOyT9lxENdm
         WQr//ExCqxprQbPR7ITV1+mC9Gaie7zWuhjSwqQ4PCSdiNLHyZAFZnKl3J7SgTVSyemL
         CShDuF4SJc7Psg4oLpiBADyyPY3aPUtYCjHRZpd7WTaA4bN9UmBDNEEHfyDwANtWZbwa
         e4hLmOHti4AU0bIzAnvkRnkMYqwt2WZsBztJFDmRcOEh1i3HfPELAU3vm+P295s0O5Yg
         EdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562088; x=1790166888;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmytOkW2R/xIUqZXV3QPl8yko/uu1lEG9yR+JJLsZQc=;
        b=aCeuzVKoP+FEd0edyjiGiOP/xSXv9/9tO196/tRzyvsB/hK6qW35HaRf+UnJOTkAF3
         gwYdcEGZR4YR7QDxGI3tq/xwCvtI936ZHCA+PNToBeJHp/k9dF55ZvFWhOt5iA9Rysb+
         wgSKPwANhT709bsaPu4hOM0rqI0GR9GBCH4JnWF6saqj3EQLAWnQp3lPoE29Zb+RIjiQ
         0JFTGYEL3AENn/4OjztH3yPkgktJDI5s8Ty1IL7+SlJTtwvxPF83fWeXc19kUfUfZTN8
         U9DefkJRfdPQ5xSN2XkIF2/lJmzjPbRpcxdKq0jI7FwLr58xfHt+kA1+u0BD+uQVF7zv
         y+FA==
X-Forwarded-Encrypted: i=1; AKwUvBx8DK5OiS9/9u1OMhffD4cCI/Jdafkxa1Q0SL9/jzGHSLh1kRTOrvzwhlPtD5Nci0+GzLXe77YVYtd7vQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kMoX0q2GaJ/D53Evl4gEA9l8n/1ANw7Sa1MKJSTQfNoVDf2B3u
	QM58xGdtQvQIGnbKsZytnRV0uI3SbQ8Dm9gPJwOTrCnG1dXXihQ2nYRX
X-Gm-Gg: AYBFou1HSf8xub4ZYIzoJg6rsYyfbIJm3IL/NQYTK1LiWcTESR3tf45Ib5Vn/6q2+mm
	uT+MCZkhfK0O//qYzt5q0toNWwuA5yoXUYTHs1+a5ASB5zeJmCIW/EqY6sjBw27aLyyDEQAHPiL
	PRhAF7MZ0L5oSossFShhNXKf40jZU5sG0oE5YSvcfDQ9fNyYmTo60kTkwFhLTRhlXCXvP73rwvk
	pwX8gI2T/w04iGQGlfxDcKCrwyzJPrwRVocN3GMCWbktkioGIFb7HAcCCCZoXoj8xmA8MCZUVd9
	3ZjM8ACN4Rb0tAnO3MxlIXXKuknwS/gm5kRbtV0ZZFUCaeBinbtWYUz2Vc3NCXQQTb6TbPz6bOw
	uXMDlYuf7z5+vRIO2k+Za47Gim52xtu8fvw4vwO3lguYLbUfQqUUl65JQwbZDGfRhdXxwbhEjGx
	1nebmMPiujVPrINWqE4SsSq47PU5Q8/92uDfd8oiRgmttGkjqyvLLyI88652dsC85d13YA6vJ0F
	D/Fn7dHWVP+gWr6m0uKXVjJFrEMnyhq5vF3
X-Received: by 2002:a05:600c:3513:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49eac4678e6mr27024995e9.8.1789562087480;
        Wed, 16 Sep 2026 05:34:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84202028sm57591175e9.0.2026.09.16.05.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:34:47 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:34:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ux500: avoid -Wparentheses warning
Message-ID: <20260916133442.2d21ff5f@pumpkin>
In-Reply-To: <20260915202038.3534453-1-arnd@kernel.org>
References: <20260915202038.3534453-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 22:20:31 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc warns about a slightly confusing expression in two lines
> of this driver:
> 
> In file included from sound/soc/ux500/ux500_msp_i2s.c:20:
> sound/soc/ux500/ux500_msp_i2s.c: In function 'configure_protocol':
> sound/soc/ux500/ux500_msp_i2s.h:151:38: error: suggest parentheses around arithmetic in operand of '^' [-Werror=parentheses]
>   151 | #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
> sound/soc/ux500/ux500_msp_i2s.c:204:21: note: in expansion of macro 'MSP_TX_CLKPOL_BIT'
>   204 |         temp_reg |= MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
>       |                     ^~~~~~~~~~~~~~~~~
> 
> config->bclk_inverted is a boolean variable, while protdesc->tx_clk_pol
> is a 32-bit unsigned integer that can only be zero or one in order to
> be passed into MSP_RX_CLKPOL_BIT().
> 
> Move the negation out of the inner expression to make this easier
> to understand by the compiler.
> 
> Fixes: 9ccbacf5a012 ("ASoC: ux500: Validate MSP DAI configuration")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I still find the new version equally confusing, if anyone has a
> better idea to make this more readable, let's do that instead.

How about:
	temp_reg = readl(msp->registers + MSP_GCR);
	if (protdesc->tx_clk_pol ^ config->bclk_inverted)
		temp_req &= ~TX_CLK_POL_RISING;
	else
		temp_req |= TX_CLK_POL_RISING;
	if (protdesc->rx_clk_pol ^ config->bclk_inverted)
		temp_req |= RX_CLK_POL_RISING;
	else
		temp_req &= ~RX_CLK_POL_RISING;
	writel(temp_reg, msp->registers + MSP_GCR);
Assuming that [rt]x_clk_pol is only ever 0 or 1,
if invalid if will default to 'normal polarity; clocks.
Completely open-coding it removes the negation.

You could try replacing the ^ with !=

David

> ---
>  sound/soc/ux500/ux500_msp_i2s.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
> index 683b485fb570..588d381230b6 100644
> --- a/sound/soc/ux500/ux500_msp_i2s.c
> +++ b/sound/soc/ux500/ux500_msp_i2s.c
> @@ -201,12 +201,12 @@ static int configure_protocol(struct ux500_msp *msp,
>  
>  	/* The code below should not be separated. */
>  	temp_reg = readl(msp->registers + MSP_GCR) & ~TX_CLK_POL_RISING;
> -	temp_reg |= MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
> -					  config->bclk_inverted);
> +	temp_reg |= MSP_TX_CLKPOL_BIT(!(protdesc->tx_clk_pol ^
> +					  config->bclk_inverted));
>  	writel(temp_reg, msp->registers + MSP_GCR);
>  	temp_reg = readl(msp->registers + MSP_GCR) & ~RX_CLK_POL_RISING;
> -	temp_reg |= MSP_RX_CLKPOL_BIT(protdesc->rx_clk_pol ^
> -					  config->bclk_inverted);
> +	temp_reg |= MSP_RX_CLKPOL_BIT(!!(protdesc->rx_clk_pol ^
> +					  config->bclk_inverted));
>  	writel(temp_reg, msp->registers + MSP_GCR);
>  
>  	return 0;

