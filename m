Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E6146F498
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973725; cv=none; b=HTfe4dKOFq+2jk1HUuVxZcgDRZfD9WhUujuJz436AwoKkmWiYqfcxAENvOleUbHujnS8dZ4dx0KBgDfahJLDknnPa+3W9gd6skJPaMeX1Fq+oPn2iWAd8mRgmoPayw9rbwCP7vWInHoS/trwQxH02KG6hVj+jo3zvo6HKcTb81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973725; c=relaxed/simple;
	bh=cKY+GzJAN8ct5E/Oq6g7XqwfAF+ehbcbazNlzOc3+jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DNil5SdSaKHHWQJyHg+W/1EaP6Vki3TDiTPRLb8+psG1+DmQQLMUGnnUxcyB5KY7f5V8JqmmF80lJ9dazy04ObaBKNc2kQRzqE9gvl7PD6YUXE/U+E/Xq4da2kIVDFU9+xjsreqYtjG3AQDdOGHeqB3LDS0s6SAt4jtrhIvJyyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PusSjxqx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PusSjxqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7A21F000FF;
	Wed, 14 Oct 2026 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973722;
	bh=rup5tkMkYi7r2xx6Jk92KFk0I50Kwn70WV1FGau34Wo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PusSjxqxWtR2Z4ERkf1tP7OoO/njBx/MmqMpC51xslR++65vbb4IpUoRBv26y/Xeu
	 aF0Jik1wEIBZl5WlP6VvO0O3SprrE+bbVrTWcBC+nAEEZYd2837CJDkuJDvUN2egVr
	 VtNEY9H579t4Cz2tyoNzzZhMr2qx5zxGulnfxCRlZlmc4k+DWEPXmRCHNfyEb9P7gY
	 RydgSrK6SXE/UM7Z9vxpC76sPnl37d0MQ61m8eL94GmUfu9CSByfNI6FiQbzF7+3vr
	 ZNMqb4hzlRZMHOezZla0Ujsqbu41xuSS2WF/OP/9CCrDNhp2eXCfLqIo1FRGg0fXxo
	 HrhyHeBWb5sgA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Zachary Huang <zuzhenhuang365@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261007193038.2473068-1-mario.limonciello@amd.com>
References: <20261007193038.2473068-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp63: add standalone ES9356 SoundWire
 machine
Message-Id: <179192409922.1606900.9539798718024832590.b4-ty@b4>
Date: Tue, 13 Oct 2026 21:41:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cKY+GzJAN8ct5E/Oq6g7XqwfAF+ehbcbazNlzOc3+jk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOR4bnJ4Y3iFxdr/1riYRSwq++0+vdsh6+sLQxOKqQt
 dv7PJ98RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACaSXMHI8NVzlgHv8jam4KSE
 De8DAn5Fsft0FK24KFV/zPRleb5DCiNDz/FlYX0yygzPUme83BlfuXpvEafIW0PBBdutlikr7K3
 lAAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 14:30:36 -0500, Mario Limonciello wrote:
> ASoC: amd: acp63: add standalone ES9356 SoundWire machine

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp63: add standalone ES9356 SoundWire machine
      https://git.kernel.org/broonie/sound/c/45c2b3c936c7

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

