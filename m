Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF7211278
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 20:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231228; cv=none; b=KuXjhkYd2BK939mmFEjOOwh2g5jd/g2rJ5NyUeZTdZMXsi0Xx7gQS240vvNkyiH915Fgtl6OjMwReZdWQzI4Ypk3QqO2qXlJfSpBKSnpKmbCxZIF2EB9HfLdcmbuBH90+dKxabXDxupHpgtSa/0/ebseE1vnCdHjoHb8ckf0OJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231228; c=relaxed/simple;
	bh=ZHx9ZOsZPH1wEDUNDJRhKGdOiwZxR9kjDB3R0K9DkcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jezZfkpJPFqEJrn1rFAMOYkw4wzVNlmevb0iSest6a/7yUGlApMCENzJwy5efb9CWGAEQwQw6rEh0yw9VNwZjlHjGeOWrV38v5EvRd3hFDJyFCRzgRDxKPhc6uMtZxfD0S3xYeu3IwjW+womkqfh4WMc8NAOWBBlIu7gr0Qmyh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc40DJ/0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc40DJ/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F063EC4CEE9;
	Wed,  9 Apr 2025 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231227;
	bh=ZHx9ZOsZPH1wEDUNDJRhKGdOiwZxR9kjDB3R0K9DkcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jc40DJ/0kw0cRs5KFW1hz9E2gxLRir+s1zxLKUtXODLUpLKAUPHDzY/4OIvHnD13y
	 IC0KP6QQb1f6QfnAVZYYCAMvlr5U1x0it7Gm9UwJ2+yPzEF6TquL1yhikDx2LNB97X
	 shWsFszXjpH3lf9UPa0eW8DIlu04xgcTvSrQ+V+F6GI/T7QTMzOQ+385vU3JOzR5NH
	 6Wnkjh+BkuL1Th84tW9fBANHulcLaiEz8iGj5I74cy3unJY/Y5Rm8tcqzRgUhwN4I4
	 I0rx/zD6fdZcviOGgXLta/2KOYqPnZDQU/hzi+ts11QXacjJs/xycCw1wGf0lyIv4I
	 uUjH3NzXH4OJA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250409120717.1294528-1-ckeepax@opensource.cirrus.com>
References: <20250409120717.1294528-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Reset clamp override on jack removal
Message-Id: <174423122672.1545843.17159362829530554270.b4-ty@kernel.org>
Date: Wed, 09 Apr 2025 21:40:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 09 Apr 2025 13:07:17 +0100, Charles Keepax wrote:
> Some of the manually selected jack configurations will disable the
> headphone clamp override. Restore this on jack removal, such that
> the state is consistent for a new insert.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Reset clamp override on jack removal
      commit: 5fc7d2b5cab47f2ac712f689140b1fed978fb91c

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

