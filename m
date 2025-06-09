Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170425B67C
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476421; cv=none; b=aLvd+I/nLjhcU6cUEvepiIUGj8wqQsa+ORVoXYzVGeSASv1RQbBdJjLepZn4RLa6FWcGnLE8F8K4jO3UJ6VxZK8Krmx2oXsps4krX7JrgxF2BI4SzfwHJg/OP/8fDmWOc6AKbER2sB5sJEP9v8l8MMZafhirrtQcLTlinMhX5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476421; c=relaxed/simple;
	bh=09ch661Pz0G7NXwnu1TICzZJqFSvQwjwPx5EeEx5CVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fxK/cktbFoasqF1IYUDu/y0xfd1qcM8Glx2KPe/Me9rKpLhpLoHi2dFfR8zYyZcgPwxvLPgL4P+gRVSfZpZKLglsEs9mSlkEN5BpQ5mxJ/fa9kiZX77od6oaQVduO7cTArBNB3pwcAUKR09O3YisdXVvFbXbAjKTyt7u7I8aIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOL6gC2T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOL6gC2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4088C4CEED;
	Mon,  9 Jun 2025 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476420;
	bh=09ch661Pz0G7NXwnu1TICzZJqFSvQwjwPx5EeEx5CVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TOL6gC2TOmZYwj3cpMhKu7omZx1VxFr9xE8HPLbDOrnZxnfGd890jDdLi8b0cfoT/
	 WUX+a4K9NhCMlW+zTNMT1n1tl0QHM+ifH5nxJoNVr8MK2YbrtyjbLJ3cY2qysEC96A
	 tp156L30caTpmCCfvKa/JIxsyA6+RnbvtmGrnTrJEdC8DusG96oJdnJwGH4Tro0SkH
	 pekMEgWBBUYLyx2WlwhEEQz+3wRNCoXbY/Kw452heB0kOddDPTIW422LUtl8fOi4dk
	 ReezkK9jUCJlfpjpEA/0JtRMLecrTLcKcQAjiIm+ar7CFDb7XIKF0dA0SFzEuyztGr
	 uGPOV0l/tLFbA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Giedrius_Trainavi=C4=8Diu_s?= <giedrius@blokas.io>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8734cdfx59.wl-kuninori.morimoto.gx@renesas.com>
References: <8734cdfx59.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-dai: tidyup return value of
 snd_soc_xlate_tdm_slot_mask()
Message-Id: <174947641953.126747.3362638266431442826.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 06 Jun 2025 01:59:15 +0000, Kuninori Morimoto wrote:
> commit 7f1186a8d738661 ("ASoC: soc-dai: check return value at
> snd_soc_dai_set_tdm_slot()") checks return value of
> xlate_tdm_slot_mask() (A1)(A2).
> 
> 	/*
> 	 * ...
> (Y)	 * TDM mode can be disabled by passing 0 for @slots. In this case @tx_mask,
> 	 * @rx_mask and @slot_width will be ignored.
> 	 * ...
> 	 */
> 	int snd_soc_dai_set_tdm_slot(...)
> 	{
> 		...
> 		if (...)
> (A1)			ret = dai->driver->ops->xlate_tdm_slot_mask(...);
> 		else
> (A2)			ret = snd_soc_xlate_tdm_slot_mask(...);
> 		if (ret)
> 			goto err;
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
      commit: f4c77d5af0a9cd0ee22617baa8b49d0e151fbda7

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

