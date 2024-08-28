Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13E21A7065
	for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724862620; cv=none; b=IpkJWYjhsPOt51e6S52WUshk1L5TcuJExxveLwd1wZx5L89oAUSDFfm2fXS0u3vLILEx2oEJxu2Zfi+MyxTvI/Kr/rWMK8mYOOMQJufRtWIutujk3xwJGvuDehdQ7aIna45mu4DrQQkSSJq2UBySV/tVwfLlS9VSsBfGVes8ZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724862620; c=relaxed/simple;
	bh=UQCw1HFtw7l1Nj/N/0Hl3E08vW7fU/ly67v+ziXaLpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u2XYtXULKH9Zyjh8pfrr5mLq6UqgxoSazaJk3M1Lq2OqNjurZXzr1xeX6ArG5DwafXp2h680aI4EjT8S/QErmcgrQEHAGCR/Zb99HzC0KpR18mxEUviJbp6yFT6Qcrwq9ycxfHtTbnREPaiYpWB+qeCFAVEhV6657AFRK7ay3y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBJail/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBJail/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A5EC4FF19;
	Wed, 28 Aug 2024 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724862620;
	bh=UQCw1HFtw7l1Nj/N/0Hl3E08vW7fU/ly67v+ziXaLpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lBJail/tW9cml7E19CHvoJX9U+5RjaieZPoS22qng5XTH6MYPOHG/7KCY80P6Ik/9
	 MdxQar4/oexYhZVzZL/hbuLF13A9kqPjk1hIz8xFYG1S6lhg1HKPK+syPIdbGxvJ7r
	 FYwIsYbJmNLGc1CPCa6MvLj66tmBxJxZH/D7HbpOrGBO11Omh3tEb6Az0NJH7bKbl1
	 fYTaFLXF7mXHZktQB2jewq7Ud9gsXeP72kAZRUCJjDIuP1u3A3hij3oFqFK4ivy0xX
	 XKq0g8SnqYdkQtQS3JzAp/YCbT7FJ0qEgq2btWOd6QZGj43SMVvSAFNPmJnUCVvDdn
	 Vw9whNyvdrvLA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Hongbo Li <lihongbo22@huawei.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20240828122829.3697502-1-lihongbo22@huawei.com>
References: <20240828122829.3697502-1-lihongbo22@huawei.com>
Subject: Re: [PATCH -next] ASoC: dapm: Use IS_ERR_OR_NULL() helper function
Message-Id: <172486261926.92851.12864505049654170229.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 17:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 28 Aug 2024 20:28:29 +0800, Hongbo Li wrote:
> Use the IS_ERR_OR_NULL() helper instead of open-coding a
> NULL and an error pointer checks to simplify the code and
> improve readability.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: Use IS_ERR_OR_NULL() helper function
      commit: 75560718e83bede12d70b2a6b6940089477f58e4

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

