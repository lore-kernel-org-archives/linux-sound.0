Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A23ED13C;
	Mon, 30 Mar 2026 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910556; cv=none; b=FkueLzlV5macH1DeFha5VKWgt8fxhgDzZ868rvozSqynRRHXxxtp0xOa/YtWb8LvD1ZDktGGj0dp7RjpUe+UE30pwhGBHhtR4dNBwFqyr2dG4gpqHiVozjB/gtJxMfomJRmqumxq2PMVUbZhTMhlg17ukvqsR1l5KZQUSUqosys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910556; c=relaxed/simple;
	bh=Xwb5eI86ZmzyTZCtUjB7uPnWziscQNuwVT1NKXjXvRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PJRjaBwysCT1QTnAcorfsf5yZZQgX895M09848RLA1CrpZ2BWaL9wKwX45TBvaBvZIILu1yL4p8U5oULjbb4C+cfg6vXs94s+JGlglxAL4F0GYncfcsC5CtRHsOPtkpAOe3b862XFcqQpSkNPWFchuDluwluhocL0dAVErZWLJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSBeVMNi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSBeVMNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EA0C2BCB1;
	Mon, 30 Mar 2026 22:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910556;
	bh=Xwb5eI86ZmzyTZCtUjB7uPnWziscQNuwVT1NKXjXvRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KSBeVMNiuXlrkSipExnceKWzkDyB35GkSukPXUIaqc9FGPvhDc+zn15rFTUT0tqeE
	 KuFYtpRlKSqQuipT919ctnWOM1NzRc6/oPX3XwJcMCDcfi/pxvipCsg4T9CtCv1N4M
	 jjAPvvfturBnRBWAA+BE5CTJ0nCy6BJT60C03NftfELEC/3ElvPIMQiGIE+QXnyHPd
	 O1AZ/pDxHAdR1rOcM4/EZ7fSDvb1HtSTgBgOkBW0uyP2HyjDDLdbHG5ywS/Y10o8CZ
	 ChzuKxGwi4LW+LugRLxohYqMJUKAi7A4OigkH36OiWM5a/3k63DlY7Atw1NB+2Fsjp
	 iGX2DyQfILxfQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260327-asoc-generic-fallback-dai-name-rebind-v3-1-c206e44f40c8@gmail.com>
References: <20260327-asoc-generic-fallback-dai-name-rebind-v3-1-c206e44f40c8@gmail.com>
Subject: Re: [PATCH v3] ASoC: generic: keep fallback dai_name stable across
 rebind
Message-Id: <177489785235.241608.10447132984613194111.b4-ty@b4>
Date: Mon, 30 Mar 2026 20:10:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Xwb5eI86ZmzyTZCtUjB7uPnWziscQNuwVT1NKXjXvRU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxZcF5+Hbk+iRf12cFs1tc7N1CBIZAz07t2r
 YiMlCI4LJGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8WQAKCRAk1otyXVSH
 0HMuCACGHH/pfoC7BWrI9mdjeVZiKE3y/XqPmo2XII/yVnk7TD3H5whipoZn2A3AAbl+Rcs0VZb
 gvocWo0gBDZrElzOQ3Kr1qfA8DghJxO+OZdpbiwALU3+1aXBh4QY7pTmwWCoOlGydegUb80LWWC
 p4ks0mjt4lx+TqKm206y3tA2n3O4ECbDTc4b7PolVOA2idfPZAwZMbicPYE6Yi7BoxfzH103vXJ
 yFHGx3qTpEDjhHCg6AhH/nzoZUWPMjQt8jRsUhogjLN1w313QKiJIdEIKvQ6MFrefFZaovwIOfL
 M8HLZ752U6FD9ENLGqn5yjufj+ELSkIw5sMTG2rHfE8qJuM9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Mar 2026 14:16:27 -0300, Cássio Gabriel wrote:
> ASoC: generic: keep fallback dai_name stable across rebind

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: generic: keep fallback dai_name stable across rebind
      https://git.kernel.org/broonie/sound/c/aa173b70d372

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

