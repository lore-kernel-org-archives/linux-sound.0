Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5B2F273F
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660885; cv=none; b=iOAMrRAcV+zXHQ2WCSYj2t3wdA6X4yA3hCoLO4H6Ka7e3GLrY58FnyPmX3ZKa/COkd6dSEd00Fz9aMpYMQc7gRnJrhxiHWjvHrMhEgx43GBI5QdGOpBhVBLY3iJgKDIEsoJP2JBBHjwvs3x6DyLXpN7/SlmZbNSzf2aEDIG7y9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660885; c=relaxed/simple;
	bh=O2YCxfpLQZxSYKTTZUVP9+i+n/N0nOZ4Q9r67ntk3b0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uJ2s9DLDQ7tV/X82FdXwMYunUDByoyBOI6mIHtOs/wxI5SKLZ4vCh2VHGuxx3P7hgrD0QZadB7/Z5NJ7B1FxGYj/zVSidlI6KCdKZo0lwoXqwx72GgmhV9Gys+CenlltoYPKXJfXgfujuwVupX3TQBqygczBl3iUkZClqiYqPyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nhb1udAI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nhb1udAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA42C4CEF0;
	Wed, 16 Jul 2025 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660885;
	bh=O2YCxfpLQZxSYKTTZUVP9+i+n/N0nOZ4Q9r67ntk3b0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nhb1udAIxxZDvqNac/aee2ghm+SvUd7+U560G12SHGmkoWD3Bab2/qVkhLesHnohP
	 aa64qp0pFHpwkrRrAWf0WEIzN+FhE26nFsTfA5Ckou9PFCkODaBkmbQpax6r5yYxxD
	 8d9WbT2M9bW3lCZv55e8W9bDgI1Mp4QC0M421kADXD4tS5fdsFAfjrlGWNMwDNJb07
	 QpK57tr6caa2L8QkzhPvHHe+AcOSIO30Y0vKSqs4FY5pIxgS1wL+3bj1BfP9M84lKo
	 jIYdaGxYg1xZf+UebMRo7hOFayoxryzSCSLr0kbJV6t6NS1C+dizmMaF7BJmwCfO1V
	 oRbiVRaYpyA0Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Adam Queler <queler@gmail.com>
Cc: Adam Queler <queler+k@gmail.com>
In-Reply-To: <20250715031434.222062-1-queler+k@gmail.com>
References: <20250715031434.222062-1-queler+k@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entries to support HP 15-fb1xxx
Message-Id: <175266088320.17737.3561865903443360061.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 11:14:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 14 Jul 2025 23:14:24 -0400, Adam Queler wrote:
> This model requires an additional detection quirk to
> enable the internal microphone.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI entries to support HP 15-fb1xxx
      commit: 949ddec3728f3a793a13c1c9003028b9b159aefc

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

