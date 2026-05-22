Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE143C2BA2
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448895; cv=none; b=Y2w0twL7M/26AosQQ3Siz+CI9lLY8d+t6HQpZPnEpuf3E1lJqcOEw46iaEOaTZtcQo5ocRMoiq/m3lLnWXR6DCWiTSYA6AS/vVqCrVjtXkqOnlREMLdMYU1+saXoe1z6LHgXCeKYXElKPNACi0Ks42MoFYvs6KrV/29Cw8Z7myw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448895; c=relaxed/simple;
	bh=KI+LTKZEa31f1b2qhw7bTyi09qvy7n1+OCDFjlfvHpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wa/zxlvmF0T50tK/O5J0ilpEbWEjFCq71z2Ev/gvdc1sJHxJDX/7+bED3Fj/hUyBYumYE/+pt8Q2mP5P22/ZhVKTJMT2zUD7HWXC/ZV64ph+NgyfjV03kx//wMlIxDgzeMOMUAiXYB4Ps3osFoupM4z6XeAl3Gr65u/mND/BKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=J0H4F3Gu; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="J0H4F3Gu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zBtljL5HI9nSq9t+p6x1VyiTSyLqJJDvvCoKL3xS398=; b=J0H4F3GuGyhD5qKQn94W/qpCm9
	MOAW6ArF1hdqaAf4yPLyRU3u1YWEflaGcYAOIsT/GgxcH1vE+TWU+FMvxgN891YqN7A0SoUj2zMoq
	V4ehSMnSmMo3j80AoJkiQiRg71Mt+03h3W7FFCd+ndPGldGBe8D2YXoDFI/jwk7J1/7iJRvYJljT3
	2wDUQGxikp6OboxPxaxLBZ5JZ3EMhRCS+1TAfp2AyX+n4RCWqFWk3hEAR2Cdqwbg3b4q0dttdWqVY
	noSqjVHl/My62rQdNivvgs7b16TsyF9iHTd3s4/nnkhtmtyDVTmorWIuLh/KxLopdURwcQjgvGMD/
	gt1IA2eA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQNwY-0007ZE-0Y;
	Fri, 22 May 2026 13:21:30 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQNwX-00094F-0L;
	Fri, 22 May 2026 13:21:29 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Date: Fri, 22 May 2026 13:21:29 +0200
Message-ID: <2460572.Mh6RI2rZIc@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <075c095d-c42f-46cc-98aa-b290f25519d2@intel.com>
References:
 <20260430140752.766130-1-cezary.rojewski@intel.com>
 <6456213.lOV4Wx5bFT@steina-w>
 <075c095d-c42f-46cc-98aa-b290f25519d2@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28008/Fri May 22 08:24:46 2026)

Am Donnerstag, 21. Mai 2026, 16:41:04 CEST schrieb Cezary Rojewski:
> On 5/21/2026 12:11 PM, Alexander Stein wrote:
> > Am Donnerstag, 21. Mai 2026, 10:13:45 CEST schrieb Cezary Rojewski:
>=20
> ...
>=20
> >>>> Now, listing the clocks won't help here unfortunately. The patch wor=
ks
> >>>> on the component-level, clock details do not interest it. Also, could
> >>>> you specify the scenario? Is just a simple platform boot causing the
> >>>> problem -or- do you perform some specific test steps to reproduce?
> >>>
> >>> There is no specific scenario, just booting the board causes this err=
or
> >>> during probe.
> >> Thank you for the confirmation.
> >>
> >> I've forgotten to mention - please also attach the equivalnet but from
> >> the system running the previous kernel (one that causes no trouble).
> >> Now, would it be possible to receive the excerpts as attachments? The
> >> timestamps are also welcome - in the above snapshop, all of them are c=
ut
> >> off.
> >=20
> > I stripped the timestamps deliberately, people told me it's just noise.
> > But here we go
>=20
> ...
> > [   15.360319] tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_s=
et_sysclk() on tlv320aic32x4-hifi
> > [   15.360342] fsl-asoc-card sound: failed to set sysclk in fsl_asoc_ca=
rd_late_probe
> > [   15.360360] fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_l=
ate_probe() on tqm-tlv320aic32
> > [   15.558546] snd_soc_core:snd_soc_register_dai: hdmi-audio-codec hdmi=
=2Daudio-codec.1: ASoC: Registered DAI 'i2s-hifi'
> The framework' behavior looks just fine. I'll need some additional help=20
> from your side here.
>=20
> What does -22 from snd_soc_dai_set_sysclk() actually mean here? The=20
> codec's ->set_sysclk looks as such:
>=20
> static int aic32x4_set_dai_sysclk(struct snd_soc_dai *codec_dai,
>                                    int clk_id, unsigned int freq, int dir)
> {
>          struct snd_soc_component *component =3D codec_dai->component;
>          struct clk *mclk;
>          struct clk *pll;
>=20
>          pll =3D devm_clk_get(component->dev, "pll");
>          if (IS_ERR(pll))
>                  return PTR_ERR(pll);
>=20
>          mclk =3D clk_get_parent(pll);
>=20
>          return clk_set_rate(mclk, freq);
> }
>=20
> Do we even get here? If so, does -22 is caused by devm_clk_get(),=20
> clk_get_parent() or clk_set_rate() ?

We had a debug session and were able locate the cause to the clock tree
configuration in DT (fix about to be sent). AFAICS there is no problem
with this patch, it just uncovers another issue.

Thanks again to Cezary for supporting me pining this down.

best regards
Alexander

> [snip]

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


