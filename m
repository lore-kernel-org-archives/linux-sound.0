Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A086145FE8
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361949; cv=none; b=LTLM0JB26AeWWEbpsbnDsEipYguaKbPQ3f6v9dDrQeDuJNeIE5xOumTTAhDkxriS7XBM5swsvIZuF4txZS00lf2KlHAQZVJ98U4g0sAB8jwzKyCrewKukP+znUCkqPXvUVHLxX2b5exCIRgGmqWM+sgiJVmQgIedL5sg4K1qmrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361949; c=relaxed/simple;
	bh=/rCZp7EGsD07FIEwqiBFCjMKmRa4Xwu/p3ZMes/fc5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K0gUMXLV/QvSNAHqyhgMed2bwYuqGEM2wRB/nyjcRcqg3pva+nvt+3QslM1hvPYSOyzOrlE+Yc/XrVxIVLwNRaq1pNS2fxLjH0NUmybVNWlesEf+tHJuKhh8ThSgg5u6HpEpIga3lkILNAuKTet2XLBZ6w5BVBbpmMegEsgylXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUdHSjNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUdHSjNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCCAC4CED0;
	Mon, 16 Dec 2024 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361948;
	bh=/rCZp7EGsD07FIEwqiBFCjMKmRa4Xwu/p3ZMes/fc5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oUdHSjNhiLLMgrYXboVG+da3SOpjjaxD2nVo+QYs5OkOhbwzEfNFEkeQGgTydblXM
	 QJ91TwPCPk4PdQN5RlBDoEJknKvEdGoLMAhDqjllo5Xx7PmWNFRBkUzRO0FPDzn0gV
	 LgohUnvg3Uio5X5vXapAhcL8lUTqfOfAvWp6F9bjBpBRAZjaqz67JaJ22WFDbAdCjw
	 KbQIDLAGKtiQHDqmPyL6IFYjjwzUMKmZpZnek5QOX9uR1vE/jwONlyRdGzNlvsRISN
	 Z5Moml6wBXOBlJAG24YKKjbXTohzthZwbl3lfGtBkq3h4B1HdQ6B94pi44nsp3L3vJ
	 rFAbFvQYSUXrw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y10lu0gx.wl-kuninori.morimoto.gx@renesas.com>
References: <87y10lu0gx.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Unify clock direction by
 clk_direction
Message-Id: <173436194773.77772.16922765031960774103.b4-ty@kernel.org>
Date: Mon, 16 Dec 2024 15:12:27 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 12 Dec 2024 01:57:55 +0000, Kuninori Morimoto wrote:
> Original sample-card assumes SND_SOC_CLOCK_IN is used for
> snd_soc_dai_set_sysclk(), but someday, Codec uses SND_SOC_CLOCK_IN
> and CPU uses SND_SOC_CLOCK_OUT at hw_params(), and dai->clk_direction
> is used at simple_init_dai().
> 
> There is no uniformity today. Let's use dai->clk_direction for all cases.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: Unify clock direction by clk_direction
      commit: 5725bce709db1c001140d79398581e067e28c031

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

