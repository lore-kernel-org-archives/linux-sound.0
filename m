Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664241;
	b=0UV23Q//eSbpNTJb9jlBeQ9n04ID7ATPA/ZA4938e2Q0yJC/vJAeFlFnW1v8suMpUfbi
	 6GMMVJaV9KOQvWYKfHCeFzSMk9y1UBo8t9Cb24rAn5api6jQdVEQ0e3JYfh6jMGbxiH7O
	 ieJMxe4FjhvRZ21Xjju0mpbPjmTg6V8Ot4Vcvwl4el+wVua3BqA8RdSuJJzSD+SZQT1BS
	 dNiRHrI9H7U6GkE54X5mgf4wxEl7fo1g9MefGG/viiD10V4CpjkaPt4wT+NTmNgHcGC7J
	 XyafR0E0zoVYYx0cHOEpziY0wUa7ymJ+BvrUpU0SbvcSCOLjU+c8Jqa2COi5xiXI5Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664241;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=IYxFZpMjW37/5suOKDidxplLfsHXkNPKLuAvRd645nY=;
	b=T4nDkjhwyAkrx3jAsxbFMaUcOhCmZHy/pA0V1obmJMbgNPZLJ0m2wjo23ZCNuHYRzWBu
	 QyM5TwtalhfR4NOtuQBFnLTdvTD0WdiVb/ML6o2WcnayeIoKsrTGRRXKBkJONR6wr+HTa
	 +sy276tvU+NGFYgm5C5O8jV30Hhz33xTUMqLyvuu2sJl24oHCT+Cld6GC2oQ8qgjPpUJy
	 gOoLBULnFwGsJ/2d82rMiUEVbk0MUJk23R35eyxPk/s7RzoI9g+1yg/6LxMmUAh13g7tC
	 dSWKoGPSQ515KSuaIAQN0DTpbXLAP9jtoMpGUAesM/NYjdy39LQStUY44awz4he057A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AskNrt0f;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC77F606A329
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC77F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AskNrt0f
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261022101719euoutp0168d47d53d7774bef5a374feaab20e175~g0qCpKIFJ0804008040euoutp01I
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:17:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261022101719euoutp0168d47d53d7774bef5a374feaab20e175~g0qCpKIFJ0804008040euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792664239;
	bh=IYxFZpMjW37/5suOKDidxplLfsHXkNPKLuAvRd645nY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AskNrt0fWASWdDP1M7+BlehXfGDps/5ma58THxDHuveOzsK1xUx7oZrFiX/66s/8L
	 hZaMXcE1YHVdCnTD8h8geyaEGM/pV+MSJA4D/8hSIfoSkGbtbi6fWUEbP6mvDnYZij
	 O2ENRTAF/IjJHRXYChURk2d2lJIY3VC/sCClAnFw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022101718eucas1p2a7fd447c28862d0a5c92d24435fb650f~g0qCWCcbE1665816658eucas1p26;
	Thu, 22 Oct 2026 10:17:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261022101718eusmtip1ec9fbe61ffb327606dd996757d44a039~g0qBvsBCK2082120821eusmtip13;
	Thu, 22 Oct 2026 10:17:18 +0000 (GMT)
Message-ID: <dddc8674-0083-4246-ba64-128eded404f8@samsung.com>
Date: Thu, 22 Oct 2026 12:17:17 +0200
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 0/4] ASoC: wm8994/midas_wm1811: fix codec clocking
 issues
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Artur Weber
	<aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <atnfVHWwQlaiPeb_@sirena.co.uk>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261022101718eucas1p2a7fd447c28862d0a5c92d24435fb650f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c
X-EPHeader: CA
X-CMS-RootMailID: 20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c
References: <CGME20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c@eucas1p2.samsung.com>
	<20261022074743.625223-1-m.szyprowski@samsung.com>
	<atnfVHWwQlaiPeb_@sirena.co.uk>

On 22.10.2026 12:03, Mark Brown wrote:
> On Thu, Oct 22, 2026 at 09:47:38AM +0200, Marek Szyprowski wrote:
>
>> v2:
>> - patch 1: move the MCLK enable to the newly selected MCLK when the AIF
>>   clock source is changed by configure_aif_clock()
>> - added collected Reviewed-by tags
> v1 was already in my CI queue with other things stacked on top of it,
> could you please send an incremental change with the differences from
> v2?

Sure:

https://lore.kernel.org/all/20261022101531.775891-1-m.szyprowski@samsung.com/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

