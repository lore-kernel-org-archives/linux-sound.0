Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1711119A2A3;
	Mon, 26 Jan 2026 18:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769453138; cv=none; b=rjyZKP4dY/7yO1jZprNybnR1rFC1xHypyFSbOLLNIj0OnJgbWMO+K37gydyiU/CVvFKy3Ki4fhLjwUe+zJqcu9+0dMDHUnbiO23BLMJ9yNJZKI8Vk5IRHxs+HdDF11GWLNGKQBST75hgHGinDuqExXabtSdbhiZiH+FaJSSJai0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769453138; c=relaxed/simple;
	bh=7wYtCd5ZqmWUGeltWIXEhE03P6pAWm4MmjmrdHrKDro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MShuzHK2RYbuW8BIgXD6cPcOUAzloeFvtW6koiSRqO1InkxP30aVw9GY6Y/EQcth8EP/KxcjIMeMYChHIilcf9KiPrm6uImN/SFuEBqs56gs7heDgIc/q+CEDVwIiDPAaA/qisK5+NYwf2QIZUcUq96bGYhJewhoGYX0qMR7U6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdOTid0K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdOTid0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C20C116C6;
	Mon, 26 Jan 2026 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769453137;
	bh=7wYtCd5ZqmWUGeltWIXEhE03P6pAWm4MmjmrdHrKDro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MdOTid0KIYgf/g2F/PAGUu+RfhgU7iDkwtt+YyFyhrMhZNE63TCCFaw92f6FnU4+9
	 QlOXZHXiGXxzWRBaSCRekjYuJh30u5u+j7g6bc17yOTt19B5TjRMP5DGcAGgSld3Az
	 8UQ+jDo9BBd74zk3gDYP6XHQ8ClWd/z0AQ8rYJowFDSIX0AMLQPc3Q9cN90wFC17YN
	 Gq/G/+sxD9LQT5iK0TkBOvkzTsiT8EByCoavtZ2HmAdZ1d/bx7aKhhIJXqSqspJl9W
	 mvRtVotvkXxdCAlYE87M3GGHFOepa2TqE4fO4Jfd5p0ppsVrkURbqaXNNk17PxGyZk
	 /iooD6637tfTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260121235757.370920-1-robh@kernel.org>
References: <20260121235757.370920-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Convert ti,tas2552 to DT schema
Message-Id: <176945313576.769345.1126214237939485232.b4-ty@kernel.org>
Date: Mon, 26 Jan 2026 18:45:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 21 Jan 2026 17:57:56 -0600, Rob Herring (Arm) wrote:
> Convert the TI TAS2552 codec binding to DT schema format. It's a
> straight-forward conversion.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Convert ti,tas2552 to DT schema
      commit: 506e0825a4c9b251d141f0f31c6cde1bdc2983ff

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

