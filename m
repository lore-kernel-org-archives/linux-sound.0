Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C1222D4C5
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068954; cv=none; b=PSzkfBR4MzfRG9WqjlDzVAlup/VhQyFmgzYYjX8SOh5tazuJdhqIKZiKcSS3zrpR3nAAZ6auxQJZ93HYrjys8SIwh7FnPY6Btfv0pbzpWxShmCnpd2ZWiZFMruYIR51sz6CZ3+H/UymMBsR2w8JM7YuaI2uLZIOd0UCd17aIf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068954; c=relaxed/simple;
	bh=XFgJdjffG4yb7JCCN+e/j/mssVKEzB5Xc8hcri3YIoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U7CX9FkFfQ/Y73fOlrw82QQY2rfGiyuXu74rtiwkr+mvYjICPj5p2vZTz4Ss/fikbvynGAjRZz4RZ4aeqze6TisxjMHZ4MXFz2G9IArGr1aFrQgp+Wbv5mF4EUp9923KQ/RrGm1hw3cKECPtCSiri4/ZJWFEdTuVZ7K6Bayve5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRkp/f5h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRkp/f5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46E3C4CEEC;
	Mon,  7 Apr 2025 23:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068954;
	bh=XFgJdjffG4yb7JCCN+e/j/mssVKEzB5Xc8hcri3YIoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rRkp/f5hyTZ8N/h6BWU8Ur9AxPVBnAqbSUNgs7RpSBZAiNRvtqzmpHhjVmVYkI62l
	 ecm7w7QoguLMKmWnb0J5BrkVLEzCtAG0JU2AMNZEu/hoWcGunSw9FAzTTKtzqeayHA
	 dy5JGpMNU8v7FW0zshuI7SFsJ32BzlkA3dqfXSVYIF+hgdRnylbZ36UbMNO5EKrTj6
	 IzuEaxNUBpogwLJBETWKxFsYd751sLsci2R7JyyXR9S4adokjwaSy4ZLs5Dq7uwFh0
	 9kAdSfIOsbPxS7/1g+L79OcKQ+tNetiiM7U/ryI7KK0xG4k2ZJmHJ6hO0xkNE2jK5P
	 7dLK+rMJsq+8g==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org, hdegoede@redhat.com
In-Reply-To: <20250404101622.3673850-1-cezary.rojewski@intel.com>
References: <20250404101622.3673850-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/2] ASoC: core: Complete support for card rebinding
Message-Id: <174406895266.1337819.16252123862071464051.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 04 Apr 2025 12:16:21 +0200, Cezary Rojewski wrote:
> Since commit e894efef9ac7 ("ASoC: core: add support to card rebind")
> there is a support for card rebind. The support is only partial though.
> Let's consider the following scenarios both of which aim to enumerate a
> sound card:
> 
> 1)
>     snd_soc_add_component(comp1);
>     (...)
>     snd_soc_register_card(card1);
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: core: Complete support for card rebinding
      commit: a3375522bb5e28285cb1845ad5601bf4a581da04
[2/2] ASoC: Intel: avs: Permit deferred card registration
      commit: d0e1a832ce60354da2159d4d2b1fa324843622d5

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

