Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9FC408628;
	Tue, 30 Jun 2026 11:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818271; cv=none; b=YLcntrJaXo1vDECpBYvqN40Hrw6jpDCLpiNYpyLUhfXu/+HQlm0gB9HZExCQ4wXp1+zxIdzBT0lCsqCPLypkyXzVx9VeJBluphgZMepJSPug2iEiw7ibHHD93fdwQCU7WDO8bwWJ3AWkrqJg2gmUefdW6nQ5gDEKlfU9g7YBsbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818271; c=relaxed/simple;
	bh=LVLBp4pppIdlwmG1k7BU7ysYpJfif9BXRNzg+h+3kmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i+GC3sEUUzMGzmMg2MAJmEtzXAZxMN964dmEj6FF7TXnG3S5ecCO8K1YXiL9ibe0Q4X3s3lrC11Yx0t3TNNusdWgdgKTAg0iTsTlFmRY1Onmlw59UK0bxNVF7519xYePKBGU423QUUeBOiwSKWVZLBmaPLiJyxHdACi2kiOT0r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfJ1JuqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfJ1JuqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1D71F000E9;
	Tue, 30 Jun 2026 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818269;
	bh=F6rHcvZpgYkYTHTQ7xa3MWpWW1ro3ZT1yid6kKIHIgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UfJ1JuqPyNT2hDSQ3d/17xAhXLsd24ohmdwRJj71qB2oVt7a2v05q0g8DXiSOmbVz
	 yVJedvphOFfzfBHC9+i15rSm5p/+2vauK+FDhZO1FTyXx3bn+I1/APjtk9hOzxZFk9
	 48PRjSOpHFpmc2QzgrzZJpFYhAa5knB7WxQl88aI1o0buJ0paS+Kq/zfhbKL7pD9s9
	 FvI9I9kcIHnx/5wfiD6YRF+8fbCaQv+nNDsZeM2wyxskmG/Z6P+bpVi0WABj+7eYVK
	 f1LChOc109IKblkaYr9O3a+7W41XtRJkoYfxBdwRih1EhHmwfAMmgD9CLmENFHxE04
	 G3IPar+vIfW0A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 ckeepax@opensource.cirrus.com, sammiee5311@gmail.com, 
 kuninori.morimoto.gx@renesas.com, Haoxiang Li <haoxiang_li2024@163.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260622151127.1198196-1-haoxiang_li2024@163.com>
References: <20260622151127.1198196-1-haoxiang_li2024@163.com>
Subject: Re: [PATCH] ASoC: hdac_hdmi: Fix resource cleanup on probe failure
Message-Id: <178275564366.47562.3041542458993598060.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:54:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LVLBp4pppIdlwmG1k7BU7ysYpJfif9BXRNzg+h+3kmw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6XbEZr3KbTz/CTgN9GzKJuaUy8etX8JLGtEI
 QDugH0AiC2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOl2wAKCRAk1otyXVSH
 0Md3B/sGLPi1XOV5BWb3j64WmmLo0SjEusssDd46/gABQ54pog+P3itnkUHsy3kzYz1vQkG1PoU
 zELCU5zN2QSAmzLG27KwoGk4hWSbmp6GFnia3VSB9rrDNaznrj/dIEXztQi3e44NMAx19PPVyNh
 eMoVEOLSZT2AGrBbgEg+cl5ZJI0uDGAYuNkEZ73YSgofy6UTZR02e8Y8ztB2MjZ64Fp0WZ6xDzK
 +AG+UO7ai3xgOJrZaFi4xa5mqn3RarKkqtzZsTGqyiqTNS22B08IZQM1ZFJD87CGcVf/yyA1zpk
 QGrhD4+H3pyse3kCoTNxV57MpQ6LFZPcUOziaFmQJ0fk4l/k
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 22 Jun 2026 23:11:27 +0800, Haoxiang Li wrote:
> ASoC: hdac_hdmi: Fix resource cleanup on probe failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: hdac_hdmi: Fix resource cleanup on probe failure
      https://git.kernel.org/broonie/sound/c/785903b7770f

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

