Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DF68F5B;
	Mon, 26 Jan 2026 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769453153; cv=none; b=PvIQ067g9AKyLzYY3X8br5i9ccObeL0yIKyFJxtEwMWZfRt5mFrPiN6oPRLoqs4eOdo/ZWwmnLqrOdLGXbsQp891N+UqPcOE3hd7ei1mo7I6IpHAxP2owwEyYjoOhAFrQqpXfNLxEL1qm2/5As3BRevvMWE4J83mK0iKOBNHkN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769453153; c=relaxed/simple;
	bh=cDPA3m6EWcIme/d1ogFQWEer5VNfhYCQx6xZENRS77I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=leuOR2UuVoE5D4YNpd0aRPNoLG8J6ULYqWrt2h3y/5lDqjiUjsqW1RCKuJbGZBIebKigXoK2vLfWIKUdhNWtFmhKk9F9FiFAF8M0+kkLODBCcbhGCdEh7B/gVt9OhfKxMsC4D/ITY0b+bY5rQEi1qCjsJzymw8kfwKAeLddONB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6QXF4oj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6QXF4oj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CDEC116C6;
	Mon, 26 Jan 2026 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769453153;
	bh=cDPA3m6EWcIme/d1ogFQWEer5VNfhYCQx6xZENRS77I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L6QXF4ojg6ZOZNYEAO7mzPRDf92KOuocUoQIpQu0ocv+5jklyq3DMen9QzdcrFzxd
	 sboJCeA/VKocqD2OWA0XMUigC36yPyk461S7DtUraWREWbaJy5MtCBDH0m24sMGFJq
	 DpbzROztKzRrxGT2eknNjcwka7R4395ZbxTaWXdLRm1a3Yk3F7fIs5FFDuy5yXPYls
	 exN8ICN8HB1pQYwhNWkUWRnJRvONmEymxAZt+VqCD3hfh74LennShR0okaEQoBKZS6
	 3SUd/xqowiilZJC0DuZJZ5zM0jB7e6t0NIgFdLIkiXKQx5pjUMxH2/q6x3lJW6GZ4j
	 JwHUixhjwq9fg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, 
 kernel test robot <lkp@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20260123095524.490655-1-syed.sabakareem@amd.com>
References: <20260123095524.490655-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Fix Kconfig dependencies for
 SND_SOC_ACPI_AMD_SDCA_QUIRKS
Message-Id: <176945315041.769345.5081384237187461339.b4-ty@kernel.org>
Date: Mon, 26 Jan 2026 18:45:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 23 Jan 2026 15:25:04 +0530, Syed Saba Kareem wrote:
> Fix the following kconfig warning reported by the kernel test robot:
> 
>   kismet: WARNING: unmet direct dependencies detected for
>   SND_SOC_ACPI_AMD_SDCA_QUIRKS when selected by SND_SOC_ACPI_AMD_MATCH
>     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] &&
>                      ACPI [=y] && SND_SOC_SDCA [=n]
>     Selected by [y]:
>     - SND_SOC_ACPI_AMD_MATCH [=y] && SOUND [=y] && SND [=y] &&
>       SND_SOC [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix Kconfig dependencies for SND_SOC_ACPI_AMD_SDCA_QUIRKS
      commit: 10d366a846be648aa47cdcd3dc7b7346a4143a6c

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

