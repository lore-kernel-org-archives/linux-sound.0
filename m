Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837618;
	b=VNtLc45kucrdwb6e/l+Q4kuzK7k4EUXzZSExLvoOv6Mp3bnNCuo62g7ZbqKaG+m4ErfU
	 OTUKGDpCMivYUmQPGQp/u4VcqJQ1PXcc5dJEkvP6JMiNNFy83i8l8UWcereblHGV/MBUE
	 KVm0toP+IwumopkYhbb4InQG6LM5v6yB3Wq754ERxJPPgM0X3nLHkxP4xXk2ayY+F5mr9
	 DD1FCFA9JbWU36VzvgsMCSI8+IHcUcPtYxSAlkNDGNEkud4LWSFF5vNJvHJ+TOSO0CvIE
	 WEjZ36dEOc14GSSOAY+4BPj0PVpj4FZSiNqhk6MvyU2xcb5a7hoGz8DYaIHo0DtQmWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837618;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=F4GF/YHFpQCaR6gBCt0pMceA0m8Tmzj0vyf3rVcVrvU=;
	b=lT0sC6h+/FAO4woGzvr0jlyEmAGr+I3xPHeSFkSpBK8P6np0FOaTYIgYAMd/sp53mYvx
	 sIJ1gt9p0QbABDB3QJEmeEXESOIQH/Xmo85K6qu+tGqqJphaxeSTREC5ei8JhzlhnfYRF
	 /pdPAPdAnYUfRagbZginCtc+V9vJty3iG8dglEUSesK/eHwOQb2OyiXRC33v4fvL6N8b+
	 86sdHJ8c+ZJ51DhL/qlUeHUkmrpb09mcxxIYHmnOwIbd71rOKA6ZB64hmpgMh9NxjhoLf
	 YywFquK/qweM75seGuAn6wYiy6BeZp8YfKO/CVKNDKmsJF8L+ZROCcgmXcK2IL8fs3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=willbush.dev;
	spf=pass smtp.mailfrom=willbush.dev;
	dkim=pass header.d=willbush.dev header.i=@willbush.dev header.a=rsa-sha256 header.s=fm1 header.b=b5pkVAGW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nglupo5P;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FF0606A31A
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 10:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=willbush.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=willbush.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=willbush.dev header.i=@willbush.dev header.a=rsa-sha256 header.s=fm1 header.b=b5pkVAGW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nglupo5P
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id A26531D00133
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 06:26:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Sat, 24 Oct 2026 06:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willbush.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792837616;
	 x=1792924016; bh=F4GF/YHFpQCaR6gBCt0pMceA0m8Tmzj0vyf3rVcVrvU=; b=
	b5pkVAGWlFJ7xh3wOa/ewnYXAQAlRZ7i3KtoFg5qzXT2/HIIxJFJ+c0WT3X/W2bB
	Y1Vp9ApinjAXMdQ5q7/o0PORiQ7NPTShDi1pZx1sKLd/CZd8aqQsCpomYL0lzBsz
	PmM8bSyaa/TRdPAZNRKrXn3c2DNOtlRDCD8bW32chmO55W6tbQc9ui1Af3Mvxxde
	L7HgJ2umkbA5NkwwQINYzuTmnM4cMcKNBIBH2m6A2aY5YCWQ5SC5vv0Z4XZ41pdJ
	6u7SX4I1FX45+7zdHkeL7rokpqSY34nQDy8qDhgXktz8Vm7py0PBmz0mZJeCGCnU
	hOaOuWhdHr27MtvKscRyFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792837616; x=
	1792924016; bh=F4GF/YHFpQCaR6gBCt0pMceA0m8Tmzj0vyf3rVcVrvU=; b=n
	glupo5P+bo33CKeY1AMr/42EjmaZ/N3388qyahmNvE1zu0mGjq14XdWoy7DwGugU
	hj9PrzkzbAkaTa2dZOMEP7ECdulEf/TdO7rzcoHX/EWzC3BOlmdMoCMYmWTZW2Qq
	bx1yQTcocnD28meHspPawzNbUpeqr7T574fcaB4e/5uJwhWZ6mRPVADpHAPcSHQQ
	pRNOrWaLh6TTHl9f/ouMR3h06ic5Q80VydHmCUdBWop0AJg4iO46QXB3gLcAXvj9
	7mNR/RGCfUCDFNyVwTpq2p+HVrFRKERtQt1aabcfaa+PVzzjZRntTkZbTcc3WIET
	JdVIcDbkGKQQyONnxEHmQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=willbush.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792837616; d=willbush.dev;
	mf=PHdpbGxAd2lsbGJ1c2guZGV2Pg==;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:QMc+V3AR+yIU420223Xhg+eI3HPgU1iRN72vjJXvXsVfzLe
	dIITo62rx/FPd6EaZFl/SF9gi5q2oVEBZWqHMUxVOkQu/h9pUWlPdfCCLfZlvHTj
	Roav39zUM6H7zCmZedpPcuz1t1UFxpkc9NPv82SMAyWAKyOiyWk5AFE4IknQcSb1
	7ddfW+cA9JH8jUaOGAfJ08FGq9yaI7RVeJPzIvPcw+x82G+iCZea+OoIQ71sk9ak
	VqjDYBeUiCjp2teoIrh40w+mUrUJwf0XaWjb4nQugyEyZT98Of4GxjGQ8wNOhf8s
	lkNxmKJMq6LpkXaRcas/ionFG1c58CuuEZ6xKZg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GFvj5PUssEElx8MeEIj2yuT1jZs9cUZ52cQsqxlYcdc=:F4GF/YHFpQCaR6gBCt0pMceA0m8Tmzj0vyf3rVcVrvU=;
X-ME-Sender: <xms:8IfcatJNoymSmjqc1E4U9G0x3DBzJRd_1OR5DkMJBfJFN3AP7EYC_Q>
    <xme:8Ifcaj-imScx-4lrjEmt_WvXxrVfE2ni3AUDGARWGJaKeGlr2bCwlMZ_SZHv71w8h
    xbsW5qxE3jjI6VVW2gnGOgVLeNOWm04P60mkzTnfsjl9Hsc6P_tK3E>
X-ME-Proxy-Cause: dmFkZTEMyYLQu2mHG1fCWK9eqXPlE4pPq3ymMC0teF//+ku6VD6HBSjnVZI9IW+TMNv5aO
    wly7ZHwPPncPFggUlxGxdXRP6AMAiAvYCN/t0I9x637eT362fSsm5wM1FrsKSF26u4krK3
    7J8vAppAE3msrpsoBC2bbMkNQ7p1xG8IZVLOqZvC1RYU04tjtvZdUXg3guhBTEU5KizTqn
    Ml9bfEn4rL3c3NXUKdYfiowvDMUX0SdLDLJ5tNx2/+w28m1fk7NC2BcE4jm+g92kRp4fEf
    TS0cGhtvfs1FzPzRgZFSJj5RrwnGgUCwg/C+vTvpDTlIzhAiJksIxb5K8fYSwehErQl6L9
    uHRBesGSx1ssXWB72WVwXfbfxt/+z+TBg8138k5XpJO6RqcTMw4UFczdB07WhApfb+tQG1
    RYrQSw5jmBFdS40ztEz7dEHwzZfCzdJg7S4kYMKXVjfusHoE7Xw1/31db9o0b546a8nu2p
    3kIUrS8kK4yzNYGOmu0X1kush6OGN0pm/ZqUDOaN+4JG39aZOUSZFosmtBLB/6QGCP6xv6
    Fz79xzU0QPR+B6EIGRgpt00rwA7+booviFoAj03LtzvKMAkSzd5rTkqpu+5BwBwAVxCqrv
    uhiNxZJll+i7k5G/U1cBz7AEj+mOKo+j0Iz4b5Bg7EuxLC+SQ6ibuoxW+PrQ
X-ME-Proxy: <xmx:8Ifcaqs9FWJEH4We7IHm1AA8vnp5qyx-IfWhcKH2EjSSVty4BPGAqA>
    <xmx:8IfcavlkqAZ7rIv8tEN0LVNoRVPAzp6as-AG8arnp_l7gP-4-SugdQ>
    <xmx:8Ifcatu9yZEhNfDWSOTePeDsRBPz-0X-ywyLW9csRRSHe_OmWID_5w>
    <xmx:8IfcatdYi6Zb8e-Of1FZ9WCYgW_FO2rr4IusriEiIlmRuz5Zhy7Lbw>
    <xmx:8IfcapK86z0yCQl4O3YkGeComZjPp2AfvCVoKUejvNv04ayzh8DrwpIZ>
Feedback-ID: i0f194965:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 03AF7700069; Sat, 24 Oct 2026 06:26:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AyAsXzFXx5f3
Date: Sat, 24 Oct 2026 05:26:34 -0500
From: "Will Bush" <will@willbush.dev>
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Message-Id: <c87b68d6-8e4d-4d4b-b5a9-5918af9f2217@app.fastmail.com>
In-Reply-To: <20261019102347.2425406-1-tiwai@suse.de>
References: <20261019102347.2425406-1-tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Avoid applying boot quirk for Behringer UMC204HD
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 5:23 AM, Takashi Iwai wrote:
> As a quick workaround, skip the quirk for those UMC204HD models.

I tested your patch on 7.2.10 with my UMC204HD (1397:0508) and it works. Thanks!

Tested-by: Will Bush <will@willbush.dev>

Best,
Will
