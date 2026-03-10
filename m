Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FFD2E6CD8;
	Tue, 10 Mar 2026 18:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773167354; cv=none; b=q3VNEGZEfAtfwZRYCAdGK+qwxU7sotZUihaKTLAzHvQivr/ry7EguCvQYOc3tno+c6qz9AKqMk4pUYaIMR5BfDt2Zs1uFVebkcXJnyVh+YhPngN8FCeCAE/+TlS5x2GcG1Dt6up5OsBUbwfVfrA3OOn7xaxDXKMzEnFoEMZrhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773167354; c=relaxed/simple;
	bh=v16l5CMPlte5JnlLDIiiQg2wqmnSlWegBqNmbZcJsIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rnhXA4cAOBYICZIFH61lPTSFEJdXgRl/UuFiaGuLl70+YZRC/Qz0tdDvvnElA5F4YppeF94FuzhbiZqfzoLiogFvmu5fwJ6B+AykvajQalp7+bl+QfuxJuDnTDSJmPdIAb2js5Veajjx+pVF9q94x/zuKGhkttnu6m37+YRbW3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nA1ypvCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nA1ypvCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF69C2BC87;
	Tue, 10 Mar 2026 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773167354;
	bh=v16l5CMPlte5JnlLDIiiQg2wqmnSlWegBqNmbZcJsIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nA1ypvChT4RCw6UvoBlSYDf84MKefHL+BYYdBAtSD9BRFZ9DozeotO75YxDbJb3DB
	 OZE8L3D9T4jfQcwblw0o+Rk/jv8oFNveUm7XXXWhZrVk1psKGW598E1RFj/0SMqikO
	 zoKA3fe+glZ+sAQ5uMh9/D6cdwqPtAJG0VSdJmDeMqnZ3I87DO7xU3cwaHTJJ/FiUj
	 b38xs8e+PtbAOXdaWBB09OELynRh6VDWAfhdW16p9jaGn5Ug0zvF4qleYmXRclf5Rl
	 gv6PrLM5RXbgR9c9MVYQGWtUgK7UUZFpnkiw20MB7SUnflxW4qfQ6uhre+OkI2WYGc
	 V4oY6Skw/+Ptg==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, Sen Wang <sen@ti.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, devarsht@ti.com, 
 v-singh1@ti.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260309042109.2576612-1-sen@ti.com>
References: <20260309042109.2576612-1-sen@ti.com>
Subject: Re: [PATCH v2] ASoC: simple-card-utils: fix graph_util_is_ports0()
 for DT overlays
Message-Id: <177316735239.446684.9948986277661383645.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 18:29:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9189f

On Sun, 08 Mar 2026 23:21:09 -0500, Sen Wang wrote:
> graph_util_is_ports0() identifies DPCM front-end (ports@0) vs back-end
> (ports@1) by calling of_get_child_by_name() to find the first "ports"
> child and comparing pointers. This relies on child iteration order
> matching DTS source order.
> 
> When the DPCM topology comes from a DT overlay, __of_attach_node()
> inserts new children at the head of the sibling list, reversing the
> order. of_get_child_by_name() then returns ports@1 instead of ports@0,
> causing all front-end links to be classified as back-ends. The card
> registers with no PCM devices.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
      commit: 4185b95f8a42d92d68c49289b4644546b51e252b

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

