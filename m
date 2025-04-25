Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D81C2475C3
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583445; cv=none; b=dU+ukA87jXoYNUX36CpPF0pdXaT2T3EKPmqQck7cKRmsqI2T+Yo4hiJfkj3KklGizhqHGrhq1wd0uW7wzc229DryTmult3EIuwY9PjIjH552ZPomXyqAn0ipZ/zsIuP1aa86pIbVdl/6ENqqbhskF84ZzugSYYpqtAn3/cSqIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583445; c=relaxed/simple;
	bh=VSfHlEFqla9L+4QRrbfAYzj745/2XsnIK0WgMh17TXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mt3wlG6dUvszH2FZ5PpXGPQFZjMA/WU6nDpdYib0YKXaxRb04P4ArObraIqHrs1Fi3buXj5Kj4Zc4X0OgVhJFg0aztiajykamrIF57P7XIqYVgBcU/apFUIDZUzqB1d02AEk2GFpi0bUSb7XLQP+t80wKfhEK1+haesHROx1WTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjj69Ce6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjj69Ce6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9089CC4CEE9;
	Fri, 25 Apr 2025 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745583444;
	bh=VSfHlEFqla9L+4QRrbfAYzj745/2XsnIK0WgMh17TXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qjj69Ce6+6f/RSPykjFixg1WQW3Qp/YsY/np4K67FMoK0W1XW+DJ1yMIPFQW9fPoG
	 1NH6EEV/3biflqRmph8Xxzi6VPQCf0M+H5/zaC7mbmGYB1OLPrC/29VKf44PfjSNEv
	 YeAKyvPLSvUYUqj0fD+wRs2iu1uLAGvYlOJZ5fsJU6DPK+pwd/gfIWQV9Z25Vj37Px
	 jSEvp46gefgvDfyV+1V6OJrn9N8MlOTbhN2CocKWOwtynvhTylSVoASg2qq6O9ECBX
	 GX8uPaS8DHVQ42T/Ei360OE5ihMQPdYQSI25+A7YqnAJiPiFvO7xNU7lOBRYDj/2jW
	 p3p27AXeon9sg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250424094600.1678051-1-amadeuszx.slawinski@linux.intel.com>
References: <20250424094600.1678051-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix NULL pointer dereference
Message-Id: <174558344330.35587.16584848723138816620.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 13:17:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 24 Apr 2025 11:46:00 +0200, Amadeusz Sławiński wrote:
> Due to unfortunate interaction between two recent patchsets, avs driver
> ends up dereferencing NULL pointer when registering i2s boards.
> 
> Commit [1] does a call to avs_mach_ssp_tdm() which requires mach->pdata,
> however due to another change in [2], mach->pdata is initialized after
> the call. Reshuffle code to initialise mach->pdata before calling
> avs_mach_ssp_tdm().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix NULL pointer dereference
      commit: 3b41574eea3922f98038fe161d30c16a13188dcc

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

