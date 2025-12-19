Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4D62D29B7;
	Fri, 19 Dec 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153375; cv=none; b=cYlWLhVGKB5mLrYTVmsJg1lFsMrmRASE5/zS4cOkQ3JMpKaYdb0CY8hs7O+YA5u8tqV8c1hwch6J+wlWPcykTL7pPlO1v+HYysw1yMXtsPMEh/nNUYgsZ8jGVn3EAd2/IoVHfyncn6ASa5qKVioiocOIp4IhPH7OhI/SD8OvN9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153375; c=relaxed/simple;
	bh=UN0Mdg7W0tnMFqXs/oDk505vUqsvmgjP/v5TojxbzAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CFwva+LsIkFzywBZHEXo6g284SZqv5WB82PCim4ZCysCTNizN7H4BqtPj02JePl/flYrVrNJCNe9NTzOLmxWCBXNCKZb+RQu5m2xHpplKA3Rzo924s+nqXfeQkGh4Qic20c6/9sUfFXhB8CU1RuP/CkcTjkd7kOxrMbefOAcqzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYAs0Edk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYAs0Edk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39ADCC4CEF1;
	Fri, 19 Dec 2025 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766153375;
	bh=UN0Mdg7W0tnMFqXs/oDk505vUqsvmgjP/v5TojxbzAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eYAs0EdkTER9JkGoUn+7p6/vexf8MbgjyW5TGJjh527luFHnIeEUSI611+cCHraqD
	 s9mdX3U9FNhCeF39EH8LXxCxMol9phEQn0uwaA8nlALyqDs2J7d546AeCtT37YWZt5
	 F34jG4ErHjcnfA7kJJP0q6JGGorDvIUKJQVPlVf82fsf2YQVbXyhjEQrA5dGLExCDd
	 HwdEL55K7zxPtKg0XCXTYWDLzSjGbN3QXXz4Pv+uDN0PRkWYeJ8g3Wj3CuQEdB0COq
	 iqiIygwrkELT9fAriqzPlD8bLymvp32UX+7a542aL/z4akjJtp7AAvTXiMeBMDT3ep
	 4GLi2vCjPL9nw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20251216064721.4622-1-zhangyi@everest-semi.com>
References: <20251216064721.4622-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH 0/2] ASoC: codecs: ES8326 : Add Kcontrol
Message-Id: <176615337397.412520.17326760984744611865.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:09:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 14:47:19 +0800, Zhang Yi wrote:
> Add some Kcontrols for ES8326
> 
> Zhang Yi (2):
>   ASoC: codecs: ES8326: Add a kcontrol for PGAGAIN
>   ASoC: codecs: ES8326: Add kcontrol for DRE
> 
> sound/soc/codecs/es8326.c | 18 +++++++++++++++---
>  sound/soc/codecs/es8326.h |  3 +++
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: ES8326: Add a kcontrol for PGAGAIN
      commit: 68970b53890c877c61686c86fe28cc3a142c1584
[2/2] ASoC: codecs: ES8326: Add kcontrol for DRE
      commit: 9a6bc0a406608e2520f18d996483c9d2e4a9fb27

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

