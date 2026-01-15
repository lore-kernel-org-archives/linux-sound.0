Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67B2D594F
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 18:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502503; cv=none; b=cLtqZUXQODRE1xHieXHSgFfLRXp7xC1Fd5PMzn3P/SnINzcQbSLhaVmhdPS8igvkrKHRBtrLDKV5CdbyTVROjreN2xJR8XoVx/csZA02gSBule+5c4jAyNCN5qB/10ace72umtM3crBcD/18buP4+DsTq7je5yhBVmdBk50KNRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502503; c=relaxed/simple;
	bh=sefFJM000cBoTHmEK034mKrPL1rN39O9Z7IRhNyugBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Juafj72syrychYcUObxbYev09PMF5mX6h5bIPFcg5fPuHb/x+EjFZ9VXr3PuTpTcIx2152LSpFj1CEoXaxMBKep9ocfLTdP58dsLHGf12UIRXYI0dmGVc/13gO5PcwUZsiomOSGsClZTIwmJ4Tzufw1GWQhZgpC2ZF/zPNx/c2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1h3IfUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1h3IfUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F80C116D0;
	Thu, 15 Jan 2026 18:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768502502;
	bh=sefFJM000cBoTHmEK034mKrPL1rN39O9Z7IRhNyugBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N1h3IfUgGSeCnZVyJU0720BmwhZULUO6kW62CBN/3vI80QjEabfkPCMveXoQ3LnHn
	 na4DzvUN9ZwLIs6XuWZjLNO4WuV/xmKt0P+6dLkjPIs5k7xacHt6N66jJwbj07BtXS
	 Fo5gM1U7j+y3moU6GKRykDIbKCaMruKsH5FDYrLHBN0q9G6HhnWp3Hd3jtD01Fj+f4
	 co3P23UmLn8+eHFPJMP+M4JVmxtOol3G9gEef9PP5aOpyO4OOIesjX4XWFCXxU5Mho
	 txvXObwszfInyVRLJLwRsgGxr0hqVKVab1WLkEaW5eyLsXfwqxd4gw+3Nul0N2WG9Y
	 6J/FQ7ti4NG6g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260115114607.271990-1-ckeepax@opensource.cirrus.com>
References: <20260115114607.271990-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Tidy up some memory allocations
Message-Id: <176850250138.1337585.5714359524781512770.b4-ty@kernel.org>
Date: Thu, 15 Jan 2026 18:41:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 15 Jan 2026 11:46:07 +0000, Charles Keepax wrote:
> It is slightly better to deference the type being allocate for a sizeof
> rather than manually using the type. Saves effort if types change in the
> future. This results in no functional changes, just tidies up the style
> of the code a little.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Tidy up some memory allocations
      commit: 61d2a7699ab39d448f44919ef15c16187e6f70ec

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

