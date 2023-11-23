Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D59B3FB14
	for <linux-sound@vger.kernel.org>; Thu, 23 Nov 2023 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDd6yTtb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B372C433CA;
	Thu, 23 Nov 2023 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700758800;
	bh=saYxe/NoTX0miZmb5XKxxLdDu9x5vl+RmTWfCOD6DjM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PDd6yTtbeRsj6wOggVxLqAbMolmiQE6qQ8JQMjxsTnac9OnBXaBn5wL341k2RT5iW
	 MJwed2MKyls/spX4p0h0Qy09Zi4t8xmrAikNeHjzWYqUX2oFd/RWh3qB8YOzO1rFh6
	 e7cDyh90llt5V42LLzMzVkVM9UgccW2zQwk9ei/zeLmCAykMldI/MfY6tE4jtWAKLH
	 7ROICKqUWkOLgoUOsG/w+1glGUDQJcy3jn7OFhf1LBq3TGPEl0tnHmZR3jwypcliZL
	 5191BU3/KsCypMK/8YrOif/0LJ1KFG8YItDu84lMN7C/FKY0ghU84hrMggCeLmQ8iF
	 6xZz0V0uaO9zg==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231123091815.21933-1-johan+linaro@kernel.org>
References: <20231123091815.21933-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: soc-pcm: fix up bad merge
Message-Id: <170075879786.2448402.7389319315728304933.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 16:59:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Thu, 23 Nov 2023 10:18:15 +0100, Johan Hovold wrote:
> A recent change to address pops and clicks with codecs like WSA883X
> touched the same code paths as a fix for clearing DAI parameters and
> resulted in a bad merge.
> 
> Specifically, commit f0220575e65a ("ASoC: soc-dai: add flag to mute and
> unmute stream during trigger") made mute at stream close conditional,
> while commit 3efcb471f871 ("ASoC: soc-pcm.c: Make sure DAI parameters
> cleared if the DAI becomes inactive") moved that same mute call back to
> soc_pcm_hw_clean().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: fix up bad merge
      commit: 3841d8a563a7473ceb7415ecfe577e20b2a66d37

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

