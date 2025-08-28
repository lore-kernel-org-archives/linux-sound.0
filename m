Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD68299A94
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756414843; cv=none; b=WSW++yCWa4xlXdHtGDSNRSw/lGqMdNcKgSJaUwq6LkFXfSwnHeVWuXfeUefj7Z6NMZjVMKH8VJIREs5DX71oN8JfUR0sgIQ7YRgrPdH+KUoxKmV2G1BC9AzLtsNeoRDtRrcBuKrAcZj78EFRo+ILhG4NZMHIfgbyrrU+n/Vu81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756414843; c=relaxed/simple;
	bh=4SKy0UrRQcf2FlJlE/A8R0sgQFjDPRgWCAHjGTnf7Aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LTpAwd/nxWnZzf6nqhUTSH8KFqyrVNu9nRm0tXbuCDTJxoPrWqQFGiXY4F5VKG4BKSM71XonwcXtRza0WqR9FayCiFRUG0EXrPvltfo94AfwAvotqEr0X5s1zdu+/cvT6nyviFRVDkvLMhpP7mWME13OTtOBd8jnqjKpZW5BrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtyqPTch; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtyqPTch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1218DC4CEEB;
	Thu, 28 Aug 2025 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756414843;
	bh=4SKy0UrRQcf2FlJlE/A8R0sgQFjDPRgWCAHjGTnf7Aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XtyqPTche9q0WEFBs8cGrbcRldiXzbjDHYZnARsJZG4HESA9zvLdBweof8E0/RrD2
	 MAhupqinCYMFQjkB8arQokeqhinH4f1DqiSn1sp/hQKple94pfF/SyWWuAWbdcyArT
	 aTC3xTjLoCvUQ7ftRnCtk3nl+5fVK5VvAh7O3YjEIhxPJ6pChQMS3um6to6wJVrfHw
	 E4avKLJTW7fKItAR8OW8ATAQU2lv64T+FqI/pdMOZtYcstVorrbdCZuuwYqyaRgoO2
	 SLmtGe5rg0v2CBP/DVsD7cRW1j9W21vI6XugPwk6xW+RTQK9n+Cm6aMpdodg9n5TTH
	 42FWTLeF1bU+w==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250827142229.869139-1-cezary.rojewski@intel.com>
References: <20250827142229.869139-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel: avs: Refactor machine-board
 registration
Message-Id: <175641484183.364214.6721597198781092696.b4-ty@kernel.org>
Date: Thu, 28 Aug 2025 23:00:41 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Wed, 27 Aug 2025 16:22:24 +0200, Cezary Rojewski wrote:
> Set of patches all connected to the machine-board registration process
> and the board_selection.c file. Apart from LOC reduction, allows for
> multiple cards of the same 'type' e.g.: avs_rt5640, to be present
> simultanetously without any workarounds or tricks. The last patch
> improves debugability - helps us (the devs) deal with basic I2S-boards
> issues out there without forcing the user to constantly switch between
> debug-friendly and non-debug options.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: avs: New board registration routines
      commit: 3351e814cb49dff7ef4808f5ebfb299162994118
[2/5] ASoC: Intel: avs: Cleanup duplicate members
      commit: 6acfaee44cbe9364a91dcc373fb4e6e395c5b20b
[3/5] ASoC: Intel: avs: Simplify dmi_match_quirk()
      commit: a44281b8b58a88ca3020c89fd697fc1cd18a31b4
[4/5] ASoC: Intel: avs: Simplify avs_get_i2s_boards()
      commit: db41fe9baa8b8bd1a1aa96962dd4294f2a9135c7
[5/5] ASoC: Intel: avs: Allow i2s test and non-test boards to coexist
      commit: a37280daa4d583c7212681c49b285de9464a5200

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

