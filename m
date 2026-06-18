Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B339231835;
	Thu, 18 Jun 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785043; cv=pass; b=hNrlJCU3qCVaC3g6w3bjimCp71i+AgJX72llECSLdbqhq5mszVPzZ6j961PUWFQHdVCOmXHwrYgl6pCajpWsBUaxAy31DEe9F6Yx9Mhnj9IyeBdj0ZcfUjOCDzMPHrX6dxE5xyAJ/oOGLyuParEkZnPfOak5E6W24yc3lpcXFBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785043; c=relaxed/simple;
	bh=w/SMo7/+NAzeKF5iV5FKCiYFBVliie3QMVxnrcejz78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9fmA0c5dl5ooV1UYgiB47kmXbrL2HXze7gcL2v45UWfrXPcsoklTHM1TA6PLUJ9RDdHs+T9Nhy57ypjNLF2K+PWclgw8Nw/uAybO+76TqY8aCKt7YMbrKZp40hRmYm6zagONRiqTHga7YSE1KFIS9Hio/FwXl6bQvldaH3hhx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=O8wU4yi9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="O8wU4yi9"
ARC-Seal: i=1; a=rsa-sha256; t=1781785021; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SRY15kLo0a1jC1eWJ0rWHaJ3+azhzZ2fuS836+kPtheGl5MaWh+vmrCRD7hU0PynXanpRQy94PcroHGr83nhA96womaIlWqJO2hiCP4koCXQ1xneB9Ym3KJnpd3leMNb4V7u0vBNq5FYlpMXbRhaYPXXV+J4tfq0Ixo3wZcdFlw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781785021; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w+AhAEVoRg1890k5wY55SgwuMZz8LqOoIUrf4PaEO4w=; 
	b=mCUAiG0NxgSk5SWKpOvbNBdrxQelLTTHOBWEjhajJf//g/PRTXq0kUnIZQLp+C8WLIGW4sBCOaybZtVYD0y7dI4lMBz5Ba7c8fm4AVf/znttCKLD8YleQ2Iqy5wT0/KBZq2m5vsAZk9yjOpcc4m8TXmjeip7dSIRjHSc7EGAQG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781785021;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=w+AhAEVoRg1890k5wY55SgwuMZz8LqOoIUrf4PaEO4w=;
	b=O8wU4yi9N4RKZFtuUBldol3ASmhXprLUYvNCiLNHTubaOpMNG5JxgKhPaMEIMwWP
	xzA96hV9tzi6XSAXgdS8SeKP9dMFsa+HnqubJUOblc1J/9K5cVRrnT/Ypv7pgMf/Nj9
	SvdVAGPsZqVTMoilol3FPtiJ4Gyqroi6t22fT5IU=
Received: by mx.zohomail.com with SMTPS id 1781785018759133.6823912950772;
	Thu, 18 Jun 2026 05:16:58 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
Date: Thu, 18 Jun 2026 14:16:53 +0200
Message-ID: <D9b19fqJSQK5FO2BflNEKw@collabora.com>
In-Reply-To:
 <CAABR9nGEHmy4YSqFSyh+gqXVwNgpaGOjqBeUZyHBmMibHwvMxA@mail.gmail.com>
References:
 <20260604033554.96996-1-phucduc.bui@gmail.com>
 <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
 <CAABR9nGEHmy4YSqFSyh+gqXVwNgpaGOjqBeUZyHBmMibHwvMxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 18 June 2026 05:16:24 Central European Summer Time Bui Duc Phuc wrote:
> Hi Nicolas,
> 
> Thanks for the feedback.
> 
> > FWIW, the SAI patch wasn't sent to the proper maintainer e-mail
> > for it which is why I didn't notice this series at all until now,
> > and the whole thing is pointless churn that wasn't even tested.
> >
> > From a cursory glance, whatever LLM was pointed at this and decided
> > to make the output my problem also didn't do a good job, the scoped
> > indentation of rockchip_sai_runtime_suspend seems pointless because
> > it could've been replaced by a pm guard followed by a spinlock guard,
> > without an additional level of indentation, and `if (ret == 0) {` is
> > not kernel style.
> >
> > It's not worth the revert but it sucks that I have to now set up a
> > new lei search for all the drivers I am supposed to receive mail for
> > because vibecoders can't be bothered to run get_maintainers as they
> > pad their CV with nonsense like this.
> >
> > >
> > > [1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
> > >       https://git.kernel.org/broonie/sound/c/4bda5af16920
> > > [2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
> > >       https://git.kernel.org/broonie/sound/c/ec22437fc41a
> > > [3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
> > >       https://git.kernel.org/broonie/sound/c/f7fe9f707360
> > >
> 
> Regarding the claim that the Rockchip SAI patch was not sent to the proper
> maintainer, I believe there may be a misunderstanding.
> Before sending the series, I ran get_maintainer.pl on the patch set and
> included all recipients reported by the script, including:
> 
> Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> 
> along with the relevant mailing lists.
> 
> ------------------------------------------
> phuc@phuc-desktop:~/work/linux$ ls ../patch/sound/rockchip/clean/
> 0000-cover-letter.patch
> v2-0000-cover-letter.patch
> 0001-ASoC-rockchip-rockchip_i2s-Use-guard-for-spin-locks.patch
> v2-0001-ASoC-rockchip-rockchip_i2s-Use-guard-for-spin-loc.patch
> 0002-ASoC-rockchip-i2s-tdm-Use-guard-for-spin-locks.patch
> v2-0002-ASoC-rockchip-i2s-tdm-Use-guard-for-spin-locks.patch
> 0003-ASoC-rockchip-rockchip_sai-Use-guard-for-spin-locks.patch
> v2-0003-ASoC-rockchip-rockchip_sai-Use-guard-for-spin-loc.patch
> phuc@phuc-desktop:~/work/linux$
> phuc@phuc-desktop:~/work/linux$
> phuc@phuc-desktop:~/work/linux$
> phuc@phuc-desktop:~/work/linux$ ./scripts/get_maintainer.pl
> ../patch/sound/rockchip/clean/000*.patch
> ./scripts/get_maintainer.pl: file
> '../patch/sound/rockchip/clean/0000-cover-letter.patch' doesn't appear
> to be a patch.  Add -f to options?
> Liam Girdwood <lgirdwood@gmail.com> (maintainer:SOUND - SOC LAYER /
> DYNAMIC AUDIO POWER MANAGEM...)
> Mark Brown <broonie@kernel.org> (maintainer:SOUND - SOC LAYER /
> DYNAMIC AUDIO POWER MANAGEM...)
> Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
> Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
> Heiko Stuebner <heiko@sntech.de> (maintainer:ARM/Rockchip SoC support)
> Nicolas Frattaroli <frattaroli.nicolas@gmail.com> (maintainer:ROCKCHIP
> I2S TDM DRIVER)
> linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC
> AUDIO POWER MANAGEM...)
> linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support)
> linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
> linux-kernel@vger.kernel.org (open list)
> SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC) status: Supported
> phuc@phuc-desktop:~/work/linux$
> phuc@phuc-desktop:~/work/linux$
> ---------------------------------------------

$ ./scripts/get_maintainer.pl sound/soc/rockchip/rockchip_sai.c 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> (maintainer:ROCKCHIP SAI DRIVER)
[...]

b4 will also pick this up. Running get_maintainer.pl on a patch with
rockchip_sai.* in the diff will also pick it up, see MAINTAINERS. It
likely wasn't picked up for you because by passing every patch into
it at once, it decided to "deduplicate" my gmail from my work e-mail
based on name, which seems like really silly default behaviour for
get_maintainers to have. `--no-remove-duplicates` works around this.

I should be setting up a forward or checking my gmail at work more
often.

> 
> If there are additional maintainers or mailing lists that should receive these
> patches but are not currently reported by get_maintainer.pl, please let me know
> so I can include them in future submissions.
> I would also appreciate avoiding assumptions that the series was generated
> by an LLM. The patches were prepared manually and submitted as part of
> my ongoing effort to convert lock/unlock patterns to guard()/scoped_guard()
> helpers where appropriate.
> The series was build-tested before submission, so I do not believe it
> is accurate
> to describe it as "wasn't even tested".
> Whether a particular conversion is worthwhile is certainly open to
> technical discussion,
> but I do not think it is reasonable to conclude that a patch was AI-generated
> simply based on disagreements about the implementation details.
> I understand maintainers have different preferences regarding how aggressively
> such conversions should be applied, and I am happy to adjust the approach
> based on review feedback.

If the patch worsens code legibility through excessive indentation and does
not make any functional changes, then I do not see the point of it.
Build-testing will tell you whether it compiles, but a lot of things in C
compile but aren't correct.

If you want to try again, do so in a way where you don't have to indent
large parts of a function another level, it's possible and the diff
will be something I can actually read. Remember that you can place a
guard for the spinlock in the middle of a function, and it'll only be
picked up then, which should reduce the need for the scoped_guards in
this. To avoid having to manually do pm unwind (and therefore require
that the spinlock is dropped somehow before function exit), use the
runtime pm guard macros as well. That should simplify this immensely.

Last but not least, please run things through checkpatch. Even at the
default options, it'll warn about the indentation level. With --strict,
it'll also tell you about the braces. Personally I just use whatever
preset `b4 prep --check` uses, which usually is quite reasonable.

> 
> Best regards,
> Phuc
> 




