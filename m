Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C740BCDC;
	Tue, 30 Jun 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818279; cv=none; b=Xbxmj7Uamw0kpjhyYmq1vY/txn8qWuV/S4y8v6xhDBaJ9cNdh1xRmD4anTfkHvzHsQislBLsZ9xeBP8drxb2+YueAWj1O0kgMDrVP/lROeGQX4fA+o/8bCrnd57LGuDerYs3oHfjpvpScHQ5AtoWeajSo+mTHQxbGYTORL5gBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818279; c=relaxed/simple;
	bh=9/YDBUVtaVW6S4CrG6wouoMrNJChPfP/QJL3on0HzmA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PvpGZy3XTAuscpovEUQUvgPDuF6x6W/socXy4qhPA+F7nA4Vtd0ElnLP8tQmUKNX9t4xcmkz7Ppgof58bfA5M3L0UGlc+4BrkViclh1a9cwTuIj1BHnazd0B8bCztV+68MZluzCtXlV+jdGWwaNM+DpQ6mgpfTImikNPM2wt+YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLdROPEg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLdROPEg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9291F000E9;
	Tue, 30 Jun 2026 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818278;
	bh=mNYmvI7fy1S/QZNsIS84bHZwcpw6Z3RHt86wJ+hbZA8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=fLdROPEg1iSFGXo0GRh6uDCuaChfVv/ePiqoq2hSHB6tVPuT8O4H1I9gWglk7im5h
	 QgIGJOzHuoIxKju6Ztvoj9acBsFJAHslx47vhev96GU5sbOLBs+x9Y0DsQjuXkGG2a
	 f78WZGCEtepeuXOfJFDa1Illgme3oGOML5boMa1VmCwqTS7Kckf1XLmtUYgwBw9OQa
	 1YICylUr/Qckc/P05yVNnlQVqEGy6ENYxSe30ZgjBxJWHncmLbrpYFYBsTXl2YL+I8
	 FT/akuy9vq8VS11lpt08lxHEhIfTWrU90FOtAU5jYpuEEpD860ILEZ9FNBOa9y6BRA
	 aCxGmOh6MiFRw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20260625122811.4056274-1-christianshewitt@gmail.com>
References: <20260625122811.4056274-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: pcm512x: only print info once on no
 sclk
Message-Id: <178273909454.47562.12205602859787359059.b4-ty@b4>
Date: Mon, 29 Jun 2026 14:18:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9/YDBUVtaVW6S4CrG6wouoMrNJChPfP/QJL3on0HzmA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6XkjxGR+d8+o+8JweTewChMuA6PLfEmRnTW5
 uYJN9Efy6KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOl5AAKCRAk1otyXVSH
 0P0SB/477BRsptiGZ+yMS2xBzEhLQoHlVvaE0VoZsX58ZoaFd9Ph97lM7OasSyrbExXCZSd1WOw
 RcXf9oTvICqieYKVNZowQBK1WHlaC315kuI/4a5vTUw9vEWhWKHus2SHMqr8ltQ5U0htszcisj+
 hbbmjhWppvA4RbZ9sXUisH/lZSPbNqVvspxr6GqSVbQfKC3PEiGW4txGCmX8nsI1rWSVResuMs9
 I6qKo8YX4tXjFwxlR1u5c7ET3S2MVdZUZxkh8+SEVU8icQ86dBKGP+OFdU1j8ZLwM5XPuXcL8JN
 771qnMuRarLWH/3fYwEDN//ZS9QTXRiOkuHLVbru/FWvEVp/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 25 Jun 2026 12:28:11 +0000, Christian Hewitt wrote:
> ASoC: codecs: pcm512x: only print info once on no sclk

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: codecs: pcm512x: only print info once on no sclk
      https://git.kernel.org/broonie/sound/c/c5315c8dcbcb

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

