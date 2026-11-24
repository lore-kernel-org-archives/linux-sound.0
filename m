Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543989;
	b=RtI7WoE/1G7+mz3EOzR5tj6khmVmJ17DA2yZsGdmfkuUNOtUyBrAkr3MaivrpyHEv1zg
	 DAsKKrVmFEkCeA9nqXjzwgeE1Q6gTt7WlPX6s/zB597dNgforWAFTGpgUPchXKLV4m6Ra
	 fygfE5lo3YaXiRaKKZhAV244j5VHSQp1BqrCS6KWMKOE/XpLE4DTlTlWgcJGaUrNQAaeZ
	 RhICTy1jR8YRlWiWPeKZwUrlA6xx0V7vblinw/uKCqec5yIIZb6kx1DXMoBWTJVNsc5QX
	 XUVYlEO0Yr7lU8td5Qqir395i7cJhAuK8MCdUd4MWHgIeV0RYCjVg64GSHnRqcOmXqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543989;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=z0VN1tpsKHKBMst944km9k66cgg2FkTQu5dxh0kyQz4=;
	b=RbisrR8v+sPjHFqAfHqfB5eIb7yHEn500czX/Tk0BS3nDT0/JYE2uftIouDsBzdsmT4f
	 8xtyaJepenrpR7SFLxoGjoh3ppH6qMYXVNSOq6UTvhBnVtxTkdqCZrzLtOWY8WU/gg32J
	 x1CGNFj793YCNplhbd0R0mhrwtsYy6R14IvSmaYpIt8X51LrUwc6dqE6NLD+bR1QLVixp
	 ShU26Wz8sQ0BkO7ZViNm4YTg3XNSrTeHz1o/JaD2PmGhHEBgpnCFy2P4BYNdzpg2BZq7w
	 +AMl9vpq4ATm9wKpOJuyJbkqWzg4RSBo/cwil4C8wqeHvEiG2hHD6YEBrNW2jvAO5Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZ1MMukl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62208606A31E;
	Tue, 24 Nov 2026 18:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZ1MMukl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D627A1F000CA;
	Tue, 24 Nov 2026 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543988;
	bh=z0VN1tpsKHKBMst944km9k66cgg2FkTQu5dxh0kyQz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HZ1MMuklpdA0HGXkjtE+D6hC+IShwL70sk/Ui0+EydS1GPylOBWJxiTNv7+CJj3hc
	 G3BZqDbMh1eyMvN8pzhHaVp9yipm1iCKqY48Mq0eScPucwPgiA3GrV0/hXAWX5k1S1
	 qS4VbmcI7juTd5zxxCEHS/R7V8ocXyccNQmJtB5ANBaas+mXEad1YYtKTUsraP4ujw
	 m1zsGUTGlZ4SUum91hYcE/r8abWRO5O/mBG9rR4dlISdbrrCdPqSB0cx4o8g40+Loc
	 a6tk0dpB/EBN2zq3af8peZqeUEP5ERyH2zOSVu/1j4YygxUH/oC3SS7k8U4wO53bpG
	 Mn4roAylwEnnA==
From: Mark Brown <broonie@kernel.org>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <SN6PR19MB230389321D29F0C88582B4F6FC452@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB230389321D29F0C88582B4F6FC452@SN6PR19MB2303.namprd19.prod.outlook.com>
Subject: Re: [PATCH] ASoC: aw88166: fix backup restoring the RE value
 instead of saving it
Message-Id: <179554150944.264265.5918495065220583498.b4-ty@b4>
Date: Tue, 24 Nov 2026 17:31:49 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KjMOh11PaUi/koWqxHNrt2PxKsKncR8w6XfULZXMCow=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZL2+Uyql5ZhB5r5QjcYXCwYAHVbvOrDWZ/WT773UJB
 T8XfZ9Z01HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJ2OoyMiy+UfNXMO7BhvVd
 eQolspO3TNna9cRjz0tHmf/TF/r8kq1iZNgjuexXcVpB1K+b+ab9BSsqxTdXdrEfeN0mKnxvx8u
 +TfwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 23 Nov 2026 18:56:10 +0100, Marco Giunta wrote:
> ASoC: aw88166: fix backup restoring the RE value instead of saving it

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: aw88166: fix backup restoring the RE value instead of saving it
      https://git.kernel.org/broonie/sound/c/b0d43948d45b

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

