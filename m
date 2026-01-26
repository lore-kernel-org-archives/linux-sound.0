Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CDC25A33A;
	Mon, 26 Jan 2026 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769453139; cv=none; b=RipzG3sSmDSHKj3YI04GdYjs8Gz90fkB5Bnw0x6dRbIzlLZd92KYl29JppA2Na8ADLqS9zHo8OmifScXu+XPQK2cj4k+g2IGa6S8fEB4xYRS3XWdKNytVKxYbIng25eFIHk+QgFL0lnNi4t1R4u1LLHEcMDO3RB5BIcKuDP7ZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769453139; c=relaxed/simple;
	bh=TVu+ugucK87dBHPV0OXlqnSninibDFVdz6aQPn46UAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Yd0k9izdOm9HbGmho1/HcxdRcYHWSlTndFgvP+n4BGL0PsIlUNeJyTBnCzZyfM3++zFHJrZXJHDGuJXqaxL7S+N0XsXiDeFt6Im8bfqet8GuB9DUa0A/YeaYFG4EEc32UL0uJJxGVSO8qm6CdlLG+U8qavl7khRevJ3NBzEivuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVscJieM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVscJieM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C489C116C6;
	Mon, 26 Jan 2026 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769453139;
	bh=TVu+ugucK87dBHPV0OXlqnSninibDFVdz6aQPn46UAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cVscJieMrA9v7y5yG10c11iXh5ZZzIKQCqh+sUcHHLtnCz2kZtr3BIsqOV8EehBXi
	 JHwRSD93CoMVljjiFzUav7E8J9F/YTZSjPxbBeecWPva/fZOPgb8JxgQT3PHGvIVtm
	 MlIe3yrumeXYwvk6v69Qtlb05F7gVoXTa6DcBRn9wVKS4WvRtuwmY1S9tBTJk4ERVg
	 GGe9Mp/oH8XXiDJuXCJC8dFowsAOVK0AJTyyPrrchBA6yi6u7WjnhJyBHckWZqDWr2
	 0AFl0MbXTJZRQihbClPAEE0xRzepzip2nSqJDEfEIq8lApETZGvCTm+FR2bQYvGge9
	 aFO6yAEvX+ugA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260123111354.1931986-1-rf@opensource.cirrus.com>
References: <20260123111354.1931986-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56-test: Fix missing module namespace
 import
Message-Id: <176945313797.769345.17717506163508689826.b4-ty@kernel.org>
Date: Mon, 26 Jan 2026 18:45:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 23 Jan 2026 11:13:54 +0000, Richard Fitzgerald wrote:
> The test must import namespace "EXPORTED_FOR_KUNIT_TESTING".
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56-test: Fix missing module namespace import
      commit: 74120bc29856509c585c38dbe963801ecdabac46

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

