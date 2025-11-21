Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D739F287508
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763763104; cv=none; b=m62dPwNi3HBg2njuSK10HO5KSCT7cBHiLO61DT1n3+Tb+aeUSDdD1eVh896xo0GwjWQNUIHEs7RKkDYDzvhqHgwnABg1xQRMasm4KHOvEmtHT0QIYqHVVUPNBqiqmMNzgvbP80SzPtX3wc+c6xwK4pLVr/ZdbKy4/U1vGe6XTjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763763104; c=relaxed/simple;
	bh=1+QcWKtLjJrr4BnTXig2sCmnsMsdJ79kuYQ6fdt3ILU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M/Or1zsMP6JG8nRYWcXUzcX2uvH9dfKbKdNsRHhotz3e1r3yiLE0rDEntxcZ1xJ7Rp34HfwAh0eRLH/52fN1rK2gWphA0CCbUNYjO2HJ1fbB9kmyEfm/Er69P3bsG0Cc6+6fFrayQvH7PrEug9JKMe8dOnUdch6ugBTxb0l25tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCGs6EC9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCGs6EC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FC0C116C6;
	Fri, 21 Nov 2025 22:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763763104;
	bh=1+QcWKtLjJrr4BnTXig2sCmnsMsdJ79kuYQ6fdt3ILU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SCGs6EC9Ho7IadBne4bI/kTmTBtFa7iZcSGLtJ6oythzEq6y7RxYHUblsBUAtJwO6
	 UTV4VzUkf+6MUIngwuwV+OgpTfIKNlybcxEdReNLQF6o4hIX8HUGl8jSO+PnES0Qnw
	 dKn/uOimSJpZZ5Sm9KOI1ueU+TAikGBq/6XqIDEnue4X/Dc2nnDkavCSZwd2ZxEZOn
	 qQ21ldG7G3zd6uMDfVD6RQN97baVzusv1aqfo1ok/4jhKic60v3WCB3m2ZlSyovAO/
	 RHT9hDQg+wvbmzGhTnIl452RPdgDDxEibjcetd1GRc66tvANvJPLHsUGaik/1ypO8r
	 8AroQv2zQHT0Q==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 00/13] Add SDCA class driver
Message-Id: <176376310277.101329.17795063595578979022.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 22:11:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 20 Nov 2025 15:30:09 +0000, Charles Keepax wrote:
> This series adds an initial SDCA class driver, this consists of a
> primary driver attached to the SoundWire device, and auxiliary drivers
> representing each of the functions of the SDCA device. These drivers all
> use the APIs added over the past series's to provide the class
> functionality, as such these final drivers themselves are quite thin.
> 
> Also a few fix ups at the start of the series that have gathered up
> whilst the last SDCA series was in review.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: SDCA: Remove duplicated module macros
        commit: 549f618516a17f7d492cf64048713f77e057cd37
[02/13] ASoC: SDCA: Fix missing dash in HIDE DisCo property
        commit: 3508311f2e1c872b645f13c6fd52840418089d41
[03/13] ASoC: SDCA: Add missing forward declaration in header
        commit: 5fe65824b74c0414f105f0535437108cd6c31cc7
[04/13] ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
        commit: cc58055bfefa065b68a8ab92a0196c9b24f46f02
[05/13] ASoC: SDCA: Add comment for function reset polling
        commit: 336beae295bf6973e5c8c222dfec6b8faf3c55f6
[06/13] ASoC: SDCA: Move most of the messages from info to debug
        commit: edb82534ee655091e198edf95e223115dc27c284
[07/13] ASoC: SDCA: Use helper macros for control identification
        commit: fb62da31fad29fe3c9844ba217b9bc99820d4622
[08/13] ASoC: SDCA: Factor out helper to process Control defaults
        commit: 222cbe172e5f7de130cc9c3c85f8f33d51c131bc
[09/13] ASoC: SDCA: Populate regmap cache for readable Controls
        commit: 193c65ec8ed4d946b3f80b7d08e4320ded7ac4fa
[10/13] ASoC: SDCA: Add helper to write initialization writes
        commit: 5acf17b6df5e759bfb8bc0a75fadcbb3e363a17b
[11/13] ASoC: SDCA: add function devices
        commit: 4496d1c65bad7a3a32d2e09aaf3c54bc562c3fcc
[12/13] ASoC: SDCA: Add basic SDCA class driver
        commit: 2d877d0659cb69cc0677ee2805e9521966d70ac5
[13/13] ASoC: SDCA: Add basic SDCA function driver
        commit: 3af1815a2f9caebfc666af3912e24d030a5368d5

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

