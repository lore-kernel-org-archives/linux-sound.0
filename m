Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D670715574E
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 22:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742511285; cv=none; b=UwH5pnod1idbkZLmNe0GO3hH49Sw2G3yhgpPeqk9Xy4sQlGAbt1X/uJjqdrlt0Xjexfh4jiJ39Ab5VJCQJUvMk2PWWD6ziWQds8TbbesRJwu6QNJA2Fd0P2jRTRA8DaIjAT+E/bHRqAr2Q9fLfT7hNq0sju6+NuUjn/86DiS9mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742511285; c=relaxed/simple;
	bh=k4JMSu6667/+rSewCNyUafinoVxtlnnGBFil9hK+u/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GhBcQz0VCzhkHsJtQR+yzta83pJlkgnHTyPIHgPzYjPy4ZDrhLuYba4z7dnbY+92wKjz7WmJTJHxecdShLeprCFSpU5oQmHxK2qIr/rWtlMGW1cfXLBTq2vQvC2Ap+5Ur/6RNnyk4XnpuxESqnj4nd3Sa+Ji7YjAklVLs2o63XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhUulynq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhUulynq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14A3C4CEDD;
	Thu, 20 Mar 2025 22:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742511285;
	bh=k4JMSu6667/+rSewCNyUafinoVxtlnnGBFil9hK+u/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nhUulynqtcQEFuIdoPW13zvu7BSe8NQISfVvbAWYISl2e/Eidq4iaY/UDI9Jf6aae
	 rELkQdQIx2rsoJr4VQwTgrIUAhlmn6yRIhBSAsitATmJhvvX/tkDmmM6cKSU5tAcNa
	 Fwa7a5UdhU+jIo1T6acbfpk1iaSfuoJ/3GUtKFLYV0UgEXf9PmfXKc3YFx4XNhUaK3
	 a+g7HEW0Fw4ggyJ5r+GbQb0FRTwj7JO+a0gq7MG4GM/C0GqlvsRzyt/VXOd+CNLnua
	 N2otGdQXF/ycKYKyJGnMpek1W0vMTeLjRkmhpr4dkREsQKimf57/lY+Pyrl1Mu1f5O
	 /QI1yDX6ll2bg==
From: Mark Brown <broonie@kernel.org>
To: mario.limonciello@amd.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, olivier.moysan@foss.st.com, 
 Mario Limonciello <superm1@kernel.org>
Cc: Akshata V Unkal <Akshata.VUnkal@amd.com>, linux-sound@vger.kernel.org
In-Reply-To: <20250319145636.2401680-1-superm1@kernel.org>
References: <20250319145636.2401680-1-superm1@kernel.org>
Subject: Re: [PATCH] ASoC: dmic: Fix NULL pointer dereference
Message-Id: <174251128341.367646.7719546523755965599.b4-ty@kernel.org>
Date: Thu, 20 Mar 2025 22:54:43 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 19 Mar 2025 09:56:31 -0500, Mario Limonciello wrote:
> Regulator support was introduced in commit d3321a20b5111 ("ASoC: dmic: add
> regulator support"). During probe `dmic->vref` is initialized with
> devm_regulator_get_optional() but in the error flow doesn't get cleared in
> the case that PTR_ERR(dmic->vref) is -ENODEV. This leads to the following
> NULL pointer deref.
> 
> ```
> Oops: Oops: 0000 [#1] SMP NOPTI
> CPU: 7 UID: 1000 PID: 1587 Comm: wireplumber Not tainted 6.14.0-rc7-next-20250318 #1 PREEMPT(voluntary)
> RIP: 0010:regulator_enable+0x17/0x70
> RSP: 0018:ffffcc10c1fe7a38 EFLAGS: 00010282
> RAX: ffff8bccc1c25010 RBX: ffffffffffffffed RCX: 0000000000000000
> RDX: 0000000000000002 RSI: ffffcc10c1fe7a38 RDI: ffffffffffffffed
> RBP: ffffcc10c1fe7a68 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff8bcccd51f800
> R13: ffffffffc1086e88 R14: 0000000000000001 R15: 0000000000000001
> FS:  00007f927bc35800(0000) GS:ffff8bd44f09f000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000065 CR3: 00000001332c6000 CR4: 0000000000750ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? show_regs+0x6c/0x80
>  ? __die+0x24/0x80
>  ? page_fault_oops+0x154/0x570
>  ? hrtimer_start_range_ns+0x142/0x4e0
>  ? timerqueue_del+0x31/0x50
>  ? do_user_addr_fault+0x4ac/0x880
>  ? exc_page_fault+0x82/0x1d0
>  ? asm_exc_page_fault+0x27/0x30
>  ? regulator_enable+0x17/0x70
>  ? __schedule+0x491/0x16b0
>  dmic_aif_event+0x82/0xa0 [snd_soc_dmic]
> ```
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dmic: Fix NULL pointer dereference
      commit: 6271b746e40ebaf24dc54be5f4248f5a61618871

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

