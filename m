Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D1B3DC4A0;
	Fri, 22 May 2026 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445348; cv=none; b=jh9/1/RNZwydxKihln7wltrpLYf4qWwBNwVZITURb/z4bJMhHmbEKDb7asiz0Tm5cOebq2sXzvhF3qYHYa1t4MBreL4vDQToAwHfaeXyuZBVlA6hhMSV5rrOAlOAwGnZQ+mTit6NQL3mPoCKkSsfpSgxySJECZzWYji9tEh9lwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445348; c=relaxed/simple;
	bh=BUgN1e5H5mo5+5boEtT1XMKU+Xyj8tTuTeqNZX20Mvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WuVDf9CR6d8HgGCGNNTCjDjpPDoVeDrXMX23ClLwTt7moe3Ie61MARDqaSyC8VgPvBAKaJEKyHWTw7aZACntxIHhjAaTk5JwYTaXoTQO6BdF/Jz75gYXjRRWqNd3AXFXQDsvRyt4+k86Q4MhFyYZmBtSYyhxGFRV4FjWxeql154=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2YiQbgV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2YiQbgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7721F000E9;
	Fri, 22 May 2026 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445346;
	bh=uiVDNm6IFywfGcj+EC7/0xnSsyAd3ISr3p62vdZVkHI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n2YiQbgVbyQjWDUN4bolg/K+bhob0jjmgttgkCtqj/Y1WnvJRlWtuO4ygPEnTFHaQ
	 d4q0y2dSuAgtkO6Ko7mHHzSo6i9F4U59l50ehpJy8LVUiX3RZLN8/uQvrhKkPbKGFo
	 HPOhGXJNGetkdp1irlaJv0VDBEcacbTp8y6QlGuxWCQcZBgF3HVRDfbQ+hecSrxzQB
	 xtIj8hqwEoM3B62ei187I4DrRmOUndJWuiUlOogjlRZaPjr+5O7UAsrFowXOImSguE
	 jduYEbHYtGu2ZpabVByj9YEgddR7DMR5aclo4QhO1SsXsUd2ihajTtHqpsf8WLJM50
	 XLP/pucWEWQhg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260519010337.629127-1-rosenp@gmail.com>
References: <20260519010337.629127-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: uda1380: remove kmemdup_array
Message-Id: <177928602698.56665.8582819101399242381.b4-ty@b4>
Date: Wed, 20 May 2026 15:07:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BUgN1e5H5mo5+5boEtT1XMKU+Xyj8tTuTeqNZX20Mvw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5glGGi1Upy3peVB6/jJQZPXm9NY4wh+p4FX
 mo2Gz3HcOGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuYAAKCRAk1otyXVSH
 0KPIB/9kocjyWWkVuC0q7RasclUsQUBHtXOc72x1N71VLW4VHtP3jBat2J9nLY9mNp/Ch7gkF/0
 teXEsgKTmE5ieVAfuhNdq93S2/pRNv6izJ+wNhS70KE2HKGUlTzflm5Ypy4BlaLo8YLtJBDZZix
 ZL+qYD7VysY/3LeedTEIr0dUc5s83/oC1y2E74KYtL/n3KVFVQaibjqBLi1y2ZwmqcPeDFQS9sq
 ORnfoIkVR78+zzjWcnTpJIhHcKtyW+AxdJYHUa170fqeHE9Bj4EVUYMKomy8kccyuDgPszYtIW8
 HRPjpugHLwEqmAiE3uE0+xzlHPNExlInlGF0eqatdk5+uc1r
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 18 May 2026 18:03:37 -0700, Rosen Penev wrote:
> ASoC: uda1380: remove kmemdup_array

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: uda1380: remove kmemdup_array
      https://git.kernel.org/broonie/sound/c/04aec3799e14

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

