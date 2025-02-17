Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9B821A422
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793440; cv=none; b=kS5REfWeeL2hZdOWvlhtV6QZLR6re0SXAosBrjGSz6pM5lYDz1W6W+rWDAogCOdEy6ISW7xGCvTYHZMYp5ZogmOR2dLzQ+jDNXqRR8NejhCXx78KFWy20gBPWsx1slltlP0zz1NxACz1l+y7CcuiktGtDvt1NDQXctjwKUgtLeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793440; c=relaxed/simple;
	bh=/3+sJwIfRCmKrviKd236FwmFr7wVUJjZOrDCBxeTg6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Uxe5jaeGzOXCqTcgxNB1xE53uEF4+DCHO2WGMuGsAvVSwQHTYhLw9+C5P5YpcLuaK36XKSx3c2jzNep/UKiRk2rqIY9Zj962JfNjHxGsxLHmdnDnumwzYJwEjHHwXDcSWXdez2OkXDIzxHRL9WZ8d98pDm/VhC+z2gIy97GeW9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYJ4oYef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYJ4oYef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE35C4CEE4;
	Mon, 17 Feb 2025 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739793439;
	bh=/3+sJwIfRCmKrviKd236FwmFr7wVUJjZOrDCBxeTg6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WYJ4oYefPp2cROg1yhxwWDPfwu0hDPxQzIgYrbqFBuw54kfWsv757v0biKJEzCozw
	 Gjoc6SOQgS3ZKyM7tPqOITjL0qxYONXuUVmA3bYOasCBv/qjHeaZ+oQNAxKq5H0M9e
	 uRGD1dtK0+C4nHGXxhs9JxJPgK6/NS8miJSPakScgcywH2Jrjxd3EQKxDagCh+7rEG
	 G8qLHFcuvrO1KZdYxIyA0Kk6WBg0PmiKGKBJUyne90tVCfeCbBE2evRyPQMTry8Qoo
	 TC9JghuWpl2NjhdmOksu9f4IvoX0xkVYV43mgGCdS2agkFpHDBe4Zuc6J2mw3WS0T1
	 Y4KhB1TshIVzQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250210031954.6287-1-yung-chuan.liao@linux.intel.com>
References: <20250210031954.6287-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: Intel: soc-acpi-intel-ptl-match typo
 fixups
Message-Id: <173979343767.13947.17376397871267812196.b4-ty@kernel.org>
Date: Mon, 17 Feb 2025 11:57:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 10 Feb 2025 11:19:52 +0800, Bard Liao wrote:
> Fix copy paste of lnl into ptl.
> 
> v2:
>  - Remove "fixup!:" from the the subject lines.
> 
> Peter Ujfalusi (2):
>   ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of rt712_vb +
>     rt1320 support
>   ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of
>     rt713_vb_l2_rt1320_l13
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of rt712_vb + rt1320 support
      commit: 78ccf6a6bae11e451e20a52dd2bc2ab98f66326b
[2/2] ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of rt713_vb_l2_rt1320_l13
      commit: cb78b8dc7834066539253c039f276b3625fecd9f

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

