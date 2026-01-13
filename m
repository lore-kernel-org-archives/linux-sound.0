Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EDB3921DB
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312200; cv=none; b=XHYsKoM2lgTaZ9OEbnheEKq04yDe6aHTWgdlxNggIh6YLm8MKO7X30pI1TktDyg0NXv/+OGMKr1W0IyFyto5bW21RkYCixZu/PKZwT6vO3QD5GHXPlSPa5X8o8X5ma1D0V0+fPB2UXFyLONiBxxGnh5pnC0t/z6Ab0qJe/I1oI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312200; c=relaxed/simple;
	bh=wxoAj/A6po/vHFvKikZXhrhsMZM/I8bhI5RazqI6j1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iy12idC8yfK9hgcjTt7p88HC4+M2aa68H6Y61n4dmqzk9pWHRId+KWJorwUsIBNNBJqHHDwwpSjCnwmUar2jckWZJpF3ZVdL9jEX3Tx1Mh2SZdtBpABNpd0AlS+aMPjFDWzONeS2b7tgDNminXXKBCed9N7czCa6JrcBJzvRHVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/ZjD0RQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/ZjD0RQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987D1C19422;
	Tue, 13 Jan 2026 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768312200;
	bh=wxoAj/A6po/vHFvKikZXhrhsMZM/I8bhI5RazqI6j1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q/ZjD0RQwisDklqKNOzAJYYFsV/LYUaKZQPd5eCahstIrSETC+/DMctKlPwMzdwUr
	 WpC3+EPvgDAofGi4Kw7+GVvKdl6urP+EI4JjAiIeOxdfCIpsXSR2KVB9FsEz1jFQgg
	 9nvSmbr7NtUBa8pe74PFnF1hKzbCcVx5jzAZaLfPd7jfAbHqZUGkLJ+tkXdL1kYB1h
	 SLORnRU3qHHjZ5uxkEjv8LwELTrbzgLLl+Bd50dY3ruqe4z5501NGMO3ZAmY1540nw
	 ADWb5LTDNNRa5T0sx/m4zzEBApJbgtt7Acj6EuGzCrilSHZVD/C80mHY1Z/Ly6PVy1
	 +8B70UN/UuYJQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
In-Reply-To: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
References: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: SOF: Use guard()/scoped_guard() for locks
 when makes sense
Message-Id: <176831219836.70484.12871978324661169486.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 13:49:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 12 Jan 2026 12:09:57 +0200, Peter Ujfalusi wrote:
> Only code refactoring, and no behavior change.
> 
> Replace most of the manual *lock/*unlock handling with guard use.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: Use guard()/scoped_guard() for mutex locks where it makes sense
      commit: 5c19da34df029fdc29fec1bedf210af7d2c4fccf
[2/7] ASoC: SOF: Intel: Use guard()/scoped_guard() for mutex locks where it makes sense
      commit: 599a5b00a1bf2fdc5abb42985eb21c1ce3489416
[3/7] ASoC: SOF: amd: acp-ipc: Use guard() for spinlock_irq()
      commit: 58a581c38babe5ae2fa96b9a8387418f3275993e
[4/7] ASoC: SOF: imx: imx-common: Use guard() for spinlock_irqsafe()
      commit: aa234886c7263e8c78031a20e33a9725acdbcf5d
[5/7] ASoC: SOF: mediatek: mtk-adsp-common: Use guard() for spinlock_irqsave
      commit: 36fabc449a055547960712c164bfa3fe77cf0a88
[6/7] ASoC: SOF: Intel: Use guard() for spinlocks where it makes sense
      commit: 294b9e7e8ecafd4dd4b1cc13d7585082451be0e7
[7/7] ASoC: SOF: ipc/ops: Use guard() for spinlocks
      commit: 83aee46dc2142eed2dc40b5cef0e9e08e14cac42

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

