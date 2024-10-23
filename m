Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA8913B792
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700120; cv=none; b=kSunu220Q67xHRhMZjeWFkZfJLWJJwGCjhO/ltKt6dhNWBHlY5MI1NsrGLRC/r+ecPe3VQRPGiB76VYFQsuAm8osWKjGEkcSXO3Wn3A1LsJBOMPLIOks3D9tf539Ys5hPKVrPYjhv/qj+agnbcNMqFVu9dEPIDXaJOss2eufBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700120; c=relaxed/simple;
	bh=nmcSuYSdRBDEx+9q5T4wgkUA1SEFWmqg0YrrxCT2RKM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rCNWFSczMUVjFAw3BF1VDpzqxsOqfJsG+n/pDXfC3w3FlN9dvIWoouvlc47IBZmDbIny0b9MBp11E0381CNkTwHkLsVetw7JXTq0YXVWplxZaB63tLg845/7ggDRbamBITBMOh4JBJxPJOjD13Jksr1XNw3/HwP3h5xwtx6RXS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtukyZOp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtukyZOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125ABC4CEC6;
	Wed, 23 Oct 2024 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700119;
	bh=nmcSuYSdRBDEx+9q5T4wgkUA1SEFWmqg0YrrxCT2RKM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JtukyZOp50VhVU4+iPd2ACCgxRAGLx6EOgoVjmrNvANlBEbUp2E3bw5nL0Fo5Pp5q
	 plvxcIPM1zmCxaSAf6BrU4tK4eZ/lwyrAgKIcHsFfQNotTJE6K5XBQMyEp0I7DOz+j
	 HK8Wq8O9YRD+cmwTFyPC288DcxghdPXsb3iYrIVCoacTsGKPisRxilmW3Eop6uwt5X
	 v/9fTKeF0eddz/dIuYBy/BbK8FjENp/t8xp+rK/FHthc6wrlWcL+FqQzHZwupBSzS/
	 FYHGHQk3/TOAsCXzuu71LNAkCs3SAk1dmUikcMkr6w5i3gskTAlqglhKgB3m/kHX/F
	 +wY+f3gy1jKQA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
In-Reply-To: <20241023110610.6141-1-peter.ujfalusi@linux.intel.com>
References: <20241023110610.6141-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: core: Module parameter updates
Message-Id: <172970011772.77029.15004268261899587627.b4-ty@kernel.org>
Date: Wed, 23 Oct 2024 17:15:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 23 Oct 2024 14:06:08 +0300, Peter Ujfalusi wrote:
> Add new debug only parameters to override the default IPC and boot
> timeout, these are only available if CONFIG_SND_SOC_SOF_DEBUG is
> enabled, only for developers.
> 
> The second patch moves the firmware, topology name/path and IPC
> version overrides from acpi/pci/of platform code to core and markes
> the platform parameters deprecated, to be removed in few kernel
> cycles.
> There is really no point of duplicating these overrides as they
> are not platform dependent.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: core: Add debug module parameters to set IPC and boot timeout
      commit: de688e50f5ef5b4937a5dbd5bfc7afb38673b936
[2/2] ASoC: SOF: core: Add fw, tplg and ipc type override parameters
      commit: acb219840fbc57e3135436c03d2c4c2db80e39ee

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

