Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D427A904;
	Tue, 10 Feb 2026 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759219; cv=none; b=YKgNfm1Tmlk48YHfQnpBQbRh1Lt6C3zXYKk+9Vmu4tJEK4OkMNFnrdJPGbe40Vznn1wbEX8rJQQs3z4AAJwGjPjcvzKcfGMUQtGFo/iArZuq80MpBbcPR6DCq0oJLEqFOGIyfQgtbXGQP24AjMd02+kTAbLcqo6uY0fITdKWFQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759219; c=relaxed/simple;
	bh=R6LL7radRbHZVM7ek9wngXsonsoiKaEW/OY9SShZ5eg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AurfXO6bBKOAjj9tZr/PzKapcHvA0ZfqlCiY/bJNidR01IEsXoQtN71w8R2Icrl7XjHKI1ExHS1nocc+l64CSuQmmEcCrwMBzbjeXdmvrO/l6MTaWjE2EzoLJEezGByCTEzSKIIS5wQppPiSsH3YbDA9pK0Or2TIdjg+8sl/oZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXlV7bKy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXlV7bKy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C47DC116C6;
	Tue, 10 Feb 2026 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770759219;
	bh=R6LL7radRbHZVM7ek9wngXsonsoiKaEW/OY9SShZ5eg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CXlV7bKyxc8bB30zTAlF1dBIM5dbPgFmainXv5At1nT0HKVNiFSAR6674wSDvMHgh
	 fQUbkny4TFSF/qByH8agsuZBnwEU2UkNi4KbC4HN5XLaxBl1lOiMLUgX4Z5vAmyPwW
	 Ds3Q1pbEHZ3ftKP9i2Fq6LU60h0S2a6jMHDyG4lCDAiV45vamLnxM5vMMzJjR5iVPK
	 izaGOVo7e3M8nbYRh/0l1gI0CJ7cHIMLo9cCIBEBKv+8TsArLhRLPCMVGHRR4Uf0EM
	 lJTtl5OG7yzq5iSURDFVykBnzox2Il+bz0u+jF9U3VkQfN11VFXL1ayLf4h5xo70LY
	 e7HY0XPCLTQ4Q==
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260210185714.556385-1-n7l8m4@u.northwestern.edu>
References: <20260210185714.556385-1-n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH v2] ASoC: fsl_xcvr: Revert fix missing lock in
 fsl_xcvr_mode_put()
Message-Id: <177075921678.419952.11304606547745968754.b4-ty@kernel.org>
Date: Tue, 10 Feb 2026 21:33:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 10 Feb 2026 18:57:14 +0000, Ziyi Guo wrote:
> This reverts commit f51424872760 ("ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()").
> 
> The original patch attempted to acquire the card->controls_rwsem lock in
> fsl_xcvr_mode_put(). However, this function is called from the upper ALSA
> core function snd_ctl_elem_write(), which already holds the write lock on
> controls_rwsem for the whole put operation. So there is no need to simply
> hold the lock for fsl_xcvr_activate_ctl() again.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
      commit: 9f16d96e1222391a6b996a1b676bec14fb91e3b2

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

