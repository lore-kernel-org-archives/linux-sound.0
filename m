Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F1214F125;
	Fri, 28 Nov 2025 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764365715; cv=none; b=EMLWo0g/zgTGw91vtnfgqyRwsfac2SVAAaarU4vMqMMLdntavNnqIYHPZQF7Rz2mEEnzZR1XfwfwhQUHaIMpQFiRbCq4HrFbgM5iUesfeD0753ShkXUV8L/2ePYuFkjpsrAe1F8c/rOugsagptSz4qPiyLLnwGQVN4om0sCpWfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764365715; c=relaxed/simple;
	bh=ypCFoZUKVBqWCo77AzQx58SLOYwSY5P93/lTcay8wG8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OafKChPdZXuCuOtp5j0HGlsoAe7TdCyAW5j9puhofOhv7g439erxppTPpzqbOnWe0zMyprBGtLCk4Tp+R+CBpJuW2Uz5DHu1hedS+Ts5nDaK1Ma62XfPDnlpGti0YFeMmifPuI2Qtkg9kE757F0B+YtiLZ43KJWM0mmxHLorAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2bKWkEp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2bKWkEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE474C113D0;
	Fri, 28 Nov 2025 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764365714;
	bh=ypCFoZUKVBqWCo77AzQx58SLOYwSY5P93/lTcay8wG8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s2bKWkEpVe6wExJNrYooBnVdqE9Vp8pVIeKpQPkwF3+DcSW78aowWAgfP3YeYuCtK
	 7isClojYpxW44o4mSsNGbAhTPOdQxcB4PsF2Ro4fPdE1gSIFazP8LwieaCrzPvXIPZ
	 vIMltl++/El1/nHW/j6janFDg7KV8ABFO5GStIlw2Vifb7lCwqfXK59WhjsSrdFvRs
	 uJ7Ohd2CukXy7S8OwuBugl/8lZcjEv28md772lyVosqyBRNjwn1kSCNuyoBNP5a4ue
	 BeHqRuuU8QR3ic7gEMsCljNqOFWLNlC8GVSRdSWsQCbgv8WifdajGY9sg8SNpQND4O
	 SI7AqdsZayQhA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251128112520.40067-1-rf@opensource.cirrus.com>
References: <20251128112520.40067-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Log a message if firmware is missing
Message-Id: <176436571350.232510.7650120666844121045.b4-ty@kernel.org>
Date: Fri, 28 Nov 2025 21:35:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 28 Nov 2025 11:25:20 +0000, Richard Fitzgerald wrote:
> If the amp is still reporting FIRMWARE_MISSING after cs35l56_patch()
> has completed it is helpful to log a warning.
> 
> After a complete firmware download the FIRMWARE_MISSING flag will be
> clear. If this isn't the case, the driver should log a message to
> report this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Log a message if firmware is missing
      commit: 816c9cac35185aff33da1eb73cc974349623eb3a

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

