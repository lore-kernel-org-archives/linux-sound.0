Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB38421F1C;
	Tue,  3 Mar 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536800; cv=none; b=er0yM5LUwclFGia4ScZi59XygpbUeNHI9nK7NWIuB1unpFb8s6YpHtERwfoFA4x0UFne928QwKrqoeLRHAJXSzMJ2ATk4yoQRuuhzEaivt6faTfdv7iein7VEmIRQmXSJgBIJsUpFg3D23WF3SVAOGQ57QT/mFOLEoh3FVBZYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536800; c=relaxed/simple;
	bh=ZkfPkmeb4b3mbKdTJj7BYrsiQTgkQIrQs4AML5lW6QA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rb7I9CaMMt5m4C7rHRFIun2r3XM2wPdQYXPRHm38FH9TgxbQYhZ2FWqtM8+MXrHAK29ex+CgRoxL2K6fgH2yh4O7H7k4A5YUYKTDK+sY/M2FukgLOlFoWwT6cWm+8ZJXMQPzEpC0Y3CG+EKbNi8Hk39KxUtFihRa4tnXeRmuRY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngehF4Yl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngehF4Yl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D72C19422;
	Tue,  3 Mar 2026 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536799;
	bh=ZkfPkmeb4b3mbKdTJj7BYrsiQTgkQIrQs4AML5lW6QA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ngehF4Yl5wRK6sphaWZMniJ2iV1Gbwudy+5HH/tzD5Fa5Xa5SvejBRC3dt4J+db3P
	 96fgXYlQVfyiVaprHLNu34pG075ianSEVmQrbYGcNe0y4uXZGzTyiTKZg8wIwUqTbz
	 rvZ7eGdFkj6+z4qiOxOOPDO5kOSmvYuUTDQyCHH7Fzv8WWfQIHXDj+reES/BAWVelD
	 1jDI3As08vJJcq8WFO4gvB5f6NJmMHa81rJYo3tlJfQsLcRsO+Xf+rm/+pTOMmU7dr
	 EfxnL15HAQP3FgRyKKxwgAagoRakLQZab8daTpP4u221ui3Y4Lt1Ljx+j8so1LIfEV
	 Mm1kV/T7oP8Rg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260205-asoc-fsl-easrc-fix-events-v1-0-39d4c766918b@kernel.org>
References: <20260205-asoc-fsl-easrc-fix-events-v1-0-39d4c766918b@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: fsl_easrc: Fix control writes
Message-Id: <177253679744.22767.4381073391012911431.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:19:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Thu, 05 Feb 2026 00:25:36 +0000, Mark Brown wrote:
> I noticed that neither of the put() operations for the controls defined
> by the fsl_easrc driver was flagging value changes properly, fix that.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
      commit: 54a86cf48eaa6d1ab5130d756b718775e81e1748
[2/2] ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()
      commit: 31ddc62c1cd92e51b9db61d7954b85ae2ec224da

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

