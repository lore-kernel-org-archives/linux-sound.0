Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177123;
	b=Ee/s8r1kHC4qlEmuTn4bV8txa2VtdPHt7r5CUxBGhoicPTJPkyh4ir1OPj1e9aiWMPJT
	 VnGLhNxrkAL6Ht+QSZXV9hLOqEErysx9aHexy8lhoWmPD/ZnjBGqrI3dGgP52YA1s6dVI
	 ZTATvx6FRD7qzL8WphY6VZGOdd3IRlM9elu52ipQnohQV2juEzqdKVXWEfnS2kHpwyvGa
	 NmQW+cY7ekIhC6qXRUzGN0PzZudRWC9Dm/srUA9cTeNK5vYbPvqjXRjKUmv9oQmdtOVgI
	 PU9QzNNXJngvI3gE6XJ3b43R96DZsUKGKnYJpc/P1FVn3nT9QClaIHzbGMHeL7EU85g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177123;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IodcqX00+pisBgADKvsigFNy5B6EW1o+HPTOgHq72TY=;
	b=epF7yyp0fmqCk/hxbycjU2kot4+t6J4GEH5VE2zhqayFVWUuGLWvXA3YzjQVnpoHvhah
	 0K0NJb53/6x8WNyqee2sWNrwKJzZZCf11xCs/7lZ7h3u4kziokdPh7xaU+o1sMeEkRsQ5
	 dN8+PpPnUG4up94jUHJA4eQNNsErQvOfgUzngGKh+WYs7OOSBLlN+gS8Ed0ZrsqUyOadX
	 h2AYUgpMznIDDpmn4k5wAns1RBO7Xg7VK3ol48Y4gQO7OzFWlAYu+p+fdY7Yu8pfq4gRf
	 9mOZXBm/Mu41BqzMFm5DBVej2NRmJio6OmD5CWXFqLoQmRehbSx0Fk0RBvHC5j3WsgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kr2WQgTh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C2C606A320;
	Fri, 20 Nov 2026 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kr2WQgTh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D171D1F000CA;
	Fri, 20 Nov 2026 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177122;
	bh=IodcqX00+pisBgADKvsigFNy5B6EW1o+HPTOgHq72TY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kr2WQgThDY9Wz4Df3Ueza8lR8P1YXXzjW5t7pRQicJcEXEt8cZ9BZuin1zrIRmQJs
	 KSwMuhbwuFrf2hhxrDw6MJWg7xV+K+F/quJmukkXQqW+x1T9Y7hpFSaDS7dVzevwF9
	 LUfU2lIfrdRBgiwhiiTquJeBFXlobDx9p/jJrQ8JHEEXFnmFWL5Z8f1s8+NY6QhfLn
	 RNWvvU7CUG01x3H41IwTeepYq7J7SWOh4ovHL7f9Tb4TxGkoGVStUIWSuJg78qSVwi
	 81guYFZcpUKazZroGyAyPs1At9c1kdWysemvwwVoFjUU/17QnMltqBmpdiYSTdI3Ad
	 OxTxOdPYf77Gg==
From: Mark Brown <broonie@kernel.org>
To: lee@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 patches@opensource.cirrus.com
In-Reply-To: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
References: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2 0/2] Update cs42l43b load detection
 procedure
Message-Id: <179512617389.116416.4465022447490094558.b4-ty@b4>
Date: Thu, 19 Nov 2026 22:09:33 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BotcgHxqj5Qxs0TGlbneURXoPE1M570lq/RdtgfZyZM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZrOZfbd+WZTTbxOyYXabKRt/XP4Mc9edvyDOc9mVJZ
 ETmMfu3HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiISTYjw4KZ9j2CK238j7Us
 WLzS4cpXVy6L6kSLmo197Ufq/E5d3sTwP/PPm9oltktNMrYoTXrHcrnRK0VQy2lOzXkdVTajJ2K
 tHAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 14:16:48 +0000, Charles Keepax wrote:
> Update cs42l43b load detection procedure
> 
> Some updates are required to ensure proper accuracy on the cs42l43b
> headphone load detection. Add the required extra register to the regmap
> in the MFD and then update the procedure in ASoC.
> 
> Changes since v1:
>  - Make LOAD_DET_SEL readable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[2/2] ASoC: cs42l43: Update load detect procedure for cs42l43b
      https://git.kernel.org/broonie/sound/c/1305c408e5d6

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

