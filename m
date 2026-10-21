Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595880;
	b=lzodok6muyFfAM+Rs2FXYbCzJSmEc1b+a0JSmKYo0iFwLoekx8NCk43so7HBB42uMq49
	 5GQnnGyH3w7KX15XpRE6hO6aL2vqO9j9ERWncOkkRQf6mZ+8YncV8Z97Bbs1rZGqumZeP
	 w5eDYmToYrSDQPcsRsrIy6Wu/yol18UIS7tRnKI40yqeQ9Ae/CtGz0PBWoX+hXEaiCDRv
	 BOLaMidyQl+rm6o9/+g87eWlbe/QnJdwIasy2Z525GrH9vlcDBH0acye6Ub3nACcUd6Hr
	 hV313EgoaN3EeJFXANIIW+YWOvTHzYDOrV0NJlIi1mzhgYTtOHtuMUzKGq57zzFG6Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595880;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=vPr25rcUTDWu20dbGkdUbserp7aWFZ9wd0k9Zudaots=;
	b=QsqabwA9P21b/vvt+jRmCuYU6OTQ8XL6ulxQ49f0w+8l1hBr5GitqEignOAh6A81EYtc
	 JKUr+Q5woyvmHuBbACef8ywHI8mN9P3M9aruNIMI6hGVV3Cdq0DNBGX46tKXhLsiXcFbq
	 E17CL7eZ9gMXkirL5Df9Cwn0SllqTtYjsTziaKcGjU7SgaWE3K2kgJttRjUbhSt2NMrnv
	 m1hugkLDsIwdEAOZQMQJgjroJL2Fs7K+BsN9Q5z1SB2j9tN9Wya7new2kruBy56LeilTR
	 a3CMKmHbuc0eFRM+swyQ9I6UzeXCi+5gPvrNootFC9Ux6fOcgKLWkA6+NPCbZBAkYZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JxdnG1Li;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B666606A31E
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B666606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JxdnG1Li
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261021151756euoutp01f6c51652bda0854bc3d94e52268c1624~glHO_M4EQ2115721157euoutp01a
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:17:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261021151756euoutp01f6c51652bda0854bc3d94e52268c1624~glHO_M4EQ2115721157euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792595876;
	bh=vPr25rcUTDWu20dbGkdUbserp7aWFZ9wd0k9Zudaots=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=JxdnG1LikwvotjkKCxWpZrTvugGjQV+s8ysu9IbciYlQKcDcc+dXqu5qYHref9+t6
	 hhdNlFqUYpYQg6pcLHVlfVp+OyM/349A5vA9s+pv+wPw03OAXv3xUBQ3Ucdz50sZoR
	 AE5iKxmoDMXwcKT8hysDJ8LyHaVQJLHsireiI9Vk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261021151756eucas1p2bc6356d811cafba2f15c028e108c2805~glHOjTjD_1269812698eucas1p2K;
	Wed, 21 Oct 2026 15:17:56 +0000 (GMT)
Received: from AMDN5751 (unknown [106.120.87.45]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261021151755eusmtip2f1640bf73c743595bdc6b515ef488419~glHOGV3T93196331963eusmtip2W;
	Wed, 21 Oct 2026 15:17:55 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Marek Szyprowski'" <m.szyprowski@samsung.com>
Cc: "'Liam Girdwood'" <lgirdwood@gmail.com>, "'Mark Brown'"
	<broonie@kernel.org>, "'Charles Keepax'" <ckeepax@opensource.cirrus.com>,
	"'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Simon Shields'"
	<simon@lineageos.org>, "'Artur Weber'" <aweber.kernel@gmail.com>,
	<patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
In-Reply-To: <20261021101750.3297770-2-m.szyprowski@samsung.com>
Subject: RE: [PATCH 1/4] ASoC: wm8994: fix MCLK gating for AIF clocks
 sourced from MCLK2
Date: Wed, 21 Oct 2026 17:17:54 +0200
Message-ID: <000101dd616f$59517e40$0bf47ac0$@samsung.com>
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
Thread-Index: AQKrkeRVrtMc7xGFxDI3/ROeqrh4mgFky/HbAY/TKtm1VBWJwA==
Content-Language: pl
X-CMS-MailID: 20261021151756eucas1p2bc6356d811cafba2f15c028e108c2805
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225
X-EPHeader: CA
X-CMS-RootMailID: 20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
	<CGME20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225@eucas1p1.samsung.com>
	<20261021101750.3297770-2-m.szyprowski@samsung.com>

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
CH=201/4=5D=20ASoC:=20wm8994:=20fix=20MCLK=20gating=20for=20AIF=20clocks=20=
sourced=0D=0A>=20from=20MCLK2=0D=0A>=20=0D=0A>=20aif_mclk_set()=20masks=20t=
he=20AIFnCLK_SRC=20field=20of=20the=20AIFn=20clocking=0D=0A>=20register,=20=
but=20compares=20the=20result=20with=20unshifted=20field=20values.=20The=0D=
=0A>=20MCLK2=20source=20(0x08)=20therefore=20never=20matches,=20so=20MCLK2=
=20is=20never=20enabled=0D=0A>=20for=20an=20AIF=20clocked=20from=20it,=20an=
d=20the=20AIF=20relies=20on=20other=20users=20of=20that=0D=0A>=20clock=20to=
=20keep=20it=20running.=0D=0A>=20=0D=0A>=20On=20the=20Exynos4412=20Trats2=
=20board,=20AIF1=20and=20SYSCLK=20run=20from=20MCLK2,=20the=0D=0A>=2032768H=
z=20PMIC=20clock,=20while=20the=20codec=20is=20idle.=20That=20clock=20is=20=
shared=20with=0D=0A>=20the=20WLAN=20and=20Bluetooth=20chips,=20which=20enab=
le=20it=20only=20once=20their=20drivers=0D=0A>=20are=20loaded.=20Until=20th=
en=20the=20codec=20runs=20from=20a=20stopped=20clock:=20FLL1=20fails=0D=0A>=
=20to=20lock=20when=20configured=20from=20that=20state,=20and=20the=20codec=
=20floods=20the=0D=0A>=20kernel=20log=20with=20FIFO=20error=20interrupts=20=
once=20a=20digital=20path=20is=20powered=0D=0A>=20up:=0D=0A>=20=0D=0A>=20=
=20wm8994-codec=20wm8994-codec:=20Timed=20out=20waiting=20for=20FLL=20lock=
=0D=0A>=20=20wm8994-codec=20wm8994-codec:=20FIFO=20error=0D=0A>=20=0D=0A>=
=20Booting=20with=20clk_ignore_unused,=20which=20keeps=20that=20clock=20run=
ning=20from=0D=0A>=20the=20bootloader,=20makes=20both=20issues=20disappear.=
=0D=0A>=20=0D=0A>=20Fixing=20just=20the=20comparison=20is=20not=20enough.=
=20The=20AIF=20clock=20source=20can=0D=0A>=20be=20changed=20while=20the=20A=
IF=20clock=20is=20running,=20for=20example=20the=20Midas=0D=0A>=20machine=
=20driver=20switches=20AIF1=20between=20MCLK2=20and=20FLL1=20while=20AIF1CL=
K=20is=0D=0A>=20kept=20enabled=20for=20jack=20detection.=20Looking=20up=20t=
he=20clock=20again=20on=20disable=0D=0A>=20can=20then=20release=20a=20diffe=
rent=20MCLK=20than=20the=20one=20enabled,=20leaking=20the=0D=0A>=20enable=
=20count=20of=20one=20clock=20and=20underflowing=20the=20other.=0D=0A>=20=
=0D=0A>=20Shift=20the=20field=20value=20before=20decoding=20it,=20and=20rem=
ember=20which=20MCLK=20has=0D=0A>=20been=20enabled=20for=20each=20AIF,=20so=
=20that=20the=20same=20clock=20is=20released=20on=0D=0A>=20disable.=20While=
=20at=20it,=20report=20the=20MCLK=20number=201-based=20in=20the=20error=0D=
=0A>=20message.=0D=0A>=20=0D=0A>=20Fixes:=20001b83d395ab=20(=22ASoC:=20wm89=
94:=20Add=20support=20for=20MCLKn=20clock=0D=0A>=20gating=22)=0D=0A>=20Sign=
ed-off-by:=20Marek=20Szyprowski=20<m.szyprowski=40samsung.com>=0D=0A=0D=0AR=
eviewed-by:=20Sylwester=20Nawrocki=20<s.nawrocki=40samsung.com>=0D=0A=0D=0A=
=0D=0A
