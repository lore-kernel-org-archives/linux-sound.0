Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AB623ED77
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206667; cv=none; b=c3UuMelbuZ2/IX1TL7in82uy/8oSezDgOaVv1m6sNCaCPzg/t2gEF3Rw2NnFA6fkVYTFc50DU/KI4aO5gEm0yUokxKl1Qc6xuHTyOZe+19Agho7ZZNZv2VjZcunnX4UZgy6qe4zRcOAKJzu/QQnC5fXK8JUPYEdYTmIEIzvjG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206667; c=relaxed/simple;
	bh=TIfDxlWL5qP6E0+LHkik8dG8u6aDsWqqrgSj09UW7Oo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NF2wv6UAZmMmMV0H0eUp/l0RCLAKqxR8v9C/KDLQwVAjb3UBYSm8QB11ROXdkxVWQXH6YdVklxCkV+aUrJwsXgJYXUdBVRa2xmLsZOaInNTTLOiRspDYlZbYru1+PuccfoaD3RFQ5duY14j851XQPOn1Ssr1ygTYkCcZ7I6WkFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPZ3ggMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPZ3ggMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9707C4CEEE;
	Mon, 17 Mar 2025 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742206667;
	bh=TIfDxlWL5qP6E0+LHkik8dG8u6aDsWqqrgSj09UW7Oo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qPZ3ggMMKatZXbCBPEuhMmdEzH0s6UmPy8OZcf49tzgmIpzIZfgZM6YVbMEBRyIpl
	 vW4HmnlrrqF3+JiaGq9nJjowvZp7kqUFJEgglBOAlAY2jb+YOjA2vzGse1YWapFqos
	 MKK8w3LYmWGi45BMXrbVq5b9ETDWdxrIcyc9es+f5E3Q+Z0lyZb8+12U6XCA0gcvNG
	 3xFjuJjQ02cqzWwR+zblM+O7jsXqwdQj3Nnp9gH3DHIYghH6Fs44o1Fe8J6sgBS+sS
	 /p93kWfDImmY14tThpKxlmwMZZYiFnX3iK8lKaJb4Yka4Ia7lbglyNEUqv4mnbViiz
	 +Qj+8mangP8cw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87plip7ie4.wl-kuninori.morimoto.gx@renesas.com>
References: <87plip7ie4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-pcm: tidyup function name to
 snd_soc_dpcm_be_can_xxx()
Message-Id: <174220666661.86423.12523454383150345111.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 10:17:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 10 Mar 2025 02:02:11 +0000, Kuninori Morimoto wrote:
> We have similar but different function names
> 
> 	snd_soc_dpcm_fe_can_xxx()
> 	snd_soc_dpcm_be_can_xxx()
> 	snd_soc_dpcm_can_be_xxx()
> 	             ~~~~~~
> Let's unified these to can_xx
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: tidyup function name to snd_soc_dpcm_be_can_xxx()
      commit: ede6445d5405edb418c05582d46d12687b632236

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

