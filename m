Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513413D531
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 05:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752212720; cv=none; b=iMvkS2HNNhZU0GYUDh/QueyiPOXDwW5nDq9xg8qz5k08wDJCXtkzdVRJ/VW5zLBXrV6wlLwSnS5uD3P8Rdxi7eDR68h2F5vhsVVnXT9uA366HDy9ljOrqqkogFLmGpAXA4NOvlxGF1iMmIfDMVf4Ux5jWKeyLFuYJ5dNGpSzjK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752212720; c=relaxed/simple;
	bh=UjzBtjv/v9wfcZ7smwRbIX30XrhpQay1tiOLIjU1g18=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JggmAb7h0Xl8GdNy0S2fxH2Kbn713OW6ZuMreGRqED275zBlMIsjnU8FZgHNDq3f6fLTCMSvDDPYxlbhlURcHUoSZUFLJC0VZrWwVRCMEBycwtIsK7fGykXcxzqHWWvUFHyEI8HZ/zLXxix1IiYlTOs2oiF2ZZFrmow69xCq12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZ4aoWX8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZ4aoWX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583C4C4CEED;
	Fri, 11 Jul 2025 05:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752212719;
	bh=UjzBtjv/v9wfcZ7smwRbIX30XrhpQay1tiOLIjU1g18=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YZ4aoWX85fqfFH8v7YsNnf/uA2F+DHAs29DmwNuTrEy2iQntAFwMkGFJMUZkr08zl
	 E/UPpkbIKLBTcDrL2UFQJQthLR8jbwaRCkplck5vNaZOlstoNLYXqn1brlADr6OemV
	 YMV046E9wj2/+cCt8K9wh0d7hXV0fruWgpnizqWrJwCTTFbKZNiSTvCXhoQYOkZaA5
	 Ms2dNFPZhlSYMxxAp6yPWUANPrIcHv2Q96vrqbTeIm+/DWNUXPjqz22XSXMXL6Q1G3
	 9ulg/3M7gHkdVD+sLbQfPNwaAh+HE6Fb9qu3DkDtk7WEQZlsH0IUPupT7NotfRzeyS
	 UULnTK1g9CCTg==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 56CB0F40066;
	Fri, 11 Jul 2025 01:45:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 01:45:18 -0400
X-ME-Sender: <xms:7qRwaNli2rx1Ye5ppU707Bw92EWrhJHiClaLIEEroHCDkUVbiAky-A>
    <xme:7qRwaI0ozTMYJL2e_mLJFHC5OIBpIWbqbTLDjijs9WBV9Zfi-oVCH1Ptyj565Yht_
    pNPGE185tNqbsTPbYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhi
    rhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepphhivghrrhgvqdhlohhuihhsrdgsohhsshgrrhht
    sehlihhnuhigrdguvghvpdhrtghpthhtohepphgvthgvrhdruhhjfhgrlhhushhisehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephihunhhgqdgthhhurghnrdhlihgr
    oheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegtkhgvvghprgigsehoph
    gvnhhsohhurhgtvgdrtghirhhruhhsrdgtohhmpdhrtghpthhtohepphgrthgthhgvshes
    ohhpvghnshhouhhrtggvrdgtihhrrhhushdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7qRwaHdcvc8o-pB43viuUdplGgnnoIt4j0dyHqbGweGpgH4muDlZTA>
    <xmx:7qRwaOxEbs0rDpPVlM-LmLTw5CPnCH0lwFQGeGxSmq4Elb00TOtcEQ>
    <xmx:7qRwaG1HOzP-RUoCK8FUcvw7SUqLCK-bOb6GpU8wih7cfwsV0iAnWg>
    <xmx:7qRwaEyQi-SzaT7otFFId7vk6OntO8x61NRd_ZGfDuxIB_A3JAJsQw>
    <xmx:7qRwaLW5ldGfs_SHU8ZxwoyjHQbyKbbzdDXDu59Dlg9HYGztaKLXCHJH>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 317F9700065; Fri, 11 Jul 2025 01:45:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td1059e209304f498
Date: Fri, 11 Jul 2025 07:44:56 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: lgirdwood@gmail.com, "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Message-Id: <ca33a116-fb1d-45bb-b73a-cab4a994c61d@app.fastmail.com>
In-Reply-To: <20250710163424.1158958-3-ckeepax@opensource.cirrus.com>
References: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
 <20250710163424.1158958-3-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 2/2] ASoC: SDCA: Pull HID and IRQ into the primary SDCA module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 10, 2025, at 18:34, Charles Keepax wrote:
> -obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
>  ifdef CONFIG_SND_SOC_SDCA_HID
> -obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-hid.o
> +snd-soc-sdca-y += sdca_hid.o
>  endif
>  ifdef CONFIG_SND_SOC_SDCA_IRQ
> -obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-irq.o
> +snd-soc-sdca-y += sdca_interrupts.o
>  endif

Since these are now both 'bool' options, you could write
this more concisely as

snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o

     Arnd
