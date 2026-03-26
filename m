Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740193F787D;
	Thu, 26 Mar 2026 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542074; cv=none; b=dD8LrzApyOHcNpqd/H/pHJI7LUQsTThyXdaPD6JQpTz0mLOCSPzvnsHV5GKuszRgbn2NytgUURTaCDsD+Y5nfjDdhA46zSgw7czPoztwR+0JAUhJ0ZVzyZm1/HXyghjZOkpJZf6G+tq3eXFrQ3ywwVjTfLQ7Jnw8Ifmrp988lMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542074; c=relaxed/simple;
	bh=eOCyYCSLDoadN76oMwhvAFsw6SQQV2BvFvbDGDtbhng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S21glc/QhmVMCJR+xdn7eW3S4psyREBciTrrHRL7nZZTv4ejKP6H4Hq7Qr0X07NOqAK/1KHFXK0l4xymW2LPbudJInIhMHJx3bZDev+OElH86pZVra9vxRVF++N7b9gRrSeluOpcSQ9ABxjdXrMpp7MtuMFUow46NDD0QCJUm/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evq2OP0Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evq2OP0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF30C2BCB0;
	Thu, 26 Mar 2026 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774542074;
	bh=eOCyYCSLDoadN76oMwhvAFsw6SQQV2BvFvbDGDtbhng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=evq2OP0ZbQ42qW2C/4jcMokU8QDwFqqG7ZGNJQEI7Pn0Da9PBEn/QXXA9YwY98WtB
	 yA0rZY5uUt6lb1xu6x6GU0nxKCkFV9GthUHPyqNKUCjlp/qjchb5HDPTeIdIHXxY0z
	 +sqzDWBcC7BqixYo9SHEtKmpxMbfLF63gpuN6i26bik4SXctLk6nYN/0iAVoc/0edP
	 Uj+3rHbgOGwIcJPjLgF61gyL6bRoY9NBkN9qRpab3jUHaxcvV4rEJcpOo1dWUq6ISj
	 hBzmmt93tSudELhAVk87DHkmqDTR/xs739WoRnnuseWQa+uCKLanxu+A2AtSgNrP9t
	 TQ5J/XK6vzizQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: kees@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260324224530.102164-1-jihed.chaibi.dev@gmail.com>
References: <20260324224530.102164-1-jihed.chaibi.dev@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: mpc5200_dma: Convert to devm_ioremap()
Message-Id: <177453253945.151520.1239444471189921152.b4-ty@b4>
Date: Thu, 26 Mar 2026 13:42:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eOCyYCSLDoadN76oMwhvAFsw6SQQV2BvFvbDGDtbhng=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxVz39CDvP5ZQuGfn0SpxhkpFyk5WtlAOOGdFE
 8XxkMDnJU+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacVc9wAKCRAk1otyXVSH
 0NUyB/4zNNphNDNBy43jgnKZ2ue5eInkQsvpwAyrsHnoeyStDMsXZjjiZf9BL9DjkX6ENIFpwCg
 R+bWJAR1JwP7JYOlseByGrK9x0X+X6fYnE6zCGkmmldir4IgbeRcIJPt03RSBV19wiv9IBIWoYj
 8EFR31trPWymYcN0m+63LylJonW9GwAcIiQqgGx/ZLUcZSlk9huXFuXH2IgmnJnymyGINsC0+3o
 z9+5rkfnAK9l009T0+Cr9ZXTA48nVOQ/1StFg8MZMDrEUJjroO0Wm5lITkUqOquaFRkqgoOAk2o
 qg0N4lMVghTW/SyD4CpqmZuaR+CFvvHaHOD0ttfG6Z4ltwnn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 23:45:30 +0100, Jihed Chaibi wrote:
> ASoC: fsl: mpc5200_dma: Convert to devm_ioremap()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: fsl: mpc5200_dma: Convert to devm_ioremap()
      https://git.kernel.org/broonie/sound/c/3b6f4cfc7152

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

