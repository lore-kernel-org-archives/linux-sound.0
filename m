Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD7C3101A2;
	Tue, 24 Mar 2026 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381444; cv=none; b=I0J0t2i+IrciQ6wp41sUu+kPGc99+FInbdxIPXUNkRyS9pK11FI48LmbMryiAbTjpjwu0iBCTLeUz53N3/jKT2tqYzv7E35jclGfKqc1jD+rBGeahAM0Pq0GWNUP6EetkcIrxlys/UnS+brvPbkEmIiu2aWFtB45B10OcTafxzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381444; c=relaxed/simple;
	bh=q0PllgsFQyJSFI4pOaw7qm/0+R8fwatPwIoMWEk53AM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k4kfIwD2w1CMHqrFL+fNX91UjFx6P28Itg4SrvISMztOXeewN2in/dhesI3LuIlSsGv3oCKJCZg4/pHCUzpL7CFoiS+IQZ/qu9PhH+9o3s0nl5kGJ40sWRzS9lMHRamCsuo0UAn480cAQ7RMPBC1QjF9r/51xdsvVBX3QzxdNic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxnxlUgP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxnxlUgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0359C2BC9E;
	Tue, 24 Mar 2026 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381444;
	bh=q0PllgsFQyJSFI4pOaw7qm/0+R8fwatPwIoMWEk53AM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cxnxlUgP7w0Dz8ydBgClfrj7NQdHaztO7Bvdr/DZhLnaSTYldgi4UVhS5DRuQ/Og4
	 bpO8auYyoAVYypo3IbxmVQ9xOmemU8FINFkThxesZnWnZgLozo2dl69W2XX3KHjXEF
	 DAJo27k7yomY9eOkMXyIfdMJ2HIxdSE/YNWEr/j7Q2C/N134umfghh3hVbcCgs6Pbg
	 1wpDQxgAAtrMrUlgpKCVi/80ziZajuIUbC1YFX1Y5HyGwuDTVm7Q2t0SJ4g9C5nZLX
	 rFxD1+HDTwU2QWxQC2gG1SES0X5HLKTqgArH/mTIKnebvO3o6Q1ZEzh5jdWvpgeAZu
	 m+IRvGhRK15NQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
In-Reply-To: <20260324133403.107708-1-ben.dooks@codethink.co.uk>
References: <20260324133403.107708-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v5] ASoC: SOF: sof-audio: pcm_id is __le32
Message-Id: <177436042872.98682.1923486931321084534.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:53:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q0PllgsFQyJSFI4pOaw7qm/0+R8fwatPwIoMWEk53AM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwumAzMc0D+/+7goSckRnnZMd0KfZmQn7yOe7l
 4YYESBrDHiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLpgAAKCRAk1otyXVSH
 0N2vB/4mWzC+Dd924XQ0aNc7DY5olGyWRBM2q03exLxD3O/SYTTb5LTfX9mS4AAx2tbvYkeN1Ls
 6I0WInAOcLTm0ongWrkR3xTM716NhqqT3LpfYY7CtohGnE5CkoyqlBOkD5WS3mLdP0asc+ivVc2
 f+iGjVLpWsqGTzpmLWLglIdasnWNYCxIKTH7G06zch623H1JyLJvCsa738MbWXO4BenQa0ga+mW
 63ZxxF35f5aIxwEOrikM6qOhkHW9lUjAh5D2SHSBN5ieDV4/XXpH4ZwIeGQO7qvIXdM9osiY09B
 yox6Uo6oI9g83pFfEkW2ZWX3KUfVu9XmnqcIGg6ubof/RPHx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 13:34:03 +0000, Ben Dooks wrote:
> ASoC: SOF: sof-audio: pcm_id is __le32

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: SOF: sof-audio: pcm_id is __le32
      https://git.kernel.org/broonie/sound/c/4478886310e5

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

