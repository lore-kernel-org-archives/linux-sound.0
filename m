Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985AF39D3D2;
	Fri, 12 Jun 2026 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302717; cv=none; b=p20IuRF+pmPc7JHYsQy34Og4NTv1OXNEBrWbo6TnPVzp+cwJgYmTgS+IxshXka4UvTKlo+xDqSonu31hIBQS2ic2GA9vSlQ24ZJwZKjH8tisSOoF+v7e1vPpLTGIUeBMcNXsl1Gfm0pa0eFIt1hSqdk0PAbXKiXmoTOLgpn0TzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302717; c=relaxed/simple;
	bh=Um6eAUCPWjVFfcT0KQXUzpNerI9+ZQ61WvEYjkwPMdc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nSr4pHbnaph3M6mBQun4yGhEOtIVMYG4Qf8mzSs60kzIpIenAnHhJ5ZiA+bU8otUNKxrT47BONC8WxwsPBduE1nUM9fot0/YMsKuZrPXSMdEVT+4lvDailhD665b7JaX9hPunhkR32p7dk78xEVNhjjGTmiq4Ig8XX6Rx0eWQPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1IvyK72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1IvyK72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370091F000E9;
	Fri, 12 Jun 2026 22:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302716;
	bh=Igrw3qxtiftcPY4xHzzndMXkm3VLQrIZsuKRvMUK5V8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=U1IvyK72Dn1ZLBy1YNbgjyjOcI9MBnLlQniWKqpHxBfosYni+SLbHULmJhgZVjnM8
	 yWr031GXcbc8fyrY/aNf9RP8EVI18NMGLizvEym4ECbHVTaZrwax30KVjCVjLxpEXC
	 TtxAePjfV5Uk6353xOUzuH31FUKr+tN/RkoSSZF37Kc2/UHPhrv8V8DXPkVgl2nrSd
	 7gE6+NinMhTdbC31tnvcq5wjwBuJWvclPHDArZoF6aLC11gzxOgFF25kxvq8Zs/e5I
	 uxy0K+PvYc12wovKMpBa1v16xHnVE9V3Mhd3DHtBoOwRqSpIOH/b2NDmW3dLkob8DZ
	 gYXnbiBECuPcQ==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
In-Reply-To: <20260604125520.1428905-1-lgs201920130244@gmail.com>
References: <20260604125520.1428905-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH] ASoC: adau1372: Clear PLL_EN on failed PLL lock
 without reset GPIO
Message-Id: <178128516877.48375.18234991680601369888.b4-ty@b4>
Date: Fri, 12 Jun 2026 18:26:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Um6eAUCPWjVFfcT0KQXUzpNerI9+ZQ61WvEYjkwPMdc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIW3zx5NyK6TbnZG5s3atZB/RUse7UHSCP3pf
 3YWJ1Wi2KeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFtwAKCRAk1otyXVSH
 0HBCB/9QE6TMxbXyr0vrNlB/vSbWQJ/DXG2deq42FFORf5eh2xyu1gjeYWHmXW0WReX8goP4WYt
 BukqrgqeEEsu3hx47JlAdYNWFUXvfRf3I59r+tqY7URvvaHSPrI6vxqOJ6sijjt9retE+6yw40P
 4iufVI6lMbzRBm6XWLaCdRabpVOoRoCbHlnoM0uYc7zfUy5DeQrNjlXkR9xfX5aq5Ycf4eMYVKk
 EkVACBYhW2xDW9YtKXct6U/HN5SB8inhdiMsKtKi/b4PbUu5hkQ5G7pGHYDwyvl1jygtUmVaSmf
 nr/kUjPFOGxOwQacIYXFPni491qWgfD3X0E6dSs7wGGFi6KL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 04 Jun 2026 20:55:20 +0800, Guangshuo Li wrote:
> ASoC: adau1372: Clear PLL_EN on failed PLL lock without reset GPIO

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: adau1372: Clear PLL_EN on failed PLL lock without reset GPIO
      https://git.kernel.org/broonie/sound/c/69b4141b428b

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

