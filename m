Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E73224CF
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727790627; cv=none; b=DeQSFFfPT5A6BGmFJA+NMWpzhy2dV+3LQlrJ/mo7sXN7c6NYnGisr7A9iDsvK1/305doUhRVjELYgHkjqIwlSb1mRhObf4Y1WVLniQCY1C2u/bu1hGY2Wa5hKxaNEkDAtPhzSj731bYuByhERq5ape5oAeJG5p1EiT4UlQhdOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727790627; c=relaxed/simple;
	bh=dveGBljm7UEvi8gZaPX4Fj9VImGU7ctszDWc7FARMwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fAOS9DngK89KG0qFyJ78WNzeRCyhG33l47juoYw5qtxIUx9TF1rzJ7UfhHu72OHVpITsH4v+Pgnbl1tOnEuM8PEc8AZ0TgcUWIjFymPB7R1PgSLalAxS4UmhMz62DfoPNEpPJpMitmccsDYMGm4QrTTFa3ugjkNcZM0l1WFwv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KL+RmCRS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KL+RmCRS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94396C4CEC6;
	Tue,  1 Oct 2024 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727790626;
	bh=dveGBljm7UEvi8gZaPX4Fj9VImGU7ctszDWc7FARMwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KL+RmCRS550Mk93sOfmQoIENJ+OUkK0O6xXu8pwFIHFd+mEgW5z/mMHsLQMgzadxn
	 Q6eVgE9vGudHbaRJzJll7N9t0TWAEW1jZiHlyGZwhPN3da/+Is7aOr7NAYhGy36Kb3
	 Wemn20sat5mVt1EPXqeWAFli1cj+yVtlckny30mI2UiSGdC9CjYT+7nkBfPQ9aDmGJ
	 qVioEp6kkc7PyyvuA8R0sCxilYKuFmweLYSlNNLfhpMBMN1ddM6YLGg/lOK8Hbo2VC
	 aSu3hYqWFGWR68z/supz4JjvKeb0SEDvf//uee3OC9AXTumETGU7VFYBrt5wUXflJ9
	 UaVOmIkv24M/w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20241001071836.3719162-1-shumingf@realtek.com>
References: <20241001071836.3719162-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: fix the range of patch code address
Message-Id: <172779062337.2290041.16568498435860240014.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 14:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 01 Oct 2024 15:18:36 +0800, shumingf@realtek.com wrote:
> >> sound/soc/codecs/rt1320-sdw.c:564:14:
> warning: result of comparison of constant 4295491583 with expression of type 'unsigned int' is always false
> [-Wtautological-constant-out-of-range-compare]
>      564 |                                 if (addr > 0x10007ffff || addr < 0x10007000) {
>          |                                     ~~~~ ^ ~~~~~~~~~~~
>    1 warning generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: fix the range of patch code address
      commit: a34b9d812d7ec95789b15ce84de5f03c6dd1137b

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

