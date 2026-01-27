Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573771CAA68;
	Tue, 27 Jan 2026 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515742; cv=none; b=Mr01qRIwkVtah8lS1FLojSWjcCmbyO/X3frgpjUND07iv8ULpP7uIRKDWftsWZo0Hp9+hJcvg2G5Y+SEtquzY4claxUC5lntbgy52d6T+sh0hj1jJ00Tr+9rEN0Xp5cy3KvzMOVMPTtxgt+5/x7uRXMWC/edQiHYaxMT3tlQ1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515742; c=relaxed/simple;
	bh=SuzlVlg+ggZcSqpI7hmAJeTSuPsvplvDDTMa0ieIzxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MN0Hb3aU3x/TVJWJGNnWzHTPHRV5ZtR+Ft3T0kGEkmdVdsOvoSupBVoQN46E/wy+8ZzCpXNWHSdu17/UtVrC9auXC9Mp7IeOj3UBhmi269dEGBltILYhAOrlQFgoRjqIypElcqagXanYVHDuJlILoVm3Bh5n2jZJlfDlX8Wk73c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chIMduis; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chIMduis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16767C116C6;
	Tue, 27 Jan 2026 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769515741;
	bh=SuzlVlg+ggZcSqpI7hmAJeTSuPsvplvDDTMa0ieIzxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=chIMduislS1qsRRfDdZTh0VKh5PJaaxqQV3lbkF3o75DVlE6MakenXP0w30SgrPzF
	 7rGYbPwM+Tk7drwxY8vpUSSuTaVd8Om+ydBwt1pyOityiVCxaB4ArZuiY2RvimORMb
	 nBQ/8J/s+hvpePTc986mWye7vMIifRDhYX51IAfzckBHn3IKkHzGWhyIL2C9r/y5+I
	 P7DdPJMWvTOBH47YdgKw4miam7WsvijUAoIs4FekLr6Q5LVftVGCikVLSLiDyC8sBM
	 t76v/+utxekQzLm0xPgWqWOcaIH7gYMFXeDNCr6mNO9PgLjIEKt2/LQWvcxGlYzUXt
	 LhIijp4AfZ40g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260126073528.1826406-1-nichen@iscas.ac.cn>
References: <20260126073528.1826406-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wm8731: Remove unnecessary NULL check
 before clk_prepare_enable/clk_disable_unprepare
Message-Id: <176951573980.80702.2468336338207061829.b4-ty@kernel.org>
Date: Tue, 27 Jan 2026 12:08:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 26 Jan 2026 15:35:28 +0800, Chen Ni wrote:
> clk_prepare_enable() and clk_disable_unprepare() already checked NULL
> clock parameter.
> Remove unneeded NULL check for wm8731->mclk here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wm8731: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
      commit: 87ee3f05bfe2f5955c2c77ae26a1be236fd615a5

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

