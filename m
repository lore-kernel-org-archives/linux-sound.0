Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2044242D77D;
	Mon, 27 Jul 2026 22:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192970; cv=none; b=WlTa2KuGcBk7hAlLNIPg8/T6v/L5eAagmHR9ITyaBwL74JY55GacCtku5yVvIJOkfJSlKARMwuIWl4a09sBIgyxAnG+GmVMCsakoZifmR6IhqNfVKnCUIMZ3eyi1PYdpavKwfHcU2QyCIBrmZNjVt25PWGgX4TjsR4xEmzNt2ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192970; c=relaxed/simple;
	bh=DcPQTw13tQK3ryzKdiVRyyK7hVhT4+YGcsOmVocKA5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ThNbWqTDvPrcm7WdlpQDJVlu9qqYdAhQWX8SgZnD9+SU+pycLIoXdKPrstL7BCXWDVlTOkRoFgm+RjaZh06cQCKkJedMM/xgplHZuTjGfVkE3bpByiFJcqRmkW02yUyM7ChvJ9zNhzMhbcXsrGg3yyLibYPeyOdTKrsLb831nCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4Ex//7h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4Ex//7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C521F00A3D;
	Mon, 27 Jul 2026 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192968;
	bh=0qK6hd9wSWkwKvlj6HzXKj262cJHJ+hOZynNz6AuAdw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W4Ex//7hdLxqHaOPijGNSgOhWOwnvn0SCUSQw+t9PZrIHpecwkgjUlXjNSRSgDZsi
	 9wjlrUGA5LKCgXU89foAVPXCi9b+PSlc9ZeMIn0ns9ZLzy4ayhh0CARiPAH/iEWMsT
	 s6FpzL+dD+yjvUoIlkKddEUfuMP18f8S0mSzSq3TbAz2sE71ORHKYkIb732GKGPaFs
	 4whKBxj6Ojh8J+N9s+UWvib3lp0rj7BPAhS+yybiwyZ808BQzcDr3it+FeYzubu79C
	 2Z+UQ0A9roLQ2DowVaU4yGjmxWxgq/bSTBvW2xLCHi5Sy4+7yd6OnUmeb8XMSZy2ic
	 NkCSHmU+OnafQ==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jack Yu <jack.yu@realtek.com>, 
 "shaikh.kamal" <shaikhkamal2012@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260726055227.18123-1-shaikhkamal2012@gmail.com>
References: <20260726055227.18123-1-shaikhkamal2012@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fix spelling errors
Message-Id: <178508422325.10630.3401967100989878890.b4-ty@b4>
Date: Sun, 26 Jul 2026 17:43:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DcPQTw13tQK3ryzKdiVRyyK7hVhT4+YGcsOmVocKA5w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+IFGeNDPfR+IfnWCVE3tu5jjRoOYjUhNyQc+
 jP8xXmt6viJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfiBQAKCRAk1otyXVSH
 0KQsB/92hXJSSVmC8O0DhdZC9f58FPe0bLxlXGXY+VKjiJ8RoF+CmT1864HFeQV1okiJy7E62KX
 p/onddRikyUhPCasCSVERv834D0ixES2vh9rXdtYEHQw6UnDsn1ro298p5EIedU+ZmDH/Txi06d
 ZwFmPrhQc4YG3XHmWbERW4v6oK9twSYUQoRpI54ra6ns+Z7bR7PgM4xDiQt/aU9aOPFAwI7xFoN
 kPq4EWmCP6fhVj31W9YtuBcrbO2WPFWASClifIh/Fj7aa/cJdFJi1sXzkO6vj10ST1oUsBgphDt
 8jQ9eLVoAhZ5kKM1Et3JyeIbK7PabvSQdDgmwkuaMpUwQg1P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 26 Jul 2026 11:22:27 +0530, shaikh.kamal wrote:
> ASoC: dt-bindings: fix spelling errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: fix spelling errors
      https://git.kernel.org/broonie/sound/c/7a047311de7f

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

