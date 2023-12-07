Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0B40C04
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwHh4q6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48603C433C8;
	Thu,  7 Dec 2023 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701957589;
	bh=h9qIVgWoNEEuTzl6Tsfvls0u+ePauJ5wDuhKYBF21dQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BwHh4q6n6XqIfDTkagHw02ecvJaQLX2nBSTIIfws01fsLA2GfwUZnFleQRAKjKGQ7
	 /hZoOR1Yx+NRtcw8CzitUtC8/iritRYfg/Zd1OkCTB4eyPwTmfD4bu/kIQ8GkewmRK
	 ouLnI7D5cvDpBplAs7NYWv3pGUXvW5P42wzHn3zNnMOkJfgupxdyzy40vTU+ETB2iI
	 LdHs488/HvC3G/CPfHQNQMW2aYc9jUyR6vk86E3UQq6FVcT2u46LVycjvoiO2VLZ0C
	 YKfAo8eRMmZPH2NXGNgGHRsmqXs2g9M+ZTHH7GS0Agrign5Whhxr3PMfxEjq6dKp4u
	 FDNWT940QAnKA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.de, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.com, 
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20231207095425.19597-1-peter.ujfalusi@linux.intel.com>
References: <20231207095425.19597-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-codec: Delay the codec device
 registration
Message-Id: <170195758801.40629.2465488625957737438.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 13:59:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Thu, 07 Dec 2023 11:54:25 +0200, Peter Ujfalusi wrote:
> The current code flow is:
> 1. snd_hdac_device_register()
> 2. set parameters needed by the hdac driver
> 3. request_codec_module()
>    the hdac driver is probed at this point
> 
> During boot the codec drivers are not loaded when the hdac device is
> registered, it is going to be probed later when loading the codec module,
> which point the parameters are set.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-codec: Delay the codec device registration
      commit: ce17aa4cf2db7d6b95a3f854ac52d0d49881dd49

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

