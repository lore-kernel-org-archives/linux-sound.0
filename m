Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8F2F8E9C
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 01:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854932; cv=none; b=ep2PF+/2Tce4tXy8gqZjRcE6xaXDdb2l5sFRFVpAf4IWU2W+CPpU4a9cXurhNPRpWhqz/w0aGzv3hkYBKYCiHeXge9aMBj8U7iKWovgIyeQGS3X9mzAmz5go0zHI5UCZyB2bD7OjJ5I0N688CTTasfm1DCmGrO0tofke1xJ2oDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854932; c=relaxed/simple;
	bh=oU9j6aTWP1vMtEKOSHhrTlxt8KzyDiMTiCeZwo66sOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r/eU7QVSRQWW1mPTVyHZKKVa15R93qx8VdArumlp8ne0WX9as8hE7imrKTQYX6ZTjIEieZGGCZjO9BeYFEwfynh8wdK9OOk1QzrEE3XmHA/55lM9TWkDFd/oMUsQ8hg56Bq4NNnR6+fN1Xf5+mUNL+xUQ3heBijIPYgY7hizurA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVsaLMJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVsaLMJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62D01F000E9;
	Fri, 24 Jul 2026 01:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854930;
	bh=e6CERQeV6VLXqnvXEyzOe844YoG8or7d8CTmqCjHGKM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PVsaLMJQvJ3SH6JAxz1LirnvLV64pVpIXWS6q9f/UJ1WnhmKX4ovnauXpOT0E9SdM
	 GyYA4JA9dX375ZJqbF41fPtk2nsj+PT/qqVHV+zwz4iWn8M2COmUkr5HmrZMzY1fcN
	 kiYuLbkJgje+y/eTtF8KyHiJsS5ZzKch2fSoRkG30VU2JAl5LqTL/MCBIgAuk5ag3v
	 Ix4YgiO7tr3p9bUHPZlVAtTAVHHovpMtVj2zSPWW1l5oVvlVd4IPJbQZZlHdN94MTr
	 BOV15DJwmriAR//F1DpOmd3SNCP2Bgsfu5OvHStaJor3h7IezXR2R6EOU+xPr1yj6b
	 fIJhSAuXFg5Hg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bmpjfjz.wl-kuninori.morimoto.gx@renesas.com>
References: <877bmpjfjz.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: add card_to_mdata() macro
Message-Id: <178485490178.1477195.3552195843332431716.b4-ty@b4>
Date: Fri, 24 Jul 2026 02:01:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oU9j6aTWP1vMtEKOSHhrTlxt8KzyDiMTiCeZwo66sOc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrmQ+RX9h36aHsvdY5LZhe96E7K65JtxSWMmY
 gFroPj+1cuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK5kAAKCRAk1otyXVSH
 0DY5B/0Wr11AskNy73tZ6W5zwgZXcPkm6Y2Oj2JssivNtdbNmcNMsfmHUsDwBnhfUVvT7AD6p2R
 RKlXgF+egVAv94p0IdR1eaMdfs5oII3tRmZ/o9q9/htUD/mWxuQtCkD++/J+QONiCLWN/yFiLhN
 n9Yn/HzRU94ECVCbABVREl6XorpnGToDsH5Kc/dp3yjt12sVSsE1XPaHLw5HQczyEwmdxwhB0N8
 lAmJQCssQrQYSaLAEM3X5p3NNJJwduXd+qzk5IgPbepFjK7SGq+ofhNvky9QsO5Jvbypyx9FuWz
 Nau6g5hHL6pQbUr0RV6KU0gszEdgGX/1Qe2o+6Pa5AycfoGh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 01:29:36 +0000, Kuninori Morimoto wrote:
> ASoC: fsl: add card_to_mdata() macro
> 
> Hi Freescale developers
> 
> I will post Card capsuling patch.
> To makes its review easy, adds card_to_mdata() and useit to reduce
> un-related diff.
> No functional change, but is preparation for cleanup driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: fsl: p1022_ds: add card_to_mdata() macro
      https://git.kernel.org/broonie/sound/c/2700946d7bdf
[2/2] ASoC: fsl: p1022_rdk: add card_to_mdata() macro
      https://git.kernel.org/broonie/sound/c/c02fe2006059

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

