Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210F2E06D2;
	Tue,  5 May 2026 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943362; cv=none; b=PLuglFOn4Yk/UvEKH5WNFseYWcwkJb1wangAnx9Pckcf9RQljzNT/MFOt8gWCHvpsBNJLf68J1uEkA1XWQqiPm5ZzihsrHGNgQFTzoFQQk2KrQY9nOuxDsuQdvif4e3UKg/56eCpwNmF8lmGkMV1ktHCsyPlkYSBy4putK/F3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943362; c=relaxed/simple;
	bh=nImo5ObXpWvU5qmCvtxUSoYcaKKF8ZKzQ/NntiTwEN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qR3t44N7bPP3jlw5fFy+inYDHirMSQa/gHoMXn86CaTEPFM7mOHmUYAoY/YkZ2VShGTRHESjMMZymki0KUgF0/ZaIXn76E3mtNUmPwF8MWk+NQ+QBGzIdwzfHr+IsJdK8SxIoXrPAqa8WYusu2r4QTkN5G4Vlrs/9jy8SsjYPu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWaBBOE8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWaBBOE8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7EDC2BCB8;
	Tue,  5 May 2026 01:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943362;
	bh=nImo5ObXpWvU5qmCvtxUSoYcaKKF8ZKzQ/NntiTwEN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QWaBBOE8+ol4FXKcJ76nymFji0n4gpdl1o8FAADvWpJX0V0ByZ17RnE6traPPa7Vp
	 2+gsIxSoVkZaVPWeEXtO3VGdiTsMQFx57iyyoHzHaFhzbGTqk1UJq/GaG650qF8tnZ
	 hb4ONSaVyGpYniAsuC9uWjYYXrwKbSnf3M8D9sYzW95jag9CthhDiBiAPJpo7qn0FO
	 Mx7Kiqd2Kyc+Ld1LPsD/Xsxrh3msJcYSYvAuZAgoOavl6EHsgWzBJGI8nqPuX8Hlb8
	 yK0VImm7SjBYK4yWgGW96z03KeakMztzmfX+rjfLreagew+PkmjYC6XQCtZiTl6lbT
	 eW2GJm558e25g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260429-k1-i2s-fix-v2-1-8d67835aaddc@linux.spacemit.com>
References: <20260429-k1-i2s-fix-v2-1-8d67835aaddc@linux.spacemit.com>
Subject: Re: [PATCH v2] ASoC: spacemit: fix RX DMA params not set when TX
 is running
Message-Id: <177789977513.458539.3948395874655836368.b4-ty@b4>
Date: Mon, 04 May 2026 22:02:55 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nImo5ObXpWvU5qmCvtxUSoYcaKKF8ZKzQ/NntiTwEN4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UM/TkHidV6dIxc25HjU7MFgUg9136xCHKLp3
 Li5Zwd0PeiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDPwAKCRAk1otyXVSH
 0HNJB/0bxhuwGjLhVB3xyCWT6U8VsQxY/EwjI8SDhh8J/ZWdjUvh7CZuzM3Zl9FMSc1I4p8k7Fk
 qTcXCPLSdCflxHVjGezzpqxqEeG+kZKnBaUy1K9iJvoyqW1O36ZY1De5HJGDRkZRMpeCK4d5Pjr
 M4TbpRaPREaYmNLUuP0QEw9jm2x+d08OFOeaHzS9RA9U6aaDbXDPnNJLIuGEEmr76/G0OQRVv2v
 vesOxbpObzKcmQnxwMqNzKjDCNR6Mo8Z9J8WLAo1EMnsE2077VhYVcQd2lJUmAXoATySVIDECcz
 muj5DFtODqcEynvOSy0pUhb19gAznZxSpbELdb5CQwpcaEMl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 29 Apr 2026 17:00:50 +0800, Troy Mitchell wrote:
> ASoC: spacemit: fix RX DMA params not set when TX is running

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: spacemit: fix RX DMA params not set when TX is running
      https://git.kernel.org/broonie/sound/c/ec0611868f2f

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

