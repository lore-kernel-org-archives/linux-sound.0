Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F303A371860
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500935; cv=none; b=Tc8QAgpN5SCkb3HHcB3xaqFxHZXX5Dwk0gYmxfTV0t+1+t6kzMVcTZjNXVeD9avXQZX705lxnePF5XWeDfNpomnfWtHtWlLpA7gO8831hAZEfPMbRgJ6aNff3TnidazwLnjKOtJiV43ECPbTMiU3RPYwcCgerF8c0fD63Ue0IUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500935; c=relaxed/simple;
	bh=WKB0UesX8C02L3ajsPXCzmuWEL8Nz5seFQkz+X4eytU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sH2wzVbksj+u4H/BuYOJERAPyeqmkr54K3n6XRo3pM2TSs/Ddyvj/yXObGRgo0A5Tmjg0rozmFFZb8uzA0zqVjftapPM2nRHMiAVwCu+zGet3l8T7uYfB1fsQKUYCLm7WFPb79R1L7vRKeD4PWjvQG1GMiePgi8EoKn7IrWNvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGC6nHHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGC6nHHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BF1C2BCB0;
	Mon, 11 May 2026 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500934;
	bh=WKB0UesX8C02L3ajsPXCzmuWEL8Nz5seFQkz+X4eytU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SGC6nHHbusEBSqSv3riPD7+ewKWvlqKi2JXEHVyQV14w2ngjYe83o7nbputqSVEQg
	 3mIFWRKBfwd30mb1cfEcqvU3ZJtuB2+xgXg9v9naBTtIvxeBg6fXTlqfa6BjSU/AHU
	 +sVqTHXLJvd4TEP1kSDkc1mYxnO+TzuaL4RM3gFCXS5N+W2qIRin/Uho7d4Y+xhXtb
	 zRaSoyzAzv81iyNKSU9tFahIAR5p4GE+4lZ0Pd7SaqxGbg+sU7F0lbtPuRm3sbz2MI
	 vGjMRdVPzcQoYsMoYS9s+Piq1zFoRIgv6AkXf2YpVrrRyK3eKqd6ubID6LPuA9PFyk
	 iBbfnstDGLAWg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org
In-Reply-To: <20260430140752.766130-1-cezary.rojewski@intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Message-Id: <177846157446.988959.2558719237071589512.b4-ty@b4>
Date: Mon, 11 May 2026 10:06:14 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WKB0UesX8C02L3ajsPXCzmuWEL8Nz5seFQkz+X4eytU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcVEjX7f3c1E1idmWrSLiHUhSFssBS4d71K6q
 EWrg8/CT8qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFRAAKCRAk1otyXVSH
 0HjZB/9aGA9W2KSkjW+RdgL2yU4lPSxjk+V55QroQ5y6nRWKWfKMYY7B6LdwtinxML4ZhDEjmzg
 Qzv1Hls7KQMtGyqFmRMo8l6AT+mbQcaGe+47a3y15Gzi4Sf3DUdL+tgHDx+troV8WvC5DouteRV
 R9ww+pEgiJZOUYJJ3uh8Y1KaE2W1wgdXnzQpOnKZ1VaMI8fN7iW0wWgsvvWv9mL0kauHK4/+/SW
 3MuYt1B4+9tO8MpoOOYXXlKThMWZuHs6qhQ3jvUb3KxDgt/UD5dQjJ6X5ZRTu42xHOnethK9vV5
 42/6LAHI1Onc+F5QWrV5HwhaqANFYxfJkVM9ml7Vtw0wDXLe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Apr 2026 16:07:52 +0200, Cezary Rojewski wrote:
> ASoC: core: Move all users to deferrable card binding

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: core: Move all users to deferrable card binding
      https://git.kernel.org/broonie/sound/c/42d99857d6f0

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

