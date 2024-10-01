Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDEC1CDA20
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727805202; cv=none; b=Q9oa5alM9NWSTw2YEC4f/jdQZ19ET3dzMixLg4Fv8uygu+yJ0LbcqJbgF2RP8/UrQrHUZ7PVMFUNqu4g0w/moNcEb6gR3vvsOLF5yvji7zcWEww4eiATAMdV7/8ie5CwfyAPU4C5P0hlHH8FuFKb88eybDKzYsZcBUDhNQ6MvR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727805202; c=relaxed/simple;
	bh=rdu8NL5WsUbn5RMyH5goYyYCtyogitFe8oO28rlRcqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WjAunz+NIjSVKBjIeceCifPX0IAsCL+7/cCNKhHqcPHXT1IEzsCWKS+4A7Y8WaEqGL1ntU6gD2Nb2dts+Y3Sn+XzRreN1aV6WKvtikezyNrn0E/yaW6q966mxMKTtIlnmqpelSj+pW8ENW8UDFXAiByxp2qphGTuanob0fw3U7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPdfC79h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPdfC79h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2E8C4CED4;
	Tue,  1 Oct 2024 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805201;
	bh=rdu8NL5WsUbn5RMyH5goYyYCtyogitFe8oO28rlRcqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YPdfC79hXynqOy6fqk+1igGWO6rDMl9Qwbgxz+pLRV+KsqlSINpcEXz8AL3o+DrE1
	 WVjuiPQ7fDK/wT9XH5kFNT6+1uU0JH9eU8U52UbPQ3HGGFL0PsyTvrNf8cCMvAFwvD
	 GGlraLP/Cskkcw1eOqLOrg6WXfR5xUJMNGj9slMQs/RHwXGeDJT2LO4gAxp94vRln7
	 7GRv8VPjkJtpdnpiB1u7WE7rkwvF/bsmc8ojt4G+T7VlWUGcOE5n6QHUj5LjS6rPjZ
	 mcpyesdwEY93ZjPlJIU2Nmw5/0iEprULsI96UVXngjhMqdeqthc06bF/lDwWQpDdKw
	 p4p8UwV0hAIiA==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Hongbo Li <lihongbo22@huawei.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
Subject: Re: [PATCH -next 0/5] sound/soc: fix some macro definitions and
 usages
Message-Id: <172780519925.2298697.9944176143649696918.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 21 Aug 2024 15:08:10 +0800, Hongbo Li wrote:
> Many variable in macro are not used as we used macro_check
> script to detect and mamually check, let us address these
> issues.
> 
> Hongbo Li (5):
>   sound/soc: fix macro definition on TWL4030_OUTPUT_PGA
>   sound/soc remove unused substream in macro soc_component_mark_pop
>   sound/soc remove unused substream in macro soc_dai_mark_pop
>   sound/soc remove unused substream in macro soc_link_mark_pop
>   sound/soc: fix macro definition on STM_SAI_HAS_EXT_SYNC
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] sound/soc: fix macro definition on TWL4030_OUTPUT_PGA
      commit: ac9fc25f114aec07e7f5348606c9702f8377f44a
[2/5] sound/soc remove unused substream in macro soc_component_mark_pop
      commit: 5687851e484bdb22fa565578e0b046a50d502941
[3/5] sound/soc remove unused substream in macro soc_dai_mark_pop
      commit: 7215afbd8c090a3254f8cadabb550adf1c00547f
[4/5] sound/soc remove unused substream in macro soc_link_mark_pop
      commit: 2f12d0de77b99f0f35755d16efeb12e6f45e5710
[5/5] sound/soc: fix macro definition on STM_SAI_HAS_EXT_SYNC
      commit: 7a01e17e42fe944982acde1dd40bdea177372173

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

