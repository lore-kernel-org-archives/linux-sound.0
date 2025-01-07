Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0647E1F4E59;
	Tue,  7 Jan 2025 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263926; cv=none; b=rLzqcN8J670dy79Alqj5RkD9yWshwolSYMLNtMc+OUF8PJA9oixoX9sFpFPj9TLHmanMCDejZS+bZd/U8uXntqUc5pv4pE+9uadLZXsxjKyLkKZUC5DR/4aSDUJbkXXoUmxj5qEmyY1QbVbB8G/bn2wP4wS0PT0qh0cSwIqFbmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263926; c=relaxed/simple;
	bh=3KbuMr8YM2+AJ4KenbEBRiqg2JIPctLp5BkDCb17iys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UqbAjmuq/fQojYELY3uXCMaeTpvH2cQF3U8KfZBWKAxGgw7dRyXHznQ8iDP3Lm8uqiMTdBh+fhTly5h3U3ey5wHRCwxyU6GIhayym+T4szGfWe1aUhxbSQX5VSOQLaDpHFoFcfWDl8CvORIYIJ1qq6WQRU4QUJjoHqqRkBy5C04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3nfhz/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3nfhz/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C733C4CED6;
	Tue,  7 Jan 2025 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263925;
	bh=3KbuMr8YM2+AJ4KenbEBRiqg2JIPctLp5BkDCb17iys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g3nfhz/FnwvfHCySSYWt8Q6e5KE/Kcvgl1KcO3WLpvCSH+NCVoWSiG9TIdEOI6hhJ
	 af+NdvqjYyhXQgdJENtHxr8DCI4WUHG2a+HOGTSZBu1sDYbrDMwdfGa4RseocreXWT
	 R6U+AQtqDATrBM9SkltxhvrYRZHtD8VoxtFtH+sVEXEQdLKDeSEZKXDuDxtIDMR1Yq
	 q181QwViaoC1FVSBekJRptT+rzPttgimgdTrYp1wvShJUTR5miGP3ncNGiEzgz+cCL
	 WnMLvIp2gIoeKhNoq0v/RZQvYpNhixoDY2sTOsh5DQiDQpZ1sKTDeIb6lKj/lRUBZR
	 sO3bR7FV9/PGw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250106154639.3999553-1-ckeepax@opensource.cirrus.com>
References: <20250106154639.3999553-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8994: Add depends on MFD core
Message-Id: <173626392436.92253.15787518814801268848.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 15:32:04 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 06 Jan 2025 15:46:39 +0000, Charles Keepax wrote:
> The ASoC driver should not be used without the MFD component. This was
> causing randconfig issues with regmap IRQ which is selected by the MFD
> part of the wm8994 driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8994: Add depends on MFD core
      commit: 5ed01155cea69801f1f0c908954a56a5a3474bed

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

