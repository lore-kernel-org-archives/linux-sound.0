Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC43859E2;
	Wed, 29 Apr 2026 04:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436418; cv=none; b=hnat+5AFR299ijzjqI4dcuQQTLu9Cd+ZaFsQ3Hp4XXl+c/hM+aH2R3dFTfppHbFQO4mFeo7qs9GAbOVl8aeDtnS+juA4LQrO+xR+gl/GhyoZwSVSgQVxD6ixV/L3Fc0CysTO4JdDPnBr3yJDsOg6IQRzXpVAHn/fWFZOseUu2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436418; c=relaxed/simple;
	bh=U8FJ32FFrQHgLTS2Yom8zlOEhaml2B24SQBefpFmFQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ltVnZ1PYHhQvI2GWkyg98TGlgyx3PRra2GVokQa04G4gwdSkWOs/kgh2NlSZTulWcAWUnUfnLUNBKEIkYDbFUXCwdIEhyt64NtYiVuhOW7jCgoiN9qZ0LbpdKcJWWKKWiRgTq4QjWrA803AY1abTeq2U1HFAMQqzNO/VAz1hl5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CR+GR9PP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CR+GR9PP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE91FC19425;
	Wed, 29 Apr 2026 04:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436417;
	bh=U8FJ32FFrQHgLTS2Yom8zlOEhaml2B24SQBefpFmFQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CR+GR9PPjsiIPmHXVxSPANuR5i/fnDugR/zrhCXOAv6Zb0Jh4d8O0WIS7PapQtO9W
	 e7YHtCogPO2EX7yv9c4Y2rGP2kNDiUQA1SPU/PKDGDxylZuxD5+qIBpgt3wHTRV9sd
	 Bsmgn5TjB+q8pJTYw7Vrz+ps4LzHYkY7JL5Gh95c2Gb6o85l9u4OijA6aUVoc73MeU
	 4UWNFxIQztAyfIDaxKmCTVqK4hrGEmxmD8PeX0sEVvlj7gCk3Byx+lsAk4ak5fZOcw
	 0Pz2dpIqLa6+cEZvbveAfuwoiqTIpnz+/cI3H1mDodA+e9eVmclm62e/my/Am8mCI3
	 BLKeVroXcbVwA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260428115228.158252-1-rf@opensource.cirrus.com>
References: <20260428115228.158252-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix illegal writes to OTP_MEM registers
Message-Id: <177741967813.363516.16954911230074404150.b4-ty@b4>
Date: Wed, 29 Apr 2026 08:41:18 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=U8FJ32FFrQHgLTS2Yom8zlOEhaml2B24SQBefpFmFQM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8Yb+d82otwFDT74YcqAJp7APvYcj3ta0mp5QJ
 /671O4wmVWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG/gAKCRAk1otyXVSH
 0GnbB/946NCirq5YO15S66kY02oNDWxyCyOiUProeTn4TuvFvS24UpPwn6BO+xABF6wj6/tkIqY
 9Gh4rwA+lUwgq6DGNd4PK1TmSIy4us58JAHznR86AFLxg6xdveMSbUb6clyqF8rwceXNwlZVq+N
 szfwNAoxgTDbGdafRAvhqss6ufQCszXFsr9q4dSw33W5cGLgYi517ZyoGnk9RrpKw+vVb9EqlLw
 48ej+JqnJtp03WaxZXKvfuOuszEkgnHkJN0C4yQbFAQiLiI7UdzKbZtAdSnNwUXa4QhLmKUXkak
 g95AhNvqfUFnaU4KcH49G2TVSFEjBpbwOIYSwKax0MdAGfs5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Apr 2026 12:52:28 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix illegal writes to OTP_MEM registers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: cs35l56: Fix illegal writes to OTP_MEM registers
      https://git.kernel.org/broonie/sound/c/be102efb832e

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

