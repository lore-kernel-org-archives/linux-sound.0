Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6883839B2;
	Thu, 30 Jul 2026 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426632; cv=none; b=rwvrQzvTGyOciWhhMJKNcTIGAhay3Q6RxmJUJc43mHIb4Oat6J7I615HBjZXd3mB0qQGLIQNcGIVfGnYAnVr1yv3BD+df/Et+ZVINQG4xir+MpaFLALE7jXtZnO9UlNT9k3b9z9OnCRtcfYGn5Fni/zOL/nNki5iF0heFJTIyRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426632; c=relaxed/simple;
	bh=9uy9VkzZ0hSa574Xb46uO/woJbH66fugNFahjFw/+/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PWFNVEM/aNZKYEsYsRntZt17WJbxobjdPzHCcl4m9A8CcW78yEE62gX0QgDacYbh0bflTgHUWmobOPgBWMmnZeTJt1b+Fw/Z/NcBFYxQMcBreN+pSYV41QD8/Mp0eBiWDCQC9xQ+Fwa/pw/FUXQUJrEsiRyWUlXTxy7QDB2jm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS7P4wVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS7P4wVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D431F00A3A;
	Thu, 30 Jul 2026 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426631;
	bh=NqT81aOCgmfdecomTAJFzgY/9INFf+rxtvk0JfOdS9g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OS7P4wVEPcnmxBcafP6NzcGPd5Ga5yVGjt231n8nSEGIT7bZifVl4XSJPvZZ+gMlB
	 v1aDDOoawCi6F6kJrSnBvB2vvplrMnEkhr9CAaTon6HMkfZx+GKU9yqHyBb5xqNTAD
	 5sJwcpuZBBDjZ5GR8wBYtZrMmbHSLYJIee0kf8bmrxbarQljzF04wcCfiqNsp/716g
	 L5sYXOQL93e1Xy8NmD/A32Bx2XfTSkuzNF9+AfTvENgCe6otweqPPa56GTycfNGK5R
	 dBqgPDXAe+utdLMfd5g2BDBMTLtqf/+2MmhnoEQTq8j7uQG1Vn/Ez59gtxIC/+iovt
	 Ayur6aZv9e0PA==
From: Mark Brown <broonie@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, phucduc.bui@gmail.com
Cc: Walker Chen <walker.chen@starfivetech.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260723111014.54071-1-phucduc.bui@gmail.com>
References: <20260723111014.54071-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: starfive: Simplify probe error handling
Message-Id: <178542104727.81171.534925265095460950.b4-ty@b4>
Date: Thu, 30 Jul 2026 15:17:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Thu, 23 Jul 2026 18:10:10 +0700, phucduc.bui@gmail.com wrote:
> ASoC: starfive: Simplify probe error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series cleans up the probe error paths in the StarFive ASoC
> drivers by removing unnecessary goto statements and redundant error
> messages.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: starfive: jh7110-pwmdac: Remove unnecessary goto
      https://git.kernel.org/broonie/sound/c/65ebc8347a9c
[2/4] ASoC: starfive: jh7110-pwmdac: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/db233669245d
[3/4] ASoC: starfive: jh7110_tdm: Remove unnecessary goto
      https://git.kernel.org/broonie/sound/c/de621dacea09
[4/4] ASoC: starfive: jh7110_tdm: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/523c01b12ec1

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

