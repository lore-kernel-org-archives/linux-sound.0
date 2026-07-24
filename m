Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4284908AB;
	Fri, 24 Jul 2026 01:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854928; cv=none; b=g/0d2vhFSgFUp7Z8KVMyuSYBIhjg39wgSYYS9QtRyyuCPLZf4m6aw0VTs5sgQmr9S3TB5WU7Bt2BZAcUpxJQZeN6f83Exdn7b0QyMNUZfkhSGX0dk6Nkx1Br53Ca1Ni5Fsudr5XoqN166uurkujEna32HpPGULO4ISVS1yy/JfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854928; c=relaxed/simple;
	bh=JsCrlV7d32LT98kuE74giIbgmhhYI0/wuJVUM7645FE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J/G+lJeo0Vh4YORsOpE6FElPGzA3fuMj2DCued5H9BmtSAcV8MXOAMCbczsRcrp211A+Zt4+hUlQwHm+p794bHnCMkqp/YndI4/OK88DvSP6iXntZ215fGRKDdQ6w/yAlbbaeng+34XOcwkl2+UK/nu8H/vfla4+PGsjAjj20fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiwE0g8c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiwE0g8c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B7E1F000E9;
	Fri, 24 Jul 2026 01:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854927;
	bh=b48QK5Or/whWiFvUd1wGniqQbXyS0mVrzphAoBP1PGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BiwE0g8cEJR554C4x0D6SwGHpK59xxS2H2wOREM14Oyqg7/cehKS+HNfkdZbdFXXJ
	 b6/4/Lu2ycNAGceMPpbTtRgQLFJC9xqqCcKheW9KINtBpdjjQJmt2+ZE7nEYecwjqL
	 QOV8l+XLbQfkC3owtSxkKoEuDPJxkJs5aa55KU8plKMiNYoq7oCvK9J80rrcsXgAKX
	 zVTJ1Y3ZH9WPrqCFpAuY3eX7lPMA3KHH+xeKAcp0rSGvWt/tA4xp7kicxqhm/jwn+k
	 p1ilMFMqton3LhNcVDXLrCmfoos6APP8VW9zjE523E/QwxfOkfiD6ffwmSgq4X7hOB
	 xu8BYOzmNCVyw==
From: Mark Brown <broonie@kernel.org>
To: Jorn Baayen <jhbaayen@fastmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260721151924.30316-1-jhbaayen@fastmail.com>
References: <20260721151924.30316-1-jhbaayen@fastmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Acer Aspire AG14-22P
Message-Id: <178485491318.1477195.1125936107601145355.b4-ty@b4>
Date: Fri, 24 Jul 2026 02:01:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JsCrlV7d32LT98kuE74giIbgmhhYI0/wuJVUM7645FE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrmM0Hwf7b7weBPzyRmE8XWDXMtLxELyaAvgT
 v+0RpYpdgeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK5jAAKCRAk1otyXVSH
 0IlfB/4/hp3JwNb5ci3lKw91Zdn6Jc7rdOa9c0bTHXWyAbmRwVRy2x4Lm4GPGe7hGKAYIvJUzry
 w8c8j++Gqt+vPveLslBfDznX1FQsqAwgY10bln6XYYUHZYG5+JKCWOAFReS9djQjzA+IPfmypGP
 yDsB7OFucbnAYNEXpDvTeV+yfQRakCxK0PC5wAWtVW1AQp+upFrFWXiSqy0BNV1/iFuTFbv5B/h
 g2gGnbOhRrHxEzaB2eG3ykIMGqVCnBQlgaPnr8hpDWyxT/7mYplPHeq0m05oFJ5YyNo9DU7Ac/V
 6rxKqd5FNaQ+3o3VVeuYfWKxcbkq7v6Wf7Rs3PFdc7MtRw+t
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 17:19:23 +0200, Jorn Baayen wrote:
> ASoC: amd: yc: Add DMI quirk for Acer Aspire AG14-22P

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for Acer Aspire AG14-22P
      https://git.kernel.org/broonie/sound/c/a9df7939a2c5

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

