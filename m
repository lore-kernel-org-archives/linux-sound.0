Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E341ADC83;
	Tue, 10 Mar 2026 00:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102991; cv=none; b=hqbeidcJ8JMxwr7TTofEk2QcaQiwJvsnXHldoN5l3HheCix8sr2D+K8qse4XV1fEBhMWfLYYUhRduN3tblMscPn22zc9uYyQPHn1QGuNvOWwZYK8UOXd+op88PGCEkCkF2LVz5IDPgUey4qpONvqc66ODY2JJmpAicfL6+omNq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102991; c=relaxed/simple;
	bh=YpuXkVMbIJe8BxYBnsnbK33t6psPGBVuBb6VjM+r9ks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BOd0wEJlju9Lg+wCZQJ9ANtdxPwYFi2TXz+KtoCG3MZ7fgu2hMUiS9+8wDUfBkP0iu5CCTf07ivteS534Q1PgNQp1UNSxIsxWD3iY3PUv2DBqp4biHu/nDlQHeUzDXkTVlLzHScD8URaYV7RNsP9bSw2vXqt7Yx2RxUbhE1K+o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRGN3CsS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRGN3CsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D69DC4CEF7;
	Tue, 10 Mar 2026 00:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773102990;
	bh=YpuXkVMbIJe8BxYBnsnbK33t6psPGBVuBb6VjM+r9ks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oRGN3CsSQOhdP+aecuZU1YHOwSq/43JlOdyTSvgCdu94BDqjBZIIVAeO7fN4/4mfx
	 D35ATMdtpXQWXpzsFdr5PZ7oWA+PoDbmt+vbLryRJi7MBtlTiRKM3w1lELUs1x5yjk
	 1BntNJMk9FEl2AugAW3Tf+TRPVarOjFWCp6t3H/EkRy0RJ0+Wp/OsYlKDdGMWLBiaw
	 JOv1k0YuWhP1rHYfxCaYadWOP70t7ZE8cpjKfO7ncvxh2dOvLRAqOHVWIgCKWGzXln
	 lNggdKtS72uJtysSaTKfUdQl4wh5ETjaQ2iPGvQujIzPvkVetdVMfTaJj81Kmg+85G
	 mdZmnTOulDGlw==
From: Mark Brown <broonie@kernel.org>
To: "matteo.cotifava" <cotifavamatteo@gmail.com>
Cc: cujomalainey@chromium.org, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
 srini@kernel.org, tiwai@suse.com
In-Reply-To: <20260309215412.545628-1-cotifavamatteo@gmail.com>
References: <20260309215412.545628-1-cotifavamatteo@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: soc-core: fix use-after-free in
 close_delayed_work
Message-Id: <177310298877.348698.13474858295535281915.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 00:36:28 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Mon, 09 Mar 2026 22:54:10 +0100, matteo.cotifava wrote:
> Fix a use-after-free in snd_soc_dapm_stream_event() triggered when a
> sound card is unbound while a PCM close delayed work is pending.
> 
> As Mark pointed out in v1 review, flush_delayed_work() does handle
> pending timers correctly. The actual issue appears to be new work
> getting scheduled after the flush: snd_card_disconnect_sync() inside
> soc_cleanup_card_resources() can trigger PCM closes which call
> snd_soc_dapm_stream_stop(), scheduling new delayed work after the
> flush in snd_soc_unbind_card() has already completed. If the timer
> fires after soc_remove_link_components() frees the DAPM widgets,
> the work accesses freed memory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-core: drop delayed_work_pending() check before flush
      commit: 3c99c9f0ed60582c1c9852b685d78d5d3a50de63
[2/2] ASoC: soc-core: flush delayed work before removing DAIs and widgets
      commit: 95bc5c225513fc3c4ce169563fb5e3929fbb938b

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

