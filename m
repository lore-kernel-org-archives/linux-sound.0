Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5013D1716;
	Wed, 11 Mar 2026 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226044; cv=none; b=Le3e/m6qIRgZ8tW0NBcC53d4hzv5LGr9PeFPP/lKAKsXZwYydqM8TR2dx5CuQj+qxWMo1BOySryB2WYZ7pt8p/11jbpHVjlLjao+KUgFxeQI9v1jNv8/a/mPPm3ZuWm2KNXiheIS3vVeaeqK0A6cz3/9euE92YGV5pff5cTibOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226044; c=relaxed/simple;
	bh=hWYZh5j+a5VRpKLLWgeiw1cDYXLlkkCyUitmp5T9CmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EpySrOuzqptv+KJs9TjgZrg1VyxJUDOxPWPqeJHb65CiChazh7IzY2K264oSJCKA341fW6Bg1eQ0S3wPSe9JK1XFDSZIGwh3fiMrPZPv9CwubN9hFJkA/ATp0GO27/n6g/sGQbqlvTpysWdt98A3KI5PxNCrAyXJbRVtBVE00z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnXI7Pyi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnXI7Pyi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6C3C4CEF7;
	Wed, 11 Mar 2026 10:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773226044;
	bh=hWYZh5j+a5VRpKLLWgeiw1cDYXLlkkCyUitmp5T9CmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CnXI7PyiJXWN0y4LvQQfqdaCC2DtSncYT94FulCEoqXM6dO5XY2ofiC64DTvTCa9d
	 d1ECxQQH52Cqw9ZvVuTqweODHUZ/EG4larjC7+MTsXqdOAkc9MkhVukfNboP00L4+S
	 0PnSE1caTHCv3II2mMEfMyHfs3Cr/d0opfVxkk07aln1Ib7iySul3/xanQcrp5kMkN
	 eBb8wj5kN1sYPiS7a/Bmw1+YjzaxmazjCW48T/iY8x3WLXmzpzf3ID48lFQytqhPmr
	 9oYGCAv0PxnmIkrspOYhqkZHW/4L3fkIT4hR68a4nf6eEIEk6kWAEJ3VmIzOS9KjR+
	 SP45+dZVQzbeQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260310082348.743716-1-pengpeng.hou@isrc.iscas.ac.cn>
References: <20260310082348.743716-1-pengpeng.hou@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: da7219: scope AAD suspend and resume helpers
 to CONFIG_PM
Message-Id: <177322604236.10345.12105705205451299083.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 10:47:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Tue, 10 Mar 2026 08:23:48 +0000, Pengpeng Hou wrote:
> In current linux.git, da7219_aad_suspend() and
> da7219_aad_resume() are defined and declared unconditionally. However,
> their only in-tree callers are the component PM callbacks in da7219.c,
> which are already guarded by #ifdef CONFIG_PM.
> 
> This inconsistency leads to unnecessary code inclusion and potential
> compiler warnings when CONFIG_PM is disabled. Match the helper
> declarations and definitions to the callers' scope and provide no-op
> !CONFIG_PM stubs in the header.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: scope AAD suspend and resume helpers to CONFIG_PM
      commit: 4ba5c63778e5cca15b1408f012d00b441f808f3d

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

