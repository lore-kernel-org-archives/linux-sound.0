Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3145275B5
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866595; cv=none; b=jvaL0t9sl63WaTa0LeKK8QbF++clf4lg05otXJOMWgfQ7cK6wkj2VIwpKRxA47/oxGS0QszSMZk35t1E/5pNhI2PauHIByrzguL/UaxJktgqsTYPWiyJTV6lXBnUzZDTeghy7xspMR2NtV3LC0oRObuBlyefKjr4DUUMrdiKpYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866595; c=relaxed/simple;
	bh=7HlYiGd72MsqnCp+WzKe7YlSiuSaiNOfFbVXcHFWkME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lWt8bD6lYcodq4vtb6qx5cs34vxvM195EBcFIDH+2IKa9OhtcBp7oYRPesYUhUlJWvb5WBhsgZB087xjlz08FwbPzDUMYwt27HZHZRNZ6BBK9P0QOrYR1I04RUWamAi33YYp+ov4udohgjPtfZBCVbxuTzmL4TLYMN3p7PfMPgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH4QEfO1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH4QEfO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D8B1F000FF;
	Thu,  1 Oct 2026 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790866591;
	bh=MglydUP0U2mUjFDzocSD8zi/t0Ymg6+7YSjtHBoruso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oH4QEfO1/mOq6WEaTPSg/L2lnm9iJYCoTJTBtHhuSS/I4ILXeUKuIrRMyueK+XVuN
	 KYSQ2UdYa4d6ngh2jbXI/GN2yUPJPlkGhWg5Sitfw+rQgQ0FIDzdfGgZqBBZCXS0kU
	 Z+56+l9ULFqEItjR93NsRUljw1cIOgtDHuad6qWirjma0sdE3+IythuZ67MTj2eeKd
	 9XxYF/yFFWWroFEN1qJEHChuihEc+911LKJ+cIyloCISeszo6uLtt0Z9+jo13G51gc
	 0uoFcYfS+r47dWVCT5dHFYTDTS34M7dmLaHX6A8htCt7TS292U5CP8mr+AZ3NEMO9p
	 nuh7Sbi/EJ4cQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20261001090219.797880-1-shumingf@realtek.com>
References: <20261001090219.797880-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt712: avoid duplicate reset in io_init
Message-Id: <179085929068.90966.16547435466545857374.b4-ty@b4>
Date: Thu, 01 Oct 2026 13:54:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7HlYiGd72MsqnCp+WzKe7YlSiuSaiNOfFbVXcHFWkME=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL2lbR/nhwe+cakooI7T/RGmml++dpJ68K379w77XLbt
 ohFD9jcOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRthJGhis331+56afP06L/
 xi1yc3Lf38n7cjZXTUzx/ZAYwZcU7sPwP0Rk/U7OOWk3vzE06GiZbvLqea97PyezedKRX5M0Wv6
 cYAYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 01 Oct 2026 17:02:19 +0800, shumingf@realtek.com wrote:
> ASoC: rt712: avoid duplicate reset in io_init

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt712: avoid duplicate reset in io_init
      https://git.kernel.org/broonie/sound/c/923ff8155ef6

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

