Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BF82BDC0B;
	Wed, 25 Feb 2026 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046402; cv=none; b=M29HW2YqU9D/vOmW0v+JG7CtnhZlP07rofXnQ55qSt7v6eMDi7tpNQPhisnstdtp0okxcLFDnoS8uSmJEjJkUwws5dIr6Jyg2yAOxJ0Imw6S2bnxC/Tc/+gI7vQFP3oF0dAufkYjglkxfuoKH4HhJFPy2iPIs2kqAay9JHfMjV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046402; c=relaxed/simple;
	bh=A8aJaYhK7KdewEtEavhsWkja5CIjebUc7Lik1+H3QhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pgMC6F0KkF/XRlIot9cGsAzOq0iz6BCVfVLBkFCq4x8H+SYQiAyDrTUa116gwwARGTY4Pz/MovZ+RKZ+ZKtLiegywVfNa9pqda0kXHv4vL5Z2p17eWVrvnSq4syFDKO8jgl6kx1ST4JjMSjBlsOQckljaUpsWEZ4JocV2cfDdQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVmCP4IW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVmCP4IW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DDFC116D0;
	Wed, 25 Feb 2026 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046402;
	bh=A8aJaYhK7KdewEtEavhsWkja5CIjebUc7Lik1+H3QhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YVmCP4IWAYo9OyVKbnYui6IFnF5c03AqxQQKO3TwcciOi1FylweIVBZ/+wOT+bnGS
	 JUoOfwAaXfKegMQ0Yx1USLvCXKkYnD2sFOA865kltGew3prOqPGHENeMIxVZRpjspz
	 69OSCyR5Ikl7f0tGYx7Vc3//19szHD+IcZtS/gnVPB3ohBtYxv5woxi/C142q6hUdl
	 QpT3Ni+eeNac6IvQHCGRyqzoQxs5hALaVaw6aRaLHasjP6mqFXzndjSxRYYNVgljsP
	 6D+hLKKa1OZ+r/zifkYNt0ZD4t5+e1QC6BYQCkmLluIK0WIwuY8DL6aO7jD8zcjpcE
	 FWDxMJ3T+qO4g==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sen Wang <sen@ti.com>
Cc: devarsht@ti.com, r-donadkar@ti.com, s-jain1@ti.com, m-shah@ti.com
In-Reply-To: <20260211221001.155843-1-sen@ti.com>
References: <20260211221001.155843-1-sen@ti.com>
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: Add system suspend/resume
 support
Message-Id: <177204639977.168100.3708657297928006171.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 11 Feb 2026 16:10:01 -0600, Sen Wang wrote:
> The McASP driver supports runtime PM callbacks for register save/restore
> during device idle, but doesn't provide system suspend/resume callbacks.
> This causes audio to fail to resume after system suspend.
> 
> Since the driver already handles runtime suspend & resume, we can reuse
> existing runtime PM logics.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: davinci-mcasp: Add system suspend/resume support
      commit: 5879521cb558871472b97c4744dbe634a4286f0e

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

