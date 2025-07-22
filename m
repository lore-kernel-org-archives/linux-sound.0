Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818CA2F41
	for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753181415; cv=none; b=o3gZbb9OrtWNAXoumJuU+10pbrl5g1f8ATUxj31HZPbdzQCA0IgOifzu76Gy7puYKM0GzsxvMyKvrdaYMIEOCO9GUU4SCSwXX3HX/OQ+xF9B+euCkLvOk1CzUSHxm2ODmdGgIHb3D492YI6QYl9dL3x6Oo9E396DW95JWq8O1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753181415; c=relaxed/simple;
	bh=iQ5utbt9HaX7TX68UQRyNWEctJc22pqQjUsoTEDJP8U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HeMS25XxfZJHwTpTKgJsE51Xqsw+GG22MI1soeS87fZYiDp4J/qo7uvEFmbdPYa1HAvob1gyKeworPAIY3Pg6cVkwnxMKtlO5M9vl73Yhwg0BTkQrSm+oGm6OiJ7qb3Ql4s2qZ10Ts3oF+O0zgY/2xrpUEIAul/f86iT8Rfxxfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KB01UZci; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LQnMhBHy; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KB01UZci";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LQnMhBHy"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 603827A027F;
	Tue, 22 Jul 2025 06:50:11 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 22 Jul 2025 06:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753181411;
	 x=1753267811; bh=0DTb9KuMSWkTLT9gY8ZP8LsU1mJ1UwkSafpnMc82uYI=; b=
	KB01UZciJiPmdN1bYnt/H54zGWUYIGv+upW0M2uYG9gcVo6ZQ9zmIm1LSbUdHIzF
	FmMkxxNz/oSwz+F+0oHQGcrHGAPJkfUdtHGuNrWhS4MtLhtyuvW3AVjv0tlUOTfK
	cbx5AwGS4b/f7I613i7r1LTWmHnI0xYRkHG/Tsqd3/KmTX7jYY/4G4u1YtApTlBG
	rhU/xalgUQkdl5cwDS+dYZ/cEYhjyN63c4f+eiVN6IqGAw4DhxSxd724jZvlWxqn
	Wv1M+DckYm7yUrA3tnePcq69UE/M35pVnWJLFpkRms2u9LQvISc1J3MbMYgxbpJD
	axD5/TNeZM/XGA9xs72Uxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753181411; x=
	1753267811; bh=0DTb9KuMSWkTLT9gY8ZP8LsU1mJ1UwkSafpnMc82uYI=; b=L
	QnMhBHyedAplUd+B2jy1rdVG/3+gQI3yZMshCrDnyFE3aMBa3RMkCipv81F+lngU
	PTXehKCiOp8cErCt6YUGTnc9mmpoYY5IO9WdkOIrcX1LNaAD+p5lIBlgwaE2vZN4
	/WjdcTobP/Zzo5PMwGCXyiw2lyglncgALg7OLncb1jdshBqW5Jv7LLs6TIxQ8YXf
	dJjQ1Y3+04LYriDXqNPq69eDfEtyr5cvn/jCOM/fPVuuIlP/Nz33ODQCLmAqrNb5
	avsJU6N2Mzuj9cIGZbJH0ZJPTrjRqKlH4lexH9j7D6UuOlopee5OfidD8jSMdNXz
	YLpDr4bOAQhcsVwPaQRcA==
X-ME-Sender: <xms:4mx_aHYw8I13zItYBXwjPtTIInYRXv5T60UDLaRPVtW7D8RE4BiSIw>
    <xme:4mx_aGbCjINEWdzB5xZzyTsZo-ILY5npWBEQ4veaZd1Cx82nPdQ4fXanCt-sMrcRB
    76hK01WxEiEoZBY6aE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeejudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifohhoug
    esghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpihgvrhhrvgdqlhhouhhishdrsghoshhsrghrtheslhhinhhugi
    druggvvhdprhgtphhtthhopehpvghtvghrrdhujhhfrghluhhsiheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopeihuhhnghdqtghhuhgrnhdrlhhirghosehlihhnuh
    igrdhinhhtvghlrdgtohhmpdhrtghpthhtoheptghkvggvphgrgiesohhpvghnshhouhhr
    tggvrdgtihhrrhhushdrtghomhdprhgtphhtthhopehprghttghhvghssehophgvnhhsoh
    hurhgtvgdrtghirhhruhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhouhhnuges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4mx_aERPWZI3TwM5jnzq5PsmET4A7rcETE5XYKwn8NIhAvHhNl6eJA>
    <xmx:4mx_aDXU9GAVa1dkZfxAnPmrAgtwI83_m9bOHY4Oi28aYBcvVUiSQw>
    <xmx:4mx_aILfjU01SYB5w32kBMYZBY_ZGZYKJbas20aYFAzmBphKcG18hg>
    <xmx:4mx_aD0vtbcZvfBbnmmRivF0FE1FVHw_2q5UyQp09Jipc_RTlox1sA>
    <xmx:42x_aM_-NXKtUIWgKiiL_eSUeVmr9MPt1CrAHLPL9ve_7Oje5VjzvgXS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2F8B6700065; Tue, 22 Jul 2025 06:50:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T3c191088dcd86a94
Date: Tue, 22 Jul 2025 12:49:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: lgirdwood@gmail.com, "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Message-Id: <f0a0f849-e633-446c-8a7f-b63f10b9e76d@app.fastmail.com>
In-Reply-To: <20250722102305.2513755-1-ckeepax@opensource.cirrus.com>
References: <20250722102305.2513755-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Shrink detected_mode_handler() stack frame
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 22, 2025, at 12:23, Charles Keepax wrote:
> The stack frame for detected_mode_handler() is a bit large. Dynamically
> allocate the control value struct, which is most of the size, to avoid
> this.
>
> Fixes: b9ab3b618241 ("ASoC: SDCA: Add some initial IRQ handlers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/202507182222.OLgOy9fX-lkp@intel.com/
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
