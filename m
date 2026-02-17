Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3909264A97
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356279; cv=none; b=qYTuHEOs2KJ6KmFJjx+R4PsVuMYNIcaV+WNnHqynpGfHtsH0cJ6uQlQWs27pJ1XWTrsQMf4fpuBrlRAcH8KGbAdffMhiozYz2R3Wtzwy0XwXdY7quuEdWJajvxgSfhNqb76OyKQ/9imZeKT7Rj6ZPWjDcbbD10o10z5uqV5UMjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356279; c=relaxed/simple;
	bh=wIjh6yOyK9DvQrfMqC6CYjP8Xq2hI3p/QomBiTZqeDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n7vqbs4UFl7Rl+GGogCZaNMw1LFCpUkop1ujJdYa9+NI+AbD/moXv83eE1wN7HDdznVA52XtY+XeiG5MsVrSS4/klFcd7dLjMwDCvGik9+vhwAIyqM9/fLdAgenuD1zLdQRFGaJhGO9zS53I3kfwRaqDLdslesJqzkfBJZY3Pcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXS0WWk/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXS0WWk/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD78C4CEF7;
	Tue, 17 Feb 2026 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771356278;
	bh=wIjh6yOyK9DvQrfMqC6CYjP8Xq2hI3p/QomBiTZqeDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZXS0WWk/SEhYE2UgtiVxYfMprA0V3mTvmuBWGpsGrYButsFgpVf2A8rBlKF0ggnML
	 MFpd75tjsw3oH7r7ZBFVT/NEc5Tg/kwkMuzG6mQJ+ZKdYFM0S9UPcHueNiHHVZswbK
	 jmdQakIX/xUrxjHawla6ShbxtVSo9A5CYlW52dRP4QTO9h/Z16zeiSfUBSoULY0kOq
	 iDt3kgTYa+ovYWyjEAsFaWpNNlv4O/wgutEl+Fy01RyaMM8YX9PWykdJk9LgdEVIIy
	 L2mjK9qMWWSRJDz0Jkv+k4Xw4tOfDUye8v1EyVPZrv3zkEd+lygji7+IOYzCTcCMtU
	 okz22Y36QRCUA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com, 
 dan.carpenter@linaro.org, sandeepk@ti.com
In-Reply-To: <20260214104710.632-1-niranjan.hy@ti.com>
References: <20260214104710.632-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2783A: add explicit port prepare handling
Message-Id: <177135627519.310944.4176958928133427758.b4-ty@kernel.org>
Date: Tue, 17 Feb 2026 19:24:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 14 Feb 2026 16:17:10 +0530, Niranjan H Y wrote:
>  TAS2783a required port prepare bits to be set during playback
> even when it is using simplified CP_SM.
> 
>  Normally, SoundWire core handles prepare sequencing automatically
> depending on the type of the device available. For simplified CP_SM
> there is no need to set the prepare bits. However, due to a hardware
> limitation in TAS2783A, the port must still be explicitly prepared and
> de-prepared by the driver to ensure reliable playback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2783A: add explicit port prepare handling
      commit: 0d68ad088e334088b031423e59886ae118c11202

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

