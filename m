Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0C93CD8CC;
	Fri,  3 Jul 2026 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079852; cv=none; b=k7IoBiJL5KI2PLbcyCQIPsm839xHQIQ6grTxKPeDdLGh3qiAoJaiTePtYNoaIzq+FpLpsOXTdEbxllw7Zq+rdHHF5g/HX8DfswWnMntS1n+7Hy2P6R5mwxlUPyVr8a+2hQOY6V6OQwtZHOjuYk5ZnceODr7h3nw/mtvmq9Mhj8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079852; c=relaxed/simple;
	bh=6l8rDfcrzK5XIACDAY+/dmyjhmfDE7ndpOJ0lt5IzgA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WKs1qUWbSY8JKZvKHgLVUKngr6EOJJvomDp/fzscqd7ENxFUREeoCgL31Gex4NyMvrnYsnMR1CYUbt2e+oiqG4H4fNE9mbNaCJI4sQOk9vZmd4UMOuMZDmJcmSv8aIyYj4z6a2VoXyGC8DsVY9XPXS2IDYDPKGILeNp1NbytcVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW+piVZo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW+piVZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E8E1F000E9;
	Fri,  3 Jul 2026 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079851;
	bh=o5f7tntUekXIcPK7LTER4AJya+oAIL74O6kw2RKlGiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LW+piVZovAtQ3+D6sb5V6UvQOueswjCRf3J3FVdZjT1vvV4nFTjhxnEYveMy0rtes
	 fvPbte9nosNagGhFn29rHAIAQ3z42jW8cQQCWt2h8DpfsneEojzQtMS8MZyFLGUpr2
	 Ib8Q2qG6exlBFviSUhk+omK9XRBPLiVPzD0Ub4GM7bQ0hW9JdGdmD7Xl0a2l2I5b9c
	 1vVIoLCVnMkdp1PYB8MvsQ02646DgC8dJOMhRH2T5XhwCzVkNkMRaftCphStcByJPV
	 GP4N12fPjGXjCWfaOWX2mnqn2eMvGJAVOAaeDC/aBnvIzHp33+xpEa3Xzx1VX1dzgv
	 Si8edx83D0zOw==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260628000329.18606-1-alhouseenyousef@gmail.com>
References: <20260628000329.18606-1-alhouseenyousef@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: validate probe info element counts
Message-Id: <178290827353.38925.9612630838163287056.b4-ty@b4>
Date: Wed, 01 Jul 2026 13:17:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6l8rDfcrzK5XIACDAY+/dmyjhmfDE7ndpOJ0lt5IzgA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6OoI9ZtHDDL1fEPVNIBdLkNUDBktQQijM5YI
 vKFnn0x3d6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejqAAKCRAk1otyXVSH
 0NSfB/oD03A+un74sDURP3d4J1h1UyFe12Uvuk06A0gvrUTuKK6AL+860+EkPzkDddvFxjUOjYl
 qDLk0ALSei1g9Po9ukJiwWnjOEYoaL1C6fmgTfc1ZGKPGz5Xt5+/VFoVHdDaRj7f8ufa/uqBihI
 tGCArY9ZrMf8HPeNHONDG6gUtG6a9KwCulUFvbRdvFON0WuT7LFvkBxw2ivWkbLpd0QEzL8JM0Z
 RqrbuLSR2uGrKw49+/zEtxVJTOLEItAckdElRA+wHKycLqWLfBveGLwq+bT1Qij/A6NFkhCIXc5
 r8Hw2ogBl8UJysWwksabMZk6mwJijizXYCr7qETa2ViT3pPj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 28 Jun 2026 02:03:29 +0200, Yousef Alhouseen wrote:
> ASoC: SOF: validate probe info element counts

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: SOF: validate probe info element counts
      https://git.kernel.org/broonie/sound/c/95edf2dbb492

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

