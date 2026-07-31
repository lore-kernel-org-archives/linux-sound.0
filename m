Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4F48989E;
	Fri, 31 Jul 2026 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528523; cv=none; b=Lo+1CxEB95E4/nE3NKdTTtjgSU42NJxPy2bHg+efphS/cVfyYXpkdNhEC20jdEeQBiifkitzIahh9MU7vRQZ5F5yIjSevAStKqbNuYvCGYaQkt3VgfwdEMJwvtjYOVTZxizMEwq0119kxKhav4XV/VFluH5sF3je2i559gflcoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528523; c=relaxed/simple;
	bh=OmNZZJUpkX7C5FtQfN1zkS/k5Xe6AF+/t8Sz4WQ63V8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PR9bAbpkrIL5u77Wt6vSArqW3irx6dmwD2xe3VtNv43t5d5DJCzVLKeEqpAv4AwtQ4ce+EdQ+EKWMX35xOfUQCVZ2UH4qG7qm+NWYOvQ7c8TFFu3N++5UYP3wrQr49XwY0TimiSzTAoILYnObFA/aTWg1nz9pbtyZVFYQjDGJ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQ/li6B7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQ/li6B7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEC11F00AC4;
	Fri, 31 Jul 2026 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528519;
	bh=32dtsrmI1ro+bAyzPRDFOGbwl/0Yr21GgaaDwaKeQp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VQ/li6B7kgNVBfeCcMuP0zFWi2bS24FiA//1fmzYVI2z5OPhDOmJTnXrbKs5hhvtn
	 LZ/dVMHXtzyDIh6y2mFk/CuSO7yYQ/eL7Aa+XfcIZ50o98zfCfCfwA15TueucHcLDB
	 g5x+JQUsGtNRZjQNJQQOnyXrddeaTRD05ncJHVtkygjjBI5Ckn+/QU9uNesS05PVwF
	 BbvecA0fvtpfHdVPeEoXNusWmVGtMpm9PBDNezX0eLXR4LGt0CVDA4fy34TKss3PxO
	 TosiP6su8qjMKUHMa73f9ngue0ENlRgetFxkeakfeH61j5rn1PuU14564O8vFyJY4A
	 mdEzk01bsfZgQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Andrey Golovko <andrey.golovko@gmail.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Antoine Monnet <antoine@montane.tech>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <3e2751d1fb027bed0f09c88e5e56da8f@gmail.com>
References: <3e2751d1fb027bed0f09c88e5e56da8f@gmail.com>
Subject: Re: [PATCH v2] ASoC: tas2783-sdw: drop stale regcache on
 uninitialized re-attach
Message-Id: <178550971605.353541.7399708585037800981.b4-ty@b4>
Date: Fri, 31 Jul 2026 15:55:16 +0100
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
 h=from:subject:message-id; bh=OmNZZJUpkX7C5FtQfN1zkS/k5Xe6AF+/t8Sz4WQ63V8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbQDDB+ZwCog74nXvNbrc9sXyvUd9pvWL5PZHH
 oCwGLj2/EyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0AwwAKCRAk1otyXVSH
 0LNaB/9QjYDlg00Je9EnlZppN3YpWBtOGPnLyI+6dkg9OP+svxzMQvjZm6yoLgVwNhv5CTftoWz
 x52CLmfJCZBgUnKHe/p9gkHgaqLTVZayEdxRTIJYzoTyzXVrMcA+wlIrNC9hJrKOLSRe3fpJSXQ
 5VVeT1/hn1ldCm+nM7pK0/AN1oa4/tTqSG/7SMVh6y27Z1vPGqQ2LcB8QqLtlPNKeS+bQiSOUTV
 SlpTTG4pQdjTifYNmld9rwkx6/aLddAGf74PGJY0X15lAG02qrVyXfU2OVHULmKeZ9bx9JCzUoC
 ViKcuMF8Am4jBzIDRHI96XerO2PZjKG9ohTqf0JgsVA8Suzz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 27 Jul 2026 12:33:09 +0300, Andrey Golovko wrote:
> ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach
      https://git.kernel.org/broonie/sound/c/b627da430357

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

