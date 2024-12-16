Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF8D7E59A
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371625; cv=none; b=efaxH+PKylY38qsFN+aE1LdkzHATU/+CcI6uPN6mbZIRe6/8/SyuHBVSmefP9hxB8slYNka7Oi/r9PesLaQrChKD6E0tjIv1yFisHBLP8tDvMbCsbvG8YzyN4u6Ltac1B8WYtMPgzZt763KbauO1CZ2GrKDDuunBf1plj9xcqq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371625; c=relaxed/simple;
	bh=QagMwHDH8YFLVR3zgVZ33EMxphby644Pay8m3jtVkM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nDLcq8hiJn4ESkeT+y/XqtRn2NUIuzWW1pk8r+U7QJVXNayFwmjclym46uII7Kfj7223EK/QnJeUc7cTA0/bfIQwONeftBkeIr9CJJMavG5UXEBX/8+quuPuHqp8RhM6IrX2mM/DLpIW+tkfcHQBufEHx/3udB+0zXjUvFveBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBsJryv6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBsJryv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3446EC4CED4;
	Mon, 16 Dec 2024 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734371625;
	bh=QagMwHDH8YFLVR3zgVZ33EMxphby644Pay8m3jtVkM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NBsJryv6+y7sxub6f4ITEvErrSHbRhFjYR/cCcEXbW2VovcK1Syzp04CsHvAH1U0Y
	 k/LpGMvkG1Q7mhEPl7o1gZAxcp/VopIqDt+Xvwg1pjcOqT2CT40Nug9SPxwyDbHs9+
	 IZw9qyYzGPqhme8XFhfhHoA/JP3urApBq3boi8n+E4rGUS9sbQYYki/+OmB3NaHj+E
	 KV1XF1WnNj4x4GEbJnAVRcKGkLGCzmugO6lqm/fJRW8Xpk1UI0Zf+OCZwCK+BSuH4f
	 d0l/riZ4C91ERgFKhdVvo4b+kk8pK5z8qU25EvwU0xV7la3PrPA4nkiyAb26sO8znC
	 QzvoKjCWPb2Yg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241216140821.153670-1-yung-chuan.liao@linux.intel.com>
References: <20241216140821.153670-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: Intel: sof_sdw: Update DMI matches for
 Lenovo models with SSIDs 233b, 233c
Message-Id: <173437162394.168779.17377189410513763012.b4-ty@kernel.org>
Date: Mon, 16 Dec 2024 17:53:43 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 16 Dec 2024 22:08:19 +0800, Bard Liao wrote:
> The DMI match information for these models has changed so the match
> entries need updates.
> 
> v2:
>  - Correct the commit id of the Fixes tag.
> 
> Richard Fitzgerald (2):
>   ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
>   ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
      commit: 7c449ef0fdce540bfb235a2d93e7184864c3388b
[2/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB
      commit: ba7d47a54bf23a7201bdd2978e16b04fc1cb1f6e

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

