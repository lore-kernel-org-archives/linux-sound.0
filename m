Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89380334C1D;
	Wed, 25 Mar 2026 18:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463486; cv=none; b=hHmNPMoUIK7z0D7y9Tqgbxptz0E+D4H+iOIqqQJZ7ZxNHvOsb+uRrAIO2vvsqFk9+Vf0uTxyf0Fa52d5B2FrTBH8aVCUAEcUy0BW3S4+QvzpHcPE1vh28+8aQ1CYOUXt9zbcfAYqjJgWAcdYYiuwJUXMxBux0/5YQaCxE9Wvmds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463486; c=relaxed/simple;
	bh=kybuw/joKD3Ujs6Axg2qmrSATtAdTyhGHj9Zud71BTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rtp9nRlaK7bgKUcnf0bDJD5IPnNlVR85xBoN7/lIDe0b71Ijm6ykk+mSv66s/FacQkmCSMnTU7J/H2UXDWVZ5+/HZmOU04XNkOwV4QneZ+2cdhrPIsl7vp0gbWDN+nmaMKhI/+C+y0Ooe6efPfbZAUeycuuyjPIjjl+1zaRVVMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCWdD2ie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCWdD2ie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68488C19423;
	Wed, 25 Mar 2026 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774463486;
	bh=kybuw/joKD3Ujs6Axg2qmrSATtAdTyhGHj9Zud71BTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UCWdD2ieMESxwqobselJDEiSkmK4r90l/iKwsD6wVPLnjZZeCsMBKvRGGHeuSpSrO
	 B3TwSe60QQp+GIkNVMyj9cO9skGUO4juLyAYab3sBqvwUA8jkiU5WtkFaBgPoSYCaV
	 L5D+ZjJdvtKKkO4VysrNwz5VavWa/bNpRDpZY5EPk5jaG5XB7/HOpv9D2BQx5bFl6o
	 oHVm5V35QMwQ5njZcQ+61uFPnJd41Sp4dveKGAEw15uSBixfIqaXpTtth8Y5Ezcg/v
	 XVn/d7WzDaipg6MW1dllLvQJtnTpiQZKgHE1KBM9YAobudmIHikoE3L6iAGV/01qqE
	 6cBe5A8U/gjJQ==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260324135508.839142-1-festevam@gmail.com>
References: <20260324135508.839142-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: Convert
 rockchip-max98090.txt to yaml
Message-Id: <177445778598.74886.17433530132719817153.b4-ty@b4>
Date: Wed, 25 Mar 2026 16:56:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kybuw/joKD3Ujs6Axg2qmrSATtAdTyhGHj9Zud71BTk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxCn73hYijmsJEGiZYuGXud9H5IrGaTRCmihMe
 DeHsGqUqtOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacQp+wAKCRAk1otyXVSH
 0PWIB/9yF/67uvMKywglQaTIZPmNot/J+5Xu/VQH++wGoOMiSxn3iNo3aWmoHlH+iShN2xmQigJ
 xJY07gwAQL6Woo7xvrbXp5HwyDxVkPrnH/p6nVDgkrlrdzh/F1qN4gCuSvVrP8QyvsebVTJS0u7
 ELgYuXXmE9Wbc1PQMSUiRGxSKqmROzBEqRFYoZr14uk8QSg1vCaVauh5gCzHvk4/zquJAVZ+FZn
 B10E/XeJsfTygsVetzuNnfxg9QW/Y1wDWyNzbH+/CVl3dKR2rk19EZ2jJqdEf0zN3WtKwjRA/b+
 TdgQ2aQpOBzn+bngvc+rgXh4qlPkB9Xso1grQOe6VELp/AId
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 10:55:08 -0300, Fabio Estevam wrote:
> ASoC: dt-bindings: rockchip: Convert rockchip-max98090.txt to yaml

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: dt-bindings: rockchip: Convert rockchip-max98090.txt to yaml
      https://git.kernel.org/broonie/sound/c/c9b48a451ca8

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

