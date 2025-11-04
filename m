Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998BF2F5A1D
	for <linux-sound@vger.kernel.org>; Tue,  4 Nov 2025 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262706; cv=none; b=btnuVDFyBUl/nDSAqXp0CxOwNgkswAV9PBCgsleiSTng0jK0QqnzSUbDgGsp+OELv+KYam0H/P9sPCwZYzqaXomlPo1Or2GDZZAQkNCh543wI9/H37SpvWtJ234XxpaFKU6k1t959HnNfG5LlS9glUfXPHpbxSPRXEXfBSdsyhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262706; c=relaxed/simple;
	bh=9wWxv0C96hH1vyaD2tTCyIBWU8eHkYvcI8Cs5aIwaeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fg6bbeRKOZEZZlIdBzs/pzOI46rwroEw1gOmy6VYzJl5cBDaYmx4cONLuDH47Ii+lpRzApspwBHOtjfpOW0JZOeaTaiaexG/KxMZOs2fRdWscWmtpJIVJ9cYNwUgi1eDP3pZAgJTncXzY8UZyV6ESd1oY6vxYGMFrPa9cqMV59Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7VLfBwA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7VLfBwA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266EBC4CEF7;
	Tue,  4 Nov 2025 13:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762262702;
	bh=9wWxv0C96hH1vyaD2tTCyIBWU8eHkYvcI8Cs5aIwaeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D7VLfBwATTHmjOpGlblnroB42lUFFLmIqy56eQZ28MHcpVhIo4XNQZciWn6J8m9X3
	 OpSvqL7lfsatjBZKrLCZekBy4BmnW9wtNXj07OBC/5VI2Jtm8p41UraWGqPJNoWt36
	 Glq2As99RCHBTk/Ayl1bGYnV8DegDAl+yjhEqpxZfnI96A9TsrCG0i4K0C5xFyOuGX
	 yds2+snO/9IvIyz5xh+4vW0+Ju0OEfVg/d876zlMiWTZSHfJlpPnC7Lyv1OyWEg17M
	 fz4MsFct9FWSHWyfv7K2Y1rmEMmE5EYmJ7HM6msTXoMlLmFgWaeEil6EddLp3nHYlA
	 TWb/6uSjC4GAQ==
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20251103091447.771793-1-sharq0406@gmail.com>
References: <20251103091447.771793-1-sharq0406@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: max98090/91: adding two virtual Mux widgets
 for digital mics
Message-Id: <176226270028.2215600.3605922263471608714.b4-ty@kernel.org>
Date: Tue, 04 Nov 2025 13:25:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Mon, 03 Nov 2025 10:14:47 +0100, Sharique Mohammad wrote:
> The two digital mics M1(primary digital mic) and M2(secondary digital
> mic) work independently of one another. It means they could be switched
> On or Off independently of one another. To control their On or Off
> state, with this patch creating two virtual multiplexer widgets
> "DMIC M1 Mux" and "DMIC M2 Mux", with two options "Enable" and "Disable".
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: max98090/91: adding two virtual Mux widgets for digital mics
      commit: 947eaef21577f52db046992c887ed9698f9d883c

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

