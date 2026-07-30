Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E31434404
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426642; cv=none; b=Z0jscOcn+hwb5rlnyOC6KottS6j2lWP+XdW1WZQ9d1UnxBqhXMfZOPOiWtZZhjN3HzbRo0FcKA7i4+VPDHrmMr55achRlo8wNM3CRdB0cRH27tXBhYUUfA52nYTWa8V4NbUSv0EJtMRqXbWs/pnXExnLbIOTvNgNf8LahgFb/5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426642; c=relaxed/simple;
	bh=YpR87M9shIqezBNqPpkqIT7K+9AGgpZigocWC0wpBqc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bPGO0dM9Cdg5+ULej4q3LaTcSLwofP5eh+IZOw3Xqq6PsOXUrOkLwWQWrdC5+MxpVEOT25ihE+zcEyKzzcJrQSCjXkCDj/dHwr8we05d9gM7VDVNiWGqaE5bEp1YuT73EKPtHaGzRF13z0K7hxacBH/3weoswYjaq5V3LbLlYP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OunPgipU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OunPgipU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0D91F000E9;
	Thu, 30 Jul 2026 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426641;
	bh=RCnKMb6Kk/BPAWQhwRcNivF7dpPUz/upVbHZLCJ4YZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OunPgipUl8yTcoiLBSE9FmYFwPqSk3ifPHZuYG3f5d7cVVI6Z0JcVyJd/HAvKk249
	 Q45dX5BtZZEejHRXhDpbM9iJbuSL9MAGpjH4JQrl/hhg2medoapJ35ZJMU/5jmjZXO
	 hSkXs6ynwz2IEi7eK/y5gr9wHr88EjNnsnItdxwcim4WqhmweSLJXHo2d8QSJTVemD
	 Ohz6ecd4EDMQYKJfAU73LVwJFXS/ZHNtGMRx5ibo47VOb/CzjGxvk7FOW3iR12631c
	 x05uyDww9S4yTKbbJ+vkc5Ti3ZbGEQa6/jHILD0X6S+avd68SzanzXzJEgFkRMXzpn
	 xGglniVAu7qZA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260728090111.3676617-1-shumingf@realtek.com>
References: <20260728090111.3676617-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722: reset codec to fix abnormal sound
Message-Id: <178541457454.81171.12875962743999061507.b4-ty@b4>
Date: Thu, 30 Jul 2026 13:29:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Tue, 28 Jul 2026 17:01:11 +0800, shumingf@realtek.com wrote:
> ASoC: rt722: reset codec to fix abnormal sound

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rt722: reset codec to fix abnormal sound
      https://git.kernel.org/broonie/sound/c/d0ecbedd6a70

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

