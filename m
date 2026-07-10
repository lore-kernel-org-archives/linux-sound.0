Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1DD42E013
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 22:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722068; cv=none; b=kJuSupcDqGZRBc9S5LUriT/EVbU8Rzm0g7KqAVlbpOf3oDfy5RBa8t5kW8EkPLMVbXu1azafZKkn6nCPqwbo63bDFf0wMllvByzn+Er8AsWmZdugKOdrGu/ng8VJvOIwW30X5cvJh7x7sX/fKJPMJjTi3ru/NUBpxyv7EcTcVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722068; c=relaxed/simple;
	bh=WIwOMoGwmq01dj5LCqqvRmeJL4YIm+Bp4r9G9OI7Jes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mgpQ9uvqQjqQ0lGkxVZygm3S7l/CPC+6u0Eh5FQ6OFuD4ACQYS41xO+UM7LyJwcoITg+d/NOuWHWRuCdvf8DCl3wg4V+nii4MS3N3Y8S+i5E5QgBo0ZLM36PnLPA/U+Rkuz/BqSDynksdkPU8T9uhXDI0sYPCUVg51Vf14zIXW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEGMuMc6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEGMuMc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D289A1F000E9;
	Fri, 10 Jul 2026 22:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722067;
	bh=pXSsqutKxIlltsEWMmHrst/OPUV0uHIpbj+QGI2gqtI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QEGMuMc6OulrCY9FE5CHAzyr2q6boMSzrB5hxvn0bJdhFRwvOiseVOKHzMa9iyD+n
	 xubQJeFm2GGejpVAQCoDMC9SR0IKqenTnnxcjIUiRgpdYgKM0DcO9gT37EZqtUKJcS
	 369Kz/oVDOLJvM8KsbHI3x4JGfF71XSwBHMU/LBJRYzDZ01if7rURsyHiltnMbNY9c
	 joUD1v/0OCFLicnRGYJfdhvw/ERgmjVS+sA8wh46ZhVNNxLFqq1E2+IKebnFdzgahk
	 UHuDMdNi1yWFAq/HJpC3TvdMq/i6H+GEiXyqXYpRH1R0q/zpOIRlST93/3FQCzpFn+
	 gdnOP+ibm7keg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH v2 00/12] ASoC: cleanup
 simple-card/audio-graph-card1/2
Message-Id: <178369970867.82617.3209701482093583575.b4-ty@b4>
Date: Fri, 10 Jul 2026 17:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2675; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WIwOMoGwmq01dj5LCqqvRmeJL4YIm+Bp4r9G9OI7Jes=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUXBR52cdRw8T+xdvhWlDBI634ynPjF0KhAuYg
 yoOO+1D4aeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalFwUQAKCRAk1otyXVSH
 0GnsB/9yMj/2/jE0zkhXex3rzkDB3TYQ11pv9zRwXnw53H6S1mJZxc+J8uRu4BSdk5cwsqQeP/3
 SZgjGwzLm4qjoNRqhdav3/Q3Qk1HYOpX6cadcn8PVoZLI8zHoHDuPe1DUu5pmX66c8/eh9IahOP
 3hO+YlcNbgsYh17ncF/39jE0O9kGOPoM9mgCOyaxkqHX4Qmdq0UmztFXOvrtYk/dCdsfAu1sJgO
 0Sa1CRpp7pDSzaWB1n2oLBetK4pDOnE8wPZRzs6NHFpAkap+4zOIX+FxzTJLsZyDo/cUUnHK9Hl
 Eou/meQ2V3pP64DVzbhNty1KBnwsVAWRIpMtCJG32bDUlZqH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 02 Jul 2026 01:44:18 +0000, Kuninori Morimoto wrote:
> ASoC: cleanup simple-card/audio-graph-card1/2
> 
> Hi Mark
> 
> This is v2 patch-set.
> 
> Simple Card has removed platform data support.
> We can cleanup and more sync Simple-Card/Audio-Graph-Card/Audio-Graph-Card2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/12] ASoC: simple-card: move simple_parse_of()
        https://git.kernel.org/broonie/sound/c/dd79f1926436
[02/12] ASoC: simple-card: merge extra method into simple_parse_of()
        https://git.kernel.org/broonie/sound/c/7f20b9b05b3a
[03/12] ASoC: audio-graph-card2: Tidyup audio_graph2_parse_of() around error
        https://git.kernel.org/broonie/sound/c/aa7fe27fda32
[04/12] ASoC: audio-graph-card: Tidyup audio_graph_parse_of() around error
        https://git.kernel.org/broonie/sound/c/30bb98d530d0
[05/12] ASoC: simple_card_utils: add simple_util_parse_property()
        https://git.kernel.org/broonie/sound/c/7ad9d917e251
[07/12] ASoC: simple_card_utils: add simple_util_parse_aux_devs()
        https://git.kernel.org/broonie/sound/c/d0ab37b02826
[08/12] ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
        https://git.kernel.org/broonie/sound/c/27ecf4da5ad3
[09/12] ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()
        https://git.kernel.org/broonie/sound/c/b8081307f5c9
[10/12] ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()
        https://git.kernel.org/broonie/sound/c/fa6222d5e121
[11/12] ASoC: simple-card-utils: tidyup simple_util_init_aux_jacks()
        https://git.kernel.org/broonie/sound/c/279bfbb150ae
[12/12] ASoC: simple-card-utils: tidyup simple_util_clean_reference()
        https://git.kernel.org/broonie/sound/c/6f5c4f6ffa8b

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

