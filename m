Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556C188A3A
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752691308; cv=none; b=Q+M6Ega2zTuAfBgOwv7l1/rXZamaN2VZvrxZtbGXARjnAgAO8myCDgqVfaIFd6yZMCUWgB1E5cuX+L+UbIl607iHDAB6wwFWYoZb4bRVz5U+PyZx5ogqBVfvrKT2NwBlb/NoohZKx25PtJek5Hav6YoiQjoa0h6pPcVaom0QwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752691308; c=relaxed/simple;
	bh=2Cn8pIY2cKAyxX0J1u/Hhi+spKBhaflQo/8v1RNLnqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JFFQqX4o97cN3hy/f+tcyQxHiTUBNEY3aVs4kZ9IXhvzFhwievcodqYI775A+z3r0e+seuuYtRzlPJ3b8CgTI1RnQIJB7ay2llm0yyMvn89w2yVBCAK5Tf7QuCZP/YQnmYbe6Hm0ASuESlll2HFRV/t+s7CE36vrRufEA1docrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipqOjShU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipqOjShU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E50C4CEE7;
	Wed, 16 Jul 2025 18:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752691307;
	bh=2Cn8pIY2cKAyxX0J1u/Hhi+spKBhaflQo/8v1RNLnqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ipqOjShUEHvsbIWsrcuGTdLj0nCSj99cIFkYJV3jBwj/sqOc5DAX5sKgj/SRGAlws
	 oLrofsmLEOcOoOksKmZGnSA+Vuj7TFrv2O/5juB5WqZLBr1YjSfsCNbbYJX7ZUVn/p
	 EVSpPPLBasbVY9+weRmgT3X642r9adouQVYUjZUULnfxf+AkuWRwcEN4vzekbhmwGh
	 jK9fMwZk1wbEbTWc05SxJ/8o8ffYtQgkPKkMIX7MQbk0WZw095g4vK9dQfOCWbrTxF
	 H2GHknoptRFVbfBurEIDfKUWVaAlIkVT2tvS9g998RFdxjJJeyOnHwv0ByilgJHCtS
	 JXsFJXAi0CvKw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org
In-Reply-To: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/7] Add SDCA DAI ops helpers
Message-Id: <175269130621.755176.12647184337931941618.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 19:41:46 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 07 Jul 2025 13:41:48 +0100, Charles Keepax wrote:
> First, a couple of minor code fixups to already submitted code. Then
> some patches to add new DAI ops helpers for the SDCA stuff, these allow
> configuring things like the sample rate and finding out which SoundWire
> port should be used for a specific SDCA streaming input/output terminal.
> Still a few bits of outstanding work here (propogation of Cluster
> information particularly) but his should be good enough to get some
> basic use-cases working.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SDCA: Allow read-only controls to be deferrable
      commit: 4eb6ad5d2080681b531db2c1764246f9a868062f
[2/7] ASoC: SDCA: Remove overly chatty input pin list warning
      commit: cbcb5f5c2be523ef0908df290b3033138bd4c185
[3/7] ASoC: SDCA: Move SDCA search functions and export
      commit: c57ad862462f064c0bd943a5828f5e0eca469ca5
[4/7] ASoC: soc-dai: Add private data to snd_soc_dai
      commit: 5f86d41d0410b072b5f4875ef5d38bf8d18eed55
[5/7] ASoC: SDCA: Add helper to add DAI constraints
      commit: 7b0d60dbb468fa82e9053292cdc8a5436400bfaf
[6/7] ASoC: SDCA: Add a helper to get the SoundWire port number
      commit: 264d3d776fb1a428706b0ca0f679bbed876fe7c9
[7/7] ASoC: SDCA: Add hw_params() helper function
      commit: 4ed357f72a0e0a691304e5f14a3323811c8ce862

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

