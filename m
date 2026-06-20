Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABF13921CC;
	Sat, 20 Jun 2026 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781970497; cv=none; b=sOlTfFyIhgjhiMPqyiEuML6ZZfrkfD4qZtBP1WdmkP+2H0Vaz9qj7VrHsLW4ugRSW1UOvz2t3oV74oA7OvkBIbQF1rUSE5bp5ulsV1HJ7W+0Jwz3K3QngKJB6GYtmaluSX9KE1luxZiBDMci6gq1bE1DRSpEMDSQl7mtWzO1LAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781970497; c=relaxed/simple;
	bh=2hSbSGf1F9bkS+2NAVC70xhyg6JutdnzyHqeiId3jDU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Pe+8RZPB2QOJnkVH8mliBTIExqml1HBe46/I6UWkR4wmonk1rdgpYT4JRr5wd5H1/s8lPC4VpHO+ScBnYcxrqN4u5POYlCxqOYx9cYHwFaYCEh70/V6Xs7Lmi4Ch7KanNyWQ+RKo0za0NADn5VYJD53BlBFnVRGTZiM44BRcjnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=efWqbq8l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y9fPs0Er; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="efWqbq8l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y9fPs0Er"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1533E7A007C;
	Sat, 20 Jun 2026 11:48:14 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sat, 20 Jun 2026 11:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781970494;
	 x=1782056894; bh=2hSbSGf1F9bkS+2NAVC70xhyg6JutdnzyHqeiId3jDU=; b=
	efWqbq8l4xFh/SF1hv+KDanA8hbnhhr+Fux5k9dSMvIHeDeCkMMlBZnmMjYwvKBr
	p7BoB651sGmQK/Lh/MTZz5rEL3eM9VqscYZiQGQ7xHlKM5JAWZoIQGKiMBaTi1QD
	gy5GB9Bsa6U6AOijuhPQ9TH/DGHwSI8ydexrxN6lxXDNZgfDi7ZWFluCngUmggiR
	nR8HdQ+71Sq+BixPF8uzYdKLo0KlN2hXQXtvNSU+GFs8aAtPLw7Fbj8wVYBfBtZw
	wEBo/f/k+/btgnfkeM+RMRMDgoyZZkXw2lmd9eU4XusrGT6r5v5eilpYzA1ALCXz
	DqcbEbGaKwb8OqtaDfiu/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781970494; x=
	1782056894; bh=2hSbSGf1F9bkS+2NAVC70xhyg6JutdnzyHqeiId3jDU=; b=Y
	9fPs0ErE7rGMjE+au5rPa4GHg8pxd/SwaANaMq917eeANHZ+PrGDFJgf/KScU3J+
	++pRjywj0+hdNMBfrapvvSnjr0LQOAiN9WvqNDgC3piBqo/d88vLCCa4kHdmuEPn
	9+uN8l88u39ULITBgUeSAzBGgkRAFjxujW+fFhNEdscJGkNyX0GIhVNO9r5uPJXU
	xJFOvGVBKNNPbf0ZiR7WhG3Vlp+zAIXbkf70RQZKjnuPCqAsRLZKwV63xk2b4F4f
	n1i6z/UZ2Mbn5z+59OZKSjnWOXZef4aeruMbUWJ3aVQDsejvDBUilrTt8XFmH5xX
	g4b2E3ibfi9Ve5qVY4ztw==
X-ME-Sender: <xms:PbY2auls6dHnzq5IsVi4Z8Xr7dlgW9EbBhcr4QM6uY0AZZhF3vPF6A>
    <xme:PbY2agqJl2g7juWJyn2-XUdZKqyreLwc7BVBqACUzveDJBHqEnT44Ya25CzXNWYGf
    JZdintt2U7EoUGFjYqbHR-OkhTHowsrOr_kPSs4Tf8yZFjCtR1LPp4>
X-ME-Proxy-Cause: dmFkZTEhmcUzZnlVmbVvJCzh+Jwgx4rMwEUpF0qgrM+ZDKx8m5FZTcUVqEjkHZ1v2g7wW+
    N4HxLxylskQ5h2v6iA/OSXEvEvczYb9+zbFisVl6kckiFX7og8vZy0cBxQe2h7cMGCs3G8
    kycrB+arjuG7sTnvXITYaozsM3kHLfuDNpm3MEZTVVgSNY3JjTIMzdH1ds+k3KbiTHohn7
    h6QF/PMnKAdXQo+iPUfWBR0uNZfl4WqtzvMg2KZ4uBnY1ezPMc0WhDjx3gvxp1qbF/9Reg
    W6vxA5DM8vSu6Eq1oRbixJzo1L3V7haYEpFW8ol28Tzm/Bd7Ldym6+CJbw5DHm/S4o34cR
    KNMLD0YO/BiEUcIOQuM8ZUcZDsgb1sQXZ8cJ63skBr4SYMIjgLJVeIe4kUIs4RhcVSKV/t
    Y3RNAOKN4jpTf6R8AZvHoYu4ZN+JUVH+wn10Y82pWb7csvwhhwzhyy4GEDgUxxbQw23Xhq
    Jj/4lF185Ox2Hhx9BKkhCDskB+u2uo8fzH9CI3L+ufP+q4w2xriCDHNwZIQb3ObAv02+aJ
    Igy7aym6ROLdclYG6A6abQX4bLXPu4IqgHAk6pL2js15oJ/MLyTZcqCcfRJ7Q86ZCeifQ4
    hMBA9lHCgsDl8O/Gm8k+Bev4vHqasR2tad+GmijYXsTQDh6aCHeYyuHtx37g
X-ME-Proxy: <xmx:PbY2agFiq-i2IDMK0HHnA5esBgo90hu8RRAtsxY3L6gg3sxc8RcT7g>
    <xmx:PbY2alPv9B0ikhaogowdBu3u9l1-8s2DWhw-sUUTLkws9lnDLc900Q>
    <xmx:PbY2alpf5nNG_G08aGtfek2gwOonR6cZ7Ypg9X-zoct7621QAJoIbA>
    <xmx:PbY2amBfLJnnQ-M6LVaxZuv2A_-Jg70IoxUpGGIv3rUjyZ2-2b2WcA>
    <xmx:PrY2aual5EcxHVThinUJyUMuIiv2u8TWSOf3UbAwe01eA27mguzalpiV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4EF1C1820082; Sat, 20 Jun 2026 11:48:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aq2xFTrvFqoV
Date: Sat, 20 Jun 2026 17:47:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Mark Brown" <broonie@kernel.org>, "Vinod Koul" <vkoul@kernel.org>
Cc: lgirdwood@gmail.com,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>, oder_chiou@realtek.com,
 jack.yu@realtek.com, "Shuming Fan" <shumingf@realtek.com>,
 niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 sen@ti.com, zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Message-Id: <304aba0f-3c96-496d-b328-0785d62a9f94@app.fastmail.com>
In-Reply-To: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
References: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] Fix SoundWire randconfig issues
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Jun 20, 2026, at 13:02, Charles Keepax wrote:
> Moving all the waiting for soundwire devices to enumerate into the core
> code [1] has caused some randconfig issues. This is the second attempt
> to fix this after there were some short coming in [2].
>
> Sorry for sending during the merge window, but people are keen to see
> a solution posted.

Looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>
