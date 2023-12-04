Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E12C18A
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlfqs1xK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97740C433C7;
	Mon,  4 Dec 2023 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701707364;
	bh=vhrxUvsCwsaGYvyyei5h55J9yp+nmIcuFyO/lJGVsJM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nlfqs1xKZp32xjV/6EKDBJ2qWN4k1GrusvYA6y+pDG1Nj3WAKnOLkUcGrPOZ0OGXz
	 G3GpcOBo/LbTOymRzzN87kHGm/k9MEmu2KVNhy+o0ANyGkKUPya2AQF1H4vW3ZOJqJ
	 hWr/bdZvrddYY7MeY6IAo/X9/v7xnSTZ9vj6VfispDV3rz3aQUHdFTYPjwuXB6KzoZ
	 RMslHsfXUZZL/2rLamNH2sudBW3P7VJyae7PSnKlRrawgvr6wNMZRFf9tRu3rjxX6S
	 ygYFPc/AcGJOf5wewz6kWRLZs4+R39dje2xLi6wgmnMF/f+XA68ImNDZmAOIdINyn5
	 shTvUc2qSCt+A==
From: Mark Brown <broonie@kernel.org>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231204074158.12026-1-dinghao.liu@zju.edu.cn>
References: <20231204074158.12026-1-dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] ASoC: wm_adsp: fix memleak in wm_adsp_buffer_populate
Message-Id: <170170736133.96782.15219793902912289690.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 16:29:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 15:41:56 +0800, Dinghao Liu wrote:
> When wm_adsp_buffer_read() fails, we should free buf->regions.
> Otherwise, the callers of wm_adsp_buffer_populate() will
> directly free buf on failure, which makes buf->regions a leaked
> memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: fix memleak in wm_adsp_buffer_populate
      commit: 29046a78a3c0a1f8fa0427f164caa222f003cf5b

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

