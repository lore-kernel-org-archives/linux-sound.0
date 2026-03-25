Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990A522652D;
	Wed, 25 Mar 2026 08:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426319; cv=none; b=ThzUGCCNleLvrQ1FSdAxwXn7X/QovSMFEW16eaEWJCgJyLUSVLB/FjRlVKEpI7ZmirCZYBtDdZ8GKm67tJXohAFAJj0LL0iHQnC8tuh6uRnzQwpCEv4AcaREfP1yS+IKqlighvI6y1L4qSkLE3LUR0nZVe9hRTyFybpleghHxcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426319; c=relaxed/simple;
	bh=HghfEfsdTRBgNLvcULXfB8a6gZZQUecoA2SDWd2lVt8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AlQezXyJAzwMSrbyMqWOszGKsHb1BZZmhGuxIHPyqKV891zc+J7twSRk2i18D+cMncY7/0rogPQq+e3+SjyCyChCuMAwGgON2sEWXRYAnd9xhkHl0l9mcDarEpbX2DwbUN65GFprJz5vpD4xjGCGFBXGrNT0RAPTY0XovYfF2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=EUm7f6UI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZxA7dg39; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="EUm7f6UI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZxA7dg39"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D29D81400217;
	Wed, 25 Mar 2026 04:11:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 25 Mar 2026 04:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774426316;
	 x=1774512716; bh=NGYVs7u5MinSU02M0lbObm0GOc9vyMNHe3UPTGRT4Tw=; b=
	EUm7f6UIBW/PdDuRVKhz3S1lUG9sP04/eCDUlW8nRQIXCh2dFhrb8/gRPJ0bV6G+
	uUXyMCOM7CtFDfRWiVHeVxwlUHS3pgciIewSQikBKBvWpDyvlZJqt8dp7O7OKpn6
	h6LO4by4BWUgmpa4iFy1U01NzvFzxNVaDI7WRC9Vn2xDRkhUMN+EDLVDZridighw
	dymsWPeOVBJ+WJs1LN+GagBwS6AC9aP7bfdjir3gRHnbZiV8UrO5GkK9jbEtWEQK
	Hf6qsNAQHGBi67AUpwuDBRw7LZ3nJMtCKiSyt6xCyQtKOWtFyeWC22DicJBf1/+H
	Wfj9mjRBGNnQ/rtgBsTEHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774426316; x=
	1774512716; bh=NGYVs7u5MinSU02M0lbObm0GOc9vyMNHe3UPTGRT4Tw=; b=Z
	xA7dg39nWEvsZ9cuPRxqaXLWOMrMMc5eYPl2VQasd6D5DJ/E4GhFVB915vKJhkMP
	6cIKbP2wh9aXN0QHoccAxx4NFdPqSTb3ictzHr6I2wn8qnP/tuHIko23+bwZ726p
	grUG541V0uUjguV60044EOD4cwOM9mK8PVfr7oUZLtvp3FNQR+RrBSwQP4y5d+0M
	JkL6q7B6lF7T766Xt/fgc4f1oHhYPHHswyo+cAOKI3ImJaQIoT1UXqkELC0iAESA
	E08+MbkejoHigy9E8GwNRV6OR7ogvdr/PXva5ND5vyXclqUPlVgNVKCmUqlBqSmQ
	Xffjd6EYIr71TgU1ymZRw==
X-ME-Sender: <xms:zJjDabfCWql_PS6WO2kl7wYi7wY4TNpSR6hgvsry5NdFUQPB9SBPVA>
    <xme:zJjDacAl2LTpR2KJAR4-D3Do1JPEXOqPg2Qdk1sa7foWMTubuBVsrJlurnOT5qGoc
    AqgA6bAdB5SXj_3IqJhyoeBYcepOksjT6XVjQoPxGkcvtlCMhzyNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdefleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhulhhirghnsg
    hrrghhrgesghhmrghilhdrtghomhdprhgtphhtthhopegtvgiirghrhidrrhhojhgvfihs
    khhisehinhhtvghlrdgtohhmpdhrtghpthhtohepuggrvhhiugdrlhhinhesihhnthgvlh
    drtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehpihgvrhhrvgdqlhhouhhishdrsghoshhsrghrtheslhhinhhugidruggvvhdprh
    gtphhtthhopehkrghirdhvvghhmhgrnhgvnheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehlihgrmhdrrhdrghhirhgufihoohgusehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepphgvthgvrhdruhhjfhgrlhhushhisehlihhnuhigrdhinhht
    vghlrdgtohhmpdhrtghpthhtoheprhgrnhhjrghnihdrshhrihguhhgrrhgrnheslhhinh
    hugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:zJjDaSPYtPQAgR2GOXKPOMSNYLNJnQUvdfWft_tmhDvXDqeYkthcrQ>
    <xmx:zJjDabWNqMy5foP2wAnZHPv_PhyN9eN7vFFFBvBAgq8YL_mjmfJ_Kw>
    <xmx:zJjDafaTt9gCA3wRfuOkDy488sH5QkKmCfPWpdqS42TZiuqdiQT8YQ>
    <xmx:zJjDad0nSAt1iUeiyxOuQUcU6G64bp-uxgLfcOggvkWKVOqDCALydQ>
    <xmx:zJjDaX3VGx6yC3hGMpHzFy9tbK8VpPLvvCDMJTZvTbN3FxcBmd2RQclt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 50A9A700065; Wed, 25 Mar 2026 04:11:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhJ5_Lz0o3rZ
Date: Wed, 25 Mar 2026 09:11:36 +0100
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
Message-Id: <60bab035-6af7-41ac-8584-ba01a4a80df2@app.fastmail.com>
In-Reply-To: <20260325001522.1727678-1-julianbraha@gmail.com>
References: <20260325001522.1727678-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: boards: fix unmet dependency on PINCTRL
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Mar 25, 2026, at 01:15, Julian Braha wrote:
> This reverts commit c073f0757663 ("ASoC: Intel: sof_sdw: select 
> PINCTRL_CS42L43 and SPI_CS42L43")
>
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
> In response to v1 of this patch [1], Arnd pointed out that there is
> no compile-time dependency sof_sdw and the PINCTRL_CS42L43 driver.
> After testing, I can confirm that the kernel compiled with
> SND_SOC_INTEL_SOUNDWIRE_SOF_MACH enabled and PINCTRL_CS42L43 disabled.
>
> This unmet dependency was detected by kconfirm, a static analysis
> tool for Kconfig.
>
> Link: 
> https://lore.kernel.org/all/b8aecc71-1fed-4f52-9f6c-263fbe56d493@app.fastmail.com/ 
> [1]
> Fixes: c073f0757663 ("ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and 
> SPI_CS42L43")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
