Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FE73ED134;
	Tue, 30 Jun 2026 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818216; cv=none; b=hxhAjobioVQfARU24/jh8qInOPcdkOapKZjcCAxDkAsDFaKuYZYmsw6mX1d8ymFgkL+vhUOYPt9ByrfplHvJyx7AhoELgyNoffP88ic3pS7fMA4OrO1TIkpRGN/dSsmtx34fmF5mZyrPwzucqm/cKNQwXNvZyKhYtnBipZXZ7zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818216; c=relaxed/simple;
	bh=sWHuPdL4V7aEh8FugrGqBsjNaOpEn9LSPJKhiXzoATk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fa9rKDAAdSHIB8YAHb3PXcCxRgktzq8GyCRNt2fYMEYagnAAw++xEOJSvg5+YiDcw7YS9CDY3ZbKoWfdm3lWPjg1NXQap5zfHXpcuTHU5HS/LQDGoqCvl0KsgbhjSt5STsGgoZe3ru/Yn0hNJP+AAkJ1rU9+NAzOCjEaNIv2KDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNSA3/+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNSA3/+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D9C1F00A3D;
	Tue, 30 Jun 2026 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818214;
	bh=dhzauwQZPbpylpGr4WGE9mMiIv1Y0Ir+oeoCGGiZuDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UNSA3/+D4r4cXAUAKPFvhYTv+69PZbKlTh/NF3TZEpJ79O3McYU/fwKvHa8S7Au8X
	 tX+y9qFmH6BPicNXjYYrlg/+j9DkBZTOmp5fDfF82aSx1rwaLaKKhHCs08Y9W1rNfi
	 5Ztpl705/j5PzUbR/AowX4vMebYvQ0Xr3oTbEGjJBru5MDRRY9r6W1fMoP5Vynuukf
	 rEq/9ouifH2RwckH0jfh6hQdqbxSSqLI992u/HezAKa/rBMHmvSyv+1x6CI8TRgk/E
	 1Glrnw2PT127SjjgnMl8/IQ4lmL66DAjjfg1DyFlGzz0gA6ifGxBa8bG9MbsCGMIN/
	 k9fB3VhenjZEw==
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260615185810.11804-1-l.scorcia@gmail.com>
References: <20260615185810.11804-1-l.scorcia@gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT
 Schema
Message-Id: <178275431870.47562.12564836681670805353.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:31:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sWHuPdL4V7aEh8FugrGqBsjNaOpEn9LSPJKhiXzoATk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6WjLm2GfsXw6NKD5XVY0W5AtH6+Er1DxKMlP
 fHioa7fM6WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlowAKCRAk1otyXVSH
 0LmmB/9aq99s/+8+af6mipyDDgGfYxlP702UF2VGKCa6ALZ7GWzOw8XxmiNG9hYfUhlcXMHJ5tF
 GQlTZvXT6Sp7YyFnWHOqvKkoQafpEkiWL9d7+G1Tm73WSTgHmYFucxwOWf6KTTfdxy3ePy5q0yC
 kB3LfDbjrhgEaO3T4VE2dZd8oc3Qw9uf7kxrYzh5BByuYO0knHFu2PLZC5AYqe2hX7qZFN+gfCF
 IooPHITfNjS6eKssJdyR2qUzl6NGzvweMWn27In54iB5sbm/C8ZomO9s9TTti3ntJi5nMK1kVAT
 mYJLbo8Th01HOax++kLQSM9Kvy6GUiwBhvLAcAwNgFY3R/br
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 15 Jun 2026 20:57:50 +0200, Luca Leonardo Scorcia wrote:
> ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT Schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT Schema
      https://git.kernel.org/broonie/sound/c/012dfa0c45ec

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

