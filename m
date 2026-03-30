Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC913BBA1E;
	Mon, 30 Mar 2026 22:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910566; cv=none; b=U2oxUc9JxCWzDJ+0fivwcqToqk+AZ70KFtV4Mi3c2kfnzW/nFg0fZUJSB1RGbPSTlQuaHvaYhF7+fT3rTg7/QCDI9+HIVs5Vijrn2BeIhSYTSU8NvR3unEMtdaiaUVg60BaKqTWNAt9Q3Y+Mo4GHsms6wTkHFFYO25oAlzEOMjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910566; c=relaxed/simple;
	bh=juJpPxmtkv0eu3M+DVZqVdqtzbc8pL0zlNLAUEZDw5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nLVqWbHcH+M9C/bVVK52i3s57BMSVAuZCd58nBeoXEKX1RWAZ7B428j8zZoYcF+PpEjFS2qrHEwgcH429XU1nk8tz+KHnzmBPt2sgrfcMIb2TTYY/txtruw6NVrGMmwnb/Oete4BLz6CUyB/n6LPffvf+TFiuJfbK3F823STYi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFxcFIKd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFxcFIKd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60098C4CEF7;
	Mon, 30 Mar 2026 22:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910565;
	bh=juJpPxmtkv0eu3M+DVZqVdqtzbc8pL0zlNLAUEZDw5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qFxcFIKdJ+y3kX+fTCClLLVKXIxcFoXQ/ahvN5GTYdKLCpIKtZ+lS1tP/HK1FNMiL
	 2ow2jvv5R321RK3oDLjfC2X/rb5qCD+yWHyr4xjEM2k7r+hNwq2YQ+Fj4Ynme7297X
	 4I7lwz1gDwd+caeq2fkjEfx84ZphXApTh9DU0+oM2683NxaaoPDclSdavt24KVn5ek
	 5Qqec9HPoXLkycRDVESuKFGlAFydAeUKO4nsHPfYMfM9dLtuGC/5Gxj7ene/89tO1a
	 4pTBsVyYeRDTs+X5v9zLm2e2CIGbZqx1K6Y45MNk2JMsE2b5QBRcfxH9P3MdpIbT0a
	 Jz15y3vGp5HnA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Weidong Wang <wangweidong.a@awinic.com>, 
 Marco Crivellari <marco.crivellari@suse.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Chen Ni <nichen@iscas.ac.cn>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260329163152.366356-2-thorsten.blum@linux.dev>
References: <20260329163152.366356-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: codecs: inline i2c_check_functionality checks
Message-Id: <177487958998.160295.8397488474598317740.b4-ty@b4>
Date: Mon, 30 Mar 2026 15:06:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=juJpPxmtkv0eu3M+DVZqVdqtzbc8pL0zlNLAUEZDw5o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxh39WOCCtva4FGlAfkAtQhAOpqcHKkZOkhZ
 i5+CtGTxNiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8YQAKCRAk1otyXVSH
 0KJ/B/9f2SLXwh9ouwuKAWA/GX87sh3vtbgY8zuTW+Gi71cPNatT7rQf0Kn+JCvZooDeGtYSTNU
 0VNL20uWxcHE3zu+fYg/jqFJN2tNJvY8WKwnsQG5+ICbLbC1xCAuCJFGBD8OXhqa8cbADBwnz5O
 XSMudkXGYcPojKcgTseJ11OUjGr7dvGuEjkIERYYIhUx0e5pQAmmoKKYy+qQHHreL/giS+FGn+w
 mahFzw9JYj6qE84Cn+pvTZVFbvthxLAzI4IHJdnHawuwmskA1cGk2QJuj/3QyxHgsUU/BttglSv
 hzuWqY/CeTYo+DkpTtJySd/6sXszLqt8hlVCkKrtofXzSvq1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 29 Mar 2026 18:31:46 +0200, Thorsten Blum wrote:
> ASoC: codecs: inline i2c_check_functionality checks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: inline i2c_check_functionality checks
      https://git.kernel.org/broonie/sound/c/1e28cdeec313

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

