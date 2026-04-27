Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCB22765FF
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 03:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777347450; cv=none; b=LjkXC/Psb/X/lt+Qn604+dN7o3Of8TVbmmt9m0UTTgGBiesxU1xwDthUl27a5x10tR+dLVIl5uadsvDwn8FkUGaWZqDhMS9HPMdjhWrHalLof/z/j9TMlMm9TZNczVNa0/O6f08jBcrxjncdAXXJioAbxqodWT2VqxKu+Q7s6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777347450; c=relaxed/simple;
	bh=v+k0mxR7uS4QEobk6K87ilUPY+SsHJk1YDnSyP1LnG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QBp3F+MPGOdAQBf72ZIh4rbpvAh5dE3cSUEihohCtS/HEyls8hv3cBVw6NZM4ICSWxGmM09qgosEG/XBO6JjexpiDFpYg+9jjEszMULvlVa+N9xvfWB/mUcoq40fZuWZokcvhW9sWkH4M6MA37tF1EaJzvyNor2HDeRFtVmH9qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFGXpHhl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFGXpHhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F49C2BCAF;
	Tue, 28 Apr 2026 03:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777347450;
	bh=v+k0mxR7uS4QEobk6K87ilUPY+SsHJk1YDnSyP1LnG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fFGXpHhl2G8N8StPnAWQ5Yg37pyImayNq8lCo8KbQl+pS9roJlPl9NAEIxjIiC+qv
	 uL8f9JH5sfgiLoyGzsgCrjm+cSdRM8UAdCGKIshSL5hovhK2+mt65RkgjfTIm2h/80
	 8Antrzm3sZvzBfNNFXwPVpGMhdoWeCVY9wipsSq1rLsJ+zOEJwzfeshqG19i35AURy
	 puw1aNs/kk+2yxI4/P4DSO/QRZLdF753iFLsccAjzC1Wpde4zuv3B3WgXJp8FvMPj3
	 in0emcyOrKo4iLe97izNHHfReTbbeOdiHfcUqfsrawe6IPzq3BLtM9GwCok7VFJxTt
	 X81ErnopVVCZQ==
From: Mark Brown <broonie@kernel.org>
To: Sachin Mokashi <sachin.mokashi@intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 tiwai@suse.com, pierre-louis.bossart@linux.dev, cezary.rojewski@intel.com
In-Reply-To: <20260427144619.1739971-1-sachin.mokashi@intel.com>
References: <20260427144619.1739971-1-sachin.mokashi@intel.com>
Subject: Re: [PATCH] ASoC: Intel: cht_bsw_rt5672: Simplify probe() with
 local 'dev' pointer
Message-Id: <177732988081.324244.9990584552671602789.b4-ty@b4>
Date: Tue, 28 Apr 2026 07:44:40 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v+k0mxR7uS4QEobk6K87ilUPY+SsHJk1YDnSyP1LnG4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8Ct3tTi0lTyXbNyTrU2X7fsHYas5WeO6GvHeV
 puE40ct75OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafArdwAKCRAk1otyXVSH
 0GZXB/9Kl9rYQ63LnO0JguojjfdizNTWW+iEIH7IN+Hfw0nkBoYvRGk9psfgs7WJG6+Nyym6Hpu
 i/yyusKfoXNas0uLfOz9j3nm9Mayj+T9JDhhiXN5vWXR4HgQgipVX0GoHHOY5TYELExQScuiCvO
 N0p6Cz7v+wReeqeNp3U9vBk3x6s6mGHlaDLwJ7MCU1cWO2ceQHKXzdYhy9MoUblpR17New5Zr6G
 lpw+RWCYo3H7GDG1tE82QeDJZGZOsQaOvqejtXvKVYcBb09K2qOEbOvJeusXUipFD8T+trMXuvH
 EoV5qf11IZ543L29MR/YohueE2CjSET+a4/kvuh3gHvoyJJX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 27 Apr 2026 10:46:19 -0400, Sachin Mokashi wrote:
> ASoC: Intel: cht_bsw_rt5672: Simplify probe() with local 'dev' pointer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: Intel: cht_bsw_rt5672: Simplify probe() with local 'dev' pointer
      https://git.kernel.org/broonie/sound/c/cda1cf0526f1

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

