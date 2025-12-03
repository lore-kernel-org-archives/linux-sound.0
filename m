Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE3E30277D;
	Wed,  3 Dec 2025 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773649; cv=none; b=cc8HLqUncjHm7fw4oujfMhUYfkrOmw+6sEnxpXo7RSITVJVJH9NruTrkCO2CJIuJCpWZsG1AOJqsdwMBRJnRo6A9lWg7ZQoOgMWBiNsl0goSM3aRlPbYkoXe4RWovyTKLyhlXSfzgsTgeMriNrLxcwnP9HCtf4ZSJLIcgAzQ2Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773649; c=relaxed/simple;
	bh=5GnN9L847Pyh6WcSddNZjT9sAT5kCNdOyxSq0MLr8dM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HUbj5MSBro+1Ac2A/UG1VlD4z1YsH+ClITONi2+BTLYDb27NNCD3VsQg+kmT1Yrea/6BEgHfi+3m/EL7qJuGSKIHuWWfR7p6LUufZsk+OK/YfLAF49dX5Kjr1dRkZsSfwPVBH6t6Cd5drJa/H8Nds4vK7UBh7MEWs2AO8BdLLHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loUd/rkC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loUd/rkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4B8C4CEF5;
	Wed,  3 Dec 2025 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773648;
	bh=5GnN9L847Pyh6WcSddNZjT9sAT5kCNdOyxSq0MLr8dM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=loUd/rkCWw6Lln/zRrXjY3918Vh47V04p9hgf1GqpSf8BaRhYFttiAFfGyXz6UvjX
	 a9J8q40rqLR4064GmO93VNiND45GUnet8X52cckTLe7qZ1DNeJelV1eh/G5s/IdSj1
	 PP0AU1Hsco5v9XkSd7zCu4hlds6RW/7E3FjlWZx9izuhWoHtDXyrvuP2ZIEQPo+J/j
	 e5jgXIg0fBKhGkhHNIo7WNHV75gg1/864nu3ipkgFeK564Lo6Qo2D3k7XeVvV2K/sz
	 c1Q6yqutLNW/V2/0xgJXfjXLObz04ren55lnHBXh7xJFS1n8G6oPp637HR3opCaSRV
	 talFQfgFDkk/w==
From: Mark Brown <broonie@kernel.org>
To: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251202061157.1710163-1-shengjiu.wang@nxp.com>
References: <20251202061157.1710163-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: Reference common
 DAI properties
Message-Id: <176477364558.48347.15671556194399881845.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 14:54:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Tue, 02 Dec 2025 14:11:57 +0800, Shengjiu Wang wrote:
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
> "sound-name-prefix' to be used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI properties
      commit: 270d32cd0efc2ac87584883c0c2f3eb0f47f1415

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

