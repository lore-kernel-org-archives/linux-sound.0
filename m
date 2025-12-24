Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E10819309C;
	Wed, 24 Dec 2025 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766587517; cv=none; b=E94BFEZ1MIr8TPA9knvo3gQpzWE5pBR0kGr8jpBe6PtN0pOq8v5rk4nOnsudsPcfjUQpjhBrhKJmO35HrZSzEPUkEv2RaPpZxOJQqbBFthynAtRe0QWWlr92MCW8pfvtB/1KnJqzG4b8Rmto88/gQpHSlJMw78ep1jhNKPJ2fCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766587517; c=relaxed/simple;
	bh=rfxLTt+KbcbfPgQmhYtkYwblurR4T+Sm1YIYXbzGoRM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mEeniQM9er6fbC6HypJtJ3+P1wwQljbEnBi8JIJROGw43YFQ1f3MEdah1cbjqY1FuZ5VvYWbmqKiBOyIICa6cHRDmCFSMZrTTV5ntWAwLivv3DEi1RkrvpCPACTf9uoaqCKWTWuEbnEU7kMTz7au+3MI0MEutwtbBgf4OKc95XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsinM5Ct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsinM5Ct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3C5C4CEF7;
	Wed, 24 Dec 2025 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766587517;
	bh=rfxLTt+KbcbfPgQmhYtkYwblurR4T+Sm1YIYXbzGoRM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OsinM5CtXBdKXy1ViXr7u3/X4whDypYohhDZnIYMzhjmd9qXp6xqARgSo97vI9Jxn
	 JeVu9nyT21wj8whls+1JQIs/zSX2UvDtIPmMj5uCiIxAsdanvNbnnMxbgymI4lezma
	 VbkI892hAc0MQgTaltotX1T5B7wZePyoNXsDifRgRnHkedy6crhCFYasbeGbJUk+kw
	 e29XT9dAUeMc4UdcBJTOp90YZg6b0g/heaghrDNfRnGgLL8ut9paSPwBEjAI5EiVdU
	 Y7fL6CVncOe0PkY4fs5DA2Bb/LcIaE+jYf+6siviENlPya9+Kgaqid/Qz0Ia9JBfvy
	 Fhys8Q25EjAcw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shuming Fan <shumingf@realtek.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251223215259.677762-1-arnd@kernel.org>
References: <20251223215259.677762-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: rt1320: fix 32-bit link failure
Message-Id: <176658751288.454157.5259232304769892441.b4-ty@kernel.org>
Date: Wed, 24 Dec 2025 14:45:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 23 Dec 2025 22:52:53 +0100, Arnd Bergmann wrote:
> A plain 64-bit division causes a link failure in some configurations:
> 
> ERROR: modpost: "__aeabi_uldivmod" [sound/soc/codecs/snd-soc-rt1320-sdw.ko] undefined!
> 
> Since this divides by a constant, using the div_u64() macro ends up
> turning this into an efficient multiply/shift operation where possible.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: fix 32-bit link failure
      commit: 836ecc740ca829040d86a5371f1fcb276110df84

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

