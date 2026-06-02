Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78D53FD159;
	Wed,  3 Jun 2026 07:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470273; cv=none; b=TfS2DN3Jq2As9tP+FE9fznKTyqxuESRcqfNLm7qBuRgysp9PxuJ8Z9cDnqHV9Rz32Bgb7tefYZ6jfxTRIWReE4xoKnITttvF8qyTFCHhSlyu9hYqwh5EtC19MoIrTUBVplbiaKWo2CgSGFUk3zfo1dTjE3/ErNL7RY2PypPQkGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470273; c=relaxed/simple;
	bh=u/zNKQDn2qZ5UricnkeWmclMJhxio9VwGxwwA+hGTOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=diyWwD8JvwisKhQNdWVJp3kDLCwD9bUfh2C/456BBG6rpJ2ky8g3mySKBscXWpoyioDYnwvLSiURzcRJ8ibcJLfbOPaTwVfOVMBUcap0hDgKhkb3s5LbDcC4v/Mc7H0bb9GjZWHQpJPujUwHILpnwGi0mM+1FonIfDTkpw55bwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAxZ5M5Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAxZ5M5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96401F00898;
	Wed,  3 Jun 2026 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470272;
	bh=owgt5GZRIYeDMJIHAWtLU/xNbrE+XbTLopPPhhJdwX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fAxZ5M5Z6UB9VOMhTBp9fakq6NBZWlNLeoac9S3KzKpnvG6ip4bNQxWZOebB8mj/G
	 BK8bwNp3pGZuNKNqpmfYalXmCeKOjz3n6/dic0WicfEyJUY17+1r1+dliIhO4BLlI2
	 iHmoGnTLR0KdWuc2N/5gkTDqybFaoJaVE9+fR1OSdwtTfQ/4WvVtC+CMh3EhKeyKfm
	 8Ee+Si/3okzTqe8FfPLlwG8MTD1c3sTfEdzPdcDIJu6nZ1EVNFLSr5FtL+Kczc7M1C
	 xyr6g58ugpOwu8bwiJD+tA2DGjyrLk4ljPw/SnJPWjzYv6W1kYLS4QtintXqHBSvfc
	 /m5ufH25vAlBw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521-asoc-rockchip-i2s-devm-cleanup-v1-1-9319bd781393@gmail.com>
References: <20260521-asoc-rockchip-i2s-devm-cleanup-v1-1-9319bd781393@gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Use managed hclk and runtime PM
 cleanup
Message-Id: <178041265480.93058.3443088566208285913.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:04:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=u/zNKQDn2qZ5UricnkeWmclMJhxio9VwGxwwA+hGTOw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9H9YBF7/GEMcxFUwfJTVENUepltyZ5fT6mUm
 1UYNG7rS4KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/R/QAKCRAk1otyXVSH
 0P4SB/9L2IrHxod3dm8i9HNZt7IgrEdr5Xbe00ZvnkA6R3WtT1VYCjObwb+1XiQjPMwsrDwc9uO
 PoA5FdvMRtG+jWbvzl3asMRzVcqB2VRliwYPoGEN9W845NmwAzTjDvlXUm/PdXV3Angxqjkv+gx
 N4HgHJ1V0qlJBj5WJXjj0lyDntBf++FA15PolkXq5UBKuK+f9xUbX7D2CABeyhGEVZcY8mep79K
 ZVuMGSDVlrmbQ3iz7G/QIax7gFup/pyBTijMC70JJB/QDI3lKlNz6Dfsx8iRSkXI1k5tXHCGPtp
 68adMWk7OWG25nqsuSAEZHOjyZFvj+lm6zupiSrorzdgWQ2Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 21 May 2026 23:30:07 -0300, Cássio Gabriel wrote:
> ASoC: rockchip: i2s: Use managed hclk and runtime PM cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rockchip: i2s: Use managed hclk and runtime PM cleanup
      https://git.kernel.org/broonie/sound/c/2d90ecdfa326

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

