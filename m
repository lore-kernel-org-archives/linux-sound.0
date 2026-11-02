Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578010;
	b=UPCHe1ckFPIBQftbKZ/9MwayYQgWAUT59yy33BuUloGMpyYeH/UezUWV9lnj/QXD6kLt
	 Zpy9bV6Dnc6Mnw4D7u1KNR4oR/VO/e8S4MtfOaS65POpc4HhjMYu/H0KzAnxD6jExnShT
	 oC/oOaN8XHmH8hHFemU6XjbroQj0wdbYFrQlBR8x61xBu/TQrQNShi4s49v4mEASOJ106
	 4OLoOLomIIOmAfCDXZvhmGra9kuNA6+Tmk1X2L/1B3+0bsc1ciLgk7AIcYujBNfV2jUJv
	 Epr/DOmUCbV1kJSTyEzfc9+4mIBSpZun7rhXIgu3TiWM/prGm8ZjCPQGRYLqkzb8kpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578010;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9xCj4pH0BdxMbGLqqmzUkq26fmXOK+J5kGc7ztheQWE=;
	b=WNjWz8Psr3xSipMSianTXWzjf6WJIDNm2OJoPr6ULhuN2Ui1pXc8uJ5jqnLBO9TKW7lQ
	 YXr6G1DbKOh2kgQ5d1zHmAoTkQF4X+77zdk0Zk/ks0dVmv3LDFrJrbifvnMhO+jALdwuf
	 FdgBxmusvP6OJOV4ovMhBZBllnHtf89KHwT9QsZBIy+eZ0Y8Xwct23fSgbF7Eg/wasF6G
	 P+xNyUgVcaa6wj+ooirkSFF0EyrI8yMl7ocwtAlBZY7+FnzWgSSRmrmnpVW1+SX9YV2+M
	 p9KQ5te7+OkWdNjjtHqrw63llhD+9cNYVdWM6K9vL4iGGz8Y4F9kXxu0nIST+o8OIWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GSiGLLR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA1606A330
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GSiGLLR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488591F000C1;
	Mon,  2 Nov 2026 00:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793578009;
	bh=9xCj4pH0BdxMbGLqqmzUkq26fmXOK+J5kGc7ztheQWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GSiGLLR57bWJYXAgPYfcr90vYx4ioyxgNt4eL+LKdeWR6fOueH5x5DznqxnCqQSLS
	 774P9LNBx/c5vLf1YRQIa0z63wL/vmd8lUpBVhf9TqDa4zj+3kMIP5pv889xpGNbvh
	 FIl+msurWFwcEC+hRWb1dtxMnf6HPMSPwq6IlrzOMZAMuWU2ECA5Q8QCOoGq0KJYM2
	 CVPRJ/3YyQW7OybGvl6Y517Yt347GWF7seym3daBFJe7OLcEbOBhWcVc/OGwcHuFPk
	 svxbkiQb7O/4+kZnvCHfkHcmRBTnjLiaGjQsPY27k8vOgtY8t0hvU/m3ACNlrT8acz
	 zztQsXRDBQsdQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BB38C218F5ED;
	Mon, 02 Nov 2026 00:06:46 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com
In-Reply-To: <20261030021312.2027-1-zhangyi@everest-semi.com>
References: <20261030021312.2027-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v2] ASoC: codecs: ES8389: Fix the issue of hpf_freq
 keep increasing
Message-Id: <179357800211.1716893.5094312808771231748.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:06:42 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bqH2KUu73iSxzENIYRC/9Lef1zWcdxj+SYw3EG1kZOE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKeXxE7fnLWI5vk/Sw5i857zRBbOFu/9VfrBPa+488sC
 n4prolc01HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJqNxmZFi7pp+7SMZ8+WEV
 jo1Hbba/0tvl9OLtTu/j7SFf1kRH+IkwMlyIe7F/2qr1hibrLu72FpGJzvZb/meaQ5Z5wb4ZMn7
 skTwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 30 Oct 2026 10:13:12 +0800, Zhang Yi wrote:
> ASoC: codecs: ES8389: Fix the issue of hpf_freq keep increasing

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: ES8389: Fix the issue of hpf_freq keep increasing
      https://git.kernel.org/broonie/sound/c/a34544701067

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

