Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6B147F60
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 23:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712100572; cv=none; b=ZDGt4kImPE+nHxgs3w+6o6M+lY3Odp6hxPIWPGPGmxFDBFAxHEh6TMDoqWhepnExSYz9JfHX+YYLDtwEzI5K1JFxymJexqleeRVT3I2mgVRexEUd2v+IKVXYj8bjIdnPASNdiFKIhSncHouDSECvbS9+a2rGgo0s/rr2Ou74KjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712100572; c=relaxed/simple;
	bh=vewoNZzwNO4E+3r1grBp+IiKHI12TK609zRpSn3opTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j5fgQVirj4c97a5/0aWzDFppXdZw9OCnn+Gq2END0EuJze02esXblx7NJZyUG05a0TZrpRbB+9IkssNgB/J0qKINKZ4qhUd0QuLhraNhT+BWJQSP9WmMZCPIjvUiGlTGNgAmtKPcHcDbmLpWu3ALjbuEkL987EMTZQBB+drRMCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWFotQwm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWFotQwm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2B3C43390;
	Tue,  2 Apr 2024 23:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712100572;
	bh=vewoNZzwNO4E+3r1grBp+IiKHI12TK609zRpSn3opTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gWFotQwmFRHmWSIq8UAFv8EEkGWbzu546W4DRZ3CwXtYIKm96aU2bxtKVAefUw83V
	 BntvPeq4s93fp7n1SqsIJqdYcDVinqPP+YLuNjYp3SwyMQyu5p1ORlkioR4i38aWta
	 yLz+WXlNGxAcgnmUbvgLeJ0OxTr73wmpDKaAmZRV5JRDS3XZZJVxNXox4pOD/f+kZK
	 1VGlPquBuI9734k/4eRG/M12VPOG1pvjKJyZ7PLyGHwFVJqNKZkAp7tv1PUD/KTzgv
	 stmFb8uBtlXCIOOyQPL4vVMvltuHL5yGQRT1vcD/zMQNKdk+UCpp23Jxk0vcGh9SOT
	 N4OcKAFyxT3Lw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
References: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: cppcheck fixes and debugfs addition
Message-Id: <171210057103.279166.8183843160177110505.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 00:29:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Tue, 02 Apr 2024 09:59:55 -0500, Pierre-Louis Bossart wrote:
> Small changes with 3 cppcheck fixes and the firmware version now
> visible with debugfs instead of only via dmesg logs.
> 
> Pierre-Louis Bossart (3):
>   ASoC: SOF: amd: acp-loader: abort firmware download on write error
>   ASoC: SOF: ipc4-priv: align prototype and function declaration
>   ASoC: SOF: ipc4-topology: remove shadowed variable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: ipc4-loader: save FW version info to debugfs
      commit: f690cdcc01a5b549715fefe22a98962e7672516b
[2/4] ASoC: SOF: amd: acp-loader: abort firmware download on write error
      commit: dbb6ca68b55ddf23d0b6de782c7641624a285fc2
[3/4] ASoC: SOF: ipc4-priv: align prototype and function declaration
      commit: 458e3870507f7ebd26a2f5c7e925d5b31a873114
[4/4] ASoC: SOF: ipc4-topology: remove shadowed variable
      commit: c143cfe4f87070f11d7550b38f72625b51bf229f

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

