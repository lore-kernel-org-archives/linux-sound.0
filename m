Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC96727D786
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229087; cv=none; b=gtxiv4cMrx19OHhUdECIY2WxTujnjG+8/fuXbMyM5Ig7OStLrFADs1dvDHsskyJUGixgn55AaxYn5XefQmkE3k8xIB8acN9Zk2JHG3W10wmSffH5Lv7uk5w/WiAJ8+/OLgMiexP5xSZDRl7OcshjYvLUgnpY0AAC1qQ5St5yQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229087; c=relaxed/simple;
	bh=dC7kjJa4LtKx28FmZ/7s17vGjS4R9wYpXPVz8VuCWUQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qQYSuDuv3V919R5wdW90uBHKxbW06OoCxsM5VuiEVV0z0eIt05qW8szANBZUQVFI35atA5T6H+aHUr+4Qd06s2X3klF3IHtiURnNvE4rKFLbduosP+d2+5I66ervJl+kLNJWABANlAReDVm82k11uxCAjfbjVEwJW2MOFLVyd7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUPCEv1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUPCEv1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D285AC4AF09;
	Fri, 11 Jul 2025 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752229087;
	bh=dC7kjJa4LtKx28FmZ/7s17vGjS4R9wYpXPVz8VuCWUQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=TUPCEv1NwI7nXRP2x8vrfslskoJur+GEFLQAipOw8RsMNGvgzNhX1pf3JhVF4XnFe
	 Hrp/cpaQNfnC2m8FGgje9WUdQzUK8MaIBkrNNS5Ncy0V1NVe0h72eSXCF5zlgPKED/
	 PhGCt8ivmEzgaqGsJtz6eHrTPMVICbti8/Q84NAQjafyJT6Knc3YD+NbTdJRKDUt/0
	 nDcvINdw3Zfu5Npqjq8n93J3g2OhtBoU9Nh2WFr2gYGEHOpOqjTwAE3ZuN4dMiG91S
	 I69PvwBetbl7WJjHIAIGXWA4E6tNqXscpTmJAGqxw9oDP7HNJPwKqWg8TiPEB8bMhj
	 6FN2DfrfZbFEg==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 00DCEF40066;
	Fri, 11 Jul 2025 06:18:06 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 06:18:05 -0400
X-ME-Sender: <xms:3eRwaC5lsTEhRphJSyBxqx2ky-2t3-npfmVyLTDJ62nmKJqfvoRl7A>
    <xme:3eRwaL6Ezfuty-5f0_kTrWJTCoZkyuhkQFPO97zsJkwdYNYSLfkibfjgKGrYQJ0ot
    opCNAvjz-ERDyNz2h4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfedthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
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
X-ME-Proxy: <xmx:3eRwaHwgCfAEW1aGFsk1FXTfWIGl345E2OleIxNmPpWx9iAHZpj2Wg>
    <xmx:3eRwaA05aarPAC29RSKrGT_NN6YmNnzp4PQWSVmZqZc3nCnenAuvew>
    <xmx:3eRwaHrf1m2XguWBKr6pB7o3OPcuYugFeA6eXdhpIh1LLYpL8Y6O_Q>
    <xmx:3eRwaNX7YhW6ECyIpo3Ph9kgPhd09RY4k9DUj3vnJ92JTZmSd7tPgA>
    <xmx:3eRwaAqZNxj_LLDdlnBs6AmtJVHLgYkGhpz6GL5iQbyiwk2JpUcBLv8l>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CEE99700065; Fri, 11 Jul 2025 06:18:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T6985f5a9ddbf9277
Date: Fri, 11 Jul 2025 12:17:35 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: lgirdwood@gmail.com, "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Message-Id: <b6128e4a-b572-4bf9-b0a1-4206b1d0b385@app.fastmail.com>
In-Reply-To: <20250711100616.296329-3-ckeepax@opensource.cirrus.com>
References: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
 <20250711100616.296329-3-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/2] ASoC: SDCA: Pull HID and IRQ into the primary SDCA module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 11, 2025, at 12:06, Charles Keepax wrote:
> If the HID or the IRQ are selected as options they will always require
> loading alongside the main SDCA module. Since it will never be possible
> to run without them the value of keeping them as separate modules is
> fairly limited. Pull them into the main SDCA module to simplify things
> still further.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
