Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B32400E19
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433669; cv=none; b=VdWFXcsLMQspNIQTKE2wmR59sAIG+k2doSFB1OQL5/ihn3P3b+8Duj/6xfmD+O7UcRH8BoDQDZz5v/uBvj/gceh703yvBm6J+ZfKFHG5AQxpS471kHs9ZmjdUfyb8B53LwmgvnzK2Z2w2ZPotCCVyu9LsWNgHL/VSSE2qmgA/5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433669; c=relaxed/simple;
	bh=c9/nLltMtqv6BL4+pntltBr542j4ifksHZuNTY8p9Q0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MQinuKIXin77UXzGlE6E3Vz689x7UDMt9/hpj9IXMrdMSnXGcOIjZApOLKxcL7n+I+OFUCwJ9U8wEFcYNqfEU428SIaP53OVPWLufrcK3ggHWtwuZUgA4URrBghIFnXB7pzjK+qKkMzvZjKkuwEE2z7tsY+UR07JeOZgK7lNYmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTMt4GsY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTMt4GsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659E11F000E9;
	Thu,  3 Sep 2026 11:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788433667;
	bh=opnJs1NGnlxunljz4jGYliV4+zj9bQ6PKOeSnGWMa1g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TTMt4GsY4R/igqim0LmX/0ZS92ml0w6C6kGadtnI1YKutZI1QaPcG8QQ3MpuAIVm2
	 rU4o5fu36F9ugwwHKYxIYglKSZazBq3iX7OW01LY1X0DYpknOxUZaQwtDM8eQ7ihUQ
	 O/fH1f7TE4xVKo3wDEXiBX4QW9PRAu97VUTfYClJGXYR/f41ViL6drevfekdWq/CF+
	 vMglfeum+w94quXnkZn3ZidJHgsF6wIMRJlXEfmUs+ofm7qSkC32i9ZkkW22AzviDK
	 B57J4CgWS1/Rox2DNOgzfbnTt8Wn/ET7l2ziAQtBxcRXVlFN8EuWEIcKa2O39G538/
	 2Uha1BoJAiY+A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
References: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
Subject: Re: [PATCH v2 0/9] ASoC: ux500: Fix MSP lifecycle, clocking and
 resources
Message-Id: <178835028439.33904.16187219005738622445.b4-ty@b4>
Date: Wed, 02 Sep 2026 12:58:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392; i=broonie@kernel.org;
 h=from:subject:message-id; bh=c9/nLltMtqv6BL4+pntltBr542j4ifksHZuNTY8p9Q0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmVT/91q4Xf3R/Sy27ReG7UbDYxk8xSJKrdCNT
 RE49TqT3+eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaplU/wAKCRAk1otyXVSH
 0GahB/0exkRo7yHLAcVHM9D9tHlDTGxTtRjMFbUuneN1ASVzXDBsYpn3L5sKs21FcR9Ahl37GMO
 vlsS8lukMt8scO8nCg+mwd1ZX9qUboujOEQNKYO1K6uyRYaPztMmRHN/cus/8mE17mrwm0ua5k3
 ehNV2H42KhWnypY1poX9zNsAnkJEH9zxpd2NSVwveBfgs2GkMSFko9ziTCCViak07ADqzpFrIwb
 i3P89w6FaEj8a7x7ICjHjUhv4WQAnp4OS0tzKunj2ul3vcQm85AvN8zx+oxA+MrFnGwXOX3Dja+
 GMQgs6YjWtlN/L4vbf5s77Tm7gb7wwzlqYUExL0T+K95eafD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 02 Sep 2026 09:55:50 +0200, Linus Walleij wrote:
> ASoC: ux500: Fix MSP lifecycle, clocking and resources
> 
> Repair independent correctness problems in the DB8500 multichannel
> serial port driver. The series fixes duplex and repeated-prepare stream
> ownership, error propagation, frame and divider programming, FIFO
> watermarks, DAI validation, reset handling, and MMIO resource ownership.
> It also removes obsolete PRCMU QoS calls which are unconditional stubs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/9] ASoC: ux500: Fix MSP stream lifecycle handling
      https://git.kernel.org/broonie/sound/c/c37ba8fe00f2
[2/9] ASoC: ux500: Propagate MSP setup errors
      https://git.kernel.org/broonie/sound/c/3415421a2b0b
[3/9] ASoC: ux500: Correct MSP frame and bit clock setup
      https://git.kernel.org/broonie/sound/c/94c18cea657c
[4/9] ASoC: ux500: Validate MSP DAI configuration
      https://git.kernel.org/broonie/sound/c/9ccbacf5a012
[5/9] ASoC: ux500: Deassert the MSP reset during probe
      https://git.kernel.org/broonie/sound/c/66ec63e7a90b
[6/9] ASoC: ux500: Request the MSP MMIO resource
      https://git.kernel.org/broonie/sound/c/4fb67925f33a
[7/9] ASoC: ux500: Remove obsolete PRCMU QoS calls
      https://git.kernel.org/broonie/sound/c/7b819677b503
[8/9] ASoC: ux500: Allow repeated MSP prepare calls
      https://git.kernel.org/broonie/sound/c/dc1a1b1e2206
[9/9] ASoC: ux500: Program the MSP FIFO watermarks
      https://git.kernel.org/broonie/sound/c/2519439b4b5f

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

