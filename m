Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0099D1ACEAF
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879438; cv=none; b=IbqS/tQvvCch05efNKGhUk8+QBLYdyZzJ+6ih5gPvYZRX6Dp9ghyHEtst6ilzXVnb5IFUCpFaDoz1Hj0/0fjb3sxojMt/fFUxLhfhglbf9YukKumyKdnZMbXDKvsyh5E2aiNQDpqxzKSReyhL4xbm4BvjArUSWPPeAK8KIN8HC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879438; c=relaxed/simple;
	bh=EKGrF30VCV77uh0BMZxdUZbTDiLS0DLbNN919Li68/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T7qUok4fQoW19J6gdhQ6SUjSHr5MCTM7bxf2IF4j8WQ55zEcycQrrNcSl1IYH8o8eCZlA4pbmiDSvCUMFqKdhG108d9ttp+HVm9sbRxASjZ8K8FPAtqCacABC3iX9o58c7JmCZKlcRWLGj2aCX4T5rbecuxzVVCfrRogivKZGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qF8GpOCy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qF8GpOCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4D1C4CEEB;
	Mon,  2 Jun 2025 15:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748879437;
	bh=EKGrF30VCV77uh0BMZxdUZbTDiLS0DLbNN919Li68/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qF8GpOCyEZKSU9PWqXwF/lwwIFlf0fEZSzlP94buPeubx48lBgaF7m22SAUNMHsxt
	 zxifmeoZh7tMqWXlKM78Qsc0HgkknZOPBK50RJ045rxEYthnHecl8u6zUQuSxqQK4m
	 KTOdzIIwPhibELC6DWn60EjBnO9NqVbvRLE+/2wowVJ6XKnUB5XpYALP9LTqRDSR8g
	 Mq9vO8bfpKWX/zvAc9DO/QFf6cyH394hAMCv0kS7qoEL0QwEUlXou1xdHtW00dqMHh
	 /CcHg5garjMj45nPlqUtEkHTAGLXOQgQmqnF/S/fS5lqb29K29Tg3Vxj1W/j0xjjzm
	 FYKoyNIaCA/ZA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20250602085851.4081886-1-shumingf@realtek.com>
References: <20250602085851.4081886-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: fix speaker noise when volume bar is
 100%
Message-Id: <174887943603.88031.2296324167879703993.b4-ty@kernel.org>
Date: Mon, 02 Jun 2025 16:50:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 02 Jun 2025 16:58:51 +0800, shumingf@realtek.com wrote:
> This patch updates the settings to fix the speaker noise.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: fix speaker noise when volume bar is 100%
      commit: 9adf2de86611ac108d07e769a699556d87f052e2

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

