Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596143;
	b=z3yXNhXNkOHZQN6W/gBUN75T/gDoZPzvv2iA0IlPsuYV70O6MfR6BE2KD9A6qevEv1VI
	 g4RUDB3CAS5GyKl9jl+mPtcm+N64/JacTdKgmwHtP9fMVm7QxqoW3jrsEapfWzTqr0G6L
	 BsgGmLUpe377SA2jLKI24HzTQkKRi+PAMWZFko7HFSWflgtxk977ifPXwO8ODmg4rVQUI
	 Jcahg0D3mPsJGI8g4nVdZN8KHrZwkRhjhTlLU7AsjVBD/bB44a1pyUp78jddQGq1eiMfn
	 wlHHzXtBNDtEiYaPiKQDvwH7MX83zxOEBYsBy38CFgiGQKfR6+zu5b4L6GJDcLFw+hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596143;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=CLS0Qs2ubIbRXjhR0X7BaSSYFVvieMwMEkgPkbahYNk=;
	b=FJIIQpvVNM1zzmfK6w7D9jpUc0FhkuI7aIoXZxW1rQ206Yy768cMJc9CELvoF9c1eUqK
	 RUUwWsWnJtQBP2o+TaPlDgp17K7aKYWNYu3AuZJrGR2udZJzORYUagHiOSH2YUEvr6iOD
	 jcWiOz/FTP0kg+ohTljFfjQFwbyoVj2SM9PBp/jkc/XFwGlZgFcE1jrFvKhs3UVOHOK4R
	 e+HscOFHLsIYP2Cx3p9/M0jGSGCrEsjDXNo5MAWGR+yvQKV9tkSrQmgUUFe4GC2ESqUrq
	 8rPQbGeUR1TnKhNL9/fRwQtfjRxgocNNiXqmu3i5IHclOyN3Z03YdlPpiUWuEX+zlgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ByjUL6AQ;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200A606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8200A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ByjUL6AQ
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261021152221euoutp01870e2a2a969b1a864a5b55ea4d30e239~glLFYSKC12463724637euoutp01s
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:22:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261021152221euoutp01870e2a2a969b1a864a5b55ea4d30e239~glLFYSKC12463724637euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792596141;
	bh=CLS0Qs2ubIbRXjhR0X7BaSSYFVvieMwMEkgPkbahYNk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ByjUL6AQV3xkJ+Cz9hGoqvstz8R8qIuTDnGHY2R1qXT6aJiQ0PvEf0VmeKx7Tzki5
	 b/12JzgHThH09kmBDIQmoOUeRNQK8i4dwOSeyIq+3oGP8j7vXDoKoG/3NiEY8ywkFr
	 NQVUFEJZE/A7OsHNfu8W+VGmQRz5Ux+9EiIIkutE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261021152220eucas1p2edd000dd4dfc1eced6604af872dbb7b7~glLFE25Ey3066530665eucas1p2O;
	Wed, 21 Oct 2026 15:22:20 +0000 (GMT)
Received: from AMDN5751 (unknown [106.120.87.45]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20261021152220eusmtip113c6a29c39b6379eaf87859e1f59c3a9~glLEoKbHX0630006300eusmtip1G;
	Wed, 21 Oct 2026 15:22:20 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Marek Szyprowski'" <m.szyprowski@samsung.com>
Cc: "'Liam Girdwood'" <lgirdwood@gmail.com>, "'Mark Brown'"
	<broonie@kernel.org>, "'Charles Keepax'" <ckeepax@opensource.cirrus.com>,
	"'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Simon Shields'"
	<simon@lineageos.org>, "'Artur Weber'" <aweber.kernel@gmail.com>,
	<patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
In-Reply-To: <20261021101750.3297770-3-m.szyprowski@samsung.com>
Subject: RE: [PATCH 2/4] ASoC: wm8994: don't lose the AIF clock ratio when
 staying at 32kHz SYSCLK
Date: Wed, 21 Oct 2026 17:22:19 +0200
Message-ID: <000201dd616f$f7178200$e5468600$@samsung.com>
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
Thread-Index: AQKrkeRVrtMc7xGFxDI3/ROeqrh4mgIRsRXtAyywVpO1QcQeYA==
Content-Language: pl
X-CMS-MailID: 20261021152220eucas1p2edd000dd4dfc1eced6604af872dbb7b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931
X-EPHeader: CA
X-CMS-RootMailID: 20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
	<CGME20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931@eucas1p1.samsung.com>
	<20261021101750.3297770-3-m.szyprowski@samsung.com>

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
CH=202/4=5D=20ASoC:=20wm8994:=20don't=20lose=20the=20AIF=20clock=20ratio=20=
when=0D=0A>=20staying=20at=2032kHz=20SYSCLK=0D=0A>=20=0D=0A>=20When=20SYSCL=
K=20drops=20below=2050kHz,=20the=20AIFnCLK=20rate=20ratio=20is=20saved=20an=
d=0D=0A>=20temporarily=20lowered=20to=20128fs=20for=20accessory=20detection=
,=20then=20restored=0D=0A>=20once=20SYSCLK=20gets=20fast=20enough=20again.=
=20The=20ratio=20is=20however=20saved=20again=0D=0A>=20on=20each=20clock=20=
reconfiguration=20done=20while=20SYSCLK=20is=20still=20slow,=20which=0D=0A>=
=20overwrites=20the=20original=20ratio=20with=20the=20128fs=20one.=0D=0A>=
=20=0D=0A>=20This=20happens=20on=20the=20Exynos4412=20Trats2=20board,=20whi=
ch=20set=20MCLK2=20as=20SYSCLK=0D=0A>=20twice=20during=20the=20card=20probe=
=20and=20then=20configure=20FLL1=20while=20still=20running=0D=0A>=20from=20=
MCLK2.=20Once=20SYSCLK=20is=20switched=20to=20FLL1,=20the=20128fs=20ratio=
=20is=0D=0A>=20=22restored=22,=20so=20AIF1=20is=20left=20configured=20for=
=2048kHz=20at=20128fs=20while=20being=0D=0A>=20clocked=20at=20256fs.=20If=
=20any=20digital=20path=20is=20powered=20up=20before=20a=20stream=0D=0A>=20=
reconfigures=20the=20AIF,=20the=20codec=20raises=20FIFO=20error=20interrupt=
s=20every=0D=0A>=2010ms,=20flooding=20the=20kernel=20log:=0D=0A>=20=0D=0A>=
=20=20wm8994-codec=20wm8994-codec:=20FIFO=20error=0D=0A>=20=0D=0A>=20Save=
=20the=20original=20ratio=20only=20when=20entering=20the=20low=20SYSCLK=20m=
ode.=20While=0D=0A>=20at=20it,=20move=20the=20code=20duplicated=20in=20_wm8=
994_set_fll()=20and=0D=0A>=20wm8994_set_dai_sysclk()=20to=20a=20common=20he=
lper.=0D=0A>=20=0D=0A>=20Fixes:=206730049a4763=20(=22ASoC:=20wm8994:=20Lowe=
r=20AIFnCLK=20divisor=20when=0D=0A>=20dropping=20to=2032kHz=22)=0D=0A>=20Si=
gned-off-by:=20Marek=20Szyprowski=20<m.szyprowski=40samsung.com>=0D=0A=0D=
=0AReviewed-by:=20Sylwester=20Nawrocki=20<s.nawrocki=40samsung.com>=0D=0A=
=0D=0A=0D=0A=0D=0A
