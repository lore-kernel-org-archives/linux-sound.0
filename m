Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F04C17BB7;
	Tue, 20 Aug 2024 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724163566; cv=none; b=aUZCHPwmSh+BX7CaYSpnKG2ugMiRJ4bG2BHdqadnjz3k07WBpIbeZiwfV7r0I7dLxyM55rlauubjyVFXX9M1yahcB2e4F18EJXXWbXyHs2gP9vR+HsGp9qeea1c7AfuAzHJdDiZW+KlLWvRrf7JePl521G+tFAM+wNTfi6B5fbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724163566; c=relaxed/simple;
	bh=PbOxquV5o7WuWMJBCMJR6LWOsyiINGnqBTBjqgFyKq0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e1YKKDL45KoMwGUEostq0JUeceElkfPt503qQQQpCJHHz5QOH2EQP99j7397uJltBlEyJIyViIOLr4fIdMG5a3K65ANtThzFPzpYZteZukMcQQoP2kRwrsBrOybvY9q6oHKyC961rP5eLP5JRBeJQ1xGW9/sv/qXzO2dYzgkCPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kteWXbtl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kteWXbtl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E398AC4AF0F;
	Tue, 20 Aug 2024 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724163565;
	bh=PbOxquV5o7WuWMJBCMJR6LWOsyiINGnqBTBjqgFyKq0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kteWXbtl1ef/jQEYZ17TOZN1lPRRWuqUDxz6PNHGeA9Qqaz7kanUc9groVf6l24CK
	 suHYMXrdSowWba4mkX6BsYIcVVYQOEU81BCPM3p+sV/AwMCHvo1+meutTMLYVFh2Q6
	 Bqhyeqe8G2A9xbchzDQ9e6gUo5LPB41XqFfr8tqPkFdiCL8b8Z7FKYbkD+Qjvt5w2l
	 ruGh0O9buFp1BQfSr8snHhcp5KmQPGkOGOw4bJ2GuV2WsXgr4fytbS5PqpiCn8Wz8/
	 k+zKjp4ME40doeNmANH+ZpPMdVAIToAM7FT2z+cisp1W3eVu0/jceqORtyw4xhbBN/
	 LCyy8B+zLew5A==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818173037.122152-1-krzysztof.kozlowski@linaro.org>
References: <20240818173037.122152-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: samsung,odroid: drop stale clocks
Message-Id: <172416356364.261879.10105106383289811025.b4-ty@kernel.org>
Date: Tue, 20 Aug 2024 15:19:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Sun, 18 Aug 2024 19:30:37 +0200, Krzysztof Kozlowski wrote:
> Clocks property was present only to allow usage of assigned-clocks in
> the sound card node, however in upstream DTS the assigned-clocks were
> moved in commit 4afb06afd768 ("ARM: dts: exynos: move assigned-clock*
> properties to i2s0 node in Odroid XU4") to respective I2S nodes.  Linux
> drivers never parsed "clocks" so it can be safely dropped.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: samsung,odroid: drop stale clocks
      commit: e6c1d9068295796e34d59ef08fa80f6ff8f3530a

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

