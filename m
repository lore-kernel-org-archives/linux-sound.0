Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596675;
	b=GR5Fga+pqg7OfjkXKdYUMfh/rtV5papEfLfY1XMdy0sxV8RscGhmPJr2fAJRpuLUlQt7
	 aFYtYRBjuuWXSuMSnXvPC0jBawjAH9Zzq9YNGw0IgFQ60OBfAJair21Z9v7hNqSh7y0SJ
	 vR7KU+3u3axfczlZommtWoVfjFi/re+sLH8UKXEm1OlNJXM6xhlkZA/SNId9RgutVZzS9
	 EDVf/fJQZf49ZOcEK2KmOdllmpTYMU3B2dbLIp+UZNEl4Q/Ij7gaHMEnVGrPAF/Mod2CZ
	 TCV8KB2CMqyz4xKvlGt3Qo7+fYi5W3W7bUO8l1TurlmfxOL8jsUHGTChGwTEzoVz2sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596675;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=T/FNDiBCQLotUrV9/f/GH/Xcye3m989EX4Dxl8pPQSM=;
	b=mUG0EfSc0gIRMsirGEmTDLcCS+YD2Tf/Do6aQepoNGe7AmjFvjLcAoWWc6K+QTyoHEY0
	 wfoAf6h7jCURrw/VJsb+neF37bRvrjiqq1DA3mW4jf7rFkD3BwWLUanT85anwcefGMqMZ
	 9F5vinIcQA3rpGj8yZbe7Hs3W2AUK1LTemlN5vvt+QTsIpSCUjem8MldzYIgMtRHKws+9
	 sZNGqpH/izHcRPgZmU7dS+DnhL596dLlbVAbONB5gkm+TykXdONEalUGJpQR+YcXX1eOF
	 A4G/NewPRgj3OvpimOuJQrPmMmYk86mMsme9jBh+/fpig7gaBQhK6nK5Hmu4/geZbwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=eTe2LDMA;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E71606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E71606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=eTe2LDMA
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261021153112euoutp024e6a3c86dc66b464258dced588a3b2ed~glS0aJ_Q61524915249euoutp02j
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:31:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261021153112euoutp024e6a3c86dc66b464258dced588a3b2ed~glS0aJ_Q61524915249euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792596672;
	bh=T/FNDiBCQLotUrV9/f/GH/Xcye3m989EX4Dxl8pPQSM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=eTe2LDMAebnBssKx0JVLpRzjDFlk9IgkcO4DEjjKcBzyX1IerUUW6oYVMC8MjmzDa
	 FEkiSZxBlhtAGkUkBi78a6hCYfg08Rk/tIb0vNVcBDRXdcfwQIQFihw8L4QMz+BuNK
	 Pltb4jQvQyw6Ij9cUw6WZXHnko4ha3vaKwvPiv+I=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261021153112eucas1p2aa80cab8bf82ccfe7f9794c29fcbd5d0~glS0C9EMz2816728167eucas1p2s;
	Wed, 21 Oct 2026 15:31:12 +0000 (GMT)
Received: from AMDN5751 (unknown [106.120.87.45]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261021153111eusmtip231f2258ce8cf5012a03608e3eee22463~glSznDDE20890708907eusmtip2i;
	Wed, 21 Oct 2026 15:31:11 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Marek Szyprowski'" <m.szyprowski@samsung.com>
Cc: "'Liam Girdwood'" <lgirdwood@gmail.com>, "'Mark Brown'"
	<broonie@kernel.org>, "'Charles Keepax'" <ckeepax@opensource.cirrus.com>,
	"'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Simon Shields'"
	<simon@lineageos.org>, "'Artur Weber'" <aweber.kernel@gmail.com>,
	<patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
In-Reply-To: <20261021101750.3297770-5-m.szyprowski@samsung.com>
Subject: RE: [PATCH 4/4] ASoC: samsung: midas_wm1811: run FLL1 at the AIF1
 configured rate when idle
Date: Wed, 21 Oct 2026 17:31:11 +0200
Message-ID: <000401dd6171$33dec8a0$9b9c59e0$@samsung.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKrkeRVrtMc7xGFxDI3/ROeqrh4mgICYbRDAdrNTfe1TNPEAA==
Content-Language: pl
X-CMS-MailID: 20261021153112eucas1p2aa80cab8bf82ccfe7f9794c29fcbd5d0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101818eucas1p134e97fde95718540efe6e74639380fe9
X-EPHeader: CA
X-CMS-RootMailID: 20261021101818eucas1p134e97fde95718540efe6e74639380fe9
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
	<CGME20261021101818eucas1p134e97fde95718540efe6e74639380fe9@eucas1p1.samsung.com>
	<20261021101750.3297770-5-m.szyprowski@samsung.com>

> -----Original Message-----
> From: Marek Szyprowski <m.szyprowski@samsung.com>
[...]
> Subject: [PATCH 4/4] ASoC: samsung: midas_wm1811: run FLL1 at the AIF1
> configured rate when idle
> 
> When the codec is brought up without an active stream, for example
> because the mixer state restored by alsactl powers up a digital path,
> midas_start_fll1() sets FLL1 to the default 11.2896MHz rate. The
> codec's AIF1 however keeps the configuration of the last stream, or its
> reset default of 48kHz at 256fs before the first stream, which needs
> a 12.288MHz AIF1 clock. The digital paths then run with AIF1 clocked
> at a rate not matching its configuration.
> 
> Remember the FLL1 rate requested by the last hw_params() call, which
> matches the AIF1 configuration kept in the codec, and use it when no
> specific rate is requested. Change the default rate used before the
> first stream to 12.288MHz, matching the codec's default AIF1
> configuration.
> 
> Fixes: fd0ea9cd9698 ("ASoC: samsung: Add sound support for Midas
> boards")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

