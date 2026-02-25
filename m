Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292772BDC0B
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046413; cv=none; b=G6baQIhwpcMHZMdLDASJ9ykxvOCXprYvkPrlA6T3uf7m7Lgl9Puat61gCDSY0U70B+6iqn4NKe39mVdkfEQHjizjSiBoyRbWKPOdTwz+YoQPWsMl0rPWseVjugoD3RVr12+4AHLTyfGFuQhq5wGbe2b14XelYo+Wf0vHO3LNvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046413; c=relaxed/simple;
	bh=38t0tBDUoCsG0xmXEAVKJTqI4xdsP4h2//1wmSiIswE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k4BCkplpxpvcJpeJJWzXH9rnVer5/aYw98tsXZSXF6mkSSlXc6Y2aMlnp6l+CXKoU0DN3AiZY2u4soWuHG9QZ18ERul1fDIhitpHzzGhrGd/4Tbi/qj3n+QURZ01HWHoViMNRsEqGFpBbdB9fDti0Z+PeBERhASBCXDez1Qelow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5XK6w4S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5XK6w4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A40C19421;
	Wed, 25 Feb 2026 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046413;
	bh=38t0tBDUoCsG0xmXEAVKJTqI4xdsP4h2//1wmSiIswE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E5XK6w4SaByC0EjkaQY+5tBcyE5X6QyXvp9Xlm19t0QjCgszZl+DnyQsSd4iyMESD
	 OvLOOOfQBZGB6UDpqXU4CkzQjuOV+Lrc3VWqxUUfnAHUO/9wcbMWleCG9k6GaliTPZ
	 ueOIqBBlqU6saP/ZvQccyOXv4RcJt5EdqFaz4O8LI4Idk0ZwOB8J9F5sBNlp2FE/nx
	 hXRcuS0JaiduT/fM0IhV4+OZ1Y4bXyIj8kdli9BSSz2WbUMaUGC8kdbN1foKkVl3oi
	 /1Qoupi8KnIjPNvISetD3VgG6E/Ax1Hen+Gt3jMHcSDH99KyQ9AAGtM7dG4OVoY85r
	 B8QFA2nUqjLMg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, Nicolin Chen <b42378@freescale.com>
In-Reply-To: <87ms15e3kv.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms15e3kv.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-compress: use function to clear symmetric
 params
Message-Id: <177204641217.168100.8197122488118261701.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:52 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 19 Feb 2026 04:53:52 +0000, Kuninori Morimoto wrote:
> Current soc-compress.c clears symmetric_rate, but it clears rate only,
> not clear other symmetric_channels/sample_bits.
> 
> 	static int soc_compr_clean(...)
> 	{
> 		...
> 		if (!snd_soc_dai_active(cpu_dai))
> =>			cpu_dai->symmetric_rate = 0;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-compress: use function to clear symmetric params
      commit: 07c774dd64ba0c605dbf844132122e3edbdbea93

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

