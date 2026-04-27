Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA09349B16;
	Mon, 27 Apr 2026 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305504; cv=none; b=gbOZEqtoEjdVnM3iicCe9I7ml8jcGnKY6JU/oMul+FM3TCGj/jpS0NkHXSILdgu2q3GCspFwxSnHxdb1ED9VduiF/WC1lXY7TFsflJCqNIO0csZ1og2MjB5Yku2G/nxo2IK0GXA1LOJa5IcZc1L8nb6QmeiGpPJSHgkeYK1e3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305504; c=relaxed/simple;
	bh=SY4VLwvbJspJ+TcfU35Mdd0x1khIkUNDp+/D+15Wf/c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oqraguCsuMNfchyQYGaD8fX/ZeyLFA/St85aFCVURsz+0p6TX2D/NogRK+2TvND5+hPUbHYZF7H3tHG5uWzkq+HEVDFRWt693+wbGK9JKuyMVEkI/1I26WwS0IVSph4blsPLxAf63zEe882zmzLXQc41s4NDdOFc6gQG/YupZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=mBwa/kJO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VKem/1e2; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="mBwa/kJO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VKem/1e2"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id CCD2CEC0534;
	Mon, 27 Apr 2026 11:58:21 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 11:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777305501;
	 x=1777391901; bh=T2aR+6afRE4IBhXsS2IHJGgZpLXecUczxjpGvTGuhgQ=; b=
	mBwa/kJOWeUBPQWoSrkX9Ev17TCZ7fKhDlQwI839YRsbPVGT3jQbP4wDfV5Gz6sj
	5WJwT3fSSlh2h7LztSuMmgBb8xXb9P7oGSi7Q0Z9beGQWJrehaYfXldWVxgQNk9Z
	PpI41LUVp6S19h7biOmm5J2R80wj3pt4tjxxjnQqd0Y2veqnt6My7xbLjIeJzqgr
	tu+OOTI7rY9TZr9oES29aL9nmyC+Rk8j4IpCNJ7G/Q23s1OkHJ0yODjdXZRLKQ3e
	Eetf2R2Lfd251ts8qFDXin67kW75kPXtfZHPH0Bcta+kkZneDxOgFNWccWQu/wCA
	TKwrPskZnnecHVONeQ/UAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777305501; x=
	1777391901; bh=T2aR+6afRE4IBhXsS2IHJGgZpLXecUczxjpGvTGuhgQ=; b=V
	Kem/1e2Sa1OMtjJ4I6B7qbozsu3HYimp9VtPqiSYhxz9wxKLQeEihXBGDI6mCE++
	F2xH3EvhLxxp5cKipMKwmia7pW6Zp1W0s4jnMB8eG3jfuz0ZmgeQMq20dLJaLRyM
	5hImai8wVMZHsulNsIggoUmqAn1I6KM++W35Qcemu1vnftfoUEXrDWZw57tcMKe+
	pUAhGXuvA1wG9PaNNXLAYWgdJxUr9gZ1BcAiSTUmd/A1zEC30Qxw7GOgh4ZKFavt
	4i1bjf4fVch0y9jaqLsUyxXSEIQyKrnpm/TC3TJNp8lOmnAWaTvJgn2EmJV8cGSQ
	6TzQTfMZ6FycL/wOicSSA==
X-ME-Sender: <xms:nIfvaRg2kykgBeIHoGMuggizf8Wqr5FNbagnIxNEb39ysa125HgLRw>
    <xme:nIfvaQ1s9n-NOCrUbSXIdXFxUSyTGEVRQ5g53x6x3lH7V5L6TNMJJMm4HTvcs0XEo
    ETc1hj_hvzCgQ2ctLofRBreMPvWkJzMc9i5d6uGvK41PKKvjydmImw7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejleduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprhhosggvrhhtrdhjrghriihmihhksehfrhgvvgdrfhhrpdhrtghpth
    htohephhgrohhjihgrnhdriihhuhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    lhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopehrughunhhlrghpse
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgv
    nhhkohesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:nIfvaVvNweGU5fYm207SbiSVpRUd56-f_XkKR-e2NdIO_ZcgtX4Ddw>
    <xmx:nIfvaabwLMFxcmzKjYcqGZIikHTCMO51C1SDeK5CJFlfnX8J25tqlw>
    <xmx:nIfvae42QTDnMnEASh2O-n08HJdko6RgBKlg3j03VcebfAYrzAY15g>
    <xmx:nIfvaSkQLE0NLZiCiJCYf0cSSsXe5lnDLC4hssyUHahtrZ9pBGrZUw>
    <xmx:nYfvaTYBwfkNhBnepG4KwWpOzXeLn_WbHGzDfOTo1eMMPudRcKz_TQm->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8BB2E70006B; Mon, 27 Apr 2026 11:58:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: An7FB6z9gEL7
Date: Mon, 27 Apr 2026 17:58:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Peng Fan" <peng.fan@nxp.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 "Kees Cook" <kees@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Message-Id: <2e77971c-ce4d-4489-9e8a-7766c6576a39@app.fastmail.com>
In-Reply-To: <ae-GOQjD4Kq0ve8D@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-3-arnd@kernel.org>
 <ae-GOQjD4Kq0ve8D@ashevche-desk.local>
Subject: Re: [PATCH 3/3] ASoC: pxa: integrate sound/arm/pxa2xx into sound/soc/pxa2xx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 27, 2026, at 17:52, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 04:46:31PM +0200, Arnd Bergmann wrote:
>
>> The pxa2xx sound library modules are only used by the ASoC driver since
>> commit b094de7810f3 ("ASoC: codec: Remove pxa2xx-ac97.c"), so move the
>> code into the one module that uses as a simpliciation.
>
> Is this part of the series that touches UDC? Btw, the UDC one despite on being
> mentioned as v2 in the changelog still have no versioning in the Subject.

Both patches came out of my work to hide the last users of GPIO numbers
behind CONFIG_GPIO_LEGACY that I first posted last year. A lot of my
patches got merged (or replaced with other work) in the meantime,
so there are only a few drivers and platforms left that won't use
GPIO descriptors any time soon.

> What a lovely change! I would like to give a tag, but see a comment below.

>> +
>> +extern int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
>> +			      struct snd_soc_pcm_runtime *rtd);
>
> Can we kill 'extern' while at it?

I can change that, though I usually try to minimize changes to
code that I just move around.

    Arnd
