Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A06919309C;
	Wed, 24 Dec 2025 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766587521; cv=none; b=u1l/rb2fxGeYaqMNsJQ+jsJE7xpBazAFrdAu8CoPehsLmV1YQWdaaWhG6dLvatBFowgVcWh6IDpbEaEVooA6Ic/DwB3bytdXuUq59eIxBHK0E5Hqs5wmKhG6Q6qvILM6JueExngUDFTEARwMU6gnRzn+Rr1N3geZl6cTWWIFsnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766587521; c=relaxed/simple;
	bh=cCl4ociJEv9lrGUSdHJWnnyqz66+jXh46wVCjbxaEQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t28/BWm4vDZyxoV17y7nG+EsF9t4LrzBskWPOz+GNO7I0Su4tMAKLOuVDm+dv/QNO33kirqdVMCsLM5q+xZ9eH1H+1Q5fLRB/nRL7j9RWRCZMbgQWt3i56pSxk2227g4JpfDSuPD8RKV/D74hzaFxAahyM9uiVQjeehdQV5OT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfDt5MCY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfDt5MCY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6461C116D0;
	Wed, 24 Dec 2025 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766587520;
	bh=cCl4ociJEv9lrGUSdHJWnnyqz66+jXh46wVCjbxaEQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rfDt5MCYaaNp4s/LQex6zSsAvYqGAdadTIE6MBAxxgo9tUUXWg8VZwKvbAzqjIq3H
	 7BEnB6xqdOnMWsg2lAH+nY0QFhoXMqWrAfFTfv8jG3xNEDtlBlWQKTSW3sBKLLqlNU
	 2kr02Me7is4K03XzuejtOD28S+vl4Pc7+FqHUGZM3kYWlk8svx7m5hdquqItX5NX9a
	 09LBse7t3jHGCSepzfnHo5PFSXEEZHE2BRGe1K0R8qx8pMn4XY82HuyWbe5REgfGIc
	 Wl6GR6kEDG0vTS3gbqKSO4Zp9G7rzCU2ab5cgTPWuQeXsKUml+0CJQQI6Rgmb0zn+z
	 MDqPsVM6JjQeQ==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shuming Fan <shumingf@realtek.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251223215322.694265-1-arnd@kernel.org>
References: <20251223215322.694265-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: rt1320: fix size_t format string
Message-Id: <176658751581.454157.863314342971629409.b4-ty@kernel.org>
Date: Wed, 24 Dec 2025 14:45:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 23 Dec 2025 22:53:19 +0100, Arnd Bergmann wrote:
> Printing a size_t portably requires the use of %z instead of %l:
> 
> sound/soc/codecs/rt1320-sdw.c:1494:30: error: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
>  1494 |                 dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: fix size_t format string
      commit: 284853affe73fe1ca9786bd52b934eb9d420a942

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

