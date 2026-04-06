Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717845B21A
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488654; cv=none; b=FJfB5MBkn36QmQZDRv2+rniHZUS3dXjSBB+GWkOlzJuxbTwc2uYLHUimqV+NYiRPFz28gDU1NKeLY62NJWJZJVMH6YAmZ0jwIqNTT2GcUnPZPAZIlJp7Po//6u1UmXQ1UfYuGpdF7jRbl6NH8u0u5MzZOwS8sP9xOeyu+eTM7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488654; c=relaxed/simple;
	bh=OmJXcRAxUebf7HOR35NrjsEnfybE749vs5w6RDuZspU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ooJMVVHp3omR2nSus/pCl8FcSKulEkYgGqJCPi50yvQ7Bx/rxCKvgAecQXjF3eVcnkQjBaF9vlXbkkR6Nmh0534mw4Wy5+NeemTg2iNGtjvnThyTnhp9A1XDbIE3X7Dms0g7T6wCvvc7KOx41VrVDJc+2WCBXpmR4GmdbZCUHj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIDRHGC9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIDRHGC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECD0C4CEF7;
	Mon,  6 Apr 2026 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488654;
	bh=OmJXcRAxUebf7HOR35NrjsEnfybE749vs5w6RDuZspU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RIDRHGC9gVhZgs19AH+Gy1uqlkwz4QLE73+hS2AEkWXNavfVCORJKlLgZVpM8Jg/a
	 sLbMCEapKyeU+8OovxrzRyisIwHSfoi8NXUROP/IrWYhHrZ87Um/J9Qi5qQhAKN94N
	 oYvrtFH/mFmjCLeazLVONDbxEfRdPyoZZAs3qmxN8vPwTcPUeUVm2jXGupugRmgGXu
	 CTlFHl44/+F6TtcbUGQFE1xP64ZDCY9EdkqIHfFIlOFA+oJwp624ssBBfYA8fIaLsu
	 c2Pgtz1AvUob+9BStcGla/ql0QwbT0cx6DjPDu009BmkPCXbvSemFymPu1aO318Etf
	 jyV+8LAuFI3Mg==
From: Mark Brown <broonie@kernel.org>
To: gaggery.tsai@intel.com, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260316141449.2950215-1-ckeepax@opensource.cirrus.com>
References: <20260316141449.2950215-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Fix errors in IRQ cleanup
Message-Id: <177548865251.270504.13808859362022770053.b4-ty@b4>
Date: Mon, 06 Apr 2026 16:17:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696

On Mon, 16 Mar 2026 14:14:49 +0000, Charles Keepax wrote:
> IRQs are enabled through sdca_irq_populate() from component probe
> using devm_request_threaded_irq(), this however means the IRQs can
> persist if the sound card is torn down. Some of the IRQ handlers
> store references to the card and the kcontrols which can then
> fail. Some detail of the crash was explained in [1].
> 
> Generally it is not advised to use devm outside of bus probe, so
> the code is updated to not use devm. The IRQ requests are not moved
> to bus probe time as it makes passing the snd_soc_component into
> the IRQs very awkward and would the require a second step once the
> component is available, so it is simpler to just register the IRQs
> at this point, even though that necessitates some manual cleanup.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Fix errors in IRQ cleanup
      https://git.kernel.org/broonie/misc/c/4e53116437e9

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

