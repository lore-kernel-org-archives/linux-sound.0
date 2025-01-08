Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1781FF1C4;
	Wed,  8 Jan 2025 16:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736353358; cv=none; b=sDq1FmptAjZTy5bI88bSOxSmZOuyJNBdb8lcriMHq2TkyXRekPHj2mJJhNpvPnekUWhqxVb6lL+0SNGDlvUHK1Rl+x7LSJaqLh1263/ASUmaFN2d3d0IPYwUySD2hgHv7MGBKqClhRPoC6F6WDISu5w8LdBNbdRTespWUPetEUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736353358; c=relaxed/simple;
	bh=+VGNqbgBw8AwiN9n3SgJEcfLQUc+Y5DWxIQInEJRV8c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BY/Z5iL/u5hl2QRhiotfJMGBFhY+oLqBqnz8ccCzAW95Hq+H9mNwURFcZO5dYRzXfC6W2w5nvF1bbnVh0MTZxpplBmZprJubzvDuqebNdKZnHUvThvSzng83DWSUDCE4cPDpdm09gmG/MgRf2qhTdYJwn94fUQ2PQeOyd6Rc0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X466YpNw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X466YpNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362A0C4CEE2;
	Wed,  8 Jan 2025 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736353357;
	bh=+VGNqbgBw8AwiN9n3SgJEcfLQUc+Y5DWxIQInEJRV8c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X466YpNwY8MEv2Hft3epY8NzUYYUrCn8IlLD38cE8l2qzhhol53UUxwmXPrz2EkRo
	 WHMN37dTUIcwYRixH7lfb21R/ELGmQLV+Tg6JoaEzGMfXMOxdz+5A3Cgh/cHZ3vRbU
	 UgqyUp2KEDeHbNkDsd49GfL1LK1wW2/iFbFYfb/Ixr/Rl6vPfkdlfgr7QZpL2GFm5P
	 06Q+nBCHJ3intjXaEZGZr4txI4uAureGzrmwgABymuORxbhYJ1O3tSZRSC/V+VMUg8
	 r8gt6FUk+FGimjxdlbQJonFetrH3Bekc9Kh/OHeeSwpuvf6LmWxPsnVPAItQwIZRSI
	 Abvz9HmIQxoDg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, 
 linux-sound@vger.kernel.org
In-Reply-To: <87v7uqkpye.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7uqkpye.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] MAINTAINERS: add missing maintainers for Simple
 Audio Card
Message-Id: <173635335692.82702.13862032000740084108.b4-ty@kernel.org>
Date: Wed, 08 Jan 2025 16:22:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 08 Jan 2025 02:22:43 +0000, Kuninori Morimoto wrote:
> Mark Brown will take the patch. Add his name.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: add missing maintainers for Simple Audio Card
      commit: 1acb73db4893345d5811f48f1ff979cec495009e

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

