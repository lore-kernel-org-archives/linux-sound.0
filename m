Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFFD48C8AE;
	Tue, 21 Jul 2026 12:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635712; cv=pass; b=qHmteRa1A+clFoOUn2D6DJN48f80CqAE78VkJrZOgWZpM6qDS/tUAGvMMbH58Kkhe0iCGzgu6PkHKhi0+hpIK2rH9THY8i10jZDCbfaBpnJqnTC9Fe/UrtNbuinwtCm4j9w18SpjAkXFzJuvoI/nEM1rEGYwKSotUsVXyDX9N8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635712; c=relaxed/simple;
	bh=9/Rc69ICcMIXTRsEEcWrTvEKGRw9LcH0+wP9oDuTp54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EUWMw1dEs+TwfcPd8KeleGgCjMEr2Y1ZojvvbeHIxUfVD4QD/1uJayqC5RvgxU2OC4ft4Vr138GwCnJFYRjT+4KyAzwntAqOMPLSMTOAP+pFENixteHTd9LZqUxMRixzOA/lG4rM8hoyj7c3e6tWFvlwq32RVmrdxf2nCrpMsyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=i/1rLOvD; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="i/1rLOvD"
ARC-Seal: i=1; a=rsa-sha256; t=1784635691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QMzxjQ57NYr9BooOwPo5hMWKlOWNkk3kX6KXgbb6WqQhQJCJkkVxGhHv10+z21zs/PljupmoaKekrKrcyGD6fu9E9FwUH5VNQ+rsKHV4KEhEZPf2ksqdScM86bm3/UPrTBGV5POl7tmvBg4FHcvAp7C5hy3LLx+sCIsPVFqo76Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784635691; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/JLUszQw5nxntPaMSf0GuQmSHicYA2ZRYKBzU+ywtRU=; 
	b=Mv3S9CyFCDf036vRiccAQDi/NTxkqhop8CKFVnX9qitzt8iypy8xlxzr8RM7NwtlQWNuSND2/wLmtRJNYmrgcYUrNyrUy61Cxq6cpkLjN68DAY6Pi4xnnhdtjNoOvGPuYgF1EhgEwLc178xH6faC+EUpHlRYLxe96QLAF2/YIos=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784635691;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=/JLUszQw5nxntPaMSf0GuQmSHicYA2ZRYKBzU+ywtRU=;
	b=i/1rLOvDpal9TKEZUrPz4yP1/hgb0vfpGw7P7SLL+jJTpEl/mihDp3GDXQcQtBgs
	qFrumGcUFbu4FKfh9aLI9+dbwSIYUsusSC6dyGKj+M0b1bKFVgKQiwdNSJjrqaDF1SE
	CGzDaX+1CJmG6xPZKVqgd58J9qmhr7b3lyryOsPc=
Received: by mx.zohomail.com with SMTPS id 1784635689231785.3049535059575;
	Tue, 21 Jul 2026 05:08:09 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Mark Brown <broonie@kernel.org>, Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control exclusively
 to Runtime PM
Date: Tue, 21 Jul 2026 14:08:03 +0200
Message-ID: <xrl5n7J2R2GNQC1ABA20Mw@collabora.com>
In-Reply-To:
 <CAABR9nF8GebpxX0ry-MMLCfsyPJ6EUpkEtYdASAep2jX+d5gnw@mail.gmail.com>
References:
 <20260622005613.21870-1-phucduc.bui@gmail.com>
 <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
 <CAABR9nF8GebpxX0ry-MMLCfsyPJ6EUpkEtYdASAep2jX+d5gnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hello, finally got around to responding to this.

On Wednesday, 24 June 2026 04:37:33 Central European Summer Time Bui Duc Ph=
uc wrote:
> Hi all,
>=20
> Regarding the case where PM configuration is not enabled, with the old
> source code, I suspect there is an unbalanced clk_disable_unprepare()
> call on hclk when the driver is unbound after a successful probe under
> CONFIG_PM=3Dn.

If "old source code" refers to what's currently in the tree with the
devm_clk_get_enabled, then yes. There's the manual resume function
call which isn't balanced.

I think your follow-up patch does make sense in light of that.

>=20
> The actual enable_count / prepare_count sequence for hclk (with values
> clamped at 0) would be:
>=20
> probe:
>=20
> devm_clk_get_enabled           0 -> 1
> runtime_resume (manual)       1 -> 2
> clk_disable_unprepare            2 -> 1 (at the end of probe)
>=20
> unbind:
>=20
> remove -> runtime_suspend   1 -> 0 (ops->disable/unprepare executed here)
> devm cleanup                          0 -> WARN "already disabled" /
> "already unprepared"
>=20
> This conclusion is based solely on code inspection; I do not have
> hardware available to verify it.

I'll e-mail you off-list to see if we can rectify that.

> I noticed that Nicolas tested and ACKed the use of devm_clk_get_enabled(),
> so I'm not sure whether that testing included the CONFIG_PM=3Dn configura=
tion.

Nope, I basically never build with PM/RPM disabled.

>=20
> https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/
>=20
> If it did, then I may have overlooked something.
>=20
> @Nicolas (or anyone familiar with this), could you please help
> double-check if my understanding is correct?
>=20
> Best regards,
> Phuc
>=20
>=20
>=20
> On Tue, Jun 23, 2026 at 5:53=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.c=
om> wrote:
> >
> > Hi Mark,
> >
> > Thank you for your review.
> >
> > > >    1 Reverting back to devm_clk_get() to remove the implicit devres
> > > >      enable/disable behavior.
> > > >    2 Manually enabling and disabling hclk explicitly only around the
> > > >      early register access before Runtime PM takes over.
> > > >    3 Dropping the stray clk_disable_unprepare() at the end of probe=
()
> > > >      so Runtime PM solely owns hclk afterward.
> > >
> > > Note that runtime PM can be disabled at build time so we might not ha=
ve
> > > runtime PM at all...
> > >
> >
> > Thanks for pointing this out. You're right that with !CONFIG_PM, the
> > driver only relies on the
> > two manual calls to rokchip_sai_runtime_resume() / suspend(), so hclk
> > stays enabled the
> > whole time. I understand this is unvavoidable in that configuration,
> > throgh, since there's no
> > Runtime PM to re-enable the clock when it's needed.
> >
> > I'll update the commit message to reflect that the driver uses a
> > combination of Runtime PM
> > and explicit manual enable/disable, rather than relying on Runtime PM a=
lone.
> >
> > > > Links:
> > > > 1 This change is based on the discussion around manual hclk handing=
 during probe(),
> > > >   as raised by Krysztof:
> > > >   https://lore.kernel.org/all/20e4754b-ea9a-404d-b529-ec44a7263cbf@=
kernel.org/#t
> > > > 2 Background for the earlier devm_clk_get_enbabled() conversion:
> > > >   https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/
> > >
> > > > An alternative approach would be use devm_regmap_init_mmio_clk() an=
d let regmap
> > > > manage clock enablement around register accesses. If preferred, I c=
an rework the
> > > > driver accordingly.

Hm, I'm worried only ungating the clock around register accesses isn't
going to go well if the clock is needed by the internal logic of the
device as well.

> > >
> > > > -     sai->hclk =3D devm_clk_get_enabled(&pdev->dev, "hclk");
> > > > +     sai->hclk =3D devm_clk_get(&pdev->dev, "hclk");
> > > >       if (IS_ERR(sai->hclk))
> > > >               return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
> > > >                                    "Failed to get hclk\n");
> > > >
> > > > +     ret =3D clk_prepare_enable(sai->hclk);
> > > > +     if (ret)
> > > > +             return dev_err_probe(&pdev->dev, ret, "Failed to enab=
le hclk\n");
> > > > +
> > >
> > > > @@ -1482,8 +1492,6 @@ static int rockchip_sai_probe(struct platform=
_device *pdev)
> > > >       pm_runtime_use_autosuspend(&pdev->dev);
> > > >       pm_runtime_put(&pdev->dev);
> > > >
> > > > -     clk_disable_unprepare(sai->hclk);
> > > > -
> > > >       return 0;
> > >
> > > Are you sure that the runtime PM state there is such that it knows a
> > > reference is held?  The driver used pm_runtime_get_noresume() so the
> > > device didn't have RPM_ACTIVE set I think?
> >
> >
> > You are right, pm_runtime_get_noresume() doesn't set RPM_ACTIVE. I
> > think we need to add
> > pm_runtime_set_active() before pm_runtime_enable(). Otherwise, with CON=
=46IG_PM,
> > the pm_runtime_put() at the end of probe() might skip the suspend,
> > since the core still considers
> > the device suspended .

Agreed, this needs fixing. That is an odd behaviour of the PM API.

> >
> > >
> > > The runtime PM API really is a miserable collection of landmines :(
> >
> > Yeah, plenty of landmines indeed :(
> > I checked, and rockchip_spdif.c does use devm_regmap_init_mmio_clk() fo=
r hclk,
> > rather than wrapping every register access in pm_runtime_get_sync() /
> > pm_runtime_put()
> > the way rockchip_sai does.
> >
> > Best regards,
> > Phuc
>=20




