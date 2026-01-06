Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6712F747D;
	Tue,  6 Jan 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722507; cv=none; b=FdTcaZxF15juZhj4NVA4T28M/+kyMmcqeX5K1oR6wMs8CRuJoDb13mAfC2PJUyawJ76LHblRgKIOHg0xRD3FD3MjLjgk83Pi6p0r3H/v5C7Q9visaDf8fxN/+WsfP+211EvkXkoTu1vTRc6kicUJtTWVMZXOXtSz6V3CP7p5Toc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722507; c=relaxed/simple;
	bh=OfXM2+mlddIInL3HYUwcm34G5HCz/6bMyt5/qTFD+A0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hHQkepqS5IROswweX0JQdD3OX5SXWFea63obRdeF9tHuEWywBeMIJHVq2632MJIC/2uSg1MjRGMgMyPnHKy+diXqK5md1oUQnE21hCeUE1qtDsESzOJuOlJer90M7LLaXh5HuVeZEeeoctuW+i87Hx9Wa673hXEIjeKs+sxMKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im7OAmqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im7OAmqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD35C116C6;
	Tue,  6 Jan 2026 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767722506;
	bh=OfXM2+mlddIInL3HYUwcm34G5HCz/6bMyt5/qTFD+A0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=im7OAmqX7CZeR9GwgwioJ1sYCYqeBuIASrpnt6pqEK8cu4GwVafmUBU7+fYbE2s2/
	 IY+HTZRKTSO+gNLRjIgphTj/00TCm6v0nxREms/n1/EdON4r8uNOC7kXh+/d8tg1oG
	 wHoqnJqMYUXna93jMwtmUk9G8dxsPt8d+E3640F3Cnz/sZ9cJWjW1f6fUGukqmbB4D
	 euzehDOmRy+HMJ8KnFx+iM02HnLCWjrNU8Dt7bDSAO54C7KlUsED94S+nda5LWXP9E
	 yJDeQxJ+KqjYn1LnM7raVrIoIFxuvITOT/61UObfIbBfIhzY+jcCgveGz8wlxeAgzd
	 7omnyV5R1Qkbw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260105193203.3166320-1-robh@kernel.org>
References: <20260105193203.3166320-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: everest,es8316: Add interrupt
 support
Message-Id: <176772250444.283131.5553972039682424729.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 18:01:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 05 Jan 2026 13:32:03 -0600, Rob Herring (Arm) wrote:
> The Everest ES8316 has interrupt capability on its GPIO3 pin for
> headphone detection. Several of the RockPi 4 variants are using it
> already.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: everest,es8316: Add interrupt support
      commit: fd9a14d233fbf33488cfa0cb7f59051b3233b017

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

