Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A34613B123;
	Fri, 15 Dec 2023 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toQpHFxp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49836C433C7;
	Fri, 15 Dec 2023 22:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702678440;
	bh=bDiBbPR3RfT/ab4YUavIkrVz8RJyt3orRvU5WNVHrPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=toQpHFxpyulM1L2N5C8M6irdavEs9iuW8oMP/+3fmdfLp0d4PICOE+aRxjxdS40If
	 sJv7fKH7ZW4gTE0PwIm5j9ERUppx0vWlylXvy9aZee1glLuAVgGyUy85B/uDroXbmW
	 L1r9zR4hfDuFIUevglgPmurdxtTkuFKpEx5edpU5ObhTfTTVHuHEgwqPImJ3XiTQ+i
	 FrBHgffnwl212GM9USQh1+DweRURale5ZaXb6HSzBWGvds9f73qyEogAq1eROzsegI
	 vf/ps+doTRETPqYTNJ7OLh4jCZShym15zky05grMPyn8P7y0Fkq89+v0Cd7B3VYz68
	 01WyDrXke6xvA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, posteuca@mutex.one, 
 bagasdotme@gmail.com, venkataprasad.potturu@amd.com, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231215130300.1247475-1-Syed.SabaKareem@amd.com>
References: <20231215130300.1247475-1-Syed.SabaKareem@amd.com>
Subject: Re: [RESEND] ASoC: amd: acp: add pm ops support for renoir
 platform.
Message-Id: <170267843699.316482.4350897389116089852.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 22:13:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Fri, 15 Dec 2023 18:32:42 +0530, Syed Saba Kareem wrote:
> Add pm ops for renoir platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: add pm ops support for renoir platform.
      commit: c95a2a0be0b1bba2e051faa105c2e0401fc2de33

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

