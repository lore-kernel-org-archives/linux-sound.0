Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC877187545
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082474; cv=none; b=L0vMu88OSyB9te61tvzKxi6wj2v7nd+5dnvE9qUMD5y/KrM0NPoS3VOctEQykxSkqh2EMm8iUKvLMFWdkNimRZN62CSLLP0h2trAuNSz28phhu9rk3256OrWBWKlh7wl+/Xnr2P3JBmyJisLcqrJ98kDrnIRwVVw4TUaRlU88l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082474; c=relaxed/simple;
	bh=VJuyLSPubmGWrrhVZNSJZfuHDaz7Os6exp3D2yPpQU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mGPP/na1T7x8v/KRM+mFwyuU/0zGu80SJ79UZbeEE3ioGL110uwVNJI7V3ZVdQjWeWyVfTZ2jq/8utSyJiGuWMEYlZxOBKMfGPOb525N85UBsJchpHPFtduUjQTn9SCz18e3aeYOhX8/65j3z+ZxVjoMu923Gch2xwcUvqAyVaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oz7i0UYi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oz7i0UYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CE5C2BBFC;
	Thu, 30 May 2024 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717082474;
	bh=VJuyLSPubmGWrrhVZNSJZfuHDaz7Os6exp3D2yPpQU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Oz7i0UYiQ1Xu1MqV1JR3ShuLMThNGZxltipEiQlTskas+IImTGueqf3Gc9ERaEogv
	 MAHeTmxwJ+nrnQoBY2LCNxUldi55SyZJrCEI/OOwIaZnVC7lo5xE/AyXlv3jOfy/PS
	 lBWI88FEqZhbvz8gddNfWjC5DCScYGtiRw7kxvyiGmDVyX8n53nSz1FdrC4N0z+/4v
	 45qK0MEqLolnxX1AMKI0IqdIF0aqtPfij73h/o4Q0SCMLPD2HiwmDU4kjW2wjk294W
	 +8OcE9Iq9r561GWGKupBtIgKZ8pajXPQD+8rU42cWo9GXo25wVgDKS9oGxeTw28D3U
	 wgPLpUAyRFCpA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 seppo.ingalsuo@linux.intel.com
In-Reply-To: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
References: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add support for NHLT with
 16-bit only DMIC blob
Message-Id: <171708247218.919445.15030669873033438727.b4-ty@kernel.org>
Date: Thu, 30 May 2024 16:21:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2ee9f

On Thu, 16 May 2024 10:56:11 +0300, Peter Ujfalusi wrote:
> The ACPI NHLT table always had 32-bit DMIC blob even if 16-bit was also
> present and taken as a 'rule' which obviously got broken and there is at
> least one device on the market which ships with only 16-bit DMIC
> configuration blob.
> This corner case has never been supported and it is going to need topology
> updates for DMIC copier to support multiple formats.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Add support for NHLT with 16-bit only DMIC blob
      commit: 49cb894d567980235b6e64d5e69950ff77debd8c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

