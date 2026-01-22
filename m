Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6530F53E;
	Thu, 22 Jan 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769088366; cv=none; b=WmlpG8e1+Cy7i+/WXTsgrqsZPMUqBMfNk12Bzod4X56Ful8BU+6eqFvuGr7/C1w2IcyaZWp3v0YLfgSQ70dFhPk3JacvMEtuUa3Tja3DH/01qK6ty9iQ+r/CzSLV9ZdDrk13/u2uVefHqYYLWLUgdu6ZOw7dQ31Fq3me9lsUTJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769088366; c=relaxed/simple;
	bh=a4M+9qr/iGf3vAJMPcE17WN3/sI8rpswi0dA9EBflZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aJ7uToQwhx9Ot7DWYPD2x2jC6iGo6/u/JHsteBt5l9dz9zo6dnioIfnWCF3P6yGOYMZiXpM8z7jmjnhhshN4IVz4XwOpnHlwsVvfQowD7S46RF5xKiww32LYeg/oZDJrKeClRZAwfnFT4cCGZDv8bDWt71lBvHTMzplhTABIIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZcpBWaQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZcpBWaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A738C19422;
	Thu, 22 Jan 2026 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769088366;
	bh=a4M+9qr/iGf3vAJMPcE17WN3/sI8rpswi0dA9EBflZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OZcpBWaQK8XSZmk1FUqd5omm+rp7nHTiXv99PmC/dlwjP59NsqEhn85e8Dc+Su5Gc
	 vrKim0O8xj5/6TgTJDNxIx+l8dd8ATz72wGM4zjVp7NwI1TVkuh3HxF1jQwQCfsxPo
	 XVUC2QftM7uNi5xHly2ZgRi66t0OY15WOBiPa1GqMeHe8gcjXq/WrhL7RtloVhD0Gj
	 9jozy+vkIW+4+MGENIlqG8QCG/pmcIoKS9bfmiYo2Jp7ZCT4EwVxj2vZAI1bIRvJ63
	 JdgXNThA6DAznV0lHWAkrsaVtbj0+XNzzfTdaSv8BwdAO1YJox5X6NQx1+B0dADeE+
	 mb3A2SB+bi42A==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260121132243.1256019-1-rf@opensource.cirrus.com>
References: <20260121132243.1256019-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] ASoC: cs35l56: Add support for new Dell laptops
Message-Id: <176908836510.85917.8367911975448640969.b4-ty@kernel.org>
Date: Thu, 22 Jan 2026 13:26:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 21 Jan 2026 13:22:38 +0000, Richard Fitzgerald wrote:
> On new Dell models the driver must read a UEFI variable to get a
> variant identifier for the audio hardware. Without this, the driver
> cannot know which firmware file to load to the amps.
> 
> Patch #1 and #2 are the new support.
> The other patches are for KUnit testing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs-amp-lib: Support Dell SSIDExV2 UEFI variable
      commit: 00fd40bc7acecf9f41d645aa0b35ddc7fd7679b6
[2/5] ASoC: cs35l56: Use vendor-specific qualifier in firmware file search
      commit: 51b069172a4ef2c6278c64c603a41a7f20329921
[3/5] ASoC: cs-amp-lib-test: Tests for reading SSIDExV2
      commit: d70fa6b569a95e71cc25b86ac3cc221bea541f53
[4/5] ASoC: cs-amp-lib: Add a Kconfig symbol for enabling test hooks
      commit: 3f086a4f277af799467af6c74902000461e60a33
[5/5] ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()
      commit: d0ab89951197f0fc509a0cd732d830880e79c2d4

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

