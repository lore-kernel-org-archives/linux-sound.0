Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B2D2E06D2;
	Tue,  5 May 2026 01:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943355; cv=none; b=H4J4m6GFcWQVe0xetdaVtYVkM2nwuYdW3XXLbr/4LjhA6AG6JmqWr9EC2Z4yCX1wzEDb3ALAYn0jPwaQmIfMDLBTVO53p0XucgEKxmH+LwTFjI8G1LcxYonBuuVS9xcpLmdluEqb7ehLxoEvdg1dx37YcnSbYsuc4Rt9N8GoGJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943355; c=relaxed/simple;
	bh=TeSV8bWWTopP12+hFvSE0mwWYelozELgr8bBCkiqnUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EZYOaKG+lwZOxg22ZoKNVcHz5nElvSZy3cHfm01j1aW1aiaDvYi4YFy+XxNRQ3HTjejVTycrytUI5VMwq+QmCzxFRCfj1BUnqOPr7Bs73fnZvU3OL+nnm3Q1n+Cd7+qyht9F4X4OF+NCYWwjifOrIYGmFb/BvcRKDgevdAqCRWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9SwOqJV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9SwOqJV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F031C2BCB9;
	Tue,  5 May 2026 01:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943354;
	bh=TeSV8bWWTopP12+hFvSE0mwWYelozELgr8bBCkiqnUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p9SwOqJVpVMq18ONQX4RNAoiXXLDYkYVfvUbQ0eKWOXaGrP/+b1zT6HPTxJtm+mhE
	 Yh7A3anwNEZRxkTyKCqIMRnPaCJkusxVqtYjr149ZKszDpHrD/r4SZ0e4MJU+lQ0oo
	 JmRgtnNMz0VuBatn9KZYWpQu0Qho1AQ8Vv+jDVl5Vg9UnfgCagXOCVhcn01bBMe2l1
	 7vWdBab8Dk5aTZu9SOn2cNrUB5ve6KO0i9vR/F/UehooX+evPC6cQ5x7uaBWjw2xVg
	 VreN7sr8hxgh2Onep/J1CQhh+M765yiRFPKvSC0BPbj9jcikdKKUU/dwtX69NwGPaO
	 tbmEPO98EsMlQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260429075221.73989-1-phucduc.bui@gmail.com>
References: <20260429075221.73989-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: ux500: Use guard() for mutex locks
Message-Id: <177789974553.458539.12917311861185775185.b4-ty@b4>
Date: Mon, 04 May 2026 22:02:25 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TeSV8bWWTopP12+hFvSE0mwWYelozELgr8bBCkiqnUc=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBp+UM4mPitfLFAyNqa7ezJL99rq6AqUQ6lXbgrb
 IZXUKlHzKCJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDOAAKCRAk1otyXVSH
 0EUeB/iH8mYX/+EKnCgM8jMbsMuC6YnfvbHm9nxdekiJIsN/ouY6vtcS79EehapIvjeSix1JN0H
 SvZwCgHnzkqeNUhtENRCtvr5Bcz+f2ItK0RicTwgGmuUuWW5AF5P0bAuKq91xjJgE1M2sZNAmbe
 h/S7cr+h51iY7DM2+B+ACLsVWhxtyjqzAklCTzHsCX7cA0RWAusveepPhQI3A9f5h4E7LcT/FJb
 wP0O6EgztyBSnJJpWDFXoG79w0fYdym74GMZIw5qbX91jOyS31RfjytGI26b0z/XM0vaIwvshP4
 KHZO5iDD38bCB9ekGFhuqVhYxUec4I8tXBDPqI4j98IUSXQ=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 29 Apr 2026 14:52:21 +0700, phucduc.bui@gmail.com wrote:
> ASoC: ux500: Use guard() for mutex locks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: ux500: Use guard() for mutex locks
      https://git.kernel.org/broonie/sound/c/fca2abdf1dd7

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

