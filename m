Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7C34678C
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 03:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752598; cv=pass; b=bXEo3y8EAmp1SczH88Kkp2xCw4jqcs3AZlQ5jFpHWgyW7TmNuhEoQqpEXJJnMz5tPB/qODA7wCbFapDrbq23bhep4wIBLb0kroPiWx+I5zQqNqYw5GSK6eIKFOoCRMrlUDVbdOe6Nop0pn2ImgjIcz3m0I7LXciC4llOpxqxZjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752598; c=relaxed/simple;
	bh=Dy+DLkRRi13DUOBJwC+0VGZLmUc2/IGjWJZZbuJMsZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtlwxgWn5XEZHZ28seGpDibmnHMEXYpbGOI9rVemcxGRSMgZfAa9GDPNkh+CrbEi1576b3Jz5gBZErkaPJtAS6MWOk4N0qxYUKZQPyWjYGK3rwEe5YoR2UjiDgvW6j96DrQtrYSsIMLssY3MeDMV59+QwlDmd//tWA6EC265/B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlqjZWQa; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlqjZWQa"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37cae9b7536so226305a91.3
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 20:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781752596; cv=none;
        d=google.com; s=arc-20240605;
        b=M9vy8f6JEd/RfMALpkEACo6ZmLdolF9fLk+HFRkznMTCJGDdnhKAMa76qH/BSiGKmh
         pabRxhseGu3V3HXNFAn3+BTiY8h1CD6rluK9lh9o4uiKtXRGP0UY5D+CMQ3j5Pwj5ctO
         WLdvkSdfQhGnikw0gVns81Mps2ZZgszDaQ0AveolqIerN1KAq3QLret4olbDtJDrI/ez
         1qU2qPxperv/k8ANl8vOBm9yJC5z1I8FoE1ABJggiIiqiGThV4Fl/IwtivbGeWZ/tduV
         qjzIxzjrWyOxLnRAXcOcuaem1w16f6R61qGZVoGRzLNUwAHKVkshd67MJR0OjhicLRNP
         Qavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WJeVd6wgp5NlfXuahK3rlSnNBONy3R4PRTFly3AX62g=;
        fh=VUYCxLyC1CloMqKfA7aYDxsOuM6hYKmutu0Baie1in8=;
        b=hoEnpNn+poEs+9vhUCV8agIzTdXxQuzUW6FU51R3tDI1Wm6Y2PNNo+b6QLJN/CrBli
         s3vT/sPrucw1HAZii04FiCCePKiZZlf8SlWVig+IYXjdxA9wTyUCYOczTJSvEov1kFxx
         uic6MS+JBh+xN6VyUrHAMpIsIMjyw/HlRpa5pkI3LQbYKPbRnn+x3e6Cdp71V49i2J2A
         IwRFAiYxEsbrlMsTaO91Ilq3AItLFCQCTaSmmdwKBgUF6mAFFfarOqO19khLv+Cnno9e
         J+uykISH46ZuuSqZ2mRb7iHLWGKTVoKRAiRux/Kx0sJUpBkoQ+wF8zBL4jX8/HUqZUjk
         OjGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752596; x=1782357396; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WJeVd6wgp5NlfXuahK3rlSnNBONy3R4PRTFly3AX62g=;
        b=MlqjZWQaMJA8WSWwFD6+gfZsD/lAZtiA/ypt+D/hf5yFYYdg0D/8kXmtK5vBGSwRjw
         UWkI1U1XeT+FZYEkVQumce8knmbqsAKbR3Dg5J5bWD3QkuSxMuuaO0qINa9WbYXoXhyY
         NhFO446J5/+TKkSEzlsTctPYvIUWXyrfrXnYNXdX4QJg5Rl8e6BCiBM6z147BOHPE3eL
         ie1qZSqKGg49Q6JagMjfSu4C4xSnyZP3b75XHwv7nrygvH5HzFX6wQOF0PKpfD5scU2u
         H1zLZHWZoLKpmNWemadbsSxXe3S+cmzn5RPUSujhJRSgN1lZf7/y9IBFzYToRMZIweeM
         bAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752596; x=1782357396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJeVd6wgp5NlfXuahK3rlSnNBONy3R4PRTFly3AX62g=;
        b=PxhjDpKvBzkgTCCYj1iUHhiYFTupSmxqPoSyDFSGd80ciInvGSxHJ2rCISneYdVC8t
         RfHiZwPb4OQ9megROgmz+1Qw6aBEMK47mHrj6HB4ClMMHtjNmL6csoAoZzHw1s6JgLq7
         PlVC37B/3QWeYMHboakC9M5jlZu00NL+XArM+hVh/oBX6ILjBaEpvB0aTe2LU1Ya2VZn
         7LHnHRzX//m0nLIhGHvK3KJ6uj2Y8HF7E2DQ/Jai4g1TOJ4Yd24SP+CcxZTW4QYvGsIT
         RAr6rtQiTvy+kD50UUCK/MbubEHuWrGsx32P2N6NHqZ3XKx8VcTVTrimRn0acgqQLclO
         5b5g==
X-Forwarded-Encrypted: i=1; AFNElJ8eqsNAgO1Ok56rC5E+MVJlCP22CplRFz1mQXESgdXBxV21AuYfjDwhXLB7MiajHTd9j/XIBNyIqMZ3Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7np6CcHvVSGdHM1ww90am0XUl9uMMmfymq/060oHyDVWZl57m
	gPk2HwnKatG+hz5rgOovY8yltqwBhC9Fx6vpt7i0j5IQA3fg4BVSWhpqEdR8GtRK7uQrEv4XeHT
	JmuXfJAW12KEmN4PylR8h4kzEpHMQwHE=
X-Gm-Gg: AfdE7clqg1upkplC2cmS6pDnP5DyXaOHy5ebvCgtMhiD4wx4+o08Fa8n8G1hdM6FUqs
	oDkLoJFU7zci1kiap87OSewi9ALmIE36XEEJkcDqhiSjiMN+iZRvX5FR7Nf+1JcUtbVLUEf9JBs
	W4BSy4SdvDCO1PY6NYZlukhTZpZNOHPpfF7N+Iu8ici096eciSzhHJeLK8p3yDIOyR/GsgiYNWd
	B17kQq+9mrxrM2W3T10kzk1FJ+aNXHI/LTVaLIQZle1yWXdr2KsVMC2gJXfBiv58j+Lq7exhkTW
	OwZ8Iuh8oTeSse/1JPAy14D4nBU=
X-Received: by 2002:a17:90a:fc4e:b0:36d:b680:3036 with SMTP id
 98e67ed59e1d1-37ce44ea15bmr1577620a91.4.1781752595950; Wed, 17 Jun 2026
 20:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604033554.96996-1-phucduc.bui@gmail.com> <178120760640.484538.12942087225448845771.b4-ty@b4>
 <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
In-Reply-To: <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 18 Jun 2026 10:16:24 +0700
X-Gm-Features: AVVi8Cfk3b_69bjEt4plPGyHkaTjXjkUe-hN2B8CF9dwTyCWWDnjf2lpRFKMcdk
Message-ID: <CAABR9nGEHmy4YSqFSyh+gqXVwNgpaGOjqBeUZyHBmMibHwvMxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

Thanks for the feedback.

> FWIW, the SAI patch wasn't sent to the proper maintainer e-mail
> for it which is why I didn't notice this series at all until now,
> and the whole thing is pointless churn that wasn't even tested.
>
> From a cursory glance, whatever LLM was pointed at this and decided
> to make the output my problem also didn't do a good job, the scoped
> indentation of rockchip_sai_runtime_suspend seems pointless because
> it could've been replaced by a pm guard followed by a spinlock guard,
> without an additional level of indentation, and `if (ret == 0) {` is
> not kernel style.
>
> It's not worth the revert but it sucks that I have to now set up a
> new lei search for all the drivers I am supposed to receive mail for
> because vibecoders can't be bothered to run get_maintainers as they
> pad their CV with nonsense like this.
>
> >
> > [1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
> >       https://git.kernel.org/broonie/sound/c/4bda5af16920
> > [2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
> >       https://git.kernel.org/broonie/sound/c/ec22437fc41a
> > [3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
> >       https://git.kernel.org/broonie/sound/c/f7fe9f707360
> >

Regarding the claim that the Rockchip SAI patch was not sent to the proper
maintainer, I believe there may be a misunderstanding.
Before sending the series, I ran get_maintainer.pl on the patch set and
included all recipients reported by the script, including:

Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

along with the relevant mailing lists.

------------------------------------------
phuc@phuc-desktop:~/work/linux$ ls ../patch/sound/rockchip/clean/
0000-cover-letter.patch
v2-0000-cover-letter.patch
0001-ASoC-rockchip-rockchip_i2s-Use-guard-for-spin-locks.patch
v2-0001-ASoC-rockchip-rockchip_i2s-Use-guard-for-spin-loc.patch
0002-ASoC-rockchip-i2s-tdm-Use-guard-for-spin-locks.patch
v2-0002-ASoC-rockchip-i2s-tdm-Use-guard-for-spin-locks.patch
0003-ASoC-rockchip-rockchip_sai-Use-guard-for-spin-locks.patch
v2-0003-ASoC-rockchip-rockchip_sai-Use-guard-for-spin-loc.patch
phuc@phuc-desktop:~/work/linux$
phuc@phuc-desktop:~/work/linux$
phuc@phuc-desktop:~/work/linux$
phuc@phuc-desktop:~/work/linux$ ./scripts/get_maintainer.pl
../patch/sound/rockchip/clean/000*.patch
./scripts/get_maintainer.pl: file
'../patch/sound/rockchip/clean/0000-cover-letter.patch' doesn't appear
to be a patch.  Add -f to options?
Liam Girdwood <lgirdwood@gmail.com> (maintainer:SOUND - SOC LAYER /
DYNAMIC AUDIO POWER MANAGEM...)
Mark Brown <broonie@kernel.org> (maintainer:SOUND - SOC LAYER /
DYNAMIC AUDIO POWER MANAGEM...)
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
Heiko Stuebner <heiko@sntech.de> (maintainer:ARM/Rockchip SoC support)
Nicolas Frattaroli <frattaroli.nicolas@gmail.com> (maintainer:ROCKCHIP
I2S TDM DRIVER)
linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC
AUDIO POWER MANAGEM...)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support)
linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
linux-kernel@vger.kernel.org (open list)
SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC) status: Supported
phuc@phuc-desktop:~/work/linux$
phuc@phuc-desktop:~/work/linux$
---------------------------------------------

If there are additional maintainers or mailing lists that should receive these
patches but are not currently reported by get_maintainer.pl, please let me know
so I can include them in future submissions.
I would also appreciate avoiding assumptions that the series was generated
by an LLM. The patches were prepared manually and submitted as part of
my ongoing effort to convert lock/unlock patterns to guard()/scoped_guard()
helpers where appropriate.
The series was build-tested before submission, so I do not believe it
is accurate
to describe it as "wasn't even tested".
Whether a particular conversion is worthwhile is certainly open to
technical discussion,
but I do not think it is reasonable to conclude that a patch was AI-generated
simply based on disagreements about the implementation details.
I understand maintainers have different preferences regarding how aggressively
such conversions should be applied, and I am happy to adjust the approach
based on review feedback.

Best regards,
Phuc
