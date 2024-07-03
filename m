Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40CE17967E
	for <linux-sound@vger.kernel.org>; Wed,  3 Jul 2024 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720015629; cv=none; b=uSNnKfPfTB3iym8vF5gr/ougyX/wSqtUC/0W++De+InK88EA+AcixjWQgdxJqSC6tEiPFtWKoDx7ApJzjtPFmKWaxLGtg35rpcU9OmxJacuxYbsHq5LO71KU7AmK3zoZfwZF9PONdWlPK5xK2QicRS8M0IO26jZXTwGrDm/T1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720015629; c=relaxed/simple;
	bh=5DhfcaWdbscV9eVjCMxqQ0SHqE/XTq/XxrzXAOpPDSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nPIhuf4114JjMzQitLVcoLMqr23hchNhaC4u/lWOaiJ4fWnNqlP2tIvf9tDsuzVQ4KRLancLnEyaJ1Yuz18h4iJcuUVCvuvaXdNqj/j35nVyMTo5ApR2azouSiw1ZLW3cMwB6zaDuj5E1snktloK3tEjeQwkQop8G8XpG0sGnLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eL9+4/ym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eL9+4/ym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259DCC2BD10;
	Wed,  3 Jul 2024 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720015628;
	bh=5DhfcaWdbscV9eVjCMxqQ0SHqE/XTq/XxrzXAOpPDSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eL9+4/ymbiq67PgPMtUVhyuXDkuOOEsJ61Cg9d50InQLIzKd72PKCiGqPBMrIPEeH
	 4CzDxF0gmRGccR0z3DDA7tHXngwEjBKjS8cczk/8dXr5dFvarsFqCekXdL71Fykyeg
	 XUnPgF+RwgoPxwugLgJ0c0hrG4Oh8gmEZ89+cvsDL/qc+VmpM85c9ci8qjNAaqZk6T
	 ZAzfdemMiidSL+bRbqzItCvAiHFW1QZtZqf5faWJqSPn3EVtmaffMoR4xYP4ZuXkBR
	 SzshTkTs+EXmjUgoE9DddjBrYxUDx+fhIkbYlC2+9vxdA4tW27xN4cXIHYpJpyuQZc
	 a2sSk0929ZZgQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
References: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 00/13] ASoC: topology: kcontrol registration cleanup
Message-Id: <172001562687.37877.17206337577264966620.b4-ty@kernel.org>
Date: Wed, 03 Jul 2024 15:07:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 27 Jun 2024 12:18:37 +0200, Amadeusz Sławiński wrote:
> Code used to create standalone and widget controls is mostly same, with
> with exception that in standalone case dynamic object needs to be
> registered and control created directly.
> 
> Following patches clean up and unify kcontrol creation code in topology
> code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: topology: Simplify code
        commit: 97a05cb4ab12f55e19cf28f6ceca47bb6ed8fea4
[02/13] ASoC: topology: Do not do unnecessary dobj management
        commit: 7aa129706b4d6f7a2c649b359eea0336eb640feb
[03/13] ASoC: topology: Properly initialize soc_enum values
        commit: 8ec2a2643544ce352f012ad3d248163199d05dfc
[04/13] ASoC: topology: Cleanup soc_tplg_dapm_widget_dbytes_create
        commit: 52f4f7272c92d5be3988839a33be41b180bbc28e
[05/13] ASoC: topology: Cleanup soc_tplg_dapm_widget_dmixer_create
        commit: 40a16442a048c5f2b4336edd4d202f1930fb9df5
[06/13] ASoC: topology: Cleanup soc_tplg_dapm_widget_denum_create
        commit: d1d0262a1f5c7a543271bd5899cdb4b3ddfe054b
[07/13] ASoC: topology: Correctly set shift_r in soc_tplg_denum_create()
        commit: 963942f73b02b053f97e079ed6dae5f3602cc4b1
[08/13] ASoC: topology: Align dynamic object initialization for controls
        commit: f14a33fcadbacc1d9728e9c75253145ae6e09bbf
[09/13] ASoC: topology: Rename function creating widget kcontrol
        commit: 76d8aa0f727e327a0ba9bcb904865c40d256c292
[10/13] ASoC: topology: Reshuffle function placement
        commit: c2dad0db01fcacd44616e9d4c7263b187c4ff530
[11/13] ASoC: topology: Unify code for creating standalone and widget bytes control
        commit: 0867278200f787817036419fc87b56fb04a448e4
[12/13] ASoC: topology: Unify code for creating standalone and widget mixer control
        commit: 4654ca7cc8d6b57c77436dd44b347cc7dd3f5f08
[13/13] ASoC: topology: Unify code for creating standalone and widget enum control
        commit: 8f2942b9198c935862bc2400602780844b352667

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

