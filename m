Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF04254AE4
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 21:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761254058; cv=none; b=ErCocc+jmg93DN9lpw7NlsvhDqbyHvDpOzBSzpQOJsjH1/sOv/hbdLzPhQymXfNd45EXFFJYt1a3CeaXbjFVWSpitBKeSXrN4DC+xMFydvYneZYJ7zGAdOkXD8p6DIM0VQ+cKUXWCmF0gy7YMyh8Lux5d+jzKFnFenBIOd91shQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761254058; c=relaxed/simple;
	bh=vBKZD7xyG/FpKmEBawDLjc6IaCvTxGiWV7/1KlwFVmY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gVTxwNm+UaPoWfhCHmxbD3sFpaw5GrqDH3cPDhNIXnh4YHzb6/7+Ellwb1kxUTxWhgIS3DgANqWU1G9Y9Y8uIIqkdcS6gBfJ728HKIiYnzYWAyA9hQR/xcN5xagcz6x6VzojPPR02D+Zt4QHYaDlrDMzB/qmYKCRxapTce2Q5r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQzyuAsB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQzyuAsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F28C4CEE7;
	Thu, 23 Oct 2025 21:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761254057;
	bh=vBKZD7xyG/FpKmEBawDLjc6IaCvTxGiWV7/1KlwFVmY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZQzyuAsB+phon3XHtf7sQs5aEaCS83tNMl8YVGd21M0KSP3vMbEADF+t0nehucXa1
	 W1OMC11Xr8NVqS/sgzy4qUL09h5vWil0ZaXeMMUa+/t4zrwvJBGIOhTlTih5rwSfVJ
	 aCYHraLIixYVSmaV6Dqc1ovIvSViA5Z8PMuMmXu6xAl61Nu09ye0ocj+VDLkHl3AiA
	 SWHTMUS/btDuKFXeq6C42XJZLIOmoMShGpPgTFyCD7lmzRBedOsxedflwy30uqB9Kp
	 7H9Lckj0n5q8hjN9jo9Gimu0sYFUYuFTQssQ5dGBG4gRGUco1mKR7ztg7RD/JPDepf
	 Vo3UOKl0ZSd0w==
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20251023070347.1936838-1-sharq0406@gmail.com>
References: <20251023070347.1936838-1-sharq0406@gmail.com>
Subject: Re: [PATCH 4/4] ASoC: max98090/91: fixing a space
Message-Id: <176125405646.267603.6195863936385992977.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 22:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 23 Oct 2025 09:03:47 +0200, Sharique Mohammad wrote:
> removed an extra space
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/4] ASoC: max98090/91: fixing a space
      commit: 310bf433c01f78e0756fd5056a43118a2f77318c

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

