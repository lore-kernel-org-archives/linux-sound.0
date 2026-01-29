Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E1233149
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 00:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769646364; cv=none; b=g5w3n614riEmycadGXNNm86hVZheJFh9Do0h6DmY3MR+jTW7PEC2DHUuUB93ZDwwM/RFpT5rGjlBxHcrMprFZGzJc50tYM+Qq96lKLMOPUAq5roRBF9uDU9kwYZ0y0FA8jxfiWnujkLwd3vCZrko4EdM8PwG1Hyd6lmQm/pRkz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769646364; c=relaxed/simple;
	bh=SYbb+7+rBmzJSASbi0Z7Y3QW96y2TsdBH5w+jfrT8s8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QHltA2V541DJXN5jsZhxleVoeMTKvY9lxAMmCu0owqG8KkAJi4Tzq5wA93aNReqmh+IH4btXgYMy7LcLlpIQConbjXEi26nQDqQD6OY5g8Qjejzqof4vok0U2zAL0mxDUIJNxg2afxK9SW0JdNQFXI/JTU6GmMtDPkKKglN3cAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnEEnuj7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnEEnuj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0196C4CEF1;
	Thu, 29 Jan 2026 00:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769646364;
	bh=SYbb+7+rBmzJSASbi0Z7Y3QW96y2TsdBH5w+jfrT8s8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tnEEnuj7NImVPfu73i+L4TPn/QM7nO8uolLjIXu7+Gz8QNWHc8kGefw1TmOYbzK/+
	 swgXa2mENB6H0bwPeoIZ1/3bDCfcpFe5iKHwpz1ktryx1rlSTAq0fpH6BOCC1qvTMQ
	 wlsD6w6JJlw3eajCajlEDRmi0iYVVY1fOoO8isG4OHVA+5DJ7R5i8JCDAPBaiwwdg8
	 1UZI3kXTO8ikdEgX57G6N/CbLEcc1oS9J6j40N2k2NXIgKmUoCVqZuy0Jovfg8321i
	 SwU4q2A2tL0q9+mJIsvXPudGrdsyAdMgLf4wV7C/NyqD+j4k9EFPZ9Um3X2qk9JUMw
	 17ShY3tqJxBUw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jyx21nu4.wl-kuninori.morimoto.gx@renesas.com>
References: <87jyx21nu4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: add lockdep_assert_held() at
 snd_soc_unregister_dai()
Message-Id: <176964636344.3232602.8819741089560669703.b4-ty@kernel.org>
Date: Thu, 29 Jan 2026 00:26:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 28 Jan 2026 02:19:00 +0000, Kuninori Morimoto wrote:
> snd_soc_register_dai()           has  lockdep_assert_held() (A), but
> snd_soc_unregister_dai() doesn't have lockdep_assert_held() (B).
> 
> 	void snd_soc_unregister_dai(...)
> 	{
> (B)		dev_dbg(...);
> 		list_del(...);
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: add lockdep_assert_held() at snd_soc_unregister_dai()
      commit: 88340fc880cae6a2953a366aa6ad0900fd9830da

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

