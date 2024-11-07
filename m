Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EF4212D31
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730992997; cv=none; b=QPKj9GPXz1uOFwqRKjvWMno9MgQf9TApU98AwdynR3henfJQliHSWORe9U0eKXAsojHN2B6eiVCbCKm4QEZSph6ZqWV5bF+r+f1H8jickEovECoCeRH+2dGqQhpbBpQozEh6E65vUGUZdGo8TFa4BHeLeRDOIVe4oB/GALzJ34Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730992997; c=relaxed/simple;
	bh=2b3XAHbSgmcGVdOGxYAudd+Ifal2TuUOBmaUBB3skqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tEe80zf+SSj6NDLTD1xDjsQQVt9xcaJgD8u2vs6WiknMz/nlYZj+lPe4JhLsG5fp9l3izxA0co4gIfLRHcegP0Sbuxx2VfFhmqRlQhDHz2B2pJUrr3R7RMIhn2ZuMAOagw0d/9WBGztgaLuaa1h5BpMG3j2MEauDZGezN9k0xnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uB3g5SVA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uB3g5SVA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEE5C4CECD;
	Thu,  7 Nov 2024 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730992997;
	bh=2b3XAHbSgmcGVdOGxYAudd+Ifal2TuUOBmaUBB3skqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uB3g5SVAT1ge5DbBXDFUEfPDkXSssS2j5cukSl4nqbL3ZLNuBi8bo/TN+ccczY/cx
	 Utt9KDi8a31eBQRfqTP6dit0Lv8D+G6yi9iSONfcAqUsUlYt/6JrdnrN2xQkRDsa9r
	 RJalg6Y0mJDbzWMGnhz1eIfR4ZaNt4geP37qYZplqVsroX+W/9wGSF77tbrckzLzda
	 pU5FnuX9EXPN6fJJ8zS5/DnqOYfeP8QZN4NUHp9EVYPRL8D5uNMt2x3qUA7KdTBULn
	 Mvh64EALj9+HqRbSDzY6gvJoJ7cqtMPCVJdHDAvJ7LUDcIkhl5xdxLtLzFjqDPSggj
	 lbkwEEUWEXfHA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
In-Reply-To: <20241107121532.3241-1-peter.ujfalusi@linux.intel.com>
References: <20241107121532.3241-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-stream: Always use at least two
 BDLE for transfers
Message-Id: <173099299538.140347.6960931521284075399.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 15:23:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 07 Nov 2024 14:15:32 +0200, Peter Ujfalusi wrote:
> The HDA specification states that the SDnLVI (Last Valid Index) must be at
> least 1 (two BDLE entry).
> 
> Update the debug prints as well to provide better information.
> 
> While the LVI=0 worked so far without issues, it is better to align with
> the specification to avoid unforeseen issues with FW loading.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-stream: Always use at least two BDLE for transfers
      commit: 1b1f491dac4f6ee88ec7c36c4fd27880b0a89f41

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

