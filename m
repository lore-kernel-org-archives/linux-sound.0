Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFCC3DD537;
	Fri, 29 May 2026 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065746; cv=none; b=h6rQVGKhzZej8EqiRCXdaxA4D4pnb3uj9qu4Al7bou5dqTqbtrnTuRMuQsO9dIaYpF1xmXd7w3ALnp0nOAWMahfmwZoVbDDg1xrBJbQdle0uuiivLw9d1LVX31KCodHsHBnWociscIkkiB5VBXSDRRqjCRAgj1iwLvqnw1ExjUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065746; c=relaxed/simple;
	bh=dlUjtbyKmT92cXFG08PTJX3bDjROwOwna4j+I2r49Ro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hwgs2wBUmns+saWRAPZ5Cm+bcQqbTlA5D1aCWl/GDOeB4aqZACVLXfQRox4zM13Am1mnXdQ6tmQQ3IBHfOWe7SKzMMfpbpLzqRAZWAM2/iPg9ViX4JCcomw4ukcoE+R0FJ+yFzi8W06ZH1lXY9KrXkVVbZjAGvxb49oBYHSzHsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4YibmjC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4YibmjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B581F00899;
	Fri, 29 May 2026 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065745;
	bh=a8uTzGfAUe47bZ/TAA3Wp5YtW2yhsIjyZhHT/ZoGwgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k4YibmjCiV1QZZwqJWsYhdE9xETpTnd9PzgulF2bUEk/OIwFCtJ/jtv9mk8W9rBPQ
	 49LXqZDCMA0LQS5Gl4Wg3DLTvnWKb2JKVqSftdH/Y05EfsT0zyTsgO2f+DeMWzVF8Q
	 2e8RqTb6ASoIon2WI9oyMr8BXiNv1cvvc8GOvnPJU8FK+Hiy5Hjzpy/7RV4j5pqUD3
	 OaMaIceq0GEh0bJ0Jazrwfepflzy7EDpoK34p9Gy84keY4EuX3RXdxr2AaCibK24T5
	 FkWKAudn7yW7YZs0MdAc+si0t1/tIdNKmcHsOAUqNUx0de1bykrSh64My2pLQBH5DU
	 14a6etDRWzf2w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260528144632.130197-1-rf@opensource.cirrus.com>
References: <20260528144632.130197-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib: Simplify overcomplicated error
 return
Message-Id: <177998252436.8579.10192612568050122137.b4-ty@b4>
Date: Thu, 28 May 2026 16:35:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dlUjtbyKmT92cXFG08PTJX3bDjROwOwna4j+I2r49Ro=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqGaXP1t39ht2Lupm03q/tWUbzmGOpgmnzu9q8U
 ZeBX/vYQsGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahmlzwAKCRAk1otyXVSH
 0Al7B/4y5PWPFvQeaPSWfQwRvZNYgmCUsJdNoL+yyFklSttsPwT6ON5skPKyIv3RZkD1sqy9v7s
 widYVWHnjWay1u+407xHs+Xqdv2ZursJSkKXAa/z27Y8SFz4YJQPuUZ5jaLPfFrhXAjaqXQSIRL
 BOdzZjF8Z2ju1vN2kyqdCmWzqNwkOI5JxdZf1sFjzKl9dUt3pzm/LFCCKBGN3vFICaYHooqXFRR
 s57vAam2j/OT/hSU2iopkX5gYXjwN7ewN2cY2b7e3XsnywxTbqdPZPK33x7vM8xk5r0jUsdUnEG
 KQuFuoR0xRWj2uf8GWJ8BHAQsXGZQFX/nQ01CIs9Nd2tcS+2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 28 May 2026 15:46:32 +0100, Richard Fitzgerald wrote:
> ASoC: cs-amp-lib: Simplify overcomplicated error return

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs-amp-lib: Simplify overcomplicated error return
      https://git.kernel.org/broonie/sound/c/3b28b14b794c

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

