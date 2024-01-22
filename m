Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E062E482CD;
	Mon, 22 Jan 2024 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705957692; cv=none; b=a3bwj2oI9MAVJKRsRf8lx2ZqUOnTLKYlBVc1LQ5ewL1gYBmZgugkRe4sx7GaKQiMC+QdUM20FClaxUVLLbgEHDh3isFcNnDXunjuk0mmyV2IQkqN16t6333P9SI6YjubkXHnc5isC7uAfnPR/0HkpmBDuQOrsN6hri67iQbzSPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705957692; c=relaxed/simple;
	bh=4avFRO6HirzW04Qxit8v5Uo32O/NhMy69h0hvlBJ0E4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HumLIYbAqdYLJHMQujD7xdFyukGbfDf5LBlohgprT21lI9hhpByQU8HTF9Ul+RrjeslnAGatGCZ5QJQRgrqK1MeHSoe/zDxI71SqlCm6vM99Q9c3KSk9JCJ/bpz3avAxr8pWDcgHtkyfP+CXu55Avo7Z9e9qIFNy/N2IsvetIRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie+8IZyp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie+8IZyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2045C433F1;
	Mon, 22 Jan 2024 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705957691;
	bh=4avFRO6HirzW04Qxit8v5Uo32O/NhMy69h0hvlBJ0E4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ie+8IZyprW5VglUTWz1vGCYn9EtjFPb70LV6vkva0KNpAHR55ywWTvqbZqgLKxQpU
	 idZZNcMSWVwnpwStEBCotM++yVgPNLOvnsjwYWxWDmH897KU//N+B5WC4HkM+LzJfi
	 g6LG+h4M3YYVMgGKY2sB3lq+QGUHMrKAAPZ99ztEi8L4n4KmKAXAW0kh1CIxSBJ2go
	 JVdRIH15z5gqVOk4eKGG9NW0uN6VLBYTm5aSZWLU4ctF2A1xOfhath+bvPGucmwH3s
	 5o7FSo0paZ6MWYQ+C4gQ5kw6KyvPyVtfP/zgaiQ6wr1/PNJVGJfGtpqAkH88PviAdr
	 szh66ZLoLd3ZA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20231219122957.3358149-1-alexander.stein@ew.tq-group.com>
References: <20231219122957.3358149-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl-sai: Add power-domains
Message-Id: <170595768964.151865.7664679923610974250.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 21:08:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Tue, 19 Dec 2023 13:29:56 +0100, Alexander Stein wrote:
> Some SoC like i.MX8QXP use a power-domain for this IP, so add it to the
> supported properties.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl-sai: Add power-domains
      commit: 7084f0de2322d85f9802710b008da5c9e5e75222
[2/2] ASoC: dt-bindings: fsl-sai: Support Rx-only SAI
      commit: b6ea4284c7e756fab5f78f0129acdb74b35d759f

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

