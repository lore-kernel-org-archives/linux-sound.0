Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29F91F8691;
	Thu, 13 Aug 2026 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623630; cv=none; b=qn5eedldqRno4IFCBsZx80zDjdha9UpSheAbjJTtLrqfSiZf2fCvTydt6HUedFqcgnhoUrdcq0Kdb6D6yUsWNQAN0z5JEiQZIWEJerGPlLcGLxQtTHd4ykMgLuIqVkKtbm1tcd9hlJcQmxBGAj03XBWLzSRQuTmvBv/1CnyFoBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623630; c=relaxed/simple;
	bh=WMCbSYBvbFSAqJCoiPswlpF/qTICQkeiWenI/Fv71Cg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d+XPdCKOMBH1H+PR6BiQXTTchJOuNgwzmsalU9ybp1w/48EOU+SMnK4dK4gV7dpysp4a9pTgeOog01r7kNMr6YbFdeF0DHvGA+uPjKwZjtI4ws4WEnFz0XUZohZpwB58gigVAB1mGIl6rXuVDjWTfGy8qDuShZKd2BWdX7NO6MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LliF5Im7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LliF5Im7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7581F000E9;
	Thu, 13 Aug 2026 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786623629;
	bh=j79Qv2kin7snMq51u+mksCtLNTIh6v/403FJtOsIOxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LliF5Im7g4i0LBPkEuB0ArAle1L3Wvcr3GtKvLVyY4iHgSJYmF6nF/wKfNZqGS/KF
	 VgkzFypGexMUbm7twuHFfxkeENfqUF8VB0OMo1yDP88AAJpjeH38X1IqkB/G/9aNj4
	 4FULUnknnAedjA/5gud1Iv4qTlv3A+H1/Vx1ExB9RXlU21I3An0Mu37mFmtrukYB3s
	 EK5qLKi1xc31OeLuBxrDX+PKZC7+K3pvD8evoCY4IKtztUxffbaozekI7pDG/Ugsfa
	 T2xhVpM8sOniC3et1kUMaF1UjYZwdRozu9EmbqanEC4YvOn8LdX2M5Yq9m7AjyVMV/
	 A7Gt7pckzpdvQ==
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Goko Mell <goku.sonxin626@gmail.com>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260805064348.44283-1-phucduc.bui@gmail.com>
References: <20260805064348.44283-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2] ASoC: spacemit: advertise only DMA-backed DAI
 streams
Message-Id: <178656041255.521321.7252255564384020860.b4-ty@b4>
Date: Wed, 12 Aug 2026 19:46:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WMCbSYBvbFSAqJCoiPswlpF/qTICQkeiWenI/Fv71Cg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfbaJ4xXTgaAU8344lNnzLHvdYVkrGGb5f1eyH
 s5VgiGWywqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan22iQAKCRAk1otyXVSH
 0HqpB/44WA3YXP8HUVRPmnUU+CaKSAAsNSpCeGaKrWokoYw14GfslOin9QfaxnVtK2nvQGb8hEe
 BgVlCQcdGLimIF370fcNVOBnoe/zyrX5mfwTkIe9kXCe2BnmkYQa07Q+nlzGK30knIoYvaX/59r
 8m8q/BX1DvkY6l1J9OrglwNOwfiR2oJTfULl/m2mirlq34G3WT9/bSdJni9TJLyxnsjntGFwTiC
 XUsHYmIAQRS5XB4A2MPjazuNyqibaDiFHAwbX9Pm21HviIfswR5142VE2Xy43R+J6HC+Ci6G99+
 xHTZeysYX5BilSm+3r1IeZ425sl0E9nxc+EhrJXYYFjl+s2S
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 13:43:48 +0700, phucduc.bui@gmail.com wrote:
> ASoC: spacemit: advertise only DMA-backed DAI streams

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: spacemit: advertise only DMA-backed DAI streams
      https://git.kernel.org/broonie/sound/c/0a91bb72980e

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

