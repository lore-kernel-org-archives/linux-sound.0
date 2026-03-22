Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBAB79CD;
	Sun, 22 Mar 2026 21:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774213691; cv=none; b=gK7zAf4wKc2iLhkeL5ZxxSNc1AM0leB6yRRszXqVtvYJEwsr5+1g1XGYldJJijEc3hCXRaIiwuTeInGsJYfntvPLjLhM4a4Bn5FGUS5OdhSj9q8IeSD4+wn5RpcsIkRzQA6F6HKiIipJalRTBJRS+jDihi31BEbC7Awuz+H1B1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774213691; c=relaxed/simple;
	bh=X71ZAaOLJah4j67dGynlijRFCUKGq/VdKSlm2okDdHg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZEFiNsQkenKAZIFQ2caaeZuYG+tfbWzoXgkt1S1X4IUp0r/Y989dlBaSckPvIS7T1GgF5v4hqKgBVbzg/VT5VY62QXR+OHuJ9ModV6fq2FGGF+2CKnEYa3aPaS+tWjgtcBcEsYWpbbYhydXFErn+F0fwiWiCFTj9OkD3bCa+TY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UYv2W4TY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ow+q4kdc; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UYv2W4TY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ow+q4kdc"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2A7A9140015A;
	Sun, 22 Mar 2026 17:08:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Sun, 22 Mar 2026 17:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774213688;
	 x=1774300088; bh=vO7Y6iSXnAy+gxWNCRtvgvRvOom6r+7W5Bv94/P7SWk=; b=
	UYv2W4TYGLS3gZYCYZS5bqjFCIJLBF4BC7s2a219HAX0wj5+NGDrEExHodpWk6HO
	yRc2d9qAa+wUxXW0WzK8F5rZwSLUoiUASaZwc8J8lmBOLRpK/IWZLRtUjNTkqd8/
	isktapryzjoncJkNAZcI7udY0BSX6ZEfYpBuaOv60FEhAerFcY8rqJZ5TX7uMfeT
	ja6Jl9c+QQjZg1ZSAaDgwSo5anvTh+Z241FR7f6y66WaLTW5XhRsrZttn3AkLUZD
	rUYo9BHcKq14H//4rOZKE8dwhxR8jYanAnudf9h9jrPaBv/q/IPOtsCSLfErPdQE
	kGEChZ9cPNRknz35AGRbpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774213688; x=
	1774300088; bh=vO7Y6iSXnAy+gxWNCRtvgvRvOom6r+7W5Bv94/P7SWk=; b=o
	w+q4kdcGGpY+AsYQUv1I5yge58n5oJ7eFQo3L8Gyz1xYiKiNnOwsAGSjuyVknSI6
	+oWdZ32mX31GTUaqGUOJvm9ZGolzBX6aJIr2bqSJDmpeQuxMfxIS5EXQ8LGqpKcu
	NLZUFTYqd1P6eiyo+XgrObmMBn08se4CmgHljxHIma5L6UOIAg03VlAtNJaweiT4
	0DIyJOIDBR7PxuLL0bA9VMpxWMw49ylciyvHJPk7sVec6ESMQgOulqCUFGFqjP7L
	4F9mePJ7n6jiS1qFn002UJFxIDSLZWiqUWqPYNwouCK/uklY7OQc/nnAd8GZroDC
	8KgG31Ka0PP+Yh1TR1O5Q==
X-ME-Sender: <xms:N1rAaWc614BX24hYc_NhLDnSfp8TChBgYJiHHvo0E-JLi-cztxMseQ>
    <xme:N1rAabA7nz77eAe7dS0BJ3d-7Y_0_UfTjz_nxRoZxVEF05VsbahkLKhihBfMa-8GV
    StU74HfAe8ciFqljoZFOQru7eVFuPpynVWQETpimUu-ED0ZuxLKkooP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudeikeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjuhhlihgrnhgsrhgrhhgrsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheptggviigrrhihrdhrohhjvgifshhkihesihhnthgvlhdrtghomhdprhgtphhtthho
    pegurghvihgurdhlihhnsehinhhtvghlrdgtohhmpdhrtghpthhtohepsghrohhonhhivg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhivghrrhgvqdhlohhuihhsrdgsohhs
    shgrrhhtsehlihhnuhigrdguvghvpdhrtghpthhtohepkhgrihdrvhgvhhhmrghnvghnse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhirghmrdhrrdhgihhrugif
    ohhougeslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehpvghtvghrrdhujh
    hfrghluhhsiheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrrghnjhgr
    nhhirdhsrhhiughhrghrrghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:N1rAaSW-wHE3h0zY4Ss_ctZT8vtNwWsWeHgWYqt8VN5gQ5Qh-J6DPw>
    <xmx:N1rAaabTyKYvErmdGhs5NIH0BYijy-mBNDg1inGxVXJgsy5HiNTWtg>
    <xmx:N1rAac1lGJ53oggGszNUlKRRNYXnsk7X5ecmTKQX47CuZdo07coSdw>
    <xmx:N1rAaWCLAG8296Ktzd3dSrPYqENHAwBkKGHfZxDjkKCZR69A-m7rBw>
    <xmx:OFrAaSdKViDKFCwhpc_TSxkJ3OPmtj4PMyOX4XKqgsXGBzRxu-OjljMp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F17A670006D; Sun, 22 Mar 2026 17:08:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Awp9NS_73_XR
Date: Sun, 22 Mar 2026 22:06:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Cezary Rojewski" <cezary.rojewski@intel.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Ranjani Sridharan" <ranjani.sridharan@linux.intel.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Jaroslav Kysela" <perex@perex.cz>, david.lin@intel.com,
 linux-kernel@vger.kernel.org
Message-Id: <b8aecc71-1fed-4f52-9f6c-263fbe56d493@app.fastmail.com>
In-Reply-To: <20260322194847.1126372-1-julianbraha@gmail.com>
References: <20260322194847.1126372-1-julianbraha@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: boards: fix unmet dependency on PINCTRL
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Mar 22, 2026, at 20:48, Julian Braha wrote:
> Currently, SND_SOC_INTEL_SOUNDWIRE_SOF_MACH selects PINCTRL_CS42L43
> without also selecting or depending on PINCTRL, despite PINCTRL_CS42L43
> depending on PINCTRL.
>
> See the following Kbuild warning:
>
> WARNING: unmet direct dependencies detected for PINCTRL_CS42L43
>   Depends on [n]: PINCTRL [=n] && MFD_CS42L43 [=m]
>   Selected by [m]:
>   - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=m] && SOUND [=y] && SND [=m] && 
> SND_SOC [=m] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_INTEL_COMMON 
> [=m] || !SND_SOC_SOF_INTEL_COMMON [=m]) && SND_SOC_SOF_INTEL_SOUNDWIRE 
> [=m] && I2C [=y] && SPI_MASTER [=y] && ACPI [=y] && (MFD_INTEL_LPSS 
> [=n] || COMPILE_TEST [=y]) && (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES 
> [=n] || COMPILE_TEST [=y]) && SOUNDWIRE [=m]
>
> This unmet dependency was detected by kconfirm, a static analysis
> tool for Kconfig.
>
> Fixes: c073f0757663 ("ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and 
> SPI_CS42L43")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

I don't see any compile-time dependency between sof_sdw and
the PINCTRL_CS42L43 driver and I wonder if it would be better
to instead revert that patch.

It is generally a bad idea for an individual device driver
to force-enable another subsystem or a driver from another
subsystem, as that increases the risk for dependency loops
and makes it harder to turn subsystems off entirely.

       Arnd
