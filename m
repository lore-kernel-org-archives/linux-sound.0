Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1FA150997
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129623; cv=none; b=X/cEHoEhztxGCi1/4CETssVmT3TqzrbGSQvSIAW06uTWnMMgiid4msktBr3I6z9M+O0XtHBeaEIEkxcuMrI2CBZI4GUQjSekpzb/J5Yo9SM6d6bhu/hIwQNlQvNzDfolmcIGY/+zxcvYSiPiwYmp2vAnjzpughwN0n9WUWXdgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129623; c=relaxed/simple;
	bh=IMLNd04uLUqznR7MUe/j336hFAP+ckPn1NO2A53nkP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d17oePlon645rD1LxKcmZ2tpuFmtSIvVqWW3Smuk174AYP9fooLBnvvtPuTPsNccjpXaE7pRXNGrB3pGVVv6UcCB9RJ1FAZBFOXqhQygSlP9pLEYmPyFm6WNTlIbTnmv6tiYf+qzm8o1mFo0nXUIKsw3YuLUKHKRchpctVX1k3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3VBY5gW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3VBY5gW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF830C4CEE4;
	Tue, 13 May 2025 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747129622;
	bh=IMLNd04uLUqznR7MUe/j336hFAP+ckPn1NO2A53nkP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o3VBY5gWrO773J9R/SRIlSo89VBLmUKZsoW7Ygz3bVG2BckrmRHE9YnjeA4srAkzo
	 JG0brrDlWLKaT3FAPlvUfw62N7W2l/thUlBzUfLWFFF6XPawbUahQo81OalCk8l5k2
	 Si7Rm6lElMojNQH0bQpRnb7rDIUo0aRLUTs1kPdsoJbqyYN5Lo/PrWh+zCk6933K0g
	 3rhAjmsLl8PX5z2mj3bfwAXXI0iqSLQoLmC0C/0zTH9uwcs6OrqowfSNb145zUdekP
	 uZw5xUG8jasjRD+4h/PP+AY1LzWloMSi9lZaYU2w7OPnhMSAG8jvAO53SbGQB276Gg
	 tDsyV9y5RjIxw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h61qy2vn.wl-kuninori.morimoto.gx@renesas.com>
References: <87h61qy2vn.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: merge snd_soc_unregister_component()
 and snd_soc_unregister_component_by_driver()
Message-Id: <174712961962.91208.5785496353612809573.b4-ty@kernel.org>
Date: Tue, 13 May 2025 11:46:59 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 12 May 2025 02:33:16 +0000, Kuninori Morimoto wrote:
> We have below 2 functions, but these are very similar
> 
> (A)	snd_soc_unregister_component_by_driver()
> (B)	snd_soc_unregister_component()
> 
> (A)	void snd_soc_unregister_component_by_driver(...)
> 	{
> 		...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()
      commit: 144d6dfc7482455eabf8e8caa974a6e8d9572705

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

