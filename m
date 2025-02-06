Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4681D90AE
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 20:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874674; cv=none; b=OjXt3yV53/pQ8DE1CnREl2Lvbu7sCL0seIJOxwi3dbtD8/Cpj3QulRbwbJxM/QflfmxfWZ69WJNYaNcRQfWuEIxfgDua41hO9sg+VRtYfGXRK/0+k+BUdlnsSu7GTc6Gnrx+Uii3cLQXLovcvECKjBiRbdbIQBTpdXXIfB7fwuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874674; c=relaxed/simple;
	bh=sD12dEnulH3l12ifTGe4L+f6NE+0zlvZeFB0iyKCs4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s4zDvSRmHupwrpqE70w6MQQdFz1IBJ0SFajUE5XDIyyfXt/8YCduIvt8pUTA+5lhmeRrIhSf5SRQFiQR/pcwLPiSREHyGgQc2IrQa1qOeHs34c3r5bUNi2O9EuF0XwhUSJ/cgsVYHc+6cYaCFpzVhc8gGPxjugzDe8D6JLZxkdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/NCj6UO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/NCj6UO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC7DC4CEE2;
	Thu,  6 Feb 2025 20:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738874673;
	bh=sD12dEnulH3l12ifTGe4L+f6NE+0zlvZeFB0iyKCs4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t/NCj6UOcLrUoP7Xk7y2TFjnNAnPOOMsn38U7qo71/pOAQh1oNqV/QMD6rmeFQ9VS
	 MnuLn8VD/mYXxScRFexGILTlGtIFx3Jea2xtaUE8cikuTsLylKrnOYxyzRMMUqhqoU
	 nJtrEZB2Z6LjhqYyvN9xwzbN24AIgGvV36yaQW8fMbVdD/oRZaWpk7sQWCXsh3xTPJ
	 LklvhedxSI2MIH8LnCtS9x5RlWNTcW8dINw4Fs8GLehhcE3uSmt5mzcuAXEdXeAV4u
	 aL6xjMR10ZbVre9nTDCK9KxAF1gQNM176Qk1sCVtyCk6nuteS/uTlQ/yk8Ttaf89s5
	 xWXWG17WfmSKw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, guennadi.liakhovetski@linux.intel.com
In-Reply-To: <20250206085237.19214-1-peter.ujfalusi@linux.intel.com>
References: <20250206085237.19214-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4: Add support for split firmware
 releases
Message-Id: <173887467160.363675.11878079288379134321.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 20:44:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 10:52:37 +0200, Peter Ujfalusi wrote:
> A split SOF release consists of a base firmware and two libraries:
> <fw_filename>-openmodules.ri for processing (audio) modules
> <fw_filename>-debug.ri for debug and developer modules
> 
> To handle this new release model add infrastructure to try to load the two
> library after boot optionally.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4: Add support for split firmware releases
      commit: 4c7518062d638837cea915e0ffe30f846780639a

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

