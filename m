Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD6307AF7;
	Fri, 21 Nov 2025 22:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763763108; cv=none; b=ZRbRGnvaGmGJ7OxkaOaKe6h9VryaBYFm6UDJ8KN/Nuitj6K6QkRxDK8ghjWAn2wAh3rz32d9SQm2GkVKcZhnbP9JVGdvUmOc38xGHcSkYrnTcyIEwWIEfN1E7drab03tQ8jM94YZtI+0tmf46LCjYCZj8vXO3jxqUok4fVIlYEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763763108; c=relaxed/simple;
	bh=IK5gshxmppB4MCR1zL4uo1i+evvFMkZblysOL4FTjX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KpwsNqjsw6N4OuBZIUp8yeeLETrJ7Pug2kUUha1DrIjUgI9/ZVv4p5G3zPxZfNV4VvPlIZh4/DqsJg1BlTPtW+iEqJGbs8UYof5eS5EwlLXuEtT04TDgg3a6bxnUJSInyDUGOhi8+WFu3Cg5LpJARa2nr7vXXgoB8P5yXPtXriM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twRgm5Df; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twRgm5Df"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB56C4CEFB;
	Fri, 21 Nov 2025 22:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763763108;
	bh=IK5gshxmppB4MCR1zL4uo1i+evvFMkZblysOL4FTjX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=twRgm5DfkqAzGi4lFX3P3NDgq4fzE92O5us6Kf9WndLiVp5C3g4nvC1qwjvefgKuY
	 8ogtw0GxnUTqHoUwcugSSJEk1aSKAuHJ2JTSxTwcEEXLhFRBzw0WyThE+h6IrlSlSm
	 9pJMcS70id+ZbguJE5wrXz9s6QSK3nuvTdW7B4pbBJuslgS2/AULS1NYe3zc1HCBMP
	 35OmM1RXjzmo67lgwq34kLaHeypmOsieGrDTAhvu0klPQFjM/yPrHDIyL9Gxs4tFul
	 pGd0R9lqHkqg6R6qPI39UTWAF8oCLbPjghC2nsD/Wr9zJoMzzY2lFquleidAwgq2rf
	 LKNUI1oB951tQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: shenghao-ding@ti.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lumag@kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20251121143258.229138-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251121143258.229138-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: add explicit soundwire
 depenency
Message-Id: <176376310618.101329.9975086867710479356.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 22:11:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 21 Nov 2025 14:32:58 +0000, Srinivas Kandagatla wrote:
> WCD934x provides register read/write interface to soundwire controller via
> slimbus. Eventhough there was no direct compile time dependency for
> this so far, however after adding common wcd functions this dependency
> became explict.
> 
> We can either move the soundwire specific bits from wcd-common to wcd-sdw.c or
> something on those lines or explicity add this dependency in Kconfig.
> Moving this wcd-sdw can fix reported compile issue but it does not make
> sense to select this codec without soundwire configs.
> Given the fact that WCD934x is very much providing soundwire functionality
> it is better to specify the soundwire dependency explicity in Kconfig
> which should also fix the below compile time error with combination
> of wcd934x a built-in and soundwire a module and also allow this codec
> selection only when soundwire is available.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd934x: add explicit soundwire depenency
      commit: a3d8f733d453ed4d4eb1f0e894eec787777465a2

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

