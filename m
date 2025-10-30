Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C633595B
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822538; cv=none; b=KrXap4p4/rUgYCJXJwcsw2kP9GlDcrflh6Oviaeo9YAamb88KHzsahWoH/cS24aCHs/oRUqB0PMLzqL7zAdHWtQMHriSsDMsLYzsyyJ4E8wJvY3s1soUtFaHPKIVAyAW6GdbX/oGiIt1abU+8tFm9JsRWbpjACbZdtVkhSxIUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822538; c=relaxed/simple;
	bh=cEwfPjBPX4TwCrIA6L1Tqt8WgXJ3aDyzcfo0p5XkacM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LN6jKGWPBtidoGr9Pln27VWuMu703DCwGefpbQGa3bFfTf1uDDjX4/ZVUHFCZPVCl7S/akoOLEebVQxv+CvlNA1eevXm33nVs8DyRDk1RbEUcuQGS7X2NPowCmfY07PanRiqZ3nUrGq4QB7r6641ts0Q6TP/Ee14iWmURJlsE74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrnlZEgH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrnlZEgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB52BC4CEF1;
	Thu, 30 Oct 2025 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761822538;
	bh=cEwfPjBPX4TwCrIA6L1Tqt8WgXJ3aDyzcfo0p5XkacM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PrnlZEgHCOmb81I/WbrAuye0caJlwQzNo5iDxaM5vNZDqqYkN1r7niJ1YWeiZTbW+
	 cy95t89WjpSZUz3d1berj5oyw7PyXahPlmZt334mXUZ2FqumdUOtoJyeGkHNn3ohh8
	 zP/JafjAh4a9zgV6S3N9q1F7HsbGB765IvddO/Z1dmrSpb+r4Lc3KLQaqc/8yS+2sJ
	 yRCEku+FGkx42B7d8v7bYkvKGal/8gf3qCOfo02Gc+MOuwqgaRLPQT+3CotnjGrh0d
	 U6Bdkg3HdMqm/eoqohsnW1eNmHEA7MXu+kUcCmGZCx2BJ3n9v4OJmm1hfeolxuaCGW
	 Z2MPCQ58tX3Vw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, perex@perex.cz, arun@arunraghavan.net
In-Reply-To: <20251029105134.1342-1-peter.ujfalusi@linux.intel.com>
References: <20251029105134.1342-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: pcm: Set the PCM device name for HDMI
Message-Id: <176182253626.10093.3505988510587920910.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 11:08:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 29 Oct 2025 12:51:34 +0200, Peter Ujfalusi wrote:
> User space (alsa-lib) uses the PCM device name to detect HDMI devices, the
> name is expected to be in form of 'HDMI'+<space>+number.
> The PCM device name is not configured in ASoC, only the PCM id is set based
> on the loaded topology.
> 
> Detect the HDMI PCM playback devices and configure the name to help user
> space to handle HDMI PCMs correctly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: pcm: Set the PCM device name for HDMI
      commit: 541aecd34383a85eaf7c8556779466e394554fed

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

