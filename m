Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB9C431A41;
	Fri,  7 Aug 2026 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101815; cv=none; b=YHH3VI8++mHUYgoX6pqLvUP46eEeJH5CdvCSHktKv/ZsR7wVPpqZOiQ3lVsNUbAFbDsJYrxmQoZFFU+P1wIlZVfnR0J9UtfRLxIx53khlbS9WaDIXtt4vTav1Bn4SGAYOjNQFl9p3OPP2Iib0Zu6E6x6FR/zdxoR04n4nPSonDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101815; c=relaxed/simple;
	bh=ZtKgrTVNjrMucm1azeTrEuWm+KHzluo3o1Z2D+B2ZSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qNaLwIfuZY+3jQ9ZYibyTPXPMfxn98/CGQv1vS4xBQ5G/bShs83N2BMWhtuzcvfYXqmmvXkZLdOTCSCQptADhMgLDeO5LpKWqkHYTeIpMpCpg79ygzYLtqqE2GCZzoi8yEiraLBrHwLd4xRq5zetLpfPCW3+EbK/KFzMsyypjlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoYGz25T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoYGz25T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018711F00A3A;
	Fri,  7 Aug 2026 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786101811;
	bh=Um34j4uf2ir//B+mkCj+DjA2ieMhJJj3lLlzlCCUQVw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OoYGz25Tlz0PwrsGwLUA6VSE70tr8hZCp7qlTKGoGca/BYwVIbNHie4EnsonR9Dlk
	 vDoupTEFdT8PsiUv6yuqz1g5kF8gpLQL5zPRrrezlQ3UTmO9upeJETD1/QuYMetqEi
	 4zF2TWtqn/L/1VosP2rvGagfX+vlZnbrP3MWC9o7lj03w01LZGAaxuhv2a4F2+5VZ2
	 LcipiVOkOhSERMiiUbD8lpPTeOdiQOBVF5c6BqA8VcADrI8bWG6ne38RqS1dgOEyuR
	 SVd9tZeQMU8ShZ0LuNE2PqOL3ocgkdG6dEucXPtIynj4EQdTrO81mnlygYkh3uYZDg
	 H9ogwgQEb8EjQ==
From: Mark Brown <broonie@kernel.org>
To: Chen Wang <chen.wang@linux.dev>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Inochi Amaoto <inochiama@gmail.com>, stavinsky@gmail.com, 
 sophgo@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803061605.35485-1-phucduc.bui@gmail.com>
References: <20260803061605.35485-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sophgo: Drop redundant error messages
Message-Id: <178604047116.110757.6902503041163949810.b4-ty@b4>
Date: Thu, 06 Aug 2026 19:21:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZtKgrTVNjrMucm1azeTrEuWm+KHzluo3o1Z2D+B2ZSM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqdcAwhWTZdNvzL3cu3NH1Lf2xLrGBqT8OPQKa0
 d0VFYXn8aqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanXAMAAKCRAk1otyXVSH
 0JjhB/9xmYiwHC49+6xpnMDqKjmpzs2mpeuymBqQuG5RQLEuuXXwXWFhs44n4tquSXSV/c3jYsR
 MMqO7vK5TJnm+nwW6YZR8ed4XNIH9AvDiwmBaaVp8pVG1ivCnxw4MExM+PHCMy/BrezbU0zvu+c
 n9lgLr7kTTxMheCqBmuySikk7GYe/3z1zoTytN4HMCzNYtoOI/3dI80IhLx03I0MsbKDEi2J3+5
 hOc/9VVS76sHx9b/cp8Cs0kYsec1kyCyHWqJbUcCLm0m74fqZvPNGFh5UqQIRzfNxdMs1W1wwdy
 kgahiuNagnWfokjuXEewSZM+Xcf2zDXg+XaS6xDuJ72Qkm9/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 03 Aug 2026 13:16:04 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sophgo: Drop redundant error messages

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: sophgo: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/85665ff342c7
[2/2] ASoC: sophgo: remove unneeded devm_kmemdup() for DAI driver
      https://git.kernel.org/broonie/sound/c/6d0451f9bf1a

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

