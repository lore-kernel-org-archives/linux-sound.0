Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698CF2EEE6A;
	Fri, 24 Jul 2026 00:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854742; cv=none; b=tz5+IevlRVJBZA33Jt2YrMsGdNUbv/hXvoOy8AE9h+C4Lvh/l07seNVXsMrG+3BRuSCTnkFCoWVXK/H6D6oV+mIirJSKNDapXHcV11XTzFkbof7xD6nPRe413kDFtaw8JBk3FNeYcFZwIJHqW6bu6IHskuC7DKA4bCTOqiysTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854742; c=relaxed/simple;
	bh=0mDYqZmy8MkRizZfFYfK+DRi3BZuzdXAA9blzDbiphc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vEt8VBfbKyKgtT56L7fNaG2uSjo54TREf8InY5kkphI0NBOl92R+rq1fMAy9xO3CcU3/HopvILUpW0bJVGwu1WYpSLhabNquf2OBrSjTxT8LdtI5+wCfjatUr47rrXUlHfwedLRdxqsA51vx6hZbUr8+b1Cs+Vvtgzb+XUpq3YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv7tZcdF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv7tZcdF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550351F000E9;
	Fri, 24 Jul 2026 00:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854741;
	bh=gj/HXjeSnZmqPX52UguXUuV+ZUY5c/zfkv1bO85kAGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bv7tZcdFazuaZ9VBG0l5w7VllGPFysIPpj52x18tPxrX5KwGSKMfPXMu5KfYGr/bs
	 tgID9wM58/n+haDVWtUH3wvAi3gUoRqaSHLt9/ebebXsbfKKWF8MuwlYPkO4RUbgTm
	 GyaKYlG/6RosTgv69fIPoCiPk1frsiO9xNcxfSenLrkU3SCnxqmHE93qkb1zo633m4
	 HoHJRdOqKKdHI7esvc/Xu30W+4pTvdKGi1E87XbftSLSbc09mGnxgZgcJ0th5fedjm
	 rbudvOI7hXESrBaRZFBqBvlQnW41YzGg2112Vzz0oF6jRbaESHdoORmvBo8IIS0tFC
	 WoBsA+6qa32OQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260722111655.3558096-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260722111655.3558096-1-prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: qcom: qdsp6: Remove unused Q6AFE_MAX_CLK_ID
 define
Message-Id: <178472993178.5645.8348722893682291056.b4-ty@b4>
Date: Wed, 22 Jul 2026 15:18:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0mDYqZmy8MkRizZfFYfK+DRi3BZuzdXAA9blzDbiphc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrjSWtSrq2rSqIfXvQxbjMYjg9ZwmjjImtvlo
 jztwlpuoyiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK40gAKCRAk1otyXVSH
 0EDqB/wMs2QW4fL3QuRnifRLgeXwmQfQ0yCm2E5U+oN3dRmtZifC98PaLltGBPWD/93ZsEbfHwZ
 ntwGVOokwDhg5pOEV+1BKLCtA8+98EM6Mr9n7X5YVY6X7n6fx/vLUiFmqfxF8TuX4Wq4s0yNSIG
 kpxSj6WnhSXyZUyor0ICRYFTE8EaY17PkufejfEKzuX8f3PZkkDdjKYWe5SMEZ8dK0We8yg4WFE
 AyQLbWszuLrnJOK1XPH7rIMgqrPb2bPDuTsxwM0HGRbvJq9NHQjWVSpvgbZEGYVwQCsCHBnLdiC
 6bCVmb/QY7PiJjVrr35eLkhzzWTk+xAfcGSWZEe/rUm0WUyg
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 22 Jul 2026 16:46:55 +0530, Prasad Kumpatla wrote:
> ASoC: qcom: qdsp6: Remove unused Q6AFE_MAX_CLK_ID define

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: qcom: qdsp6: Remove unused Q6AFE_MAX_CLK_ID define
      https://git.kernel.org/broonie/sound/c/784e04110272

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

