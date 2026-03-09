Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC18410D1F;
	Mon,  9 Mar 2026 19:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085559; cv=none; b=eepPW0NgtGI5RMp4U3iEcOsoDTLUBG8H+VG2L1uUqQO7TjidLUl3EJfQ2WGItDkRSxtcwvcR4oVEgEhaNddxFNCYeY5JEWeOJUTZTI4JxZnrZmQ5OF5OuYOJuEaIIa0duUSWxBry2rWUrTDTBcXbot8gXMaqtYi4ixMy6QwxIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085559; c=relaxed/simple;
	bh=EKI1CQqiByYg164SvwZHtvPG0izGw0jMi1oet4qM1Nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C5zZ8i0Tq6vXjJKlZiSzGn3qhhBnCQFrTXoPhixSNcaAUhmdtFsFUB0Y/+EQWhTeySOkSJJSdELwVTkwoaiCF/1X915PPAwqGnBqEx0zQh/G7oC3iYd559MSFfzgNvT8b8KTWu+kmHVSJ6QAJ/S6eC1E9pMYpIrapmVOPnAtxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjPT2IJb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjPT2IJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFC3C2BCAF;
	Mon,  9 Mar 2026 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085559;
	bh=EKI1CQqiByYg164SvwZHtvPG0izGw0jMi1oet4qM1Nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qjPT2IJb782kL39mzHNecM+2xl5rbvYHznNnMswX2lEdOQB+4vNfQYHOyWt8E2C/0
	 QUyHef5EgDCCpuMvLqrr2R/iAk1djBKnG1/uKjoFyZp5kBPgDrqUyP9/yNqdgEgGFV
	 VSti2e8AnWGOCniJlJHles9505NUB8alN7RQhK9XWUu3JwC8PyI8Gr7bvgJWoJ4qJ+
	 XTfZqxhSPLObsRAEB/yD0s6bQuNxtn+XZNTjlEdJONvI//Mlny3NsFpEgpFkRmC3zx
	 BdR1sMu3QmmbMOMw4CNhZ/xeLKfvEaLoOeNROgoOOHvNnZTLK3JbdPCYyGzPyCYYrC
	 7ogLGl/jwcP5g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260309124543.1135247-1-rf@opensource.cirrus.com>
References: <20260309124543.1135247-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Put OTP register defines in correct
 address order
Message-Id: <177308555792.265787.13390995977245366691.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 19:45:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Mon, 09 Mar 2026 12:45:43 +0000, Richard Fitzgerald wrote:
> Move the defines for the OTP registers to keep the register defines in
> order of increasing address.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Put OTP register defines in correct address order
      commit: 97af961568c8682c44506c9ad4b26c8a5455ec1d

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

