Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB913D3309;
	Fri, 22 May 2026 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445415; cv=none; b=tpiYUJqFqQ/iPXihatZvkRjBbaubDt5NmAwmJ67T+Ibsuo0IVB+yvynJfNV++o/Zbn/yDVvMvoLCuCoXpe6tTlIWv2jSb8MP6rpUrTy2io9fnvQgC6UPWxfcEo85m52XCkzK8YKvJVmhoFkOP7U43fAIGnaRH2Tg0WdiRdf2OuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445415; c=relaxed/simple;
	bh=3n/zPGNiIU+3F7QFGbHNhcSkoZnpWbIJZdkFviIv3JQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VEPlzjZKaMUvMr7xO9WOgJtfIO20JolPMuPTL73OXNDkESwBxIUaOH9X75dlX9Emwws9tjnNhUMASX8mf2p3W4yWxwcXXUWd/DxUjZce3LjKDB4N5eBc6lBEraDVdX/9S5z4C/GXDO0cJOKHaDFqky2xTQ1ABsO58t3S/zz2hdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoozvYD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoozvYD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917891F00A3E;
	Fri, 22 May 2026 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445412;
	bh=PEZF5ook3XLBsld1/8EaTEV4SIyENtqZyFshEpjD9A4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YoozvYD44r3Oq7LSyCGMXv0VuEXu30XZDAfkajRnjDBAWJxptL363OyHuuk/BPLKf
	 LWhBBidKfsfIBLu1CUiGjc6I/znViQsBmMr9ZnTIB0V4EUG+4S4pXaCzcrNvycPThO
	 +RXANURX4zQRBan8pvJaSAwTJvVj+lg/QQXpX5mRXXvtCphbJEMmkcxjfA+F8SJ/iN
	 Ks++dA3pj7FRowbqjI7q0S1qhXlOoToO3IupgkVoGYrTHVnQTqbrpfwPOpbbl8Gojr
	 CW3LFdGFGMWQ6xq622AhUasUuedAa8Wrlvon35ON9LFkTGxK+AYrWu+l3Sqby4pUFi
	 8Rir7Zt7SDbhQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260521123057.988732-1-rf@opensource.cirrus.com>
References: <20260521123057.988732-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix flushing of IRQ work in
 cs35l56_sdw_remove()
Message-Id: <177936923931.58022.233587039854097901.b4-ty@b4>
Date: Thu, 21 May 2026 14:13:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3n/zPGNiIU+3F7QFGbHNhcSkoZnpWbIJZdkFviIv3JQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6iuDrGC8qgEygkXDsP2luNs1uiFL/SS3e6A
 YsV7Lg27oqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuogAKCRAk1otyXVSH
 0EPxB/93U3xiaea+hBiQmJAc1EZU6o0vNpCAwrZvjhpV8MmQMA69D2rl34Frejppcxxy+dWdHD+
 LhVTYbviIg0FmsBC0gZKlT5XIkejnVzw8SVqsGS0evv+GXqQPhDF7LPcesZF3XN7E9cEZn5EtxO
 lFYnQcMLgFu+moLTo7tBmIkSjXz5OaZWU2ByUfIVPDOpI90pfXyuc3rDiaH4OcdTDWujqwqhXpw
 8v0z6nxLjZsJ9ailcIJ7dCsUgQtVsq7NUbvCBwixEuVRpX46Dbv47+zuquZJp8Xq9GmJXlYpx8L
 MzpUPOXsKDXR2i8NmJ8pv9mp+QiCU2Cc+uRNJs2C2LiSdUI8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 21 May 2026 13:30:57 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix flushing of IRQ work in cs35l56_sdw_remove()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: cs35l56: Fix flushing of IRQ work in cs35l56_sdw_remove()
      https://git.kernel.org/broonie/sound/c/18e7bd9f2446

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

