Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395B14006
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105316; cv=none; b=jJBAosah0SSBphI21nFzFiEGWCeyyn8wzsp4CzX7jW6ayZ4xupKmbVHBo67ynwQvMxaaehgsDVIMhWCL4e3veC8FEYJzvvr/mlryegx0FsWIk3Tr+pTagVwbFwsD3vb+NOE9+WoMoLCHrkYQyZ/RMkxPPGdk7dHw1t6y9PNRClI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105316; c=relaxed/simple;
	bh=sqDTlozgNMJSM0AHPdm7EUAIVn2oDHK0DdTYht4ikvI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NQ/1ziCicdSLlwzP2tPbeMmWVsRqmvWAdJ5sOsY845720gzBuncVxf1dJDA4HXgXz4cKmb74nUHdZHasBpSH8OdX3BdGaO83DO7YdeRX5p20o8JnXFPs3FgWzx2NjfsJk3iWgia6z0gW0Pmaad2WwHk/tMULoVYXqhH3Wj8j0ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSjmkrk6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSjmkrk6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FA2C3277B;
	Thu,  4 Jul 2024 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720105315;
	bh=sqDTlozgNMJSM0AHPdm7EUAIVn2oDHK0DdTYht4ikvI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mSjmkrk69vAiaxLyBPnptZ+Mxbi5naIja3zHNiCL6rBjv41RSqo2XFj64EHc6yQ2t
	 0w+e/ryR7TrUfc27azlfQ0gJWNUZ8nVrQNJgKRmFUxJkpm6lU6jmoRQbysNLY0xuS8
	 nCyDPG33sow9PQgK2M1N7wndKf85bjhhrd/JV/LsWPPJjNSYQpAuVih8imr8Sr01hB
	 s84kUqvpAnsD9bojjf62QJ11Ohn6g9UW1XediS5G45SIRhR8fNYh2mzwQDjibNJZqB
	 zeB/yWd2YtgaF6nhfA4wO1/MAiGuaQS4QyOFnYa/AoIqCarcgS03Qdk9PxXvL8ZSZd
	 mTmHJ52GiIkRw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20240704085944.371450-1-pierre-louis.bossart@linux.intel.com>
References: <20240704085944.371450-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use single token list for
 the copiers
Message-Id: <172010531424.64240.8468418054807775164.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 16:01:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 04 Jul 2024 10:59:44 +0200, Pierre-Louis Bossart wrote:
> There is no need to keep separate token list for dai and 'common' copier
> token list when the 'common' list is actually the aif list, the
> SOF_COPIER_DEEP_BUFFER_TOKENS are not applicable for buffers.
> 
> We could have separate lists for all types but it is probably simpler to
> just use a single list for all types of copiers. Function specific tokens
> will be only parsed by function specific code anyways.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Use single token list for the copiers
      commit: 6558e8737af2067763e115ce3759372cd068b897

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

