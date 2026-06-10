Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2281356759;
	Thu, 11 Jun 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169853; cv=none; b=IfvtbX1N77Tpo+VLSiU6paXucqtqJkt/Pe7fvePFlbOQhnEj9o8c85OYRMQibmq/vv6CiT+cPFnj0jjUaVnY/cI3mbwgWWU44VmnPu/+UuiRlI/xSbllLbeO+hjpOBx4p34XJDvHOcTF8J+djSHBsdEuBctFxMeaalY0w0bpPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169853; c=relaxed/simple;
	bh=mfT8gSVDCWk4JyRaaMo+/qGlPesjAc/rwMATv4G2nsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U5/h00SUWjS/d5LhLoDewpElEXhlmupuESbMwTlkFX5FTWzhGaRWF9JM4ITSnh42IJjY5IyAE+69PW7QWiH9dQh3f2bd0uzF78tjthYpAh+waTJBV4uth7pnZxLd5QZnJ6WwjMe26nfUw4wntdac0MHaRLZHnrq71DttvM0Km08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnTU/27N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnTU/27N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7A51F00893;
	Thu, 11 Jun 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169852;
	bh=kaDbe2Wtadm1CovoX1M+pm7BWifn8mTlFUxuaDqLi0Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WnTU/27NgzOoYes/IzeMe1761wQ9wdP19YpDfXsYUpxxGG6XZMQ25Hl4AFte7UTPd
	 BL8I0iSXCAKoGHxIb9Ayper7xIpPamXXxwv5m5VsIiasCQHvnvOZuqv9I5+4qGtxV3
	 XbwKGgLUZRH+j7fA58Q7D/JhvHB0y0wcsc6r2X3U98aesHk1zaDTi+9qcueDmAeR+J
	 uAZns5DnSAzUES0mpChef3CG3k+CVsNG+l2VlDg1dyvN6UstFwo7GOoSJ0aO6k7pYP
	 puMZojS8gK/7CxwD2v0LuFfPk9L1CJ7Si0BZmcwSj1+lCPXpKE5+MQ1KAquwU90sVk
	 P5Dpa3PvD9p2w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Zhang <zhangyi@everest-semi.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
In-Reply-To: <20260607105913.355966-1-diederik@cknow-tech.com>
References: <20260607105913.355966-1-diederik@cknow-tech.com>
Subject: Re: [PATCH] ASoC: dt-bindings: everest,es8389: Document audio
 graph port
Message-Id: <178108992684.232889.2776738169377861702.b4-ty@b4>
Date: Wed, 10 Jun 2026 12:12:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mfT8gSVDCWk4JyRaaMo+/qGlPesjAc/rwMATv4G2nsg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKn65dqvazU4B177fGwRd8nxToenUhgxdKVsld
 sQPpxJGuxuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaip+uQAKCRAk1otyXVSH
 0F0bB/9PSDgrxCKFj6Vx5OG4742eNYZfdMZGWRmtZMqx1jEsWbsOTc1La2BjnRVl1v3bTjNqWTT
 o6OyxjkETr5eVJG+c6mpNoJYNumnURYwFUK9NKXk0eHHcLxw2LN62kTG1il1q4kOemlEGKb5CT3
 OCM98D214M1rKGCcpeR+A50ik03quJF8PL0hBYuTfgpczE/pOXGDSJKanc50sAq2bdnRTWZPbpr
 5eDQxgiESXTCYokAEvP+SExqeDHFdz8g5NLcy4C2Je93hx8+x9hcaTVkSAgjC+JB9srp6dwIrp7
 Tj2XVH18GBsUMlpB/cJ9mj9CStveBRbsE+xJYp4NQTRBXHP8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 07 Jun 2026 12:58:49 +0200, Diederik de Haas wrote:
> ASoC: dt-bindings: everest,es8389: Document audio graph port

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: everest,es8389: Document audio graph port
      https://git.kernel.org/broonie/sound/c/aa283db3bb8d

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

