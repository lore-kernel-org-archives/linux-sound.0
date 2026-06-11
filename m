Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993A3D1AA0;
	Fri, 12 Jun 2026 22:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302756; cv=none; b=ONHrly66wl+YcqXX3oQ9EV2I1eDOr+1bHKJkGswxzdO/I2hm8LSwnxJHyPZ832MK+FmfC2ztNSVPdb8PIixW89HPOFnG8aKoF8V4lU1NW85jX9B6DQx28yTXju1oKiL1qEd0nnUIODVl52EG39qG+Y7uPaID2Lx2nwlJde5sgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302756; c=relaxed/simple;
	bh=q/ePDLbuq221yKIMcn/uM9R4k7o9ZqIFjOkpq4bDfX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZupLbKegqG1zhrKA5iq/xK+UxES29q2IQKkNdv5fp8xSwJgvNv7Zm0LBgZ8+pOzQSirZJz7fcOji1hGMW7I5QMxItfLiX+V+PCywxkvxRD1BLGJuBeyE88tKZFfxSQL3FVGXaj4IDbIPfGlyEyJkvMUEg+ZKpuWZzNRhmeW1xR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WswevIXR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WswevIXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388891F00A3D;
	Fri, 12 Jun 2026 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302755;
	bh=raD0DV9Bl5ViipDNB5LAvSIjSFwwXj88qPYZmqyqjq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WswevIXRn/FEU/DWqFdMMd9Y+16KNZtVFclRhEjHm4yFRZXPRyNEg19Y0rTSVWZ0U
	 +dcNxIBbI4NiXRWVqhtNt3ogbY2wJ7lGSW9X4Rwz2yhRFOmn8vqrKhMifPider3OQv
	 xgKX5Gs1IFjbfAUKuKXP9bun0XzGRpcfT6/jNam/ekyTC4L+A1TKOLYbXCR10qmPVZ
	 TvezH3AYeWHzfqZbKLKWH3QxjW6O0/22TMnqnPdJuOPLGUYJqa/dsGotGoNxSm4FMK
	 mxPUnfwzJibskb5Fbio1I25k9YxEqSLuEZ84ugPk9t6nw6OaGiaPUiKjstE3nL54GD
	 TqkVWE+SceHFA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260610102153.83367-1-phucduc.bui@gmail.com>
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
Message-Id: <178120696227.484538.4270206978478924014.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:42:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q/ePDLbuq221yKIMcn/uM9R4k7o9ZqIFjOkpq4bDfX0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXes3vMx5VTSrzq+Bi0bcUY3ANrcFqllZ+0B
 kA/bI7yUymJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyF3gAKCRAk1otyXVSH
 0CfbB/wKgwKnTeGoDFLJd4ux2i4QSIdaSdF0wZdVFkFvgFvu5/MaUqyYU3jnveIKpsQTZ4v9Z7w
 yo4Q6ZI/8n3jjbfwkKNWgJq+oqEHB15qiZecTWFqa4LhCidHIPSks4W2d04F17/R86JS1ZESn2T
 q/GgTyBP8zvYGDBnSFr7hmHNGl3/XjF6TMbc6VN1Jva3q6jdxXBA3yE0qLtCm3XnSKpJ9igK2JM
 zsN1dq4a2okuV+xiAW3Hfm9LXDMeEn174EUAKaKxNZqWnK4F4Wkj10cOW81hxhkzSjUKlcMm2n4
 LdVug+WkHhDG0aBnpgei7RARaEMzQwkZHwVTsZnGQQtkSb27
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 10 Jun 2026 17:21:53 +0700, phucduc.bui@gmail.com wrote:
> ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
      https://git.kernel.org/broonie/sound/c/a68bbd4ac1b1

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

