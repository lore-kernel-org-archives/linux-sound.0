Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B91253950;
	Tue,  7 Apr 2026 18:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775586498; cv=none; b=nKWhyzIZCBcg7X+rCNS5BhwC4LlTsv9sU476+qKgd/EfD7Wl8erqf3P2vDfWxOcd8l/4t5JHUtvAwlFjuhpUo8S2+zGHqA+/8KDuSVVERua+hDtIkqSBitfz9TUr6GccS0VnQUJFAaFB8SdDaRRsS4J2G6suz6EqLRgM9CIjCXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775586498; c=relaxed/simple;
	bh=43J8STDVX9JU3+BDaKBt7Xg+JLv+ta//NsSTwVpqv+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jYedGQoix9kCoPzsUFm8+OvXgcbPJG6MxxbuDTGUlRZOnFn+YN7ZOLaNPnqVFJGDnbekAz+qtjYe5TpPm/83/IGp0WCkF4toGM053wU/msG0e5Iq5B2oQ+8BISorQzK11FCJVvjOvaVVXyy9O2oBuute1egTPVgDpVK7jlHO0B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hey1G3Fs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hey1G3Fs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2B7C2BC9E;
	Tue,  7 Apr 2026 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775586498;
	bh=43J8STDVX9JU3+BDaKBt7Xg+JLv+ta//NsSTwVpqv+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hey1G3FsOS70B5eXaJ28vnKyCffxFHdTB+1eTgBwLopnTWoBUdUXitUbNTGnGQ/Bf
	 b1HqExFJ9oqMkZ6apsYkEmVRl600Aih1ragxyRdbmlFYcu1RQzXsXsHDTK1geDlKU+
	 U+FozQSONej8xcSDd9WwtKfeW60KOUYKSZxXpzKRVGABhT6Io30+rBj93jIem63ZaV
	 UzPowbotzricAOos4Lv5PGNYQ5OWIiP9lG0iBr+FBZOuiNPIMc+B+XW10AGbJq/Xer
	 RrIKsDQyCcxTUy3NLcDn7zDuXw8ic1gn7FeVnc0YxzNHoenaHk7CHEpTkYR75YEvnN
	 Qa+ZhsVShnw/Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20260403100624.676953-1-syed.sabakareem@amd.com>
References: <20260403100624.676953-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH V2] ASoC: amd: ps: fix the pcm device numbering for acp
 pdm dmic
Message-Id: <177558247965.125930.4964395587549968833.b4-ty@b4>
Date: Tue, 07 Apr 2026 18:21:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7a3e7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=43J8STDVX9JU3+BDaKBt7Xg+JLv+ta//NsSTwVpqv+8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1Uy+Pke35rx75xNhhBVv+BDQVFWlRlsc/hnmj
 henuP40a8SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadVMvgAKCRAk1otyXVSH
 0CUYB/oDjdaaMVvAaOixH3FzZp70YI40VpA0JTSgKTv/yq12golWpwFEqsJ9nJFrBy23I/0cjv9
 Maw2lwVdfBC44XF4FUGetk/RmvCfmTdZMfodoR7ExZlIrpHbB9lGtQml3Yw5o9+RCssDqYnsawl
 Lfzr/wzq/VgwRN4t2YGci4dYodiiL69f8gBH1zWqadIS8m9HXq/ckgJOnaKe/97EWPqEK6+0xo2
 J7U5iOedkcFPL9pzhcj6KNd5IYwhyWyaKPHabzBMoBe8GrtXafk4+1RXXUXI323Y7l7lOK2T4tr
 D1H/SpFpoebr9qj25dLeSX/Alv7c07MZB4dsp4vVHv8JeWme
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 03 Apr 2026 15:36:17 +0530, Syed Saba Kareem wrote:
> ASoC: amd: ps: fix the pcm device numbering for acp pdm dmic

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: ps: fix the pcm device numbering for acp pdm dmic
      https://git.kernel.org/broonie/sound/c/3666dc0c47c3

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

