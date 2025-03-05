Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C925523F
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 19:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741204616; cv=none; b=OTGHIU5sweLsrz5TEitaHcFvNRMrtbKFD6nkHuheJlQnYdCVost/IfJAd1JnRVGrovVMrcKErnq7EBLYBSht3I6LOXYvzh4TeAcM90FGnAS8zDNF3vq+2nqrf+wPL6vFiSfWsC+NJ0t/qVVNZkmbfGB1VHS7IsF748vZIj4dqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741204616; c=relaxed/simple;
	bh=0Vn5XRz6UGCFDgXSFu7W0GE4go7q3lu4S2hlO5K/Wt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sjw1KYuyRBf4ENjIyGJgAoPaLv70ex9wiAWY3sfd78vpiOQvUqxEAkT2DNVKLN7pKp0s5u/boaDsgNuJSsDNP87snfRLAqtlzKaJGt38GHzx6Pd1HeRx6zT2VBR6BIh9USY2lY77JywqTYIoo/mmFLzFMilQhr5mJ/JmsUFtax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZbgBdr8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZbgBdr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D29BC4CEEA;
	Wed,  5 Mar 2025 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741204615;
	bh=0Vn5XRz6UGCFDgXSFu7W0GE4go7q3lu4S2hlO5K/Wt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qZbgBdr8EkPAnJFVyW1UfYsfFJ1z5+XNsL+j+l9rJo/FdJSw9cdaGKZFNWQtnr3Ar
	 In6vJTGh7xbcZ1ItUPlGE9fBu314GlLr0YAnL9VYRUyolm2eEaCZG/PFvAKcR7Dffw
	 LWQfGN4hO3rtAq2KU4RcDUVp86s9Qab//OR2FhBu4ySOGwjMo0j084DtuQXTwJmM7Q
	 N+1ABe8C6KG80ssToeKbAiPjPWkIjzIZWAwMHSZl19oaRkpiCCqSLi6vnkqZph4wcf
	 cYTZCfWxwJk/jTVithF3y8dWymx+swrKGTO6jPQB1f95+S52BeLrofMXdG3kY1SLP+
	 t7ENbcJcEvAIw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, johan+linaro@kernel.org, 
 srinivas.kandagatla@linaro.org, marex@denx.de, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250228151456.3703342-1-ckeepax@opensource.cirrus.com>
References: <20250228151456.3703342-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: ops: Consistently treat platform_max as
 control value
Message-Id: <174120461398.267307.6337281872839934118.b4-ty@kernel.org>
Date: Wed, 05 Mar 2025 19:56:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 28 Feb 2025 15:14:56 +0000, Charles Keepax wrote:
> This reverts commit 9bdd10d57a88 ("ASoC: ops: Shift tested values in
> snd_soc_put_volsw() by +min"), and makes some additional related
> updates.
> 
> There are two ways the platform_max could be interpreted; the maximum
> register value, or the maximum value the control can be set to. The
> patch moved from treating the value as a control value to a register
> one. When the patch was applied it was technically correct as
> snd_soc_limit_volume() also used the register interpretation. However,
> even then most of the other usages treated platform_max as a
> control value, and snd_soc_limit_volume() has since been updated to
> also do so in commit fb9ad24485087 ("ASoC: ops: add correct range
> check for limiting volume"). That patch however, missed updating
> snd_soc_put_volsw() back to the control interpretation, and fixing
> snd_soc_info_volsw_range(). The control interpretation makes more
> sense as limiting is typically done from the machine driver, so it is
> appropriate to use the customer facing representation rather than the
> internal codec representation. Update all the code to consistently use
> this interpretation of platform_max.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Consistently treat platform_max as control value
      commit: 0eba2a7e858907a746ba69cd002eb9eb4dbd7bf3

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

