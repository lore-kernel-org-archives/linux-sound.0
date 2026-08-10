Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA8942CAF9;
	Mon, 10 Aug 2026 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380710; cv=none; b=QDpuLzne5fe34lAv2BxVdaqEDjFl5A8ZOYfvBdjn8on+T70L3mgoylJLHEzT5xft1G2tJDGRg/lrPb3ngWuYyydoj12faVnXvSBpPRfiUhNOK/nXUUgKB7MtxcBVh/6ftsB76cpBkpSZG+tmV7s2jFFHW0qpxBusKBXt/mGj1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380710; c=relaxed/simple;
	bh=5IBcYRMu2xlVef1XFic6uLAKINq4QzxL8KNor3/9n64=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F2BDI5XZHGvE7+NLlgP1JW8qTJtpHyndVHPQzw9KfYNDIXntTi3oaLZNIRu13fSf6yi5/bB1P8XtEGIakBjHArbEJdpGQaiDnWTcmheGxjADu0csnWVmEURfiKgsO7f+QpArAmSVXVYyxNomrAZRVlQz/V9YT5YeqvUmTAP0ATI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbtaj1qf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbtaj1qf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3421F00A3A;
	Mon, 10 Aug 2026 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380708;
	bh=BsLQbLH8PCRw3EeDu73QxZ8Xos27f/XEDpXukrhJbhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cbtaj1qfI284AK9fIwMYxM/AkO4SNxhtCYcBUX85DG34th5B1IcS2oGjZY20xxdZN
	 tHpaiEMLPQYK8W+WzMu+ZMmCYVYd34kuoZ5F9JyZ/hQmHSgGh2RqYGW12GkNhd1fNL
	 yu7OWzr1Ll4MpblRZIkGxNXtNcSCThJR07jX50KhjHPXvC9a/pANlaEKE3qflfpW2u
	 gp2GWTzOknLoeDMrUrltpcOpmzZMBPjY93hAGKtzdmm/NLH+R2VXsca6x6nl0EohAf
	 gRJ1SZtqVRSWGet1OtkurQynoo6daVeJF9OVfhREP3v/WT+CwUSObxbl7yOrwa9fIb
	 +NRmH9R1WeSzg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
In-Reply-To: <20260810031032.2001053-1-le.qi@oss.qualcomm.com>
References: <20260810031032.2001053-1-le.qi@oss.qualcomm.com>
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: configure codec sysclk for
 QCS615
Message-Id: <178637233952.155010.2000772506342023864.b4-ty@b4>
Date: Mon, 10 Aug 2026 15:32:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5IBcYRMu2xlVef1XFic6uLAKINq4QzxL8KNor3/9n64=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqegGiwwYyeNLduMX2f44qw7ux/YCzM23t1Dy9Z
 PX7e6veZPaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanoBogAKCRAk1otyXVSH
 0ESjB/9WBvzmILibnmVIO48g8xB2A2bpGYBq2YJuLp/EVQf555ZQJ7pvztEkqoMfCKOvbLKxqy0
 UNjwGsBU78thig+BMrMELBsrwN59Ci3fodouYluiccakwF9OuZnfrXLGWl5SS86wS14xcauptpy
 ItOb3sr+QXLNCQ46SwwGVj38re64NwvgpAdK27zf+IVK9gbgj1ECx5HZwKDrtP7E3rc4dATXBxI
 Vrjp+07fKqKg/uQ9APjP7uuwFIWi9T90TiWPlJyp4+kAB0K+wL+Y18+/xV1s7Jr/fUG89pDVLxm
 5Yw4KIsEeKydzh/Kszjg5DY/QaA2z3+d8xzJxs5U2OPhIYCb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 10 Aug 2026 11:10:32 +0800, Le Qi wrote:
> ASoC: qcom: sc8280xp: configure codec sysclk for QCS615

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: qcom: sc8280xp: configure codec sysclk for QCS615
      https://git.kernel.org/broonie/sound/c/530e344e4b7e

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

