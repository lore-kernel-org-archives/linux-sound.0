Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5DB3859E2;
	Wed, 29 Apr 2026 04:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436414; cv=none; b=s3+9vpn7r+sKQKV1zaHEmIWslz4w8+OZyN0aJid92WZjEKYuWop5iHe/TXYy6acw3iPGCXF9I+1PpMWaUbIVnW/TEkt5GdSn1HK64OwZs/UJVJ6IVljjUKnCo9VmPerUdbBe126n7F/RjNwk+yALNnyPdJYspvnMXVC1Zp1oZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436414; c=relaxed/simple;
	bh=HVnm26M3Txv5WmPGa5lej8MaUuG+5DG8la08FyFNnDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a86CMUWL9iSe/oFxg6A7d947zC/NTyehbXL07cPKDEQ8CGEnFGoFDyehItbDdPzdDZDnHhoFoVOfo15MUbwYn5DySdDAzdW9YkSEhC5XLEX5f+7cXvnqt6mmqOUBSN42rYYbLo6DfU9yiePJKMXWVeLZlMMzdMX9Pijg4lJ5guA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+FuCjiT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+FuCjiT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE38CC2BCB4;
	Wed, 29 Apr 2026 04:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436413;
	bh=HVnm26M3Txv5WmPGa5lej8MaUuG+5DG8la08FyFNnDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u+FuCjiTvbOHH7SF612HA/9nq7+FpsD1RMaPIVLxK4SvYPb0R3T+R3A4Yc3ejEAw1
	 +kb6fUdKwbr3zpYthz6BArjMjn+3rRfkPUQSPu+hh/J1EOBOz1z5AeJvKbFv8/Frxc
	 z1ZxP5JtnpIRFZLU1IcCt7griJWo6YvgviYK/lik41YiV5YJhek9UZdWjrQSb0LBx5
	 i53iD2QIlIPQxZjls+pqbYKGNYShAwNOTRmml7uClXrFJt/LQUvCUZPZ2M09FQUzxk
	 UmLtCK3jf+QeH5uH7qH3zhmNaC05jUl8ld95O4+wg9t5+twN0eeA+joE0X+kCsYu/b
	 3HcByg28q7zTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Ola Lilja <ola.o.lilja@stericsson.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, 
 "Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260428192255.2294705-2-u.kleine-koenig@baylibre.com>
References: <20260428192255.2294705-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ASoC: codecs: ab8500: Fix casting of private data
Message-Id: <177742366371.363516.7540902089580354260.b4-ty@b4>
Date: Wed, 29 Apr 2026 09:47:43 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HVnm26M3Txv5WmPGa5lej8MaUuG+5DG8la08FyFNnDg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8Yb6huMUssIoY2fFrXMdy6MFHu6jfkFZ3YAD/
 1d5/9OmmqWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG+gAKCRAk1otyXVSH
 0HaGB/9P/XvQ+vz4XG1TTHjKmXemAC9acqtQr3zldF4i3A2P7Pqnx3KGzF/tNyuXebSCwqsi3vv
 oM2YL5pn+/NrP6PDZxPsseMS3mYK0wkcFP9A52yMdTWCz0b1nVAkD40nLLPg4jnElLDIupcRnAO
 BwDzPGc1MW/s7TvjiFQdikgthe+w44wGQHoEVy9I3BuCbQhLV/PHGRCtmU/yJJ+q04f6KBva3KH
 zJcIBc0HQTD/yLiIzWrtWq2oGOGX8rkisIridr+uqRqAdcMFmXwm3eWpNnueAZPQ64xDpXGVU+P
 9DJOPuSsi/8Ts+8DUw5h/B6KHn4cgGPI7dfdsuYTW7HNJKZo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Apr 2026 21:22:49 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> ASoC: codecs: ab8500: Fix casting of private data

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: ab8500: Fix casting of private data
      https://git.kernel.org/broonie/sound/c/a201aef1a88b

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

