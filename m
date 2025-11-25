Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB3A95E;
	Tue, 25 Nov 2025 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085084; cv=none; b=bTVPOugf19RhN1cTk9cuyblYKw8FP7w14ECabCyPhRjGD1g1uYgLsv5RodbSvTpBe7+Gcg/m4NEPRso0hAJE72efRR7t6GAoLU18R/og1zBNlt3NuX0++jVXofccJ3Ed9ZzwL1dFAlmD9BDDGS6a9mztgTN6bD3MAnv+ja0v4ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085084; c=relaxed/simple;
	bh=ey4o7udoaNIGyRI7ELmULlxu5Bl4Sxahey53FLIjqPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nWhVFaKobY6TZLjAqsyXyCIyvo7DWo4gdAPeZw2ZCvhmFoP95TmgBa6m6wSiidEeyIJuVp6pBm/xK4RS/0xh9jUk5NsqWkQvRW2MG+atWg1PRE8nvScizs07C6jA0ptzEXo8T+w7UIysTPu1Y5O3CrkyMbVYzsZ/3OKXyFOrMUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRNgAwaB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRNgAwaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20A8C19423;
	Tue, 25 Nov 2025 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764085083;
	bh=ey4o7udoaNIGyRI7ELmULlxu5Bl4Sxahey53FLIjqPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cRNgAwaBWFDMWPaXeXHmw6EDEMYmzs+XORllUPomlXA4stRbw4bdJFm/pobvNxq/9
	 WyGhYMdWcCmT9BHQ6BRxkRg/HiS2bwWjP3DiYfjeb0MNGLvKWzWa/fJwoNQAnETkzd
	 gVB5Pg4LaEqeSFKVBKsQ/tNPkdPsGUwGkhijfNC9c3JDMJJ1FESH5EvwuVS6BXJeLc
	 uWhAfD/U4nrPmP61wKfCkIuoQ787ku8ThFB/WDHXJDxzIp1UOGFKGvgHa61mTo3tWp
	 WqfAHFjc+AizZSEXOmYsTnDKazc3/mgIEaOJ5CjE1/7IleNaj0rAJXDwhrerXWcxHo
	 RxSjLdAO45Ixg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251124162016.30446-1-rf@opensource.cirrus.com>
References: <20251124162016.30446-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib: Remove redundant calls to
 kunit_deactivate_static_stub()
Message-Id: <176408508246.37186.18259443250858075461.b4-ty@kernel.org>
Date: Tue, 25 Nov 2025 15:38:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 24 Nov 2025 16:20:16 +0000, Richard Fitzgerald wrote:
> KUnit automatically deactivates stubs when a test case exits, so there
> is no need to explicitly call kunit_deactivate_static_stub() in every
> test function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib: Remove redundant calls to kunit_deactivate_static_stub()
      commit: a13744f628c61a450f650442a118405242ac0db0

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

