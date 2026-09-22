Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22671542EE6
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080540; cv=none; b=SjMHR3wZlZdnoUQo50EpN6aTAK1Y9lxP1nr676xKsWkA9P2B28SnkvV5pk55+UHVKlhylsIP+96lxYX5zQ/Rf08/A5bun8hgLupDqMrH/qrdCStXS29M9zF1zWh7VcpnuLAkyx2M3a0EESNSXeADY0F5+fo1IOOIpI0UDvjoGtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080540; c=relaxed/simple;
	bh=KmnsOJMnMIdNvEuuZZpMQM5Dje8tGHikRHefz11sqPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FxiOmH+y7SwmaoyyiDnR2JaxV7L5gZR82CfiMJLQvHtGB6aVaVAy+RA6XLEjK1rJOzSF5YCkRVM3z0WrssiAUSfISspZP3aLO53dW0aIzL2QbILitIvh81DvuXjgWAaYBdTx4+hiC+qdWfYvV/YWvBe62dKTgXHQzfyIs+5olxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZMlp2L6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZMlp2L6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3991F000FF;
	Tue, 22 Sep 2026 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080537;
	bh=I8zmFqP240sfdYm7mvNOv45ANXcN/DPs2nvI82nrZg0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cZMlp2L6WQrMW1bT1KGU8ip2Co2bf1qXlbbQToXHYM7+JYqk8bBcXgKlvJyZO3LVC
	 vO7aKHKbqGm9V/s2IhnlKXQlDsP/Ni0ru1l8jliSLCvJAU4I9pdr07taIqRoibDtu9
	 MCODqCptUzoH/xa7nckQQyJMkHjL4zL7WnWwFUMgj+njOXOCRatKrjJ0StUVpNAhZk
	 mB8QnEK711JSz92AWdLAFs3425KWLDo5+PFXKgv97b7w29GuRGIfyTGvsottJ8OzEM
	 LSsWIuMLncOuxrv2CqEfljyvGyLcKItI7uLxgKg0OmHrhVkVMeYiBYozzm5UOi6nOA
	 OFadd9hZwL6dw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260917104244.2512641-1-oder_chiou@realtek.com>
References: <20260917104244.2512641-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt721: Add support for the RT721_U and RT718
 codec variants
Message-Id: <179007411243.322763.4743058105036896640.b4-ty@b4>
Date: Tue, 22 Sep 2026 12:48:32 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KmnsOJMnMIdNvEuuZZpMQM5Dje8tGHikRHefz11sqPQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqsnYTBGU3ywbvg8+KQ6eGyypR4MMfNFx6t/b24
 2h5TUyho8yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarJ2EwAKCRAk1otyXVSH
 0NPBB/48EE9F/27U1SNN8uamvmjjmBhDhY74BhJGPzFMULqD+LzqMS6OPadwGT6Qn6DvATPFWBs
 Q00vXsY6mqdCt6T5dDr/b6QqFmv2ooPH8stQzPNk0iT7RFjH2ahTKQ8lzTC6Y3oMMT1CfvSpKx8
 fR6O5aB2TZi3b3s377Macpc6cCt0DvBXVxw8Cc/p88ROdeEfGSahs4IsELGKjDD16wll7joJ/dJ
 Lpc9VmNP7JS3ABeUAYjjOknrRXZXRzYpOom8vHngUtznpFiI8jmCfhme3Emn+l7ECIEV4PMbG9k
 Wsq7VYoQvXum0/XJGNF0zURKSqD0zCYwaX6OovT8pgGdq85T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 17 Sep 2026 18:42:44 +0800, Oder Chiou wrote:
> ASoC: rt721: Add support for the RT721_U and RT718 codec variants

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt721: Add support for the RT721_U and RT718 codec variants
      https://git.kernel.org/broonie/sound/c/7325b35a12d7

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

