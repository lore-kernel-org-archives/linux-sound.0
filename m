Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF192EC083;
	Thu, 18 Jun 2026 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787141; cv=none; b=q7/g2692hyh2eOrMGA7Ed+9dKTYBr9xDl81kJCP1J9uUyfRBC4+6/++UGFsWCnTgHjJuEC7viep0KwBedJMS9mT3CgiBdpyYyQc9X0d7p/wknwArQZRgIg3bJDYmVSQDiar5qU3ZH14Xw62MgefQyBacprZfQy6g82NFHPn2qPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787141; c=relaxed/simple;
	bh=5dwo2XrqeVLORSUE1lwRd6yNZITVOczsLi9vIE3RgdU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RU72dOIQH2aJywygWI2/ZUSR5NH4ogYNGjrYHdxlkPakPKttt3LZuKCMaZixKDsfBXtlexh1z7Ylw8lf1oSmvDbqB72ihA8WZzk/xII5zUo4rwlPIKelU8P4OStrb1Gw+ToHWUGqNl9GLDmHUImqz3rSg3XZUX1ILGvKHEV2VjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJuMtccO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJuMtccO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A67C1F00A3D;
	Thu, 18 Jun 2026 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781787140;
	bh=L+sZTuqfAwZOvcHkddEpZ2hQIeARdrjBTwFIa3TnH4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QJuMtccOvtTNhNy4ODHt796eaLXGIqqNI+marKFA2Y68RH49mxSJ6Qp3LLMeWvpA7
	 7rhuBdSJwOd+Oarwz8U7s73cCMhSY0Egz1BIxE4hcvlXYuHpjMaTIPf+34ZvWreuyt
	 iQtzRD9HUjRzQw0SXQK0IqxlIgxpxn30RWy5OMWWHGMFbCSApvSEVAfqtevhvRJYj0
	 FRCLlTv77nVKmx3pDPV9sUicVg828RE3qUOoaaP8T22r0+2q6cx4pUqm0wHuirGr18
	 sooykekHs1U1rDl9xrEAK1iqWbM9HaViAH7hhWXJVPX3CW7SJhg2LqeRGEurr/A3iU
	 Rg72rnATGbq2Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: bui duc phuc <phucduc.bui@gmail.com>, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20260617-sai-revert-v1-1-e46adda2213b@collabora.com>
References: <20260617-sai-revert-v1-1-e46adda2213b@collabora.com>
Subject: Re: [PATCH] Revert "ASoC: rockchip: rockchip_sai: Use guard() for
 spin locks"
Message-Id: <178170382923.38451.6156134773470813531.b4-ty@b4>
Date: Wed, 17 Jun 2026 14:43:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5dwo2XrqeVLORSUE1lwRd6yNZITVOczsLi9vIE3RgdU=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhizjV4x857jfRDss/Ki4/oiiVfyyI4xbXvw039x12jpg6
 57stvPfOxmNWRgYuRhkxRRZ1j7LWJUeLrF1/qP5r2AGsTKBTGHg4hSAiaQ3sv93uKJ7O7bFj4FH
 vKElisvm3LuW1/7dZsadbOveHUt85RSjwjMlnzlu0V1ezq0ys/brLWU+F5sWEKbS7lS5bN+flaK
 uHx96ML5Jz5ndEzNztdNte2EJfz83K+6K0jPbudQi1E4dkNu1XDWt0V/v/B4D3rcMzo8P26iGcl
 vY+sxPD+dXusB2UdXsmk6bmeqDzOn/HwW/OnN0ZUubwtvFvE/ZZmmq8Or/n679cNbqCz/tzm1w/
 d1R3Pr5n8KqlpiMRNH7bIHTt3seruMN1puVfVum4rt2u9E9piWqhavKNE3j3Np/zE53Xmc8N7ni
 unKR7mQNrT+Bm2oPcQSz3JxjxN9wxlOc02/Fo98mqi2KAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 17 Jun 2026 13:46:04 +0200, Nicolas Frattaroli wrote:
> Revert "ASoC: rockchip: rockchip_sai: Use guard() for spin locks"

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] Revert "ASoC: rockchip: rockchip_sai: Use guard() for spin locks"
      https://git.kernel.org/broonie/sound/c/1a3c8e289597

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

