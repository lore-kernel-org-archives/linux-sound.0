Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF9F10E5
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 04:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715230434; cv=none; b=hSc2HCsO4wasaQvFxGAvJlMzxs2FIHw0jrhjI793SDTbbDDOCG6uiw6oit0NV3hf10Yz3cUz6Xr1c0norXTFK3ZayRkO60FbwsTg7oqJG9roZxlttf3LuiNqLPCUSCR3gYpWz0Yyc6EWwPSwdm2gVPLs7SUjpBZIgO5AvoOmDck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715230434; c=relaxed/simple;
	bh=FYK8o7agHkWB8dqb5Brb1yBs7Vs11FMp6xgHqrbWLwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gLt+LcLme3zsi5MvL7nH8r6l0zR59zqUDYz3jxWDHPC2KUrXSbTJb1fv35PhpwjMztQS4xcp2l3VfWrUuUgqh/amSDcdIppVB177Vz2Wd3djILUxhpltbupVYjgiFra06vljn7RyvtqbN3u+Ryz56FK218eZFDA1MkmqJ/35oro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1A9S6zn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1A9S6zn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FC0C116B1;
	Thu,  9 May 2024 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715230434;
	bh=FYK8o7agHkWB8dqb5Brb1yBs7Vs11FMp6xgHqrbWLwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U1A9S6znfuy2ERRFcJfADxwCdJCbF2FfXsJWP2HLPUz9HTZpJLbGL6Vj4Rw1lfn4Y
	 qtajnKL5RDW1XVDs2MWaRQpiP5i/wqcRhd2hczIQJ2Ki7QSgCIL/KeImhsudcOAm0k
	 /5J2We+2jnd4ug0xZn+hQeQ97iUbGpgK926N9L0dpcAy0P9SPzlYcEsDRkUXgPPugW
	 RSz25M6CpYsqyetiBekLIf4ISmgne0cOpgZBdkvQ/9+tfGj4mG5WHBcL8X2gp6jHP4
	 ZRfdrB9hFWlfcHYzG98BYb21+ZkCqVDL0E8Ig5aJO/6eDZ2C+S8CQKOCBbVwYXPOBz
	 89C70b4daF9Sw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Subject: Re: [PATCH 00/34] ASoC: Use *-y instead of *-objs in Makefile
Message-Id: <171523043369.2017141.17422657545742601502.b4-ty@kernel.org>
Date: Thu, 09 May 2024 06:53:53 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Tue, 07 May 2024 17:55:04 +0200, Takashi Iwai wrote:
> this is a series of trivial cleanup patches for ASoC to correct
> the *-objs suffix in Makefile.  The other ALSA code has been covered
> by a previous patch set
>   https://lore.kernel.org/r/20240507135513.14919-1-tiwai@suse.de
> 
> As was suggested in a patch review, *-objs suffix in Makefile is
> basically a wrong use nowadays for kernel driver modules.
> They should be replaced with *-y suffix instead.
> This is a result of systematic conversions, separated per directory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/34] ASoC: core: Use *-y instead of *-objs in Makefile
        commit: fd25e1c1328f40c6eb0bfa5ebee757e0e1dfb308
[02/34] ASoC: codecs: Use *-y instead of *-objs in Makefile
        commit: 1c3fa6662832f1498b78817317796bc37df7da40
[03/34] ASoC: adi: Use *-y instead of *-objs in Makefile
        commit: 01e8f66b434f3cca0690f839c417324d7471aa9b
[04/34] ASoC: amd: Use *-y instead of *-objs in Makefile
        commit: 07214013578b156d0fda288a0311d353ea149674
[05/34] ASoC: apple: Use *-y instead of *-objs in Makefile
        commit: fa8e54828efee5002b5aed0e315097f7ca4171d8
[06/34] ASoC: atmel: Use *-y instead of *-objs in Makefile
        commit: 907cb79d41a7bb54d2d69bbbdd6ebb159a1d1718
[07/34] ASoC: au1x: Use *-y instead of *-objs Makefile
        commit: ef993723af434eb91923b39dcef1623bcfa89606
[08/34] ASoC: bcm: Use *-y instead of *-objs in Makefile
        commit: 37f8d0d000b55038938e90d21aa987a6db1dd31a
[09/34] ASoC: cirrus: Use *-y instead of *-objs in Makefile
        commit: 591002b84a335f538879b44dff64568875da89b3
[10/34] ASoC: fsl: Use *-y instead of *-objs in Makefile
        commit: fe756e1e54c62ee691a3778b3e758808d0a41ab5
[11/34] ASoC: generic: Use *-y instead of *-objs in Makefile
        commit: 76560b808b41267cd08a538d2ad536f557c510f3
[12/34] ASoC: intel: Use *-y instead of *-objs in Makefile
        commit: 590d82e6e6284eba3e99d15264779c4369709291
[13/34] ASoC: jz4740: Use *-y instead of *-objs in Makefile
        commit: f7d09b7d4d709b34ccb0ca8fd626a499fa672a6d
[14/34] ASoC: kirkwood: Use *-y instead of *-objs in Makefile
        commit: 7ca27af84fc3cef3a8769bbef278e460d794c603
[15/34] ASoC: loongson: Use *-y instead of *-objs in Makefile
        commit: 3299aa652dee0d9e61cf7223a5e0bf131faec63f
[16/34] ASoC: mediatek: Use *-y instead of *-objs in Makefile
        commit: 9d819c244a478099828f76a92be4b71360073207
[17/34] ASoC: meson: Use *-y instead of *-objs in Makefile
        commit: bfc05938ebab6429543fcf1df1279b24953f1a7b
[18/34] ASoC: mxs: Use *-y instead of *-objs in Makefile
        commit: 62c6137ab2d0598603115f5bacff38c440a7d8c0
[19/34] ASoC: pxa: Use *-y instead of *-objs in Makefile
        commit: 8a72584d0d7601699f7945ac84899e8a3c7cf617
[20/34] ASoC: qcom: Use *-y instead of *-objs in Makefile
        commit: 078f57bd555b092e85c02510a2cf8bd30773cc3b
[21/34] ASoC: rockchip: Use *-y instead of *-objs in Makefile
        commit: 18db1c48515ed358a1c29e5dbda3e39a822b1864
[22/34] ASoC: samsung: Use *-y instead of *-objs in Makefile
        commit: e93c3b9606d17344a17e061c51dc4ec0538b3345
[23/34] ASoC: sh: Use *-y instead of *-objs in Makefile
        commit: 8c26836f5bade6d8aef415bdbe8d290b8bb8a5d9
[24/34] ASoC: SOF: Use *-y instead of *-objs in Makefile
        commit: 9c2f5b6eb8b7da05e13cde60c32e0a8b1f5873b0
[25/34] ASoC: spear: Use *-y instead of *-objs in Makefile
        commit: 50537c3fae4114dc71cf8b32c71881ca57fd3ad1
[26/34] ASoC: sprd: Use *-y instead of *-objs in Makefile
        commit: c4e93fd13235fdc339d087d4b1f491311f9e6a1d
[27/34] ASoC: sti: Use *-y instead of *-objs in Makefile
        commit: aa4a610309028d38b041cca899b772023178d112
[28/34] ASoC: stm: Use *-y instead of *-objs in Makefile
        commit: f827d7a34bbc1922c36aae80ff30c9ef9fb3647d
[29/34] ASoC: tegra: Use *-y instead of *-objs in Makefile
        commit: 51a50d6ad72702dd8de352c5882a18001638dc30
[30/34] ASoC: ti: Use *-y instead of *-objs in Makefile
        commit: 72b28ec6de0a4dd27dfd89525c3e1efd75ad327b
[31/34] ASoC: uniphier: Use *-y instead of *-objs in Makefile
        commit: d5c337c5e3d54a98a1458942a4c1eb7a307b180c
[32/34] ASoC: ux500: Use *-y instead of *-objs in Makefile
        commit: c4850e856f9db799be4e5a211dc85bdfabbe210b
[33/34] ASoC: xilinx: Use *-y instead of *-objs in Makefile
        commit: a9732bf75785d5baa3259a59ed4cac80da138ed4
[34/34] ASoC: xtensa: Use *-y instead of *-objs in Makefile
        commit: 476d0a22bcc4d305080e3fc2d759010db23ccec1

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

