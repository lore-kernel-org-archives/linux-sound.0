Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE329B8E1
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060559; cv=pass; b=WNda/3Tzd+vUVm5Kl2tpgTXBSbSiFThNB3/NU6sRh/YnuR+AGXCU6Oj1rRJClTfI7RyAvScGxBxGQ15mMZ8OX1lQzttCeJy90z+91NutY5HqyZBh9CWZcG8QvfDQcuKHMBYd25xhnLCfIEw5w1X6Pt7tSP3s6SqfGUEE/s8D+PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060559; c=relaxed/simple;
	bh=BELWqzWUWTPdsciv6CHCfEhJicXEFTQV3kH47jXL4jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfwSHy2Q1ngHfJ+Pzg3rnsuVUx2SvV5UWWJ/+onxpHgdu5UDS0cm7VKeOwNEy4Eids1gPQZIkmaHo1rlt+bpLx34KyfNhpR1M8AhPuptIUSOY1mc7nXIWAZP5/DuMHYywZvH4Am5UQaBrqYvU+aZ4l67RU6lIw8omXNi7dPSN7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sM76bZHc; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sM76bZHc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so4249232a91.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 20:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781060558; cv=none;
        d=google.com; s=arc-20240605;
        b=D4QmwNsCpWGL6Qo40gCRXWJPieFD06255/KEUDfI44+eb3OcHca+J3KmawU93wi9IT
         ws9HxSkJ+dzMBCWg7DrmYPZG6JtdZxAk9Xhh816iE0K7BOAX6yzPn7PAt4Z3cNCdVMIu
         dSk6+jpITsQfk3YTP5j77GBteQHsT6wB3TB7PJbEz7jTB3Da8rCfe0h3kDce6zRjxvjq
         sAoiPwU3NJP405rtf5nNgByf6BIv6GaE8OkGwCM6TlKOWIZGvFudhlyLOyuw7u041PiK
         F1S8/xEo5znrrcz5zqf/o9KGAiYqB4FHASKBvI7Q3IkOxvJigvSgdN3auGL/6XT2X1GT
         2UpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        fh=h7Io0GlCevEluG4KCW1vMEoN37LP2/1jNCxp2GxBNYE=;
        b=PbrJHXOBlb/PywDWRp0ZQ/bGxsgYJEOOTfkUZWIVwVGHs+cdWOOy6zHkuIddwu3h1Y
         Kj/i9bQqibny+HBoBTSXELAYF58MqEGbqdJfxUZvMm26UlzPp97JMjHb0guZ18zLpPQa
         iCnljOJWsZBAap85Pf+jmcZak+i5yDAZo1HP7U13chOBpsW12cB51IutgrFJCQP28S3S
         uVixN1jUCqCFS71VRez1quNJHIEmSsriTbWD5WA6j60czMbz8ybm4Y5YRbqrFcM4H/oJ
         MfqOgfnR5vGSEB58OHeoe0Znx2PFsFOGEJBscEVbjqOZh5tUoUNJSDrGPgg8kL/TYZaF
         eRdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060558; x=1781665358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        b=sM76bZHc/3eJL+X8ILCMQv3sA2XtzTJ3PY+2QxYGtJjVWtmMXvKYJ7UIT/0Hl4D1aq
         ft3eZyL1tMrDW3L1eNYHvm1Kizt8Dxg5zaBc4VgZ37LXFhEkCSNBvx3leO+1S2ezWqX7
         7wZ8aBlDdZDjbck9+ZcG+Z2ihArrt7OOAlVqoZ+0gsvbt2Y4YqZ4svz04Xwxb7wE/RKf
         rxbsxO/IaRaGbhTDDQwNH7qBmxd4u/U8gi2pA5r+ZTwu7QgbQBLuoIFKqjFd+Byl5a5A
         /qvAyHvoOHyvEqJq0G9O2Wj1lYFb60SW0OS3Dsp0bMYlJl1Uo0/e8o6NxeEjKE8k3Dqx
         lHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060558; x=1781665358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0SVE56YDnDAezQJQ1qqqgFaaJdg1RckTtuMzgghSGU=;
        b=N9YFkG+u/YBNY4EV+/BSatRA+Ul4dt+WbocZUiwvjLv5GRrR4AIpPRQjtHKe+E3hf0
         LWoNzRzhncuGvfVnPf/6W0QR/1M8qrwRhYsve3KF++DQHuZ9l+jscH5rWf5kwknzWh9I
         d5bcRxmggCSHv+zEBRCC11dzyCLWK2Ky4ldf1dbsbqAwfPJAIkL7gO6OPrMZyV9MYm52
         5fQzgmqFl8OZgdvgGzivXGCdwWNa6o6wDn71cEDxCxfW0va03VyujEIN401G5u5ssYs1
         FTPHTygEam1f670ncqllT8VucGOpI9zpRqn039ZxoPHg9Cqy/jqS9MSxPPKywhifQfnu
         1guw==
X-Forwarded-Encrypted: i=1; AFNElJ8pR9JjkAaxW6v/YPlNTOyuxrrQ8t9YNGFk+m6v4vaPajjt52ObQ7VkehgtetdEMS7W7zSUm1T0ZLwINg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRxvSgouBm12uKYi2fnHr9XAVMXVZ/Qw2WFunXp/bVumhww0P
	HuETGnt6tANGBGv/p1OsmmAlog7Io+bVoMdVcnJy3xVEMWzE40HxvaGcii3F6X/KKX8y/hWZNTQ
	xXXV8upQeRvCcCUeASnzSLfMRahhpjNk=
X-Gm-Gg: Acq92OGHh3gVVRGXDVvZCzowVeMIHyLWB2oOtYNV2F5iT+0CiQ1qAFgu0K2njZZ0UpT
	V4Mbp0UNY0qnW2ygo95JOF3TzzhaVH+oprG1ObTLkmjGLk8JtO/VEpm0aNMB1ESIp01NWLeZMSV
	DTHH2G4yTaXDNKmXFoWw5eo3s+eGjQ9sl3KxkZFp0bMDihABh2a9BUbzSMe0c3AbnLhkrvxTZal
	Tkf5mAaYn+ytZC0F9q7WVKVY+a/UY8PxNOG8uxm4lXA1FrHmVB/kyw4aDsll9HWuaG+4ByCj6fK
	T4KQc8FcKkMM84t42ArUgpgrblRZOwOjtMzxPDDaREpeuNcZbo4T5LRUUDs=
X-Received: by 2002:a17:90b:5783:b0:36a:4074:9aa6 with SMTP id
 98e67ed59e1d1-370ee82fcb9mr23111578a91.6.1781060557754; Tue, 09 Jun 2026
 20:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-12-phucduc.bui@gmail.com>
 <aiigtwDM-qEBxjH5@sirena.co.uk>
In-Reply-To: <aiigtwDM-qEBxjH5@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 10:02:26 +0700
X-Gm-Features: AVVi8CfBRh81q-V9vKQU8QeMWprqYN4zKvZvg-BCK79uayFJBD6bEhlpmrZ0dxE
Message-ID: <CAABR9nGVNFs6GPZaKA6JA=+G6J3+WdGcn2T+sac1YL5N0VS=wQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your reviews.

> >  static int fsi_hw_shutdown(struct fsi_priv *fsi,
> >                           struct device *dev)
> >  {
> > +     int ret;
> >       /* stop master clock */
> > -     if (fsi_is_clk_master(fsi))
> > -             return fsi_clk_disable(dev, fsi);
> > +     if (fsi_is_clk_master(fsi)) {
> > +             ret = fsi_clk_disable(dev, fsi);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +     /* stop spu bus bridge clock */
> > +     clk_disable(fsi->master->clk_spu);
>
> ...but the matching disable is skipped if !fsi_is_clk_master().

I understand your point now.
The reason I originally implemented it that way was that I was
concerned about a potential system hang
if hw_shutdown() failed while the SPU clock had already been disabled.
At the moment, it is still unclear
to me whether any further register accesses could occur after
hw_shutdown() returns an error.

However, I agree that maintaining a balanced enable/disable sequence
is more important here.
Therefore, I will modify the code as follows:

+ int ret = 0;

+ if (fsi_is_clk_master(fsi))
+       ret = fsi_clk_disable(dev, fsi);

+ /* stop spu bus bridge clock */
+ clk_disable(fsi->master->clk_spu);

+ return ret;

If we later find that a system hang still occurs in the master case,
I will investigate and address that issue separately.

Best regards,
Phuc
