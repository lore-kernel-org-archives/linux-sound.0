Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E3145A0B
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741277422; cv=none; b=dAyh0F1RGSNxl/nkoUf/ISPR0/WZQSIb78cdWngl31t7rhF3A0PoWLQ0dwP7BknPqpMi4KShmm1/FyN5Msfbk/R5Rc5iqNByTr60aeKSoANnsmkPF5FWJ4Dz6TnBBVunkpj5tRXbtQGQLI1Y6G7MQiy33Y80oRx+4ZcKApE9Olw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741277422; c=relaxed/simple;
	bh=Gs0btnOGFHkc4wOn2mjrxcZI/G6INZiAIdx+Q7jAeN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iXl5HjSdsyozgFONa2N4CccMupBZZ1Z48kdvt8+Tm8R++UFjtMOSIg3QKw7S6KrYo5O1JkMZoKf28tKOdyk3X6yrYY/wr73hvRqvEcbyTYm6KmHL0SKpZCweSZ2Q0AUGiC3im3jM7luV9MpctS22nZG7t+vQtYrbcpcq2BpONrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvWnxBW2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvWnxBW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1754AC4CEE0;
	Thu,  6 Mar 2025 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741277421;
	bh=Gs0btnOGFHkc4wOn2mjrxcZI/G6INZiAIdx+Q7jAeN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JvWnxBW2q1aDDVfm5IY83gMX8xW1tCSAuMJzjEPDM/L5TFUsad+xfxrJgLDup+i0o
	 8nJn+twJ64+4ehANLIaKJ6VEYnZ0EFujcmQzu0qys4ILDZTnMTLIEgNi8OOHvMe2rH
	 UGa+FMy2o7NfZdT7yFgPXg513snW78/O1z3VUnHKiswgvPuAHGfkgcQmdKiLPpNiDi
	 nQwZxSIMubuInkGFt6fforpW3qC3jcgqlqyF4mjL6SqF7m35lkvs6xGaoOYTTHS3e1
	 xe686Qmblt/CGuSrHMRV5G7lLTn2EYzXba43U8y3/XR9GMZ9u7+vnhFKbzN+jFtP1r
	 H6rqGOARhRzEw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, lars@metafoo.de, nuno.sa@analog.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250306104233.1638625-1-ckeepax@opensource.cirrus.com>
References: <20250306104233.1638625-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: dapm: Fix changes to
 DECLARE_ADAU17X1_DSP_MUX_CTRL
Message-Id: <174127741981.138495.5039210123234437598.b4-ty@kernel.org>
Date: Thu, 06 Mar 2025 16:10:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Mar 2025 10:42:33 +0000, Charles Keepax wrote:
> The changes to DECLARE_ADAU17X1_DSP_MUX_CTRL did avoid the issue with a
> compiler not liking all the macro indirection. However it introduced a
> new issue with respect to the mux not being declared static:
> 
> sound/soc/codecs/adau17x1.c:275:8: sparse: sparse: symbol
> 'adau17x1_dac_mux' was not declared. Should it be static?
> sound/soc/codecs/adau17x1.c:278:8: sparse: sparse: symbol
> 'adau17x1_capture_mux' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: Fix changes to DECLARE_ADAU17X1_DSP_MUX_CTRL
      commit: 269b844239149a9bbaba66518db99ebb06554a15

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

