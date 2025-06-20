Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5C283C87
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414995; cv=none; b=jU4rDNiR5XsmmLf/wYvsQNk7zfJl4V+P5zHVuVrxzuV/lP/ek3I/ER3C5p3nOLENC+54e2g8+zPi69JG5jav/LV37Q4qveXSVAfUkusjpSGVcsCB9PaOrc9Lre5Ktxo2uiV9FFbKzLVGftP/3V4Xr13zLamZVW8TP90SbCopge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414995; c=relaxed/simple;
	bh=oCpJ7WmearngFe8eouqSXeh35xvQ+xp0kVoDqNakWX8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SoeCZi8bQeqBxglctdTVzZOLNECwc2/sHSTGJkygOmMMCyxtP8uAN1sPigmY4ZLlz97y2hvpfuaHM46fGHhhsrMgcleNeb/2YBPL6eIo8cAVBgB0AP6TSMF123GUxKnWjwjvqTCegQXq+KvDki7lJmOzjDT0m1U56CB0BqLUlpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYhQdFKh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYhQdFKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A60C4CEED;
	Fri, 20 Jun 2025 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750414994;
	bh=oCpJ7WmearngFe8eouqSXeh35xvQ+xp0kVoDqNakWX8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iYhQdFKhTH895550Tlm0jRtw3qes4peUtHcc7+8RIJhPusCQfc1FeVg/cFHX+XNe8
	 AuqKVPXH9vf2vOaZv91fQK8Ba1+fhE+cF9nwazzDndILFlkVqR99I9OdP1PKi689PA
	 CXO9+0YIdEEIGj5K/C6IQO/ogy8suozs+NkQeSmQjXAe5u+Izz1SLdVG7k+bXRrGvU
	 srkuX+m2fKRsF4w4rDk3Ka4lQ8fWHTVYdl8FwiZrpdXqNeTccmaX+WmTTOKOx+JXTy
	 /LBLTv8uRMBDM3cIlZpbAGVwFhAS+KgMYz3IU7JNlJkUqQR4qYOAeocT3CvtkU4dFo
	 bhRr15K9DGDdg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev
In-Reply-To: <20250619104608.25947-1-peter.ujfalusi@linux.intel.com>
References: <20250619104608.25947-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: pcm: Remove local create_page_table()
 wrapper function
Message-Id: <175041499287.23264.691321919513370740.b4-ty@kernel.org>
Date: Fri, 20 Jun 2025 11:23:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 19 Jun 2025 13:46:08 +0300, Peter Ujfalusi wrote:
> The create_page_table() can be dropped and replaced with a direct call to
> snd_sof_create_page_table().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: pcm: Remove local create_page_table() wrapper function
      commit: 2710204bf1005ee5ca94d07fe740111a9677b919

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

