Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167AF2BE051
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756414842; cv=none; b=HTyHs9K+lV7gxHunjTBfWDBqYdahF52t+lJYAecjJ32qougUsLu5cn9E9WHTOLrqjH51qOW86ajyX06r6CSklCKXKYBGtidavDhU/FrWuH6uPversA4CwMDsKqjBBmPcscyGFNfh2hAnqJai7UDBNnYmbMnh3rEljcFdW0rn+s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756414842; c=relaxed/simple;
	bh=KntWKqlfr6RDGIfdjViu8dcGMAIEHHvlV4zud01lphI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZkaVlAAyaHBymljRyDEdGFSnsfUQSu3GTz8TF6/fPLcWEsPGYtfjY8Mo+XQGtwsX497izFOtarCXpOlrcw2QHstyZhDaLOF95D40ep7jE1Z013o7MvSXq+RWnag9OS9kAuhS0LsGVfzisKMBdoiUuhr2kacRB04AoJHJnkpJTiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryix3qEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryix3qEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF39C4CEF4;
	Thu, 28 Aug 2025 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756414841;
	bh=KntWKqlfr6RDGIfdjViu8dcGMAIEHHvlV4zud01lphI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ryix3qEJCVIrgdD3Xa+Nlb6uwywZ6gNinjZ88Orx4JqRf0qu4QEUS6Xxdgl3bmSLm
	 n+Y9s9HR3nsa8r/CChO9C9rT9f1RLEk3/G6/JiUolEXQslQXeFwu8jWhsNDk93abMh
	 mYVrTCdxbSbXHxMV86/HZsk7pBauqtzizWnLhx8q4HjMaguTYwe2cfrw/VuuPMqwsU
	 +5wADDY9VWLt22kssLfQLpdc1Uy4JR8HxyIcSuYn2sz/+9tTV0ynFznkLsUgTqH5Mq
	 gsJPlD76OGdg+35prS2qAEwz8W3aqs1b28a0IEybsEbaBTNRdd2kK2+Rf6Gs5K48Sr
	 WRPgBHgpxY3Hw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: renesas: msiof: Make small adjustments to
 avoid errors
Message-Id: <175641484083.364214.415905926445024010.b4-ty@kernel.org>
Date: Thu, 28 Aug 2025 23:00:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Thu, 28 Aug 2025 02:21:19 +0000, Kuninori Morimoto wrote:
> Current Renesas MSIOF get unknown error when first used.
> This patch-set will fixup this issue.
> 
> Kuninori Morimoto (4):
>   ASoC: renesas: msiof: msiof_update_and_wait() checks whether reg was updated
>   ASoC: renesas: msiof: tidyup error message
>   ASoC: renesas: msiof: cleanup status clear method
>   ASoC: renesas: msiof: start DMAC first
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: renesas: msiof: msiof_update_and_wait() checks whether reg was updated
      commit: 042e57d59b3e7f44014da23e62911ae9b591953a
[2/4] ASoC: renesas: msiof: tidyup error message
      commit: d3593ac41aaf31db9d6d28cacd584330c769a4a6
[3/4] ASoC: renesas: msiof: cleanup status clear method
      commit: d092b70d7b54321ff481226fe6bc2a6aaa91519f
[4/4] ASoC: renesas: msiof: start DMAC first
      commit: edb5c1f885207d1d74e8a1528e6937e02829ee6e

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

