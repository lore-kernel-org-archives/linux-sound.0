Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C5148FED
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487829; cv=none; b=SuqYpYHQuDDn6NG1rCOxt74TiXBNe21wBFVAna0xIHIBhVQuOFdySk//2L5okfp0qOnIKeZ6RK+CsXTvqkiSKY+qxorvyGLuxa6gmNY/a/IQ6fCuEAk0E0UUW4sBHtP+qYrBs71LKAHSs6atGR0kvWVsozrDkRI2uN8HlRn9DDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487829; c=relaxed/simple;
	bh=nUXxadfRolGXgOkeHyHvKiNdu54lNo3EHhOpRM4FYYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eaqQC+1UhT3zCUORNMY/tAzeKg+SXHJyXAx6/rNWAwWje292PpdfZZSb2pSV7nXx7Hd/c360gTseRHQ/L15UpgKFeFf72TfFD+t/qjatY1iN03YtDWFKFX38/e7kfK/OZC7LT7fhnhZ2gG++G2ud+v8qruFn4EpRRaO2TqHIt2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJurPXbr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJurPXbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F05C32786;
	Thu, 27 Jun 2024 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719487828;
	bh=nUXxadfRolGXgOkeHyHvKiNdu54lNo3EHhOpRM4FYYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uJurPXbrxRjg9Qk7Xnk4Ep02lHQBbJXN4ZYZSsWiY9TJBdXk6NgWfRjDOwIyqMWj6
	 GQF0XSXhtfCMBCMNkSsrSc+ZoGLYgkiMajX58gFD6hPRhgU8avjbgYMDiaJMbZKbYR
	 mW0KdrpdKTJAQcTy1wtkZTBE3Ln5ZzcRMRCg7oYjJdXlhUV4RUe43nfp8a2VbKnh7N
	 tgJiAg5uDQPPHceUQf9VJTiQ3bdCVxmJAEnb4qPIxyNxd0ZsYd9zAqqV1ej5HKbgAf
	 oD05jA0eMRWYNsSPnM3e067K99BZJlJHgpNZFi2QyAzqLxxnYKv0Twgy3L8gSfVx+z
	 u8J6iFv3xVzMQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20240620103237.2124196-1-shumingf@realtek.com>
References: <20240620103237.2124196-1-shumingf@realtek.com>
Subject: Re: [PATCH 2/2] ASoC: rt712-sdca: add the function for version B
Message-Id: <171948782677.68092.9737848700397005574.b4-ty@kernel.org>
Date: Thu, 27 Jun 2024 12:30:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 20 Jun 2024 18:32:37 +0800, shumingf@realtek.com wrote:
> The version B will support the multi-lane function and integrate the DMIC function
> in one SoundWire interface.
> Due to some registers having different default values between version A and B,
> this patch also removes the redundant default registers to avoid confusion.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: rt712-sdca: add the function for version B
      commit: 936abb09c1c7ce2c9c8b7838fc780e98c0140759

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

