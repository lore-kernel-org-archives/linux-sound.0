Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E44B322C6D;
	Thu, 18 Dec 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046069; cv=none; b=KaE++vJSWr4pnGdPNOhG+LOqidecRR3SiDrul0J+6mAERHVb7TNmIEc8F6PgDyqAq5Rqu8xDKC9Aky67eV37Zt2ogDT/tqVLopJbic0lx/6yg5HFxvSTdO8yw7UzWx1j0nmY9X2EmqVPrDETrgAJT8ybeC3oX+sUm3WFAx22ZjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046069; c=relaxed/simple;
	bh=uERldCdr1OS/x5qYI8OmivEYE4GjVONVAGrpGJTKBMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ldQwDLMVnfu7lzrgZ0UuVnDUftWFAlrVGrhNqnF3irkZK3scgLod55nGuVCFlQBSXReQvjx5Q2ONGJ5zggOrSHMnWPl2d0fhQc6aHPNL/u5w8UVIdQPZ6n6oj20NMjR9OWTz5FGhYJp3nk34dcMbdxtVRsUOMu4TvNzr1kfUjqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DViEwp06; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DViEwp06"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B11C116D0;
	Thu, 18 Dec 2025 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046066;
	bh=uERldCdr1OS/x5qYI8OmivEYE4GjVONVAGrpGJTKBMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DViEwp06Fb3EgQvIxbNYZqpoZgUiBAIGQsR0qkomx4SmfA9HfP+xMda0dlw3l843v
	 NvKzcOyAzPKo0RKmt7SHD+MdXn/fsITXBS2vvL0JlZcNvrI5kQpOZY+PtDlZCT3JaV
	 DdVEASZ/ah23nndhI+2b67X+2tGWyK56tr0HsJ6eTUz4wAKe9VOGtsj/r4BVnVqJkF
	 Up1RkYcNYl7hzEB4z7P0MCTT5XAmNGMvImBrqAAjK3QoniHy80OZeG4RIpyXyJxtW2
	 dPVAvA5mFMsMQY2xuu+9DcSemvEnMZf1gR5pIeobJGzaShwmFB04vOZIUxFYUItm2A
	 lSkWvSOuI102w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251201123906.86876-1-rf@opensource.cirrus.com>
References: <20251201123906.86876-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib: Replace __free(kfree) with normal
 kfree() cleanup
Message-Id: <176604606576.48417.12415715226763234194.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 01 Dec 2025 12:39:06 +0000, Richard Fitzgerald wrote:
> Replace the use of __free(kfree) in _cs_amp_set_efi_calibration_data()
> with normal kfree() at the end of the function.
> 
> Krzysztof Kozlowski pointed out that __free() can be dangerous.
> It can introduce new cleanup bugs. These are more subtle and difficult to
> spot than a missing goto in traditional cleanup, because they are triggered
> by writing regular idiomatic C code instead of using C++ conventions. As
> it's regular C style it's more likely to be missed because the code is as
> would be expected for C. The traditional goto also more obviously flags
> to anyone changing the code in the future that they must be careful about
> the cleanup.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib: Replace __free(kfree) with normal kfree() cleanup
      commit: 9a123f222e1889d020d873aa6e0799098d22cdb1

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

