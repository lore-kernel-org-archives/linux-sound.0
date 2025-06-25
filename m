Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02032D876A
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873196; cv=none; b=Hw+FBrRG9JGNRWT/mLRbYWXphRc+VCDkiMrKyh1syJx80RB2hfNcEcsZwYRnMn13/ndB9QeToYcw2RnfP/1Kahl0h50++KIY57dECT0ijyRV5vYJcQzObcIPTipL42Cdhkgk1xCGs2JgV05FeDVyfPofjOElHXs1k+IW8YLkecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873196; c=relaxed/simple;
	bh=0PkphK2145S+Tz5w1DDBGAPAohEy27jRV5+57SgFpgk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sxNAoSs1FJFR8ndIt1XIaTqXFQc0x7JyUA5MXUcsnduAJoFapcbVIPEmJ9lwFj0uH8NWzY969+useIVUUi3IPb98U9GJm9mFnJ++9CuRVqnx1NVNiYZ3YW/qZOLyxpwarToQj7af1L3oP8CXKTLpd1COZiNfwdTnNpjt3xJIN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojISzqsZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojISzqsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41718C4CEF3;
	Wed, 25 Jun 2025 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750873196;
	bh=0PkphK2145S+Tz5w1DDBGAPAohEy27jRV5+57SgFpgk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ojISzqsZS3N3sCysHPBa2a5NofRjdlIxkqLHdqh3jH/tJSlVSp630LCSFvNoqtpPY
	 RPuOHdZ/RUGZXQdmUrqMglhJ0pf4lCXzym+6NSQA4CSC2UJ1CKArDSn+wv2pY48vek
	 qbAH/0F4zKgujoctt8g4C44eGwxUCJTD7Th+kVwbZ2NTs2pYdTfBSIxe4NtsomIQAj
	 YvFgBf2+vcIhxOiuwyAqsi2DU1DVup1o4yrGO9HqrYLt9Hn6ybE3d2JEAhIdmyeiWD
	 ab66HQrbZDzxCK0G4FsoKNPfhjXCobM/LLnFYSaqm9UnjC9hqiaUMr8FWuGOfGRYYG
	 m04uqDW8zJLNw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250625140430.311865-1-yung-chuan.liao@linux.intel.com>
References: <20250625140430.311865-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: sdw_utils: generate combined spk components
 string
Message-Id: <175087319499.198995.18239876279267878351.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 18:39:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Wed, 25 Jun 2025 22:04:27 +0800, Bard Liao wrote:
> The series adds support for combined speaker components with one "spk:"
> tag in the card->components string. This is a UCM request.
> 
> Bard Liao (2):
>   ASoC: sdw_utils: add component_name string to dai_info
>   ASoC: sdw_utils: generate combined spk components string
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sdw_utils: add component_name string to dai_info
      commit: f792733e08d5f5d44ef76d22bcca7ca45a82d0de
[2/2] ASoC: sdw_utils: generate combined spk components string
      commit: 0f60ecffbfe35e12eb56c99640ba2360244b5bb3

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

