Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DF3329377;
	Mon, 12 Jan 2026 20:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249902; cv=none; b=f6S1RPPKJG2Q7jcRnybt71qdYWhN2MNBX4omIyKZSz3V/QYnWT3ppOBW4Qwn+ji697wyvH8+RpzXB3Kve/m736syP4L1rYN0eMBia75hONvUdrAfJTHSvMdW6vYzJWMRcS7MZoDTJevmMD7Vy9thiKP8gEwRlbmmdC7Lu2g50Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249902; c=relaxed/simple;
	bh=Bd9bSzjPVcoY/cAs2JhUUVTBoxZVQkbOhDuHdo3aw4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UGJDzCCiDscOWzY7BNFZQHx3uXT1CdSO0CsOJN+O4fdoGnBZE82pLmsNln8f0Ikkp/YPLM9UjlOPiF23tnGM5xPmwKE8PQuCml133eNMAWRUIVhDXnZ1o7zwKOZyjgMcQzL2c4Df9W+KOIAY2LzE0XTHtaXWF4pun2C/uw0ViDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J994ur5F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J994ur5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06ACBC116D0;
	Mon, 12 Jan 2026 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768249902;
	bh=Bd9bSzjPVcoY/cAs2JhUUVTBoxZVQkbOhDuHdo3aw4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J994ur5FDxSxk/ye/ndmqu466xigHx/1LM4sT7NSaeV2RITnwCvuwj/NURxm5cDw6
	 NjlLsoZ1AJApIH62uhceM8BvYF6oX8HyhzW+7hggksZprDUubBp8qi4X7XcCp6YzXi
	 YKBFWgbouqR5dSH9/+NdhqHw5nS11dFEbqlsj4jDuK4b2WVqSW9wND3w7uWnE0krjS
	 QBBsshczXZdCGvQ1mxDTRDW66reCU3x+fypGih3/m3dKHVgkotTIdWZjo21WI7SLis
	 iTZX76dGdzLluf8PcdirF1G42W+a337OpM7ZKLCgsoAGI1sim4tNw1jNNMFrJmcFxu
	 yP4p5KHJKx0Rg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260108215307.1138515-1-robh@kernel.org>
References: <20260108215307.1138515-1-robh@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5640: Add missing
 properties/node
Message-Id: <176824990076.213661.11486949708651945291.b4-ty@kernel.org>
Date: Mon, 12 Jan 2026 20:31:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 08 Jan 2026 15:53:05 -0600, Rob Herring (Arm) wrote:
> The RT5640 has an MCLK pin and several users already define a clocks
> entry. A 'port' node is also in use and a common node for codecs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: realtek,rt5640: Add missing properties/node
      commit: 101b982654ac0305ab286b54d46de79b5b982f3a
[2/2] ASoC: dt-bindings: realtek,rt5640: Allow 7 for realtek,jack-detect-source
      commit: f66e7da2a6b1ba055d47d7c97c9c855729f868ed

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

