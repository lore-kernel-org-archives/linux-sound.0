Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3AE2F25EF
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807133; cv=none; b=bBSNtz+unF3r1twc2u4/HaGpQduDVxa4o8PcoSb2oKI3r+Xldpj+ZMq64w8JQaZOuDHY62lgMdkNAiBcn99kzfTYNLzPz/vu1u3wrn5LElqz9Gf0Mv35L+E28iwnRPqLOljRtrJQVDurepD5dQxVBlFLyRiNkuYt/pWKSMNssRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807133; c=relaxed/simple;
	bh=8y+t491Fld1EcPJ6b9WFKonqJKIrKFIKHVSPfJNiC0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AZKBPbyYm0Yc5uSa1IdwF/9L8sg0Eme/vmy08Ex4c5qtzo3+L9E1t5iPIboAN5wghXG2NWivZwhYdfmUDJBNFPODGfloa/M6v7Def3fN9cWj3mLga1EWHEELhUmSZSGmM0sE/Vk910m70PRgPWiXxUuI/rVu7c090DG3tT2kylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRAV+bDr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRAV+bDr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B8AC4CEFB;
	Mon, 15 Dec 2025 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807133;
	bh=8y+t491Fld1EcPJ6b9WFKonqJKIrKFIKHVSPfJNiC0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HRAV+bDr928fi8ijEF6RXQki1w0b88rDDToHsZZfYL6ukLHGjp6A1X5IxMTnGeiDb
	 8LFtjsHP5TybWtz5wUyIIsE1vmMhGNn+cgxYRHd1/OVcLfj35OyLmDFhlmf67p7AIN
	 TQdJrD8WXrXVh01qYp7xfrHEQUnbBQV2vQBKRbasxNnpqN7wJJX5iKcv/HhkPTw1eu
	 +cgsr3vHIQoiQFuIJ2//91Gk1UlRWfOPAZaCcY76HkJluy6qfynWjcomzO5iPa1I+4
	 4h1s2LlbC/akwnYENqugFgl+qW4RSe7eHHOLjwbb+H214V+/6x2nSe3NOmdisyuQeQ
	 pea+LqjGcAhsA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com, Vijendar.Mukunda@amd.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20251212121112.3313017-1-yung-chuan.liao@linux.intel.com>
References: <20251212121112.3313017-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdw_utils: subtract the endpoint that is not
 present
Message-Id: <176580713152.161056.14875918661003411681.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:51 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 12 Dec 2025 20:11:12 +0800, Bard Liao wrote:
> When asoc_sdw_count_sdw_endpoints() count the num_ends, it doesn't skip
> the unpresented endpoints. But, asoc_sdw_parse_sdw_endpoints() will skip
> the unpresented endpoints either by quirk or the SDCA function doesn't
> show up the endpoint. The endpoint number mismatches between count and
> parse and the machine driver will show up a warning about it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw_utils: subtract the endpoint that is not present
      commit: cb0ae6f22790ead71a866f94c7a5a70ad56af16a

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

