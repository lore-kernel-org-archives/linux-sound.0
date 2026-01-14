Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A6936D4FB;
	Wed, 14 Jan 2026 21:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426604; cv=none; b=l8ZFWUYvaVMFOsc4fguedxx0z/07IzyXoRQwlha5uBeZ/I58hNdG1xRN73sHYn93f0H2ff+k3t0ruB7qw8PNiwCpGNCExDT30PoTG/JJaYp8dqPj6TJB7J8OkL9LGAVD+hcQMB0NG8cAgqVQXq/DggUNutkcAtQoEYEgzr2qhU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426604; c=relaxed/simple;
	bh=iUdnCyo7xu2jMP6fSTFRWznjQ0rKG4U/jCOtU7ZCn+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jFIyT1vMdBUCQuSnvWfsg83Td4gtWLFzM8DfwUN2F/cNut1Y8kLLmx8lYFMS/lg4lnCtQtuGOIA7vat0ib4Ol3wWnCNYmtMnQks6Mc+au9vVVp33MlKTG8dimdTl1n6x6XA0p3mvWWeKJJV8fXajH9bDtGPpLW3GaGJdCR45gpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ec7fpTpE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec7fpTpE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9788EC19423;
	Wed, 14 Jan 2026 21:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768426602;
	bh=iUdnCyo7xu2jMP6fSTFRWznjQ0rKG4U/jCOtU7ZCn+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ec7fpTpE6piyNSpSEaBaEXzzk7Y62GW4vY6O4meaXS+uRhAdDxqBrYCTvx06X4L08
	 dV4f7qcODkXbDZZ79qdr1Pr66topjemlEMWHPiDYy8aItqo4rmLkwjKltXkQ+cguA6
	 bDoB64MNEKDavFfeeuYyKDFLACv/6lemlHX5LENyn7eVCZ0ZJPtUWUvgleiNdJLia6
	 K54toXGyU8N78PfA39zwLGZBSryIAwCSk/EIQ+4xeWcWc1e16WlUIuHQWA0BXqtwBf
	 cUcvT4krHW2ohiR4ORpc6NfllmxNea+rJeETMMGdTZMIwirn4KP8s+0GZY123cduyy
	 ycnkCAooeqEYg==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260112140758.215799-1-rf@opensource.cirrus.com>
References: <20260112140758.215799-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: Fix sdw_utils calling wrong codec init
 callbacks
Message-Id: <176842660135.229619.5331099202255368085.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 21:36:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 12 Jan 2026 14:07:55 +0000, Richard Fitzgerald wrote:
> This series fixes a problem with soc_sdw_utils.c calling the wrong
> codec init callbacks, because it assumed that the DAI name could be
> used to uniquely identify the codec. This isn't the case, especially
> on SDCA which is a generic driver for many parts.
> 
> The second patch is the actual fix.
> The first patch is needed to add a missing export to SoundWire core.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] soundwire: Add missing EXPORT for sdw_slave_type
      commit: 1ddbcb910a06f53fc2b14e1743c6ad4ccfd7107f
[2/2] ASoC: sdw_utils: Call init callbacks on the correct codec DAI
      commit: 5b027c74f3ee8979193c50d31187edfa31acc0db

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

