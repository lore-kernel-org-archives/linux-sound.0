Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117B438FE6
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725594; cv=none; b=BQghTty23SQm0v4hMHOO6rx1fPiCuZkEADfINziFGhPwwb2LEIQnvgE5zPOTqzRqBXp0UdCNi7Hx6e7FOdjL5Be4qC4g9O2gNCtzXnK6xhUxeiQJ+x6KaisRh33KYXn5mJznFryHtKLT3nAQsosY46gD8y2h4DJ/Y9McquFAZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725594; c=relaxed/simple;
	bh=1JaBGORmLNeLkIFrp0Q4nFSxa1QgGtqNJy0GFodyS3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EFB8w5gXtHDxS3imvPTMZ0ZabIB8mdfgK7AimfC6qEOA5OCaJXNNVXc2ltRRCBcwV0z+5b/JOfxfMPNmqQzGSC+KDqZi0zjFBi4AilYSTpxjk5YQJ2ydiXC6wVPwD0VNXqswfszCZYxbAyM5GoANxzwur9mgC3ds/Aje0/iUBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2l7qoHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2l7qoHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88271F000FF;
	Fri, 18 Sep 2026 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725590;
	bh=jrkc5e08goSGBeC68Jd/mSy+h84vjdGzywA789gTat0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=M2l7qoHBXThVH5QZExs7GF/fj/2O040hFNIy96W3TcvMc3kYSSE1NTy+O5hMLFXet
	 IjAdXnj8aPwm5JwZ4SSvXi3xDXMkgGTXjI2p0ijf2UA8aygyhCnxZarTe8O11WntHC
	 4YBvKBud7BAaPjO7TX6eVCZ7Udcd8dhzjWnXT7/e52zDlZTtmUtaznpYa870dme7x7
	 lVhVtzAUyRuFj2aOZ1zN5Oa0ToW9TIYTvNC2O7U+8AJPyQ1jPl7ZRDvmxl8oZWnqHz
	 i7sSHQYMAeT2soaDT7gs28SgBQ9H+vWPjCBA3rciXuVSPlWbvoddU3Yrzg9wc58ykr
	 ixc9A7DLRbJTQ==
From: Mark Brown <broonie@kernel.org>
To: Khanh Le <khanh.le.xr@renesas.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87a4pgzijx.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4pgzijx.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: ak4619: Add suspend and resume callbacks
Message-Id: <178966070753.285745.11103059130857819872.b4-ty@b4>
Date: Thu, 17 Sep 2026 16:58:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1JaBGORmLNeLkIFrp0Q4nFSxa1QgGtqNJy0GFodyS3I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrQuTJals8ucL3Qd0b5EW4Mnn0ddcz3DM2CnPi
 MXfcehfst2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq0LkwAKCRAk1otyXVSH
 0DM8B/9gpKRtX5phcstA+xpJOyRoI1aB0MxRmoi0KkwcxzTswZegecWZB6Z72RpTYKFdxlnRTp5
 RgM1buyG6s7rVF/EvqcX/klRFL3vk+coP4FmCpSXeWPv0NsZjBu2XE2agOyqtV/+Sxacw9YFaBH
 lwreSjOBa5HxVA5v4K3I3TEJSdT8R+3rYm7+1NxbV1HkZd10s4iEKsWFIt96rrvAB3EpS52MYYK
 s/D/o+7dujJtjd9R8GDvpTlOS7dJVBJxR6Oa+0lO7YOiaCyMpt41RbtMS2H599kuhMAmq0s9MC4
 A0YWzcvC05dqIxGaNwv1O4xwFdTWg6bGRZsmzHbhfP2jCDCC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 17 Sep 2026 03:02:42 +0000, Kuninori Morimoto wrote:
> ASoC: ak4619: Add suspend and resume callbacks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: ak4619: Add suspend and resume callbacks
      https://git.kernel.org/broonie/sound/c/d5212d2d50f3

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

