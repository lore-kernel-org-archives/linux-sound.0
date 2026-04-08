Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1112F34DCEB;
	Wed,  8 Apr 2026 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775671549; cv=none; b=Ig0YfwghiqrodC0GQ0PPHAm8yQnVCyQURGzHJ7z9BzFrXv9zuAG5uuMzcpwmeN/fkWEELwHdMjdc93f1+JUHFqHKnS8fkk+aQ015KxQunpeJIDMOEiN3cuIOv43Ok6Sj2f4ZHlrhwrYm6bYkeVUemzKOmyP9DcQsAYLKoHth0hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775671549; c=relaxed/simple;
	bh=q6poiG03PKI9t7tptkcqJ55P4qKM6z6IO9aXIWvOiE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BwvXIir0oqi64qeLDWyDWd3qO4U/Q0xANeiOR+1ZH4TTrF7znKDAb2MEj5610Y+HbQNAWRNCHI3Z389EXP7Dos8RrAbGTgQ34D+D5sJpd6DtXKDbFkYJcaTSue0EsJ4UunGviXphaPnZreaXcPfg8/GwdpxgIGU9DTc7E5PAst0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zmn1uvRc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zmn1uvRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708B5C19421;
	Wed,  8 Apr 2026 18:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775671548;
	bh=q6poiG03PKI9t7tptkcqJ55P4qKM6z6IO9aXIWvOiE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zmn1uvRcPuEcF7VmRSjWw0d8OAP/2E5mBEppeIsmp6sQH9zu29kq+ZEFZhOwA1yGK
	 h0hjflXzZGKhghiVL0nOhmGSrsF7JiWe8Ax/TIyK6DObxMyu4npCK0so3/ZnOoPsPy
	 FtZP0kO7/NBE0VjXPT492ZiR2lS3VK+pc+2lx0KRcuYLlllos9QU6sJ2MjERhXdfdP
	 2i7AaVBZY07gDJoEVYvxhYuVcjm3DRKl1+ShQHwYXgE7zRYxtKtHUoO3SMjDuNRfPU
	 5hfKPMQaOKKimX9YBG72k0tAlBCDfxhluZIeIVJPFICwRomJ+8//qME91iMlupTTXt
	 224PJY9WAgqRg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Sunil-kumar.Dommati@amd.com, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>, 
 Hasun Park <hasunpark@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Kees Cook <kees@kernel.org>, 
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20260408133029.1368317-1-syed.sabakareem@amd.com>
References: <20260408133029.1368317-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: update DMI quirk and add ACP DMIC
 for Lenovo platforms
Message-Id: <177566433584.101848.15145372021041613833.b4-ty@b4>
Date: Wed, 08 Apr 2026 17:05:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q6poiG03PKI9t7tptkcqJ55P4qKM6z6IO9aXIWvOiE8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1pj4HVtRR5+itJX/UFYoLoTLLJvUvLR3Wlv+F
 s9BUUPjmx6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadaY+AAKCRAk1otyXVSH
 0P9SB/9zcU/9WD/k6gGjltmxt26TLwvyzT7KSjhfbdJMiN7aTpf8jphCavXmy0ZgsWLwbi1Lxje
 b5maM6N9mVr4U4COl2ogE87JCkqEipCWDOlKKla1oHEnme9sFBtMT9ywjWBdHQnkaegdjxs0c+M
 fCCFqxu29BBlwdKhSiDtSxoliVfZIEqkTfeQjHNLXfv8FlQ1kwPFNlp8PTAEEqpLWS6OoyjnE4u
 8Vd6irbmnZ8Gzyf8OKbYIVOTfjSUVECxdZDSRXiooPNmNqPTSf1Du4UGLD0IWegX01VBUceB5WK
 lcWaBwT7fElELALpGZNCM6sF7lwAF/n5JCizqe1xXgQA03cJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 08 Apr 2026 19:00:06 +0530, Syed Saba Kareem wrote:
> ASoC: amd: acp: update DMI quirk and add ACP DMIC for Lenovo platforms

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: acp: update DMI quirk and add ACP DMIC for Lenovo platforms
      https://git.kernel.org/broonie/sound/c/6b6f7263d626

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

