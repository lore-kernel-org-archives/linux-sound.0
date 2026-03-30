Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015683ED13D
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 22:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910560; cv=none; b=Cu2rr9xyHPKdwFeR0pC1xFxnsEH3/rTA9cUz2iv0lM1mpsGbO6AzMPuheo6O/BaxUr+Z/eeOEU27uBYVrm6V7E+iElUjiqx6Yrm6d/435puOmnnDSCIQ3gQikxtK+Z8ixt9+EBe3Jc4SCREiau7Mfh+VKRSNTegtVevWKHjfKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910560; c=relaxed/simple;
	bh=cZj5MrA7RYA9UhNYIWSelOTwXYAfID7VJ/BhNOlLA2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G6TnDWrVub7g24alte5k4i2CKwZVcGllNWv+Z4giz1DB9FujLuWGk2//jwDWULGrjpH0qSEcAyo85JUxYijK6tVKOO2x3N+CJyb/Gm5n7H8NvyaaOqJke6dfknqYpRpBcuep1QJA++0TwIUZvHhozpVVodd/rbj0I8nNUMQNnB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZeiQXLC1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZeiQXLC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6A3C4AF0B;
	Mon, 30 Mar 2026 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910559;
	bh=cZj5MrA7RYA9UhNYIWSelOTwXYAfID7VJ/BhNOlLA2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZeiQXLC1zxyozIzfR3UVRcS60OTMka4i2UB3Ljj+E9OWjK+yxz00iOJbh0bTigGiw
	 ZNupu1NvWo5eZGWdQmXY48Ag+STiZasRrEL/dAAvr0ajHuElLy7LdG8HWTf9m+PD06
	 3wjIU7Umr4H+3aZDfSL6upAAK6tHTOHD8WzeGBt6XQ/RzQU50CbLfZwe8ZzFUS5N9E
	 zk9OD7i2MgvH+Gt0HoV6rhndbuXXeKtxSzRT/HQv8O71fTddB1rbTSskzbPtolh+m5
	 VGtRDf/GKAxpv4uLCVYg98nQR8WLA9Ohh4tM0xAP4mGSbOUxJkITHovXw/HPKVGCe3
	 JBFDOvzGAYE/w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87341mxa8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87341mxa8l.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: call missing INIT_LIST_HEAD() for
 card_aux_list
Message-Id: <177489155532.218613.3173853331686962814.b4-ty@b4>
Date: Mon, 30 Mar 2026 18:25:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cZj5MrA7RYA9UhNYIWSelOTwXYAfID7VJ/BhNOlLA2o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxemBDNE83szmbnWHgi4HPFVD2G2rYCqCSJJ
 NBm542sNiyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8XgAKCRAk1otyXVSH
 0NRFB/9cRF3/45BOA8SZ6rsaiQefMXxuaLyGAb1cZSWTCyoHMzzEaJpJ6+2TH1e52RuXxmwjp3e
 63pThzLK518Jrk4qIVb/VDMn6g5msqgQW5nLBddXMcpU86Nic0PFdVpvJAuKT3H/lIVJlutc2az
 m+Ke39PuKDWmJmuLqfYaNzgmYdaDFf8Wcq9nZ/MjXC+Zn/b0MNYRbtCkAlMIa4zOkFrrz4apJYu
 Gb4SixB+GmP7TzU44B5j1qXsvKM94Qy4SlVQa8GAKGN9E22kP1PFvY6EjwiPwkkePxCIbI2mZjH
 9Td7EN3DdPQb2efLvJyiX4ayU1xMjPKlw3uJsnG7pt1eVXeu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Mar 2026 02:43:54 +0000, Kuninori Morimoto wrote:
> ASoC: soc-core: call missing INIT_LIST_HEAD() for card_aux_list

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: soc-core: call missing INIT_LIST_HEAD() for card_aux_list
      https://git.kernel.org/broonie/sound/c/b9eff9732cb0

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

