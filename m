Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD52629D;
	Wed, 26 Nov 2025 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162170; cv=none; b=DBy6F+GM5G+BSHq1zJ0SdBspcFwGrFMlh+MCHA/rMZcSKA8Lt3jfQXdiIyLaHaHVbvtHSGxRMr2UXdpb9kebZMeannHjMFS/AqUCxWk47039DxJ0hZ33R3kDYSFJ261gRWuuCvNHUjZm3UiyQu66PB4KmZK5KPM4lL7eDbmes9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162170; c=relaxed/simple;
	bh=Pv1DD7DetDKWpXJjUIzZS+kNyekhWzaGdR9V6dQ1lSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iNSml1SZNX3s8/9j5yohASTmyr2u0ITBlyC6vqbrPlHHAyk2hpdEvIt2Zi5wV1yC0eRnHGyKqwSn7i1q3qc7u3Sauf56/P1tVKoCE7jvatMASL8EpG90UW0mvD3c2t6HUZiixbssn1rGhglJVnT5CCoPZd44cFifPUQNn9AmmM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7PbJf+E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7PbJf+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DFFC113D0;
	Wed, 26 Nov 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764162167;
	bh=Pv1DD7DetDKWpXJjUIzZS+kNyekhWzaGdR9V6dQ1lSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s7PbJf+E4SDRC2D0XfPvbIEpYtT0pTSgQ47ofMQhfKk/3YV4kNZMT09vrcGXspfrG
	 lZPKEJl7fRtyLKQ2JQ/Y+3DR3y06ZB5vEjBQWA/xbSenne7PuzNwGhTVFiSSQR8ej0
	 uqIpxSVEuz3NyhYJhK70NceMqY0HKbxM8KQ/3ZcbiQB2BjZhHRnE+P/c/7h3lK8RUA
	 Xl1VLHjg+5S4j6ph/476AJjRRHrKbIkjzU06DXtjjZWVrFCzF2ndDZjCz8s3leX0dS
	 OZ9YI1elsfX4WKXmoBrqymJBMdDQqAu/n4k2kHKUlG+KHdVNT74rhxVFnAXcdp3gSV
	 EdXvaRw6wGMEg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
References: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_xcvr: use dev_err_probe() replacing
 dev_err() + return
Message-Id: <176416216545.27907.3407998751782960343.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 13:02:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Tue, 25 Nov 2025 11:13:33 +0100, Alexander Stein wrote:
> Use dev_err_probe() to simplify the code. This also silences -517 errors.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: use dev_err_probe() replacing dev_err() + return
      commit: 8ae28d04593a5fdddb16d3edcdabb8d1e4330d0b

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

