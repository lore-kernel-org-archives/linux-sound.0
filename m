Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B0331A4C
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463494; cv=none; b=q9BssWu+/gfREHgr7BDSHl3/nTCEzGMrWC1YeGdZHq42PjrJ47h4anLKusURhYSTxDEj14WllkX73incC7UpXGWiWYfh5ubla9JZkmcah4POX42sAacRD653KHOuUJPp7UaCJPy+8zT5f8xPdakFuX57Pnw0Ku5FZFNLEjI7GWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463494; c=relaxed/simple;
	bh=STwlmc2a7dIx8DhrnVtgIMmVgtYG33k15Bih8ujzrvE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UwY5KtAtYkwK4j33wASChKSzkPByOwaDkSseAxgFTIYscrNbKWxL94JSL02EtvaeFp21CILZ4NrEWjBrEW3ZGwRt+erV3hCKTna1hYuRQ6mjRwQpB3UAyv+AfaiIng7bAqn1J19HRVbMkceZdlg2sWKzrrzyqv3aa25wlljBglE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGPBhepe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGPBhepe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA76C4CEF7;
	Wed, 25 Mar 2026 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774463493;
	bh=STwlmc2a7dIx8DhrnVtgIMmVgtYG33k15Bih8ujzrvE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DGPBhepek/4Sf7gUYDsX6Gf5snt/LDj2jBSObrTqNgxVG44HLxqdHI/01Wos/SBPU
	 KPFKzGaDa4/Ooewb5WKXSuxk141MYNkDNo0bdXk2+T7SEReSTZXWO/eRrHn10hHlGF
	 w/RI4YoVcubDxthYX1cIt2Bs1eTRNNrlPKHDXlztwxC1Y2Rh4RYYREVYAYU03U28Cl
	 aF8lhD9weMUz9is/bXioI/1OmZ3nXvp9ki05mhND2fagJb9FcHpS64tLjbnf23GaWq
	 JIRpC1YPRj8yyOk5ZWaeL6Xq4GFuhTBHlaLqJ/biydwM+uXuOG1uRqsEgdQbmZvYCb
	 cOkuVLH8zyoIA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20260325092017.3221640-1-shumingf@realtek.com>
References: <20260325092017.3221640-1-shumingf@realtek.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: SDCA: remove the max count of
 initialization table
Message-Id: <177444136746.45137.10370534770434144154.b4-ty@b4>
Date: Wed, 25 Mar 2026 12:22:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=STwlmc2a7dIx8DhrnVtgIMmVgtYG33k15Bih8ujzrvE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxCoDE+JicC30SOYvJZPRVkAi9n2KqOwY0sqb2
 RX51utJ0N6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacQqAwAKCRAk1otyXVSH
 0DzkB/4gXKsaJv50E/BahlrqOZYTGmKicaCDm+D4zY88A7QZ3Yee94V16LgCA1sLErir/PpvCsP
 ljjw7pvRlHSvfAmlxDt8IhY99yh04uFkKR1vr0EJkVmewxekgz5BnwDm0BC/Dqn4ZwrwHyPpOgb
 RirFQNp+lwIyykOhKGhGmfkl2uKfHosuRYBvGsue6ACVhW9GK3l6XnD6FJgQAVZmYoQoVGOF0SK
 8x8tq8qcb8nNKWsfywxhNejPsyimDWlGbnRAc7MyNcL/D+gtmMIku+cTXeFTy07iwDNWAIWLSnv
 Dxe4gmxxUWoOjLmvRyU2cbAY340ovmOHGPw99/lUkRKQtmQ7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Mar 2026 17:20:17 +0800, shumingf@realtek.com wrote:
> ASoC: SDCA: remove the max count of initialization table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/2] ASoC: SDCA: remove the max count of initialization table
      https://git.kernel.org/broonie/sound/c/c991ca323841

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

