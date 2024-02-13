Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9981C5FDBA
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707844359; cv=none; b=tg+9KSZ1e1UUlXYBwbcFsDhLFQ4tvqLghzAQgmIoocakgZoILkFwMTH+bV0HsxilrGgGDHEDKwo5xIftioK8Do7MQGPwMHYExiGukHaOG7Ie43teYJKdC9DBBwBYk+hdcF4tfzbZN93HTWYJymdIgQTSxlNlM7P3t+pHI2mkIok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707844359; c=relaxed/simple;
	bh=Zk1VVUSPuiMS+puiXACqPjlQNY+t+VUPTl22O448IxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QzBE2ZS2oBEphxcTDBeFzNR8yhn7F9z/S+lT9O3Ie65tlN27OUTau+EKr66oyHx/9tlkCKsNq7fwNT02sjUesFe2GgmO+M/UKK25rmidLRlBOyFAFsNxPIV/nlUxZhw+ant/MkXIv7kR0q9msid+KRYln+5FA/rVHh2zb8E3CFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7QiT871; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7QiT871"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18991C43394;
	Tue, 13 Feb 2024 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707844359;
	bh=Zk1VVUSPuiMS+puiXACqPjlQNY+t+VUPTl22O448IxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B7QiT871XeZFeBP+Ja8kTWepVUS8SK1ZNrIukJvMi/TXaSLMsTThyB6k4VHW+EmrN
	 JmI93n8ob0u/GmAyPIAxLrN/YFy9Sq4edjWb/JV64Px12bhNQP5RceNOHSBRGotc/Y
	 Bkwz4ZQVf1ZeBWWo7jzBAQpvTzdv1UJvGVdCfGY7igJWgrH9oPDu8Rw0xEi7QNSc1p
	 MgfsAJiYH6Vap/3sQqoSl5N4FxrrSfrHkE0acOfwxP952qDA+Tr05FgLwa4IdKC9TS
	 hUGTpb3DVeVmmRxrI2eGDlD9vjXKhVODsHBaz9WXJYPLTaLIS3zk2ys1Gr1f561nNq
	 P8ba0r1/SZUYA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20240213115233.15716-1-peter.ujfalusi@linux.intel.com>
References: <20240213115233.15716-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-pcm: Workaround for crashed firmware
 on system suspend
Message-Id: <170784435783.387832.161975827217906863.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 17:12:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Tue, 13 Feb 2024 13:52:33 +0200, Peter Ujfalusi wrote:
> When the system is suspended while audio is active, the
> sof_ipc4_pcm_hw_free() is invoked to reset the pipelines since during
> suspend the DSP is turned off, streams will be re-started after resume.
> 
> If the firmware crashes during while audio is running (or when we reset
> the stream before suspend) then the sof_ipc4_set_multi_pipeline_state()
> will fail with IPC error and the state change is interrupted.
> This will cause misalignment between the kernel and firmware state on next
> DSP boot resulting errors returned by firmware for IPC messages, eventually
> failing the audio resume.
> On stream close the errors are ignored so the kernel state will be
> corrected on the next DSP boot, so the second boot after the DSP panic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-pcm: Workaround for crashed firmware on system suspend
      commit: c40aad7c81e5fba34b70123ed7ce3397fa62a4d2

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

