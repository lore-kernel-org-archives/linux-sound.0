Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F8229405;
	Wed, 11 Mar 2026 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255418; cv=none; b=eYv1nzesGrjyhw3F7oGa6OXOH3QWCV3Cz3/h2sujlAKJLjIckm7arZzwuD0v7UAt7YecRaDeykGoLmgB5yJO9O+2dYnPDh7iWV3SMkLqlyLReWk5R13U2b9AB48zku38NBokJKRfO4Aoa9lp+K1WkfrD2Sa9ycyzfGZn1U9A2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255418; c=relaxed/simple;
	bh=Eq78QREdk7gknuw/ho203ZJktdETtGeTVckQDuTf5+c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wpph1rKsXVU/OIRYGLMzzWb7RCmKRiuAGxTQHNM5xLqS6qv6oEbsxXWeUwTQDHTylRyfVe9XaMEkYHe62w8Jfg4Ik2Q9J7TRC51QgvyTyHCHQ+qW7XRT9r9WV+IoqO/evbh1+2nsqZq39cjqg3akFIDFLxwFCpQLhewxHTCfnlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZeJlPLXa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZeJlPLXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51316C4CEF7;
	Wed, 11 Mar 2026 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773255418;
	bh=Eq78QREdk7gknuw/ho203ZJktdETtGeTVckQDuTf5+c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZeJlPLXaaS7BqAGdv+XnFTzQQD21mbUZ24yMSfeVXbmTpizM5K0XDJNxki9o0mu+t
	 eR2AT6SCbIqKPOyTk9GqEXxQ9XyH89l8sv5WEXKuC4pmEazTgnd51S+pQuYXLbcLUB
	 swcrgoLgudCdkci+muL6p/LCaoDRSAdfC41+CsmM8LzueN/FDxSDtC3jvJcVPxKto/
	 2n5GmjP8bMS2bJmErB88ZiOnK2Q59WOf2LI4CYih/0eNh4kurzo3dcaOqHsHkvvC+V
	 Lo5ezol5wvAoT4DEnhKpzM6PPJN2F18HiFUAGja+PmHYy+TQ6TxxZ3M6/l7T4RKJ4G
	 8dUzeCIHQTUZA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 akshu.agrawal@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260310024246.2153827-1-nichen@iscas.ac.cn>
References: <20260310024246.2153827-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: amd: acp3x-rt5682-max9836: Add missing error
 check for clock acquisition
Message-Id: <177325541606.227645.538355020341589819.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 18:56:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Tue, 10 Mar 2026 10:42:46 +0800, Chen Ni wrote:
> The acp3x_5682_init() function did not check the return value of
> clk_get(), which could lead to dereferencing error pointers in
> rt5682_clk_enable().
> 
> Fix this by:
> 1. Changing clk_get() to the device-managed devm_clk_get().
> 2. Adding proper IS_ERR() checks for both clock acquisitions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp3x-rt5682-max9836: Add missing error check for clock acquisition
      commit: 53f3a900e9a383d47af7253076e19f510c5708d0

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

