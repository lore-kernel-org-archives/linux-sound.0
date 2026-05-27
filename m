Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D66B34B1A5;
	Wed, 27 May 2026 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884115; cv=none; b=sjUKzvRCnSqRnedojHNXhBT6LmKiOR3oxZDn3O3HfhccOhp1wxn0RqNN8Y6fdKQoQ252WWMAFkwRlAB1d0TZ/AGRIhln4TBhW5ameNbkP7TrI1swzfbfkOBvMpIMjV52VFTuWVo2Acnm0RBzhOc09V/betCiBE1Jk7Yf0hl3BPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884115; c=relaxed/simple;
	bh=GEJQ74VP+zDsUk4K7l8UoIfmlmd7AsGJBB8X3r9TPUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SeAtR82A3dMgskoI4uNj7e/SaJgsBK92fhccIh1ykm0NIl11eeu6dMvszsOibM72RzBbh6dzj9+MSubtlYDdNfh/hOiMnpo5G5fxWA1W+oP+7PCyvDrgqB8TFzbeNBiI1pEBg5uPhEx2HqIopMTecTKKE7nnVAp2sa1oY7rL6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R16+bl7p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R16+bl7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2471F000E9;
	Wed, 27 May 2026 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884113;
	bh=vA1rZLkXAAX0deJgLbaiD7Ggpc9NMMGcRExXvihSAhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R16+bl7pxvaUtXS6kBTKrtg1x7C4+06iji7wWiXYOQNX2KFsl5EGCz4rTSjCswlGI
	 iQZ+1xIVT0du9EO6mmReIUWw+aEBXeMAZfZgRjzmZfz/kG00Qw5XHy4ui4Xsj3c6kc
	 stEjZjzQJQdvYCUWBKFkzlbre4wamN/qFoDkemJFHn25RivVgBVqC2T8eWxgVv2yQW
	 fDxVU4HFWAhfsIZIxv/gvijH2BNZNuG28Zx+QIdcE1+/Si6lRStQDkr5NloCuXurVY
	 KZuAvxyBqi36fha73rLI5RQ5Z+v+UtyBUTSnsu2QRtSzuz5f1SXaJJokYHVH/83fq5
	 tt/DDYcz2dHug==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260519010413.629214-1-rosenp@gmail.com>
References: <20260519010413.629214-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: allocate i2s_path with priv
Message-Id: <177987681143.868420.277392491342387583.b4-ty@b4>
Date: Wed, 27 May 2026 11:13:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GEJQ74VP+zDsUk4K7l8UoIfmlmd7AsGJBB8X3r9TPUM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFuBPQmpnL9F7Di0mzPQARB0JONWViTPk/pM10
 T9kunVwRbuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahbgTwAKCRAk1otyXVSH
 0I3gB/sEVdabjNdhlOJyFPr0tlVBlRrpxxtpUlK8B7sUt0VoRA+3jXqFSJFNT62IwLG1MCUXcCP
 +YALgMzSqE7lwLe5OeWp6OZzxtcuLumzl5d3uoMmfsDy9voNWkyVq/L+1AOivbUFgNQwZSJTD72
 eDo+ZhkIi+UWIfnu4xAJhDKarQwtKRPVTSX5h4Kwwq7ptS66MtJx9iHZqbprTKVa+QvjkcRtinN
 Oygk4gRPqPNvGn+4RibqXpRTQZDIaY2RZ9tporOkIk3+YR2yqitLI46/BtKeAZLrILpcUtAYVaT
 rz3EWsamwXn2+ORk7JHfaAid09NuLVdkOVoWocujBWAJArxN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 18 May 2026 18:04:13 -0700, Rosen Penev wrote:
> ASoC: mediatek: mt2701: allocate i2s_path with priv

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt2701: allocate i2s_path with priv
      https://git.kernel.org/broonie/sound/c/344a4c96b292

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

