Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD6E2F1FE4;
	Mon, 15 Dec 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807113; cv=none; b=J9D2K1Hyn8UWTKLR3DyWOea6sGc5WcHNhNNlbnkSkISjddF94CSRdXdvOrRMfFE4mPCTP9HOgdFUkkDllHEpRHPeGFQU6fSaOEc0B2dbFMagVh93nMUMnq3reI6B753tywnVJCs8t2vZ4k/PIbNRNxf4xsxIv6Zvh1k61qv166A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807113; c=relaxed/simple;
	bh=ML3DCHK9+gPjUNdX2WFzJm1Svee+fA9XdYjg4gn1Sus=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WjpHTMLgAXGix0aIujw7pcG/HbQVLH3ZQ6WnH+OO/SY+rFPW3yc0pXTBgmoxWCsLksHL1+Y0yjX0KFKNNHV12pQKpYApw0Xz6g50A0CKE2lONk4M6NuUktOqYkdk3VHA3CPs9PWx0IH6kSK3y3a4HjcIutJcQ5HMJzbw8cRy5Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYmPmNzz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYmPmNzz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA84BC4CEFB;
	Mon, 15 Dec 2025 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807112;
	bh=ML3DCHK9+gPjUNdX2WFzJm1Svee+fA9XdYjg4gn1Sus=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iYmPmNzzGWWCJw5i7gpBagH2DQ7FsaZYb8qad096CgQtK8wKCdzzmuGXO3zkpVOCq
	 sC4pEvEyw2WsbMRMlTyMwca75Mnl0FkvH44YhrP2Cm7lgev/pQUN1IPfLDFxjDHK6N
	 mUQS/dcodjh+xDjstNrHEt1GHJiiHaJSPZEo0xNdnPis3Rh3D6aMVAiwNTypE3rRgG
	 xMjWwgrI/ZVxIxx8y2Xmz0qdp8vR3br/xCX/FAToX7e83fQxMZSKPUU2mvxtNLOqn1
	 ZhreorGpi8FuvDeFAdgq/P078KpDhvWrBFRCNRXkcj3o6vF9DARoP1I59hr9N+eu+0
	 UrWD127RaWAqA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
References: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] ASoC: amd/sdw: Fix confusing cleanup.h
Message-Id: <176580711005.161056.4453150666352677379.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:30 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 03 Dec 2025 17:12:37 +0100, Krzysztof Kozlowski wrote:
> cleanup.h coding style asks to avoid having constructors with redundant
> values (= NULL). On purpose, because it is just not making the code
> simpler. The constructor should be meaningful not just NULL.
> 
> If you do not agree in declaration-in-place-of-use (fair!), then do not
> use cleanup.h. If you want to use cleanup.h, then please read cleanup.h
> before.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp-sdw-legacy: Fix confusing cleanup.h syntax
      commit: 5a7e236925b417332a674a8488ef19da233a5764
[2/3] ASoC: amd: acp-sdw-sof: Fix confusing cleanup.h syntax
      commit: bafd5cf04b2822bf3c865add7262d86e22b9588e
[3/3] ASoC: SDCA: functions: Fix confusing cleanup.h syntax
      commit: e39011184f23de3d04ca8e80b4df76c9047b4026

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

