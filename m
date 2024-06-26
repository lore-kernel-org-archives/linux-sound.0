Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03229192B99
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719431573; cv=none; b=b3z9rwzsVhUaejr2PFKEgXzwRuDbcJyKUFO0IKV/raH+Jzq157Agy86jpCvxiQ+Zj7ferXixgnGh70C/fAJbFsYdbeqdGWVfhLmQ0Ofzxhr9HEmUTClzkFFmK5639SNaX5hdC68egzFtw/s3FoKzghcu+/MpOFhgFy5DYd5YP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719431573; c=relaxed/simple;
	bh=G+y92Qkfz/mVU9KAKv1DuTCaPsfdR3w/Je5LKnhZrfI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XoWdwi/5QP05m7LKnAJRKAzV5ZNzcbBx6a0a9eOpVe4ewyWSxfUGatfyEFd2XIpYa7UhPtyQRlFPWS9TUc+QPFDLkaVxu7mw1lHECsG83CL3eVxaOFOFUBtpfxrD1wAx367EE7ylgxSziZHsj5Fp/OgQYjWgH6NDovjZLsHgLu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJrU9vzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJrU9vzx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77D7C116B1;
	Wed, 26 Jun 2024 19:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719431572;
	bh=G+y92Qkfz/mVU9KAKv1DuTCaPsfdR3w/Je5LKnhZrfI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RJrU9vzx2OlS+OSh6+N0w8XP/8ajWZZgDkacsHLUpZduD36iBbrsW97FHLMjirkFc
	 pXpIQLH4+ihKzPDCsp5yz/yAjdeuK3fAtsuiCv2/bRyZ1P2VDkJXs/roe2lqkdw3gH
	 Rm9l29qUIaZ3Hk8H0VlKAexBYBi+/XFFEs21aBQ4AI1ovVHCc/RPkTcKM1tcEBPYrz
	 cSTtudI+1MCtqE1yQDAdAJ88V0nqxc1LI2M7GC7zqn0Qa0IuD1GbvzK/l7MeBka6fe
	 AzbZYG9xiPVyTryYyLwJsszH9+xXXGR1Te9CjXYLyUDOPGjElcWA0s+yjUqX6Ztt3u
	 JXmYo8a2qAzww==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20240620103224.2124179-1-shumingf@realtek.com>
References: <20240620103224.2124179-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt712-sdca: change the definition name of
 SDCA channel number
Message-Id: <171943157067.1690751.11385447887363314867.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 20:52:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 20 Jun 2024 18:32:24 +0800, shumingf@realtek.com wrote:
> This patch doesn't have any change of functionality.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt712-sdca: change the definition name of SDCA channel number
      commit: f2177731b6cdaedfe1dea5ec7d185be579b14cc5

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

