Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64D3E6DC1
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176769; cv=pass; b=SJh5v2IqbOjXf1ilzjZouL68AcJYp5MPQUMfzgkWDz1m9tm4X0WGXeALDjfB6loExEF6ENZcrus6gYtF5YxR0ib3HvwfFfbFM6frYhpmMHFZ67JphC085vdHXN+8irTb4btGmdxR2nvk0YpvemBRz/RpXeMfSN7nE/yCaVPingY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176769; c=relaxed/simple;
	bh=WtbIduDkfCpWDk4TAOwYPiVOm1oN2PtC34wtUbnB0xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4f7yTJRsfpnlRzsBtmFNpTICmKRGtEJhIWSq32mtGnj4+KTIHKfAECr2f12w8hqh2hAv/gkJcBikgdBPcP7Y90wKqEfHiS0ecvv/HiOAIdArsIS1zDk/xvXO/JzHrOGcbRurarwE/X41NcXn8SWAgKpRvVvzPBDUdvSzVFhcMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L81DjK1T; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L81DjK1T"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad617d5b80so30541615ad.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 07:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776176768; cv=none;
        d=google.com; s=arc-20240605;
        b=RhLMtwJrzMrmyktnu6Aq7Apb+yIDnIFY6otBIHpO29WFZbhv9XEEvX4FnPt5eUpglW
         +PymQrpv62BYsJqtjObb/4AR95IGL6ISGSf7GWVcPGSkLwOLJlO7bflAT8OCrZMrEnVR
         svdRBIqAFozxYgfZcyM7laIq1OG7XAtKGd7xT/4epg+mUuM8Pd3tytCttY4ZUpNHwQ1K
         ShfJ9YKKkENV5Kl70KmewcS01eSglMgHByTXIiELdAOuTqVKFO+855LBZyK1ENjf7Cl9
         eFmQKp3ySbILS5Wa5JCG9R8NoM7/5WDHx61lqTO4toJKrDsyVx+U4T+diQqMJWeZXuwQ
         +Ovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        fh=8FIk088Dku2IUJOePpn69Docp/45KL0HgeJYXueuIq4=;
        b=QavSoZ+UKrhEF38FY/2lggUO3Yh6e30Lsg86rk0QxRPXd83+BZ6f/IyqENokGqKZmx
         gLTq90jayoOF7QWOtcENXAfiY/ZJWC5ABLNOLHCtdQvdFgWLMfguZlEPyAPkC7DgVH8j
         YSBirNBPZyGQfCa9emfc2/lBvECo78sj7rVnIUArulwZHTZppaxhcN3Zi0GxJvpbY/aN
         GKDeDafzgG6S7+Rl4Actw2M1MRuxUKBXE3JLbSMVwPGQ/NbYc4Y0Gh4tjL3nSs49sCrk
         1KLJh0Gj+TO+ab/0VwmirQ0aGWzqisLYtBlTHExNFlKw1ubQL2ddBzfiAQuBhwpY1nY/
         akeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776176768; x=1776781568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        b=L81DjK1T12jXPsxcIbR/wEh/tl7QmYTiz14CKNelRYxERXbZcmxd4urPw01VvsfxFJ
         NZJt/p6jJddMPDTETQJRv8gWYedcRa6GhsPYX1+1VTjwtsANAxjGdui9fAx3hzkMa6Fi
         DGnwvJalxnLdbfoVMNh2mwJCMNynPrjNE9YVCSwdxAVoLqPmozd6x3PoWQP6Ch8VjuHe
         qLjzO6PcwBKrdbhZLfcU5WMdmLX9YZ6fWqNmCjgCmq5hm4rK0vUzGH1f/KnBKUMGoatu
         OmXdqh+JpR5D0LbcRimwtC64Gw+wH4Uya73IaslXLWw8nfk4RzZOVT8Ib1cR5+MSmuG/
         SEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176768; x=1776781568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        b=FuHrzRQt2Owslt2t2WTqT9q2b0StvwPdTjDe/YjD2pBom1Uoz7Jg+EtTW7TIM2cDhs
         qp5sLyiSieJXOSOd4WmmagXxBVR2FsGJRLE9F51w3IkXh/IfvUXm+kvYySfCWNwOIQ3h
         pCEhJn/8IekrLgYbRnPOnRwvVkN30nozcdthXAP6fNfcGFIAPpxDmm6+p78WjElo2Iiy
         f1I84T2rFlkbiak5vCxmYx9jEyWDm8mPF255sJA1XB7QeOFNbY9i3mJr/oaZbxd/5Tx4
         Li25TfnOw3VMX0oWpqACtruCz8Rokg6DVLcnnMi22ZSCSwNVjg+tEXt2TDk5fMfBX3Mv
         LN5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Y3w+X6z6zmacfwDkTg9UBMo2jvB1y/5CHp7sCKf61vlx0AGv8jlssmBZ5NamaaPeqvtRbSe6XEte1Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4VGH5tcHUlk+WRR1v3kWnqSK/S9hyW5f12hijFvVIfm9WFnT
	iTWScug6mh4IemqZJ/BzJZRFs+6bk5Hf6YEhPkTffaIztx2D4l9OoI0nv0fqhF4RJow9XCzBbpF
	feMOdh4aWuaafONiau9mkc8RNZQC/qBA=
X-Gm-Gg: AeBDiesZJu2S/m5brzKKZ9fg7CpCsE5su4KP2Y0KpllR0gX323n6HMKadXzjlKsspXy
	OVcui71kqanHb+9QPKo1AsSYZqlhcO9JXMK9FhQywF3HkqUurVZiG22ovENCVzybQbFNoLpSAVD
	aOnDAfvosTH8Oln+Saduoo2RJ+OWeoHKGP5Z1MVMJfFa0xGS7qbKdCegkGKnLC+0Al73DjMYKwl
	vSMN0p14ZahhL/T4lNAbSyJKXYr/4lEBw2UtWdaeYfOfplrFYfh7Dq6NUz8IF23DpPmlsRhsb2Q
	CPwcv7SFZx9uoY802cpT/Fvm/dBo2sxHCmwNNKxVaL8MkVCAOJPdDktWQsrzkn4fa2B/dkQX
X-Received: by 2002:a17:903:1207:b0:2b0:5ec1:97c1 with SMTP id
 d9443c01a7336-2b2d5939275mr182858285ad.7.1776176767396; Tue, 14 Apr 2026
 07:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-5-phucduc.bui@gmail.com>
 <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Apr 2026 21:25:54 +0700
X-Gm-Features: AQROBzD5HBObKJ_ac8QE6DfolgiMCYAEtU4p5CM8HBqKzDEM1G5e1fuL3SWF1sY
Message-ID: <CAABR9nERzKW=2vZTWNuTcjz4KuVyc+eaCKBNP6ZGb4UAYw3qUQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thank you for the review.

> I have mentioned in previous mail to just move fsi_clk_init(), but why do
> you need to move it ? It works without any issue without moving function,
> I guess ?

I moved fsi_clk_init() below the two functions fsi_clk_set_rate_cpg
and fsi_clk_set_rate_external because, inside fsi_clk_init(),
I assign these functions to clock->set_rate. Moving the function was
necessary to avoid compilation errors.

+       if (is_cpg) {
+               xck = 0; ick = 1; div = 1;
+               clock->set_rate = fsi_clk_set_rate_cpg;
+       } else {
+               xck = 1; ick = 1; div = 0;
+               clock->set_rate = fsi_clk_set_rate_external;
+       }

Would you prefer that I use forward declarations instead of changing
the function order?

> Note is that the comment /* clock function */ is not only for fsi_clk_init()
> but for all fsi_clk_xxx() functions. Here is that position.

Understood, I will fix the comment placement accordingly.

> > -     if (fsi_is_clk_master(fsi)) {
> > -             if (fsi->clk_cpg)
> > -                     fsi_clk_init(dai->dev, fsi, 0, 1, 1,
> > -                                  fsi_clk_set_rate_cpg);
> > -             else
> > -                     fsi_clk_init(dai->dev, fsi, 1, 1, 0,
> > -                                  fsi_clk_set_rate_external);
> > -     }
>
> You removes fsi_is_clk_master() check in new fsi_clk_init() ?

At the probe stage, the Master/Slave status has not yet been determined
because it depends on a subsequent set_fmt() call. Therefore, I am not using
the fsi_is_clk_master() function inside the new fsi_clk_init() during
the probe process.

Instead, the new fsi_clk_init() function acquires all resources
(including the mandatory SPU clock) upfront using
devm_clk_get_optional().
The actual fsi_is_clk_master() check remains strictly enforced in
fsi_hw_startup() before enabling any functional clocks.

/* start master clock */
if (fsi_is_clk_master(fsi))
return fsi_clk_enable(dev, fsi);

> Why don't use fsi->clk_cpg ?

You're right, using fsi->clk_cpg is cleaner since it's already
initialized in fsi_port_info_init().
 I will use it in the next version.

> And why you need to call fsi_clk_init() twice ?
The FSI controller has two independent ports (Port A and Port B).
Each port requires its own clock resource initialization and configuration.

Best regards,
Phuc
