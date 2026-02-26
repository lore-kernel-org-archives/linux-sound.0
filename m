Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6F837C0F8;
	Thu, 26 Feb 2026 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772106420; cv=none; b=RV32GoZqeyjCP3Vh4a5ydHmX0eyyaClR8ziSSnYpwJdQIu9lZGkYMXxV1yWP4h07jyISZTB0teAkG+cE6DtS13GqBynq4/AqdEuUXCdVgbjahCOqfJXEC13Xrgl1qekHKofZYSdygkNZjHEkzRKhRyfm/5jIfR3VywhN7CiSOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772106420; c=relaxed/simple;
	bh=XYIYfOlOxbETbNhy2mcNP/ssY5SgbES2Ai+ZQ6Ut/pM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NdfqIOx7OsqC0VSxFSmEVxG9zAD5ZDUApOwVGeu0JD3phKINShk/D4CUnfuRJ0xwATv4nHDE3GRO1EM3HZY8vMrNffvL5MCsoU+i5Quiejjs32aywvZ6+3JtsZhTVz87hgjg8B54vLlTDzcOrLLFw3d1NdHAhDhHcT40bTZXYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZil3bLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZil3bLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D09C4AF0B;
	Thu, 26 Feb 2026 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772106420;
	bh=XYIYfOlOxbETbNhy2mcNP/ssY5SgbES2Ai+ZQ6Ut/pM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dZil3bLYWcqOmIUxdj+ig09tUTaUEbvpAyVifespSEe7Wk6FRKrvfP/uNkKr0u9o4
	 rj8w1jG/pmpncfcku8Jvktc8v082yg8ElBA56Niz/DGGncrjXfueYG3OAmv40OPoLg
	 y60gJarnhuHsbVqhBhafKnPDKR2NdGeO4/xVkRc86w+z83tOWG0JH25knxchLV1w8p
	 my1hs0yf5oVvcvYP0JTBydB9j0IUquA81g6eXzb25Uy35Y78tVUM/55QEGViyKrc3r
	 6RRrD+3LFSrs/RSlZHh0AyBlqRD19rGVPYhV8s+wPjAsim1DP/SDw3lC2IENpZfGEo
	 s4wbSWwgC8VOQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260225125644.1248826-1-rf@opensource.cirrus.com>
References: <20260225125644.1248826-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Mark KUnit test suites
 KUNIT_SPEED_SLOW
Message-Id: <177210641900.55910.7989949504501145552.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 11:46:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 25 Feb 2026 12:56:44 +0000, Richard Fitzgerald wrote:
> Most of the test suites perform a large number of test cases, so
> mark the suites as KUNIT_SPEED_SLOW for anyone who finds that useful.
> 
> The callback test suites haven't been marked because they don't
> perform many test cases, and the tests are quick.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Mark KUnit test suites KUNIT_SPEED_SLOW
      commit: 5c74a008ffc62fc57a041602b4517519c8bf9436

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

