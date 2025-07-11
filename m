Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0433993
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228999; cv=none; b=opJmWmyoPOTHzYKT80GLN6z0yfqoxB6WpZwRMGUEZQ15oN45FhZZCoweIDtHr36VQOR6LADGWa8UUZxU4sMXWFGXrQbmMDKJ3K1Ocmhc/dJt3Gh7eeAOVLXwnr3Giu0h2zDVzEUhoMUE23Ri6Kq6tVAsKNTB2BIuRKGkItrsqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228999; c=relaxed/simple;
	bh=ckGJ4o7eVb2/iZITOCQid05EPG5vUEOvRu3tlwj8fWs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gt7teuEQxq9NLO2f2HfvBloUuidfVmjOMA7jPdG7LmC3oLVyYm3xSWHdqOmgVwC9IzcvDyvY6D5yhOaU9I+U6iJZYvP9w64J1QtRPZEp4fuMNsyYMXbm1/KxHjalQmBXFUPTU+hOwoX23OBYXzkiABMedO+NaxU3jyaiGfbnJ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezmXQnBh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezmXQnBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED5BC4CEED;
	Fri, 11 Jul 2025 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752228997;
	bh=ckGJ4o7eVb2/iZITOCQid05EPG5vUEOvRu3tlwj8fWs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ezmXQnBhzPQmUX+L/u4m3g6cNYQqvISTWuiCYalErTauzSSBhbRCHSWBI136GrL5T
	 AMnB8S9lILfFrYmYdpo6gvbcCAkyxyuHfm0EAYhJMRuRZvBNlyGkQ44+DpSKGSemMR
	 q2AkS1t30S0ldE0WkjAyyMuZssdMSkCYXBUl9VNl2WonlVGQo3OYvXfvTeepXWKcM/
	 xD1YlrzyzR4fNFcBDO9eC1cDD+HQ7CXIxxVucqJkGNHo3k3FoKtXxLZSXj+f3BQoNp
	 jHt8NpwA0hmdV0n0qu9oQ9/wNPgapuiiBzdfFUuUVoEPIFVnI4l/yNN1xiB8nC4HQy
	 mmt+Zk9NLam7w==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id BC0C1F40066;
	Fri, 11 Jul 2025 06:16:35 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 06:16:35 -0400
X-ME-Sender: <xms:g-RwaCE6iMf9D_E3m_Y-zMPTo5vIvjUtJpl4SJQihCKxFhkO4K9iMQ>
    <xme:g-RwaDWCnNVCjIJgFsMamE-16a-Lg1eSTbebIUyk6PfT8-npiKvee0dYaSrtqJNDL
    ApJZDFtOMLsHbqDTm4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfedthecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:g-RwaD_XDyqL3FQlWUsr8jyBWwcqqqqx0h2OGHJooPCgQgocGIDohA>
    <xmx:g-RwaBQ8PP1WlJ3Bl9elCXtzJNUeH_yFDSCgFmSs9duWhcldD44dzg>
    <xmx:g-RwaHVz2yKeXjMND2aPQTrSUzG9lRkT-7Hff8G7t5VcDEy5mnABdA>
    <xmx:g-RwaLR_rVreLrHHZmcVFjpEVnZDema35qyQbI2EW8opBBYU41PxJA>
    <xmx:g-RwaP0YAH9KW8gvPGGBZnQknvAZT9edweRSAr7AIWHFn2JV4zYnHb07>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 91F83700068; Fri, 11 Jul 2025 06:16:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Taf94f1a6a81422b4
Date: Fri, 11 Jul 2025 12:16:09 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: lgirdwood@gmail.com, "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Message-Id: <fef73f09-c35b-4856-8408-ee286b0d57d2@app.fastmail.com>
In-Reply-To: <20250711100616.296329-2-ckeepax@opensource.cirrus.com>
References: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
 <20250711100616.296329-2-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ASoC: SDCA: Kconfig/Makefile fixups
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 11, 2025, at 12:06, Charles Keepax wrote:
> Tidy up a few bits of the SDCA Kconfig. Default both HID and IRQ to
> enabled, since typically if one wants SDCA all the functionality
> will be expected.
>
> Finally, update the IRQ support to match the changes made to the
> HID support.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
