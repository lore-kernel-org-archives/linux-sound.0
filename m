Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5752F693B;
	Tue, 24 Mar 2026 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381715; cv=none; b=dPdGfeZHOmaN4kHzMgjss+rtk9GH51sK7PtNlcd+2QRCJSPG72F7UpCw/z8J45/ewxMvYaEOLGY7q8vpOzEXrO5Z11BSYDmiuOC0TUuEaMP+hAzB3p5nihqSFwNBxJp7bTMtyeeC548EbjNEUQOhUPn7C9G/u7iJwmq9rpvJbG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381715; c=relaxed/simple;
	bh=l4CgFtQvim0doL00S4ZsHS6AYzsQXN1JeI3JZgn5tj4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kiq+xovES1Zw2Iwnx1QMuvUyryQHt8EurVDLuzIIEJBM6P/384XFNJr8HJDKi8hGFARr8v/EtcXaBOe294vXYI+zTsGoYwdkYaEs2E+u7AygqOxYkgytFdxYR5q7yx+YpeTTQWgQR1BgIu2wD+v6J1JmjVcd5SzWj6kiWrEDlZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q57v17OB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q57v17OB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77799C19424;
	Tue, 24 Mar 2026 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381714;
	bh=l4CgFtQvim0doL00S4ZsHS6AYzsQXN1JeI3JZgn5tj4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q57v17OBeAEmDMQMoBdYtFzgwo5ABh98rS54QhaEpuJrjydUgKhQwqdRfRxTIwu9l
	 GpfjMAOu+0sPUjyfKluhyw7S2uxncrt5phShV3HHlhk4CVvmWZspDTtf5bMMb40dai
	 Y6HSH+cAL05yMWjH43RTmQmvUXm6FTvE9E86IWSaEpQSMOqCdebaI0wDb03/jBBw6Y
	 bd690x1zUErNUiSFGw1qoj2Vlcsr0K9BxzNbu4rkOb4fX/cUam0hEsRWsJgFhfVYBR
	 JYIzkXHGHCUZLlSbXepL/FIf9acmpy2uxB/JAkK7W+FspnH5/PDmAHQNTCrcsERLfm
	 qTOnPnJkFxF5A==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com, 
 lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260318164800.1086567-1-ben.dooks@codethink.co.uk>
References: <20260318164800.1086567-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v4] ASoC: SOF: sof-audio: pcm_id is __le32
Message-Id: <177438171222.320528.2601936497093638409.b4-ty@b4>
Date: Tue, 24 Mar 2026 19:48:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06

On Wed, 18 Mar 2026 16:48:00 +0000, Ben Dooks wrote:
> The pcm_id value is __le32 so convert it before passing to the dev_dbg
> function to be printed. Also fixup some other uses of __le32 data and
> a couple of places where %u should have been used instead of %d
> 
> Picked up by sparse prototype for variadic and printf
> function checking. Fixes a large number of sparse warnings, such as:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: pcm_id is __le32
      https://git.kernel.org/broonie/misc/c/4478886310e5

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

