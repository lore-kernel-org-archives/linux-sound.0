Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212072;
	b=AW7eX6v/EU+udcAtJloiShKo0fE2ECDxC9CzkCSOoB/eDzq0NlZOqzOHnSjwHDLB92Tq
	 c5U02d3WfAtcTjx/wLKGTqa3sowic0T/IyQI5VXk0JIr4RspGofeuyD0XUc3fL1c6eiJT
	 npmzFNNbE25OIBl4sgJZi6wGswn9l3rIdCF6yjgG8nV1Oh2fsoOd0ADNPTI2B8Cl+iFZq
	 fKnYDYzsy0ECvHXx9ZWqFalduI9niVvlAqY/VNcNdc5a/iIvLPpctHT7u0znQ9rEQ4vhf
	 ZxX5uInqBQwunuYM+Ct9vb1LXkQ6IfOGqmxXu/BgZavoc/bHBr8n4qP9UP8Srx2cb7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212072;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aZfJXtpe15ITQA2Rbg3zMWQMjDAjjPg1SBZRCLa92Eg=;
	b=A8XX1JY8xijBM1rN691QuyQ53pYdCYI+Xb7YG+omcnLOXo48JD3ZmzzUBU5b+Z8zqz5U
	 3pwTZUB5yFi3dBfdgLDIUmbxyj6hW8JHb+eeUbTvwKvDctIhKum+lK1vTmuQFuNYs/ANz
	 trAWnwruQT+UqnItEOqo5M9nxfwSaveqON0E1FeOsjPHF8oeyF+flyFJlX6YpT8TyVgX4
	 WrBscgSFH9NvO1mGjeVtf18CakqUuugwmiMNLTAZZFjXJydQ0vWxsSpD/orDVbKA0gLpf
	 vXZsCMeG4TwKU1ENyWkei1Cy2p+eKMfZn/eYuXzl+wm7C1RfpQJqmMw35A57SRrtitw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d757wUsT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F5606A68C;
	Fri, 20 Nov 2026 22:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d757wUsT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16F21F000C0;
	Fri, 20 Nov 2026 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795212071;
	bh=aZfJXtpe15ITQA2Rbg3zMWQMjDAjjPg1SBZRCLa92Eg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=d757wUsTR76pBQ87HrY9yt4WG5yKkWYN0RywDLuZeGBHD0Z29MFDEJ1opIWvGBKId
	 Ym4wPr0TJ0WR+2xEI0NJcU6pE6D7e1GQth/XkapNqkK8qDKVcOJnvNcdJ8KUpB4qfh
	 +YhsZdi60MRkib6qWjKwADRXOQn8doyyH1fJjJDZdfgWLXS36Pwuc419TWXdOgXh+c
	 QZZo1ov/pvJn6+Ur2CB3xQGiS/Ci7IXdqKNtLcLZgBv1gZnhwTXEEJX/u3/iPf+Wr4
	 XP1syBS5jlqKGbHwgqeeJQFmGoYBdiCi+qMknIeT7JhyrQDS1mWrhVDjpP5al83zcP
	 VClxNwTciZCow==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261117154700.840631-1-rf@opensource.cirrus.com>
References: <20261117154700.840631-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] ASoC: cs35l56: KUnit tests for ASP register
 write blocking
Message-Id: <179519991844.6016.18330105477414403181.b4-ty@b4>
Date: Fri, 20 Nov 2026 18:38:38 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ulcO2bNdzKsTRGWWR6lWLyYbu6I9qAi0hGU83MiuMi8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZDktaX5n0ui24y0c3wdgxbskprqn3Tzzn2DKbVYxT9
 s5T3Un7O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRqBhGhvvrNMUsv8WkVF2O
 3SN+blJ2hMSv4ldR4c2yzppy3fLiZgz/A9Rq3ulYnPzN0xej6pb+OOhYr3Xux1+x05b+VvTi9P/
 CAwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 15:46:58 +0000, Richard Fitzgerald wrote:
> ASoC: cs35l56: KUnit tests for ASP register write blocking
> 
> These two patches are correctness/regression tests for the fixes made by
> the previous commits:
> 
> commit 0085428e834c ("ASoC: cs35l56: Only write ASP1TXn registers when
> widget is powered-up")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP registers
      https://git.kernel.org/broonie/sound/c/c9395f8db46d
[2/2] ASoC: cs35l56-shared: Add KUnit test cases for ASP config register writes
      https://git.kernel.org/broonie/sound/c/0d12b6f3b51c

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

