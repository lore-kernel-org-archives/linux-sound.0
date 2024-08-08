Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04FA15FA63
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723153623; cv=none; b=CUhwRb/i7y3lNULiXWvk7b8aW3KM9a3jLcbWvrGSp2MF+lj7tJQx9kK/HQPtsCBaTwu92X6QRHOh0L9C5x37soQQPmN6BxSLyhQp7/Q9XuiMv/WiUfYonlvHBABxt2SAKVnXehv7bQwsApeHgU8pyR50oOXiLUxZsWLBT2AHfrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723153623; c=relaxed/simple;
	bh=JmfM5c6oCUSl9e79v4ov9hn0NOvb0UND8aLM7fldPFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Avw2gV+OqH9xtLTVT4sltcoqmKsU0O+99OYA4XnaUuzfNH/1qdlAsiylEqRQoY6ecZ2CTYP5dz7OFW7jXAqzWyoI3aKUuNrV3Q35UHA8cvPWfcdu6RSyni2A5ZqnWybxvjNSwTpFJK0OhhSNgICSvC4G9XnarnbHQBMwBcw7Zw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg2s7y3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg2s7y3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C09BC4AF0D;
	Thu,  8 Aug 2024 21:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153623;
	bh=JmfM5c6oCUSl9e79v4ov9hn0NOvb0UND8aLM7fldPFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Eg2s7y3m6lxP0x8KzprLI5DFw4zb/FGgqkm8dIn3J/XgrSW4H4VQl01bn8/FxiBgI
	 LNqaEdKkmpck4Z4iacPxUNr3B3045z6jvJ+Cv28fJeX5ccLk8FWRqC9J/LEmkhXKpv
	 c6XalsVQJd4zyqznXxfQZIUeh5LOmJr2UP8P/TfhVr6/wwb0aPfIsYTIJpbRwY85Z/
	 UMBhsm6d8htmjdZVItqqeaFWJHyvoTB2NyWfMdX6ygw1HnYLZgh0OYEwICjr+TsnNE
	 lOplTDa71/82jNK/Pug2iDbmkNIGAtOLBDQ7oVkqc05H3jOdKIvaPSwO7DbseYTWoF
	 uiqQkdmoAeniQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Krzysztof_St=C4=99pniak?= <kfs.szk@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20240807001219.1147-1-kfs.szk@gmail.com>
References: <20240807001219.1147-1-kfs.szk@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Support mic on Lenovo Thinkpad E14 Gen
 6
Message-Id: <172315362254.480667.13308096985830701317.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 22:47:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-37811

On Wed, 07 Aug 2024 02:12:19 +0200, Krzysztof Stępniak wrote:
> Lenovo Thinkpad E14 Gen 6 (model type 21M3)
> needs a quirk entry for internal mic to work.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Support mic on Lenovo Thinkpad E14 Gen 6
      commit: 23a58b782f864951485d7a0018549729e007cb43

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

