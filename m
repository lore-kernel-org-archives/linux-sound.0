Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DCF430300;
	Mon, 27 Jul 2026 22:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192975; cv=none; b=FG/hw43JsRGFC+GKSBXKXhXoKTcyiizDL3D08g9YC4zQpdtE8R7L3FHQ/3vQsm19zuatjoftGdq4F4T1fg/lGxXp2gGY5Ak3Esxw69DcEFRAQhpyjcAGwQYeVCbWDgg9j1EsaQQSCPWAi2hGhOm4vkuPHIOjDSdkO7G9a1J3bLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192975; c=relaxed/simple;
	bh=bMc5qD10eMoVtyw/3+HZR7Zneg3DdDS7Uiuc5yxqBVo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DtKn+OjSjZwKG4x8gVD1SuUQg0uFYPczOsZKfVWyfEXiHeZtGAvtyPU6Jvx0UFvwnIZLu+5Nz4QqMF7gFTkjWk01ZldwyOFdNKYWDT/xidutM1ED2zKRm41GWmspUQHhjhh6VxFVj+MISB4u/umvgbwxF7eTyG5tztIo8DQJTG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dj5OjC79; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dj5OjC79"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751511F00A3E;
	Mon, 27 Jul 2026 22:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192974;
	bh=56861tHmuXQq23oXfnIkgJnWBTUaRueIgzC0WXUJG7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Dj5OjC79mZmDPKZbSOca0rjXMDm2w2m6qiWmOwJyvwUH3T/saLjkUX6lOF4ZbFoKz
	 DbzP3v/ezfsU3g9EOz0TvrJhKcyvqUcQL0h3lDL4NwDtXh6Vfk7/fhjhqLD4t4T2AH
	 30MH5XlriGCvtvAasjCkIgde7wUaTl0kxx711A8ZoBs7YN+XYOsAhBt8ffC0XVcTl8
	 O/rZwuN0FhtGbElv2/CcTtFK7HvqGeXMW0RUYljrywXSuACrCvtQqWNwxwtnvC2i04
	 ZCj1j/OFXsGFR0Cj7bjbTrKDjz1RDKIgne4x4vLyxczRB/fprxugg5CgsODJILau0i
	 m5zCsIU5j1CnA==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 sound-open-firmware@alsa-project.org, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <20260725160344.916838-1-ekffu200098@gmail.com>
References: <20260725160344.916838-1-ekffu200098@gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: remove conditional returns with no effect
Message-Id: <178515774447.50339.17330301582299042365.b4-ty@b4>
Date: Mon, 27 Jul 2026 14:09:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bMc5qD10eMoVtyw/3+HZR7Zneg3DdDS7Uiuc5yxqBVo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+IK8VuIvL/qvobEWZqQG6YsMr7av26ImCldq
 oQTdaRjH/qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfiCgAKCRAk1otyXVSH
 0CLuB/9Y5FuYF/p8ZHS7J4So51GgjFdf981O9zTmrp1HPxAtpNrqEXww4VKingKBut4bwpY5ftV
 pMLVW/i37kXwZkZq4EDUvqD1HVnrramDv3VY3hxYXHvyd/EbTs6kHX6WMapQc5aTwflnFyXYLjw
 v4uCf4kEuLdGmqboV4vtCTBVR1KfCsmiHRbRbI7C7XRH33ormMfjQQJ32CpRXrztRa0LSomPQ//
 HI3T3FYiR0nHg5my0JdudxG/o8vZC1BhspAO5s/cmK7VjM1el3s2IhQyiJAY37ngGokmxycGPtA
 BwBFF5Zcg7aUSzIXFBZrRwKfaUycqKvhTOK2UHjiVJBFaZfz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 26 Jul 2026 01:03:39 +0900, Sang-Heon Jeon wrote:
> ASoC: remove conditional returns with no effect
> 
> Hello,
> 
> This series removes conditional returns where both branches return
> the same value, so the check has no effect. As suggested by Vijendar,
> the ASoC patch of the treewide v1 series [1] is split per vendor and
> posted separately.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: amd: acp: remove conditional return with no effect
      https://git.kernel.org/broonie/asoc/c/3799a56da8f3
[2/4] ASoC: Intel: atom: remove conditional return with no effect
      https://git.kernel.org/broonie/asoc/c/52c095772962
[3/4] ASoC: samsung: smdk_spdif: remove conditional return with no effect
      https://git.kernel.org/broonie/asoc/c/cdb8b41357bb
[4/4] ASoC: SOF: Intel: remove conditional return with no effect
      https://git.kernel.org/broonie/asoc/c/619446b87c0e

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

