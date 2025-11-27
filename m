Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AB8322A30;
	Thu, 27 Nov 2025 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261377; cv=none; b=ZWcmrUFXeZxUEDASCfwA1ujofRuSnj34DI/lKIeKYM8R3r9gjIJ8ff3dkzBB7wZ+L+sWyQqyoNmvLofPlNCh8TmDNXdxdrXA0IsezoGPVDO0WP7ZTZ0Z7LpD9TFpwgZSb3ytB11jyupQIwfTXioRkkC1SeyyCprfdDOAT7wLJgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261377; c=relaxed/simple;
	bh=05j2vR6AvA+9Z2591xDcYFO8QfqvtvxVOazM7njTsrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fRwPGYg+6mNcvr10bZda/9gWDci55hCYh6ZasukBW7QMd8Djci9vUq+VsQpJUpEA44zSrr0ngy9o04oTSTgDE7TSta4AiwvqsojsKzUczq+wlUsYpBA0rUPIteOvp89bIyZ/fMGbRBumQrYijRT2ADPssThVAK5w7Gub1uBgaFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nw1VSRHS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nw1VSRHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C20C113D0;
	Thu, 27 Nov 2025 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764261377;
	bh=05j2vR6AvA+9Z2591xDcYFO8QfqvtvxVOazM7njTsrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nw1VSRHSo3GFRGWj1z65gXHf2m5RI90PN6DruOvHRJF5I7lMT/dIUj3oyt8mW+XhL
	 gUlHQxRIfeeJD2I4CmqEEKMqeEFag1eQoVBSOA9HKxX+7yAqel1/eMpAh266ur1dhH
	 NbmxA6UAdim8Cn3FksnhmkUbMVZIB89RY6/yAE523n+R2el2ae1PwKWujgPbj0nOb3
	 LvSZvJopm2u3v9xK5Rqzd4xvZ7LiDaKxGLU6IQ8MwcWP9aoIdcq+gX4yL7Qd2lvVi+
	 HGIsg1TtL+4L2y55GpieagtYYZiTTf1mnuQuBS1fm7ua7FzHy21JDoTD2tL/n0eiv2
	 lVFebYUE5rB4g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251127113238.1251352-1-rf@opensource.cirrus.com>
References: <20251127113238.1251352-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Take pwr_lock around reading
 controls debugfs
Message-Id: <176426137654.95122.11964232571173821588.b4-ty@kernel.org>
Date: Thu, 27 Nov 2025 16:36:16 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 27 Nov 2025 11:32:38 +0000, Richard Fitzgerald wrote:
> In cs_dsp_debugfs_read_controls_show() take the pwr_lock mutex
> around the list walk. This protects against debugfs returning
> a partial set of new controls if those controls are being added
> to the list while it is being walked.
> 
> Controls are never deleted from this list, and are only added to
> the end of the list. So there was never a danger of following a
> stale pointer to garbage.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Take pwr_lock around reading controls debugfs
      commit: ed6e90cb9fe53aba4750be50c1a355d676b7d69c

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

