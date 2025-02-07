Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE12236EC
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936965; cv=none; b=IuE2KG97gbIrOQN7rmu2hhj2Gr0FNR7wz+Y/IJmssVP5ys7jwn8tCWWkehxQIEotXP3gVzP/nJM6HNoidvkdkoCFxRBoMnEuC/bCL5nrWhsoWQufN1TcU0X55tiFxX7QkruKcUO9bq15UzpLaL6QneXui9/BZHRUI5zNseUyGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936965; c=relaxed/simple;
	bh=1Nu4K3cjbY0Y0L7W6DKK5PNMvEJNidmg6vTnW57GLMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YYN+dHU6tUxCXdSWLM4eG3g4hzPpBQW2ud82D+HUQCm7wfqSyFdNXVkCZyorEcfSFbmC8wTL4xo4Tyd89hL4pLNZP0O1WFLFcMtb/117fsH4My94J0QdG4YPvISkhCcVwkA0Wu0iVNdm9aXQ0hXmpv2VQMoMrZS4S2RJ+KTmzVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyJztD4i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyJztD4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4B1C4CED1;
	Fri,  7 Feb 2025 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936965;
	bh=1Nu4K3cjbY0Y0L7W6DKK5PNMvEJNidmg6vTnW57GLMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FyJztD4inZavqU/7u+qViYVAjawkITJYeK7aF7BDPWp7rkuPJBh/6hU5rBkjl3eh9
	 MY554IyZV031sQkNXPgeA7SrmhOnxXYGESuydBwpNHAp2tZx7hYqvn1+yd0/dQYS/j
	 NSnrmJC2xVYjs4fMfYDbknfA4epyYUNmegMHZiss2tFp9BRzc+/h6+xHUftFDEfDWn
	 Au2fTiisG/os1o7UHK9xlPZG/q5rtOiR03MftZC/6TtHx2V2pEG5UO/2y2zpKSxZNy
	 DaP+hFooctN+FeyQ/5ZgUUb2XM4UllfLI6deCVj1ZfbueBQq14eSnw2r3Ld6RZ/6cD
	 OSjunGPN+CqAg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
References: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Improve the spcm and ipc4 copier prints
Message-Id: <173893696397.35212.580149591364875425.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 14:02:43 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 11:28:24 +0200, Peter Ujfalusi wrote:
> Introduce new wrapper to present spcm related debug and error prints in
> a unified way and provide additional details to help to understand the
> reasons and configuration used when the log was captured.
> 
> Change the way we print information about the ipc4 copier module to
> use type specific prints, again to provide better information for
> debugging.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Relocate and rework functionality for PCM stream freeing
      commit: 169ec0a541aac8afb215ab591b0fd53276686014
[2/4] ASoC: SOF: pcm: Move period/buffer configuration print after platform open
      commit: 4d2ea16576c8aa1437048cf436bff85653f139fe
[3/4] ASoC: SOF: pcm: Add snd_sof_pcm specific wrappers for dev_dbg() and dev_err()
      commit: 860693187c597645b28a421d8acb26428b8afd3f
[4/4] ASoC: SOF: ipc4-topology: Improve the information in prepare_copier prints
      commit: 583348bd65ceaf4a5067a6267dd236929e1b4b37

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

