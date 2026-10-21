Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596188;
	b=ZQCq0R9SJnh/A4kGRnE2kk4t57zqxWHmUUFZ97K4lc5jKj/U+abVrVJRcfKD4lAgRPI9
	 pH60tqvDo1wMBxo4IwV0Uje7RLgv0HkpdGinroYHtZ+uKnAVvj0/HwPk2j4oXSBy6Wtrl
	 Jj3/l52PkaKy02lHd9DkDcoULxfN/ltKh5OkUJr/cNyOvyMD1P6rApmQj4fWKommvwMln
	 LaFsJGrJzklsYngGCqUJiwevuTzQg0OvsIm/tOvgm1TH6wcOhOGw2NDRadjFYFFyw0mm0
	 pS4TgzBR7Zr9LbHZfmaGYFun6VBPhjYZ6K7wsHNCvOYvEAkoqqwbzv6Kvr4qYFRoYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596188;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=UjOaL7ZUV0HHqJ9OrateXvUH7m04aV0nw86mEQ8nzrs=;
	b=cPdRegq2Wyyw1zsQLLwPvZniIEjYSJmXCGr4zXwXrlWJMOlcZGuK/FNUrsdVXf1vMMg+
	 N1Zvnh0bcNka5/fm6rhsYnB0qFXBaj9Ffahsowa6v+dez1CSA+tKIXIzbQxxlLLWY6FSL
	 e05fD9OFaQEo7w1NrdCo2T1k4dgq6GsfaJSoiVZEChJ542CmCjyH/iXJpxn506lzBQf6O
	 4deSTQGSlSoLkI5HApmgYUvLzCnqb5f/hhnmOLoyhvwevxHizR51CmG2EUhGhnx/9NpvB
	 hlztK+y9fgEcNDGrqIRg52tgPTLVDrI62KQq/nVJQ3ZycmKnam8cQh1ADClFj7tGvUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=d0z3Ij+t;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B077C606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B077C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=d0z3Ij+t
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261021152304euoutp0254222f099012d9252749a27c95fd05da~glLuMo09X0981409814euoutp026
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:23:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261021152304euoutp0254222f099012d9252749a27c95fd05da~glLuMo09X0981409814euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792596184;
	bh=UjOaL7ZUV0HHqJ9OrateXvUH7m04aV0nw86mEQ8nzrs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=d0z3Ij+t+CzOSlVuFBS4uGb9A3TwaS9jfjskhFJy13msWChgKlRGByvf17Cri8p8P
	 Zq7Hrf3uGeUDK20Tw4SSXntvuCjTAwSvt9ZRXJtdxLYjsiXXkSxRj/NMt5CghBjBh9
	 yUkwT2U1BpB9pZZqSxEkphuyW+t4KafKDED+huxI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261021152304eucas1p130ff6759320c0957652e80f750050618~glLtuoCYi1670016700eucas1p1D;
	Wed, 21 Oct 2026 15:23:04 +0000 (GMT)
Received: from AMDN5751 (unknown [106.120.87.45]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20261021152303eusmtip19e2cbbdcc84257d387797a76dd3c2810~glLtRqAkR0626306263eusmtip1Q;
	Wed, 21 Oct 2026 15:23:03 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Marek Szyprowski'" <m.szyprowski@samsung.com>
Cc: "'Liam Girdwood'" <lgirdwood@gmail.com>, "'Mark Brown'"
	<broonie@kernel.org>, "'Charles Keepax'" <ckeepax@opensource.cirrus.com>,
	"'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Simon Shields'"
	<simon@lineageos.org>, "'Artur Weber'" <aweber.kernel@gmail.com>,
	<patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
In-Reply-To: <20261021101750.3297770-4-m.szyprowski@samsung.com>
Subject: RE: [PATCH 3/4] ASoC: wm8994: fix MCLK index used for setting MCLK
 rate
Date: Wed, 21 Oct 2026 17:23:03 +0200
Message-ID: <000301dd6170$111b82f0$335288d0$@samsung.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKrkeRVrtMc7xGFxDI3/ROeqrh4mgLsxKfnAT6z3qO1SmB2cA==
Content-Language: pl
X-CMS-MailID: 20261021152304eucas1p130ff6759320c0957652e80f750050618
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48
X-EPHeader: CA
X-CMS-RootMailID: 20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
	<CGME20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48@eucas1p1.samsung.com>
	<20261021101750.3297770-4-m.szyprowski@samsung.com>

> -----Original Message-----
> From: Marek Szyprowski <m.szyprowski=40samsung.com>
> Sent: =C5=9Broda,=2021=20pa=C5=BAdziernika=202026=2012:18=0D=0A>=20Cc:=20=
Marek=20Szyprowski=20<m.szyprowski=40samsung.com>;=20Liam=20Girdwood=0D=0A>=
=20<lgirdwood=40gmail.com>;=20Mark=20Brown=20<broonie=40kernel.org>;=20Sylw=
ester=0D=0A>=20Nawrocki=20<s.nawrocki=40samsung.com>;=20Charles=20Keepax=0D=
=0A>=20<ckeepax=40opensource.cirrus.com>;=20Krzysztof=20Kozlowski=20<krzk=
=40kernel.org>;=0D=0A>=20Simon=20Shields=20<simon=40lineageos.org>;=20Artur=
=20Weber=0D=0A>=20<aweber.kernel=40gmail.com>;=20patches=40opensource.cirru=
s.com;=20linux-=0D=0A>=20sound=40vger.kernel.org=0D=0A>=20Subject:=20=5BPAT=
CH=203/4=5D=20ASoC:=20wm8994:=20fix=20MCLK=20index=20used=20for=20setting=
=20MCLK=0D=0A>=20rate=0D=0A>=20=0D=0A>=20wm8994_set_dai_sysclk()=20passes=
=20the=20AIF=20index=20(dai->id=20-=201)=20to=0D=0A>=20wm8994_set_mclk_rate=
(),=20which=20uses=20it=20to=20index=20the=20MCLK=20clocks=20and=0D=0A>=20t=
heir=20cached=20rates.=20As=20a=20result,=20selecting=20MCLK2=20as=20the=20=
AIF1=20clock=0D=0A>=20source=20sets=20and=20reads=20back=20the=20rate=20of=
=20MCLK1=20instead,=20and=20the=20rate=0D=0A>=20of=20MCLK1=20is=20then=20st=
ored=20as=20the=20MCLK2=20rate.=0D=0A>=20=0D=0A>=20On=20the=20Exynos4412=20=
Trats2=20board,=20where=20MCLK1=20is=20a=20fixed=2024MHz=20clock=20and=0D=
=0A>=20MCLK2=20a=2032768Hz=20clock=20used=20when=20the=20codec=20is=20idle,=
=20this=20gives:=0D=0A>=20=0D=0A>=20=20wm8994-codec=20wm8994-codec:=20AIF1=
=20using=20MCLK2=20at=2024000000Hz=0D=0A>=20=0D=0A>=20so=20the=20driver=20a=
ssumes=20a=2012MHz=20SYSCLK=20while=20it=20actually=20runs=20at=2032kHz.=0D=
=0A>=20This=20skips=20the=20128fs=20AIF=20clock=20ratio=20setup=20for=20low=
=20SYSCLK=20rates=20and=0D=0A>=20makes=20the=20mic=20detection=20rate=20con=
figuration=20use=20the=20wrong=20clock=20rate.=0D=0A>=20=0D=0A>=20Pass=20th=
e=20MCLK=20index=20matching=20the=20selected=20clock=20source=20instead.=0D=
=0A>=20=0D=0A>=20Fixes:=20419e2f508336=20(=22ASoC:=20wm8994:=20Add=20suppor=
t=20for=20setting=20MCLK=20clock=0D=0A>=20rate=22)=0D=0A>=20Signed-off-by:=
=20Marek=20Szyprowski=20<m.szyprowski=40samsung.com>=0D=0A=0D=0AReviewed-by=
:=20Sylwester=20Nawrocki=20<s.nawrocki=40samsung.com>=0D=0A=0D=0A
