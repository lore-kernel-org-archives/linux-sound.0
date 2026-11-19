Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177147;
	b=abHGpcBDQ0xN+Erqw/6jDjQlh2Id/BuAIWOytu/HtELFbeJakzHVjldVHbrHcVZKZkE6
	 xeZfSAAJUWzVhnjrzk/t98226UGq7FLVeQcSV9Vh6bWrqHaD9yDGpqYrpR3q/wuRFVPkm
	 exqQqnmQcL1f9DOBibZECmkkZ1yQakTPxIh5czgiF8sbVi4t7KD+kuMrR6N84S7QENpSh
	 TYb/BMmdR5HlVZ/sIEtUuDKdAQt607bxjxGsit0+PTvxCkMWHUdrVpKpsyRePoqaZIj2I
	 dLq08jPH4choMFRwnVVcKpFThZbr/sNtQXA17XNRtZvpLLO/jyagfU/Wom0MplYAAlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177147;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0kz6yzz7Q+evsBBzjVzgSzgxNxIGaxMZkVkvqz3Lm9w=;
	b=2rbch5eLfwEzNIdZymEqPDB0ND3Qnw0Y4x2PhuQ3N1FTbYSG2096s6Dl3Q+71JaVqjs7
	 GFH+j3cGQ9IzOtFU6ycOLMvRbSLH78hFIQF/JKYpKXStDkO/Q2X/HjdHWKP38UjLVLh7v
	 Nv+s0+RWKNdMJTuBBomztsyZxILBGxYLii3/I6fzjbfLJ9XMqSH5CnJzKgd5KwDDHgVxx
	 AEbukolwf/hmZ9zl+MvVERSzIuYfP7ql6s/QmLnxL4F4YYPOH2M7DAnyLN5HYHgkMaTZa
	 aXPhkN/d2ViIq6SepWla9wD+h9L9TmDG2+XLMMei1zplFkyTleylKULIZCjjsgFUpxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O+HT/a+f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB126606A325;
	Fri, 20 Nov 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O+HT/a+f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582EF1F000C0;
	Fri, 20 Nov 2026 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177147;
	bh=0kz6yzz7Q+evsBBzjVzgSzgxNxIGaxMZkVkvqz3Lm9w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O+HT/a+fxfzWX7PGLdTayPfk769BEStu+KsxXEHvzTyDrqsZ1jpCyFqOQtMQYvFoJ
	 Xbk1NOaMociBPBXOYizYguYgx1w/4gSpkWvX8AH82kZohq4IwH14JPqodKTC2r7zap
	 3WdIzaFVbJly6idZCRSeTMVQt5LSdWYhwOOyCeydYIKxfyJ/jX1ShSF5k7k9MvgTqP
	 6eJoI/mCIzjYZtp812xBP7fBb04nCNJkkt6PWbbIsPiYFG/+dkmijEHQpFcVEPaJNm
	 CoZiVUVu+3EzVKhPaID2aabXhBpbESZOBIMngMBIEAfD7kKznW9Ux6v503B+nM+41c
	 ERFPO2kKZmAng==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@nabladev.com>
In-Reply-To: <20261118211800.63292-1-festevam@gmail.com>
References: <20261118211800.63292-1-festevam@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: pcm512x: Add mute-gpios
 property
Message-Id: <179511178450.116416.13845415185969519115.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:09:44 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v6PmUz0CgMtStpGjlDqR5attTXFl0Wi34F9KEWXfFIA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZrLZ/viWll/Sg0b67RIRjt8uh/LaZl7yLrP4179EvV
 uOVtMjrKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwEQ6yhn+6bC3XSv4rrf+Haev
 Ju/O2QHvfWewbn908/3EZXWTa1+WPGRkOH9rfvIfu/jCjTG2Us7bkxdejt/yekpBzblrklsqT4k
 IsAAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 18:17:59 -0300, Fabio Estevam wrote:
> ASoC: dt-bindings: pcm512x: Add mute-gpios property

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: pcm512x: Add mute-gpios property
      https://git.kernel.org/broonie/sound/c/a6ff2055fdbb
[2/2] ASoC: pcm512x: Support external mute GPIO
      https://git.kernel.org/broonie/sound/c/35aa7b7f8501

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

