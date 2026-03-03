Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C074388360;
	Tue,  3 Mar 2026 20:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772570709; cv=none; b=kXxwnfE5kZ5PwAmRJVqemmPJFYjVDH6AKVTHVJjYBLfUpAKNCdx/O1AE4whVsq0EduKzCph7ciTnoT75nLqGM5uBd+T828LKzMesHZW2Exl/PXp2Y+zTf03UGFkelkdCuM+kIDCxWd1XESsyEsT0CbK6G+Zkwt4pVTomkvseqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772570709; c=relaxed/simple;
	bh=fF6XwJe/lFCVWsl9n/RrcuGHGqt7eLDLTvW36mJsSgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P2j0i82IhTvKVoJoMuPo+sB3UhKnp/Bq2gKDvWDUiCKtqEXlPJ0TmsJXVl3eAIA1tED3Msj9kViVTajwuWCwpErgFf6YWkATInVzhB71qufpWgteOFwySBFE1SfNOZFIhfptPTe5pskNjRXa5E9DmMonqCnWETrzqPShhjo1uNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRsPngsz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRsPngsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFCDC2BCAF;
	Tue,  3 Mar 2026 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772570708;
	bh=fF6XwJe/lFCVWsl9n/RrcuGHGqt7eLDLTvW36mJsSgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TRsPngsz9G20Q7bGcICAt+531j5dP3yjeNApg1dX3MrHw8PjvVrLNvR4Nlx0Fb+Ej
	 yYzorXfClW3ttHTgGxOunkOs2u6CmnoWa+iZy2a7I8pyXkAIHgzMYwmIDkUHGJLYqI
	 rtL8f1i78l+y+lDnK3ER+RzY2FwR0iKFYkwzS/dbI6Qre+OVxlSvCc6yAd6x1WEJAK
	 1sFBH7RABJP0/EiYbpe01Icy0MAUTvdf+Ua55SVu0G7jdbdurrZrnN83VzjiMOv4qO
	 dSk6vQ2+DfU0KgVb2uLSkWMNWg4hwX6ikaa8ENQPuGsRvf9b7jCvqz5JEA2kQRl/LA
	 Um/s8kfno0UPQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260303131440.574690-1-rf@opensource.cirrus.com>
References: <20260303131440.574690-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56-test: Add test cases without onchip
 pulls defined
Message-Id: <177257070756.704202.8451228810608315918.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 20:45:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-6ac23

On Tue, 03 Mar 2026 13:14:40 +0000, Richard Fitzgerald wrote:
> Add parameters to cs35l56_test_onchip_spkid_cases[] for the ACPI
> defining onchip GPIOs but not defining any pull settings.
> 
> Pull settings are optional because the pull should normally be
> provided by an external resistor.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56-test: Add test cases without onchip pulls defined
      commit: 2adac914c72b6cb5aba2612f49050c82aecd498e

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

