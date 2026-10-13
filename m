Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CF3E44EE
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900445; cv=none; b=Cmn++kDhrpVAYrirc3+hkWYWJhMjM7yhGK52IE5R1Sxo/TU0/eSHfKnTZhCP7ePU72iXKblsGeHNGJ6vVSz9VbOCHDLchuPIYjzQzJXOhXYAWCkc8ZrCL5DFsoYbHOndO/sKel5CkkN7HFH3YgRCKVw5PpHN0VYGWQoaHK9eODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900445; c=relaxed/simple;
	bh=XfYAcvaNQ2dBkigN4PXbDf5JUIB5g7gfsBxSmPMy7x0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DuZa0AF3iigjmGk9V9pGeUUV+FGoS+2eGhDU9rkIltF3UTSndrd3hXfQtgqMMI4NES9GrhAQqS18eZqKbyCBrxVxQDZr73sGEvnY97naDZ9/hI+KdB9Ut3LRHsRmRcZ5UlnSmZijZK+XeThHEsdYFO7kaX8v0QvORILreL+D+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PknL1ZZH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PknL1ZZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9F81F000FF;
	Tue, 13 Oct 2026 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900444;
	bh=99/Nd5pMbfjvU0GMoMW/xpBiNKd+5Eu+VbDqQZ4X2nQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PknL1ZZHQj5Pk8kLoS8v74pO0bw76q55YT0XAv+0dDJy9T58RDUHXhnA8RmTxy9Wd
	 di+IyyqHenirTzd0uoU5MKuC45/PoQjL/7IpkK1Fvf0YAW0PTbxeAQsN1YnXHhhoe1
	 IDmWWpSXiPsUWEoe/2KrPaidiCTGlTdy9EMM6z+zMwauwKJwb3ecvQRJq5i6qIkbbV
	 kWSLtgkjtQ/jb3kBx4wl8plaqElHZWqN8Lf2vbuYfgSOj1HNjq7O18gs2SIXr+ZMMs
	 A++gKGWh21Y7/inKj81wTSBec5DAzBV2XDjkhn6FlnvV9xAVPjZ+YvG0ANbk2qe7mL
	 gwO4u1mQM5TdQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: =?utf-8?q?Marek_Bor=C5=AFvka?= <boruvka.marek@gmail.com>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20261013125425.3541206-1-mario.limonciello@amd.com>
References: <20261013125425.3541206-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: disable MSI on resume
Message-Id: <179189857442.42298.9117713208884036522.b4-ty@b4>
Date: Tue, 13 Oct 2026 14:36:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XfYAcvaNQ2dBkigN4PXbDf5JUIB5g7gfsBxSmPMy7x0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOWUtGm7SzXL5i77/ynHXLsYVPVwoZCjPsWvthz9KIc
 H/RK1XTOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRrosMf8V2Ps78WXpe5qGR
 pixX7MtJup1iYfO+15d/8dT+d/l2+CGG/2HyC/Ts03jzg1/UeH6/mrsimv/x3+i+7KnG/TeXXHU
 8ywAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 13 Oct 2026 07:54:23 -0500, Mario Limonciello wrote:
> ASoC: amd: yc: disable MSI on resume

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: yc: disable MSI on resume
      https://git.kernel.org/broonie/misc/c/2a31b5378c6d

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

