Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B941228D;
	Thu, 30 Jul 2026 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410700; cv=none; b=REcW0XeZ/SHLTASgsr7LwR3ksF2JQJE0wGWOfPgNZZLz2styCUlcnjyRC1h/bjCvGbADug5DRhorcMWYMg/UcrwYNQ+QidMYeXOKehzPo1Ma6okMr6qqmdI4ylp/L9gWzNO1RGrs4WMezL31cl3daDnoBEloo0nxKUdZ0ZdkH8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410700; c=relaxed/simple;
	bh=ThjFbz2St7jBJklYKS3R8Yu4EDv+ErJLcvkT2uYA13I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MC8Xh0uD61pxK2f8kXhF62YxOJ4nEVuXeexuArufP+AoFkDcn7rrEgcp2pBiNdJc7v9DUZUhi1+xYP9+EWlJhg6uCfdZ0jAmwyoPFuFw7mK0XPpOOhg/sVv9pMdBvU7tjZCqn7WGLu155HO8hLS8aCYYVWXWgCBwhemXFtPOdx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUhql3J8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUhql3J8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C4B1F000E9;
	Thu, 30 Jul 2026 11:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785410697;
	bh=dt+FXGWFIEzgO+ClMjt9YfPcV9DOi/u02A48Tw/3Mm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SUhql3J8fBBBn6L607bRdoYzNN2sUdLGdrrWbzt0zntMztCwDk1C0ZP59jtXD+D3K
	 WZsficsVFKmounEhXIrPy6wg+sZWTEM50/qg+nAvwLlauaTtmhXPLVkzpk7B2zgTcn
	 a0oxMGcExjCITTPcfoEBQQFfnl8uonfvdV+8VXKfRGRHIF1irDeShaWJYYQnnjw7eI
	 7QbetxWpWDM4qYHXu8ZHhehvKZHbafTJzRxzizLaGpFKuWmT0xeV4oKNt0PHEyvIOH
	 PmUnb+WdCpH13DR9SSmZJgSpclKhOPMnt7gxx9YEUZaNei03boeote5eKsRmR2WaHa
	 kdlnLjn5xNBzA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
References: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/7] ASoC: tlv320aic32x4: remove global header with
 platform data
Message-Id: <178536708832.512962.16989517096972593686.b4-ty@b4>
Date: Thu, 30 Jul 2026 00:18:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Sat, 25 Jul 2026 18:05:11 -0700, Dmitry Torokhov wrote:
> ASoC: tlv320aic32x4: remove global header with platform data

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/7] ASoC: tlv320aic32x4: remove global header with platform data
      https://git.kernel.org/broonie/sound/c/3906ea776a08
[2/7] ASoC: tlv320aic32x4: do not allocate gpio config separately
      https://git.kernel.org/broonie/sound/c/5143ae134636
[3/7] ASoC: tlv320aic32x4: consolidate programming functions
      https://git.kernel.org/broonie/sound/c/4ef61518b03d
[4/7] ASoC: tlv320aic32x4: move regmap_config into i2c and spi drivers
      https://git.kernel.org/broonie/sound/c/2ba6a4dba620
[5/7] ASoC: tlv320aic32x4: do not make clocks bulk data static
      https://git.kernel.org/broonie/sound/c/dfefa7dc25ee
[6/7] ASoC: tlv320aic32x4: factor out rate configuration helper
      https://git.kernel.org/broonie/sound/c/e86ba7c5f24f
[7/7] ASoC: tlv320aic32x4: clean up driver code formatting and logging
      https://git.kernel.org/broonie/sound/c/c3ac0aa6c310

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

