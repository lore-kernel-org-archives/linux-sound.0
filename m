Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47414315D2C;
	Mon, 12 Jan 2026 20:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248495; cv=none; b=bIdx5YBYa/Wyvk2pDoD+SX5qZNdRjBhKL1cNJSIbozXx4K84IgRlV1mZ+msKuNJ7mmCUdv5iB3RMAtcv8965tgeg5Pv6xG63V3PvevGsSJv5yVgWNgrDJJrFYbwqQgpYNQSmhiEJaVwZbhmCdUwBiPZ8SBYDN4lcSM37RMaDfAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248495; c=relaxed/simple;
	bh=OMBhGDl1hwQY+DNRk7VkjXiJLOWnm0ay29IBbNlJF4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JbrqalX+Wf3WGsvlLEZ9lQQkQeYmb57kwA5ZsA6XnsGV6kqy8Ke0wUlXeVn5igsD6vWDJa6mxMAvA+k/WHqYHXU2ZNJroL7uJF3znlDSgPUj/LA7LPWkibe0sKevTEPntJC5LZCr6fhdtiNbXRk30Ptx1IdnKbqcPwzwbi20uUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktoWuEQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktoWuEQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927D9C116D0;
	Mon, 12 Jan 2026 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768248495;
	bh=OMBhGDl1hwQY+DNRk7VkjXiJLOWnm0ay29IBbNlJF4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ktoWuEQgYwaZGH8FjwiwIKmounYUSG9l3YpuDpoC2W7KB0JHxpAoGpRg0FKth3B0p
	 K8SHbeYHlB8WdLd68Z4nsSVRylCw1J/ZfR9yGXG/cytrIX/eOxl+9d5wEVd4zqfgAf
	 O50sqTzY1hGsnVLjpT1FTk2U+2FEFYD33Zyyxu24Gr5pe7BM/jHdT7GDq6RboEbItt
	 S+LflNxUJNlqYf5qEfL4RKuzv7mmHTSo5PfDDsjx9n/XsuiIA+ZS9a8IEpMsqNvdDV
	 Cc7Qf5DGmNYc2TogBXonsmFytnMLTQWXZp3f5LiJ+Jhsyyj+fS3aRK87W9cr56IbGv
	 xKP/4iaeca1NQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bard Liao <bardliao@realtek.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260108214443.1127685-1-robh@kernel.org>
References: <20260108214443.1127685-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
Message-Id: <176824849331.206448.10716916421615090014.b4-ty@kernel.org>
Date: Mon, 12 Jan 2026 20:08:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 08 Jan 2026 15:44:40 -0600, Rob Herring (Arm) wrote:
> Convert the Realtek RT5661 codec binding to DT schema format. Add
> missing clocks/clock-names for MCLK which is in use already. Also add
> the standard "#sound-dai-cells" property.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
      commit: 35bffbe49dfd3395c65d76f14d773a1225f3489f

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

