Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FFF881E;
	Tue,  8 Jul 2025 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982836; cv=none; b=PsaddTMGv0QDOGqhZlqfBiE/czBeSbKyluHYUNzveqZYGBdmcIWDajYqYEuhyOrr2GmCG+6sLlu886/7mgqtikJN9AgB4PXVNk/UIEWJ4/c8+aNxubQ8BFCQnN01NkBgJDfNWOS/pTpJRbgVG9lDh7DP8Jkrz1F27aZs6Vlunq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982836; c=relaxed/simple;
	bh=s8zGXRtoBEZEGtRRHAm1Fk9mZLoYQ2DIEw5RhibAvv0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b6RrS+mO5MMcQzyRiDDLuAtV3lbcRRR4KNS+EAke1+wIhW4rcmRnhBjf0c4jew/FDrRrf8q1GPd+Ej4L5sWD4nCPkeqocpN3xEchAKW2JnFOCIPoWcwVTt2zvefOvvQEPSAdD4vefiECYr6QLGBpEE4nzji6zFZj6CUN6elg+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfJ/KJEM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfJ/KJEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C5FC4CEED;
	Tue,  8 Jul 2025 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751982835;
	bh=s8zGXRtoBEZEGtRRHAm1Fk9mZLoYQ2DIEw5RhibAvv0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JfJ/KJEMxCgTWeIlHr3Fk9+DxKKVX9+xRHM2GxxSEdIAPryf7qgi5GL9lw3SkUWnz
	 cHbukwqIYdMQAWE+ULrMJbSMD/YHXlGxFYEKw+4bohP1tKoFkEAVVYteMLWhqSvQYZ
	 jJjcgAUyK3JDMVmwQDZwr5KysSu+ehB7pVZAyolLcIg93Y+Pqbif2eqRvHC0H2YFxh
	 Vy7NYy3fWcgwY5O7j2PnmcRtXWm27c/pNgh59/F3NtFtGZVewtNyhJwfa3qfxsytK5
	 Z076vbXmdE856mPufqjet0kKf9ek8kAl3MlO5XC6XnbIas13iuFl/0psWz3i28FDAr
	 urpSBVYcVpdPQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Alexandru Andries <alex.andries.aa@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, mario.limonciello@amd.com, 
 venkataprasad.potturu@amd.com, talhah.peerbhai@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250707220730.361290-1-alex.andries.aa@gmail.com>
References: <20250707220730.361290-1-alex.andries.aa@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: add DMI quirk for ASUS M6501RM
Message-Id: <175198283268.435679.12131000199300350752.b4-ty@kernel.org>
Date: Tue, 08 Jul 2025 14:53:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9

On Tue, 08 Jul 2025 01:07:30 +0300, Alexandru Andries wrote:
> add DMI entry for ASUS Vivobook PRO 15X (M6501RM)
> to make the internal microphone function
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: add DMI quirk for ASUS M6501RM
      commit: 6f80be548588429100eb1f5e25dc2a714d583ffe

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

