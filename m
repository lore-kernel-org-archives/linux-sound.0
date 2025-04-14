Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432A2522B6
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643273; cv=none; b=TweVzvObOoT+bkz5RKcQ/C5kR4oT2wsCgkoVdjCQssFDlpSgLdUCY5qv2+0S87RrwmPgxgTonkrjtnQKzCOnN4+oUj9InHVaSzpzLKj8UYBN6GDmEX2VFdw1dawxZ6h6RRuZpYcGfvJ33IDLY/zcJluZNreQI8lew6zy8iY2uIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643273; c=relaxed/simple;
	bh=h5Qwv82WpnzjfIslSAhYGa+MzIVw/nvuOx/W6c98YqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RVxqI7Ubppokhm2H4aqqcuqw5Yde5aZVD4U9gbrXfb0LCwB6Lphy1RHCfBGw5GjV2Z0/KWrpGa6MQU4ZzyOmXPfH892QZvLOSAuG19UpatpNrVmSGjKCBd6K62J45LH365jSHP3tHc2Dq+Gi/2vb2Vkn+htE0aNk5qjKUD/BZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oX5BlACH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oX5BlACH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7C3C4CEEB;
	Mon, 14 Apr 2025 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744643272;
	bh=h5Qwv82WpnzjfIslSAhYGa+MzIVw/nvuOx/W6c98YqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oX5BlACH7NndESJE3Wz1jio5vTkYr7DuobXM5n+r880Z7cfV6+DzVk1D/fnk773qw
	 9TeqcGlpG8GLdGipk/+HfcqafKsGqc1+xMpXnfxM+XDbfyJJdEMV04BXYgtJdlOviq
	 6QJXSByHUfxw3xoe+WwW6z1y+yprhQqsw82FBKXCbqTgVWIlcYqL2YIMmBebwo4Dgx
	 fd+eAS4r/jugJ+5wIuywON+3dZ1rD8pW5ulMOj1OLfwuhhrMuLfU99EvnP3xwB6LPq
	 dPxNCrGnuS+0fBrAUI5qTHDqDR8D768d68tim0vkFr0JCd4QUdf0/lLBMhjJ68wYTu
	 Hk6p3dufJYlmQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87fribr2ns.wl-kuninori.morimoto.gx@renesas.com>
References: <87fribr2ns.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: simple-card-utils: fixup dlc->xxx handling
 for error case
Message-Id: <174464327212.115540.12120235160759937867.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 16:07:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 14 Apr 2025 00:45:59 +0000, Kuninori Morimoto wrote:
> Current graph_util_parse_dai() has 2 issue for dlc->xxx handling.
> 
> 1) dlc->xxx might be filled if snd_soc_get_dai_via_args() (A) works.
>    In such case it will fill dlc->xxx first (B), and detect error
>    after that (C). We need to fill dlc->xxx in success case only.
> 
> (A)	dai = snd_soc_get_dai_via_args(&args);
> 	if (dai) {
> 		ret = -ENOMEM;
>  ^		dlc->of_node  = ...
> (B)		dlc->dai_name = ...
>  v		dlc->dai_args = ...
> (C)		if (!dlc->dai_args)
> 			goto end;
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: fixup dlc->xxx handling for error case
      commit: 2b4ce994afca0690ab79b7860045e6883e8706db

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

