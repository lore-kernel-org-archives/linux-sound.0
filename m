Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCEB364A9
	for <linux-sound@vger.kernel.org>; Sat,  9 Nov 2024 03:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731122035; cv=none; b=O2ISaoMZKEdbxLoi2nCtNW3TPqR1TdQU8CLBLS17bZekkgNEAHpmtOIksjPacjXdSgaG+Gb+a7xUeWk1Dor8+BBcElI/kraiuvLpuYg285fCC0bFglohQda/P/zXEPRzPMfje1ldNxMSyU0Mg29GhKvIt3/1RZp7vhU3c5k7apw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731122035; c=relaxed/simple;
	bh=yqbaMMWO3qx6tRcB0Bx/Tej7CO0YwvdJh+CciDKZvAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hkLMg3mreKuDsVWKowAGkOz6qjR2oKHGhxxmF+y5FUNu6rkqs10u050pJWiw+11h6HMrC2YecV2eRHfhqUT2kZNy18EnF7hfeT4MZwLnimnbnPEx7whBk1spzRv+F1KZn2cBZYPPhsIhNuRe7e7VhF2qJ3NjAkoDQSYISkDZSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwqCmgPe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwqCmgPe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1B2C4CECD;
	Sat,  9 Nov 2024 03:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731122035;
	bh=yqbaMMWO3qx6tRcB0Bx/Tej7CO0YwvdJh+CciDKZvAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mwqCmgPeCLqzT4Sj1V9tGg1h6Rx74I3FplRL+sENPwW3k7/NjtnuswXEnWesS5Scl
	 3/U1fOwQoOjH7X4SoPgZb9N2OHGk4jzkuV0E+vIoug9PRHLrVFYm/J+awE46Z2ptTp
	 z2nK7VKQisFMLZr+KpYSrI70HtZSkMFLAhqnHePdrPgVw6QtcydwwIAG36GCCgPwcO
	 VX7LneVJCvZbyf1HoayWT/TLmj6Cr/pA8CKo7MunxOaLOwlmEJF/sVx8Nh8YzW1oT3
	 5fnRbvxWm0a5xjVqqB7SqEHnOLBISvxwlzQLD83mk1xm1pr4Rj42Vypm0wCxR8E5CV
	 +JQGGGE675Iwg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20241107100204.24952-1-peter.ujfalusi@linux.intel.com>
References: <20241107100204.24952-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: Fix Kconfig for ACPI=n
Message-Id: <173112203349.168194.17228447871015538089.b4-ty@kernel.org>
Date: Sat, 09 Nov 2024 03:13:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 07 Nov 2024 12:02:02 +0200, Peter Ujfalusi wrote:
> A recent attempt to fix a missing symbol when
> CONFIG_SND_SOC_SDCA=m and CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS=y
> caused unmet direct dependency warning with randconig.
> 
> The reason is that SND_SOC_ACPI_INTEL_MATCH is needed to be compilable
> even if ACPI is not selected, modules have dependency on exported
> symbols from it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: Kconfig: Only select SND_SOC_SDCA if ACPI is enabled
      commit: c5bbc47f8e094f4489934a244ee1c14947a5075e
[2/2] ASoC: Intel: Kconfig: Revert make SND_SOC_ACPI_INTEL_MATCH depend on ACPI
      commit: 4f1636e7b0384c43856e1442755f48d7c690c2a9

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

