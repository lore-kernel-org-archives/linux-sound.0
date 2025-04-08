Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43C2280A2A
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116552; cv=none; b=cBTdNc7ClgC8oWEjRfI6rYCBjd1H7S2o3qFqUmZEWjuhZxvraaZVRePMDOC4GAURp6Rs89PXHtCmww5r4r3tEr3bMRLvaTt4khmcsNv7FGjxvBsyz5S50yURQeX5hoi0tgJENq/DiD3YcwZ1YqybYtx/Fn6MSQ0/ljUw65PFmck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116552; c=relaxed/simple;
	bh=8yBnHdH0mJmkGdlhaOPQyCW/d3iRh3+qebW/GjJ9Tu8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=de/MjNEE8TOn6J7VUItAbGKmqnBm+ExvykIbrORNAOo2r1cZShcGVWLYxucMj5cGmoiY3LyObQP4feujkRyH8iTkeMMlJLccPUH3RyQWzMxMWS7lXcc7Kp0ZtJRU2yzSUFqmF2OC6jjq0hx8f4Ixpb/B4J6oIBJEEyWIeKIaLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBRBOEPg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBRBOEPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D8CC4CEEA;
	Tue,  8 Apr 2025 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116552;
	bh=8yBnHdH0mJmkGdlhaOPQyCW/d3iRh3+qebW/GjJ9Tu8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eBRBOEPg+ARfeCfGRwhZclxH/PFrKT89W3aa5wVCiZsR8oJ34BA/qYZ/DKZMVltGI
	 cZk/T2rvOvowl+2IVTfpSayXzogI3PaFWAsiocAhzB8Tt+Jif1mTQUfx4mO7AZ6gi3
	 bVGOF7whSiXXSTxhHJy3DZkpaK7BKcI8XEQXpNxy9fMNpR8UG82TsFjTEqxl/M0g1b
	 /Qhcnxv+Ex5q6viIboB7l2KTa67Ol2ZoEeEKv5zbAdqduzcitP+2vneMo923WA3HcW
	 55qLafC4nREPSzmQglFf+0V21Z/56REIkhEp57fZK50e7tLjoUUcvU36KlAkycGLEl
	 kLzw2ffV+dudg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 00/20] ASoC: Intel: avs: Update machine board card
 names
Message-Id: <174411655114.2091760.11702478820516843039.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 14:41:34 +0200, Amadeusz Sławiński wrote:
> As discussed in user bug report [1] & [2], it was identified that HDA
> card provides wrong FE device numbers to be used with UCM, at the same
> time it was requested that we change card names to better names.
> 
> This patchset does that, by adding option for going back to old
> behaviour in first patch. Using existing way of enumerating FEs from
> topology in second patch. Then setting new names in all cards while
> providing fallback to old name. Only exception is probe card, which is
> used for debug purposes only, where we just directly rename card.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/20] ASoC: Intel: avs: boards: Add Kconfig option for obsolete card names
        commit: 1581d5c68208a776c2df35d6e3ef232288b56f9d
[02/20] ASoC: Intel: avs: Use topology information for endpoint numbers
        commit: e3dc0351d7a0fdcde18ed1719c9149b1a656e7ec
[03/20] ASoC: Intel: avs: boards: Change da7219 card name
        commit: 958fd3ff106787c72617c106b483da96ebf040f3
[04/20] ASoC: Intel: avs: boards: Change DMIC card name
        commit: 1cfb242fc12a6e8ad84b10c65ac5bd1b507c5472
[05/20] ASoC: Intel: avs: boards: Change es8336 card name
        commit: 102d3f95e6a80bd19b623005cb2a0181533159b7
[06/20] ASoC: Intel: avs: boards: Change hdaudio card name
        commit: 65327c926e7c52487c33af7a096ec8990876d076
[07/20] ASoC: Intel: avs: boards: Change sspX-loopback card name
        commit: 71439093a066450d1392ef52c09dfb42c4a03d44
[08/20] ASoC: Intel: avs: boards: Change max98357a card name
        commit: 20d5ff6d7e35e04cc24f7953036aa75cabc72706
[09/20] ASoC: Intel: avs: boards: Change max98373 card name
        commit: e91f9a93c34f6092463fbc5e03b32312b3f87a37
[10/20] ASoC: Intel: avs: boards: Change max98927 card name
        commit: 3051c1b91c4acd99338a82c044ba25d675a41a3c
[11/20] ASoC: Intel: avs: boards: Change nau8825 card name
        commit: c0019bb4ee3ed861deea56feb8939cb9ad13926b
[12/20] ASoC: Intel: avs: boards: Change pcm3168a card name
        commit: 091614d1c571933413b9debada185c8f4daa536a
[13/20] ASoC: Intel: avs: boards: Change probe card name
        commit: c9763d849a56a16db9da235ff525f452839d29c3
[14/20] ASoC: Intel: avs: boards: Change rt274 card name
        commit: e7722ac9a88f85a4845ca1304dbe47cce01e1fc0
[15/20] ASoC: Intel: avs: boards: Change rt286 card name
        commit: ffe6a23eceb8ffe8ce23a9b23818b9a767ec9c9c
[16/20] ASoC: Intel: avs: boards: Change rt298 card name
        commit: 61881b29d6fcc67a31c1cdeae54e6687d1b20ead
[17/20] ASoC: Intel: avs: boards: Change rt5514 card name
        commit: e0e3b14080eb77759c6b11b4d14ef079ad30b911
[18/20] ASoC: Intel: avs: boards: Change rt5663 card name
        commit: f1e282c333ac6100a86f4ef3dd07c5db6ef5712a
[19/20] ASoC: Intel: avs: boards: Change rt5682 card name
        commit: 3c7115677969c6a45ccce511c15adf9ca4d61fba
[20/20] ASoC: Intel: avs: boards: Change ssm4567 card name
        commit: 93fa44f84704dfedc4fe06b89bebc8cfaa5f525b

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

