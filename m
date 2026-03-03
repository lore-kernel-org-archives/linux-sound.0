Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C834421F04;
	Tue,  3 Mar 2026 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536801; cv=none; b=Rxxs/9yTgo/Gy3bE6jSDsN+lTJhi380SMltLT7Flu42KrwHyRREMUUvZAp8AzxJnDBVE5MMS/F6mrnvHt+xpXnlcptk8JMHoUuertXPHc8TSRKD6GIrNygMxh3Ug4IMxoDpEhcwdDxIrS8l82ncjhd4KFvaA97rkIzYwWf9zQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536801; c=relaxed/simple;
	bh=e6PnPUg1XGOVaWuQ6hjVA5UYSiO6q8mUbF8THA+ulsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MZnBfNsMwEDoWbWlGCbwdAQwS5EPGuD8obyX4GRwDVMyKudfXDR4eMyhVF0xqU96aJmb9WvRkxWj1dJ7naq3v5xhO9pyTJBBHBzTGMTXBfIo7zVpM2GPS0hP464q8wN3QFSXvpnlJjJU/RCRAreylp6fAwnEkTRBwtXdgTH+6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyWRwC+L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyWRwC+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDB3C2BCAF;
	Tue,  3 Mar 2026 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536800;
	bh=e6PnPUg1XGOVaWuQ6hjVA5UYSiO6q8mUbF8THA+ulsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LyWRwC+LOU4XGgEvVsevH6bc8aJ20pCUg//KlUB+1JSsYOlNQbz+QOufXADFRJwe9
	 xOvaXP/ExHLco0KVIBBeI+1cJjWKRaRVyDpbkIzEhtGRiZZc19ZTIexj7RCUT/kI6B
	 nzBbGe6zUUSp5UT6LBEP5S2NzI2WyXMNgNhf5qNqVLKVd/zp5HpJrYHw5F0AqlRAN6
	 mt/oe4Rq+sr8pbIGre12wbmxg0R/XdgGvVYOEMnvNl7O/MshgbKjDaKpfLQ37Q0KiX
	 IlpQS7ioBLZq4E1OaF6e3kQ7dfSdpoQ+QE+ze6FCKm6OEtCtetx7sQkhLjx1tQKhRF
	 1AQDUfDe0A7wQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260226110137.1664562-1-rf@opensource.cirrus.com>
References: <20260226110137.1664562-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Only patch ASP registers if the DAI is
 part of a DAIlink
Message-Id: <177253679976.22767.11860743678669302046.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:19:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Thu, 26 Feb 2026 11:01:37 +0000, Richard Fitzgerald wrote:
> Move the ASP register patches to a separate struct and apply this from the
> ASP DAI probe() function so that the registers are only patched if the DAI
> is part of a DAI link.
> 
> Some systems use the ASP as a special-purpose interconnect and on these
> systems the ASP registers are configured by a third party (the firmware,
> the BIOS, or another device using the amp's secondary host control
> interface).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Only patch ASP registers if the DAI is part of a DAIlink
      commit: 9351cf3fd92dc1349bb75f2f7f7324607dcf596f

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

