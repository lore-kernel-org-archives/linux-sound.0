Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB08F7D
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 05:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752213537; cv=none; b=sF0DBCiqMTrjnkP4YY0fFqygpCGfdcs6ogaAmXfb7TWBcYdW4YlCdl7V3Phj52SGB9p76FDnEDsyDlKKXiG5PQEtA+vAB/QI9uz/qguirX+zSRwpGE2TIPOeLyIRC8tNurP7Z+3w25WTpHT60ODD7oJUyMMoTMbGKk1wZQ9udJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752213537; c=relaxed/simple;
	bh=4C70yF9NF1WXjT8ErvVC6pQQxcdewOcEBuZM1zJOkm0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AgbesZ/73x2u9plFQDSpYX2JlqL4O34Mhg0hZgM+mCWqOq7LIRSEReuWHpMvJkB1rOAyVtT/5RSqrVkLiXslwkgqEN614qxUsWti05mF/QluuUFUWvW/CRopV/UDUUWJfEksPUu0Qv0FFYHyGwLS/IQ5s7ExV+nbU1xirhL4jIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4lgGwrh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4lgGwrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A25C4CEED
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 05:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752213537;
	bh=4C70yF9NF1WXjT8ErvVC6pQQxcdewOcEBuZM1zJOkm0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=T4lgGwrhgFCfQwyfN/fqTb0nddKmunyPSnppWCwCkQcyRKqLi37XlEtEtA6Q6Y3In
	 GhNOKEGsTVmaXiaj2lWG0HQcBosvA5qcgJ+bnIFw9GhhCfN1IlSqK8c+QKrOk6P2DV
	 CnZMwGA8S8yclBVOnF+LNaVdTX4lMznLrQ+Rzc3DxVuK2QXPbQkWaOYJVKajrImqOW
	 lpkllfREl8H35+x3WYkWiknM7QJWs4wrcuPpbY0HfKHfQTXPDT2cUPi9ZAIlfnJORd
	 l2yP25FwSvkiKTw7H2oNlYnjcxQn0brYdwMAF3+AVzgKLrsfHTo4gzv79XAuGCiHZ6
	 gl9BQGU4fyBkg==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2EE64F40066;
	Fri, 11 Jul 2025 01:58:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 01:58:56 -0400
X-ME-Sender: <xms:IKhwaDnNzP7SKqriV7X-Q52nRrG1KCWapd8uU8QFLSbsjMHTx43plQ>
    <xme:IKhwaG2zFmSqYyz7H3i5nuK6mgwBXRy4d-taFU_LCCoAOOCaqL6bRnznJz3Vo4HdZ
    rLF3azCfqXEvbzJGh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdehfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:IKhwaNdA8wajwzjVsWiP2T6U3oKI4jDQGuZ_ZU9oR63G1HA_XBVgYQ>
    <xmx:IKhwaMzBDoO_86lvZmjfgL_kWaS5GoYlXtqnVeRHTt1D4W2-WVY0cA>
    <xmx:IKhwaM2yQRfqHwCp0QvNeX3vMKkj3mxECQ3Y7u1EvTp1kQZliigA0g>
    <xmx:IKhwaCyIP_xlUfVQDZYust7qWIfzNXynj4DtEz1o0ihmZJ1q7i0Z_g>
    <xmx:IKhwaBWEaVwdO8sFO1cXTzEF4Vb_NgdGU_luvnz2OYYg8FTl4CsHctzT>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F2AAD700065; Fri, 11 Jul 2025 01:58:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T8ab29551fc8590cf
Date: Fri, 11 Jul 2025 07:58:14 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: lgirdwood@gmail.com, "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Message-Id: <a52b2d56-d9eb-4adb-84aa-8bafc81d8c35@app.fastmail.com>
In-Reply-To: <20250710163424.1158958-2-ckeepax@opensource.cirrus.com>
References: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
 <20250710163424.1158958-2-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: SDCA: Kconfig/Makefile fixups
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 10, 2025, at 18:34, Charles Keepax wrote:
> Tidy up a few bits of the SDCA Kconfig. Make the primary SDCA
> symbol visible again, whilst this is selected directly in current
> Intel systems it is not a given that is how other systems will use
> the subsystem and a user can not directly disable the symbol if it
> is being selected anyway.

I'm not sure that making this one visible is a good idea even
if I don't see any immediate bug as a result.
In general, I think symbols should be either user-visible or
get selected by other drivers, mixing the two tends to cause
additional problems.

Would it be possible to just not select SND_SOC_SDCA from
drivers that can use it and require users to enable it
manually, or does that not work? I assume there would be
a link failure with SND_SOC_ACPI_INTEL_SDCA_QUIRKS=y
and SND_SOC_SDCA=m?

     Arnd
