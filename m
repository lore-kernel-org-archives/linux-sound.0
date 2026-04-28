Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3837C0FE;
	Wed, 29 Apr 2026 04:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436392; cv=none; b=J+CKUtS044k94fA+Pewf3FqnVkDi4pbtFftuq4sWBKVtmBUto5QvDYHjyBBFVjSvoHfWacszEvhd5WM6yBpooGgMV/xYtl7CZaPf92Y+3milPLGic6r/J++jkhhMePg9TY+Ae3TV5s22N9FJdfuMEQjcsnuwkxaIXpQO6BzrgWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436392; c=relaxed/simple;
	bh=AmD4vqaT2uUvRTUm6AyJgjIJNJLVUy55SkGkTF49aMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YiEo11faye8YOqqidKIEUpk6YLdzeK3KhecpMpHo3/llw6wZ16ZZTm2sWzPywyl9AsEjWXtBZhQ0inWPI9QpmIZaqipjAMKGfJ3xPgIhVrL/RVPJRuvUG6XdZOsVbieYLPn88wzDh4xuwjeLFQKbVvjuvNKeZ0kYD6iD9Rghy4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnLaDfum; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnLaDfum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E197C2BCB4;
	Wed, 29 Apr 2026 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436392;
	bh=AmD4vqaT2uUvRTUm6AyJgjIJNJLVUy55SkGkTF49aMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cnLaDfumluBRuImtdokXh4ERk0qYVsC+bj2tEcf2BK0yh7Xia87nSp1T1ouJ/mlne
	 Mfg5oV0QjF6QOdgAakpqdKAuX21qceXVtTOd59nhQlXdsk0YKMcmvDk2yI39vUglR3
	 2tgKxpFRxGTLy47vQ207oMOAUtZ21vqwThC9W5gZQ0yZgpuzgxLhl0LYYLq9jV+fqk
	 aVUDIuZWaatTUIoC8yC+KpmeJ4AO93Bho1hjgZw/xz4FV+E9rybRsRgia1WVVY9eQr
	 /qSJzDSeaxZuFJH9QDl8KDECEXplYL6OKex9HxfYbiwvN105IMxQ2DgqVIvSYI7eFt
	 Ywx14L+qYwi5w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Manish Baing <manishbaing2789@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 kaichieh.chuang@mediatek.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260428171644.5703-1-manishbaing2789@gmail.com>
References: <20260428171644.5703-1-manishbaing2789@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek,mt6351: convert to DT
 schema
Message-Id: <177741830306.363516.10918867152857147398.b4-ty@b4>
Date: Wed, 29 Apr 2026 08:18:23 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AmD4vqaT2uUvRTUm6AyJgjIJNJLVUy55SkGkTF49aMQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8YbjsZ1LJmGgZqCojzF1xlJO7LUOaQtvFgSPB
 oYB1ACcsHqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG4wAKCRAk1otyXVSH
 0KSgB/4tV5PGktpNn5RUJqR6GvCP1Gg4ClOhRGo+4xsjo6d3QDrgQYWGh+k7sHjnZ0whup/bleN
 ZAQ8rZ1cWU3ljz98jPwzILKB92yEL5nc4wVorZmV4jfJmcuuLTTjJcEe2KxRVnuuCSRGMj0rA91
 lyoU+dcYwElbS5E7xLIcjTn2PQDR6B7bDlPwgl9LoE+gKe0r4freqjJg4upNCQAQmfmVO8Uxj7E
 hsg+tuy0noKZk5oHGZVMJtzFS6qhfdMN5l/mRkUbgY+rc+NhIxbVG4b6xnyovT9mu/mDuy2FV0X
 Ha6X1ic3NkSFi63+eth81l/6Pf5NGmmGzSdy2+8ZYLpRmAos
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Apr 2026 17:16:44 +0000, Manish Baing wrote:
> ASoC: dt-bindings: mediatek,mt6351: convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
      https://git.kernel.org/broonie/sound/c/f103e6c27fa2

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

