Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F81FDE2B
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967563; cv=none; b=WuYb2GacbUH4Ss7VDsP6aH0er3VlqFpavWvugnha3P8sSE+yCN8yw9p7Ey0uV03vkU1fIqhPhnw9rsJrTSOcBvnt0f8QBrgcdA1rILnyRU6qsqLxd39ND3/gmn7mZMKigE2hkxdba1Y4cpBr21i99r2pbvKa4nTkSpQNxbpGwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967563; c=relaxed/simple;
	bh=1Gy+mb6z9SwcIc1DZs5FG9mPMXx1bEMdQLAdBl3ZtLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ayyFk3xQ54KcwlrRNCMxwiMoszCqLOdbNbv2tooYhca99HH8n9iUMfTlnw1NnXP/Ipf8H1tatiJJq1A4dcuqR4I/CQFb0MmoIG6wyDZxUCquZtPOG3Z/sSApJqECLSxxQ+GaQ18+JqJGsPB7+umkuIXX3DiG6X/2HKK0qglPKwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/bOWPZG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/bOWPZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5997C4CEE3;
	Fri, 14 Mar 2025 15:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967562;
	bh=1Gy+mb6z9SwcIc1DZs5FG9mPMXx1bEMdQLAdBl3ZtLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z/bOWPZGSIEzCRI5bByNMx0az2HLLPJW/Qm5eNXCTZdu7W8NoXr6W7fictJmB2oSF
	 Cr19MVb/Qsm29TOj+ysZa+lx2icUxVEZfwo1LQmu1qlNFJEfGW7OZGHwrWhhOOOETg
	 eIJY3Kg6q23x3GRP0d0HBrXIkEN7imyEzhn4UAKhx6hs7G2lDGrY+yfKYcrBrKqYLo
	 D2RMtwxzL8aulKujixX3BHVjxtCJIHt9OxDF/kNUneizOpLD4DjP4US9IiZ4pUUHy2
	 QJ0xyDhZ7JpeJVwjDRdXcoYJcOdS1rsbnN72hgHTWydLmhePSRtQHWBfLetCa5bNjH
	 NyND9N48CypxA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjuoqo6c.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjuoqo6c.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/2] ASoC: simple-card-utils fixups
Message-Id: <174196756152.19728.7800874481739177136.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 15:52:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 26 Feb 2025 23:30:36 +0000, Kuninori Morimoto wrote:
> linus/master includes my patch (419d1918105e) which uses __free() in
> simple-card-utils. But because of it, it has of_node_put() count underrun
> issue. [1/2] is needed for it.
> 
> [2/2] is just cleanup patch on top of it.
> 
> v1 -> v2
> 	- Separate patches
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
      commit: de74ec718e0788e1998eb7289ad07970e27cae27
[2/2] ASoC: simple-card-utils: fixup dlc->xxx handling for error case
      (no commit info)

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

