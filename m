Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522453;
	b=5FuiHZZCjhYPTKnPnKWVtbVxQkfOAXwijA+LQWlovOrOHOUzcEl6pQs3eYkwjdiOW6SI
	 UZczEqLmjOiLjEwCJ9T4O4RTih97pEmfu/PlKIiyiRJlGA8Evo5ucv0QblLRh21ykabue
	 AGwk9CfVYSXO2nd0n4cR+9mnC79Vj47u1J1t0qBiws8ZJJYMMcBcSd/zPFAmWHrRrcNv+
	 HbRidNmtftMFt210QMD6J+a/N68BEzFk3EDFDu9dWx6L5mQinzHrBxQ9X5Y+PgiD9QE3e
	 K0GuARciqMHFoislcVrNdxJoWbIcnBKmKJLk/18a90kku7MY+i1GuUa1veQKzoRmuIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522453;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rCFII6oo86vIdq1LVcbevRfZTvtQd+XmVF7qbvAbR/4=;
	b=5hhrCX9rSd1/87FHoVDnuDr3eabALz4tFhaI6YeyAKiCMWiJ6hsIa3EB6O9bXcR8zEzR
	 0phag0mD6Kq5/MY8WQ7JVpC1Q0NlLX4fWP0RoK5IRkin0kW4O5e4mTX7gxauJXVmuHYd8
	 gYDvWw9DH5wWZC2aUlFXnom0UUmmC4cO6gyYeV7JQPIQd2MhJnHJtXN0JjvV7jeXOUcZg
	 0F60XGRoZv1t7TxmqBp1GIQpZNat7CYB/6nGfh9K6vtwo4SdOSQPfaj9cFQoZ2jwPlAUB
	 pH8xr9mbUUBFPdy/g9P7uqQys3O8D8RKu4mbaCguKKESmFpWPRSNQ3yHkxcQOzro5hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2jf+7nI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB42D606A31E;
	Tue, 24 Nov 2026 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2jf+7nI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB191F000E1;
	Tue, 24 Nov 2026 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522453;
	bh=rCFII6oo86vIdq1LVcbevRfZTvtQd+XmVF7qbvAbR/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j2jf+7nIHfPiTJViGYxlvNuGiTUXieT1ndjeGIQ9HMUtfI7DL8Nw+iD+zydrsYnNz
	 StPQ5scBgZJizWvjSyxQCKu1bxlmq0R1efsFS4ok90jZXYefG59g5/8w6cv2MLIIhw
	 vqrHtLJAhuKuJD9Yrus6ztkz3APIMzf/Wl0L3/UFf0mJMupFZYdfDHAnDu4maFOssF
	 PGU9D03uemPyiTQ/Hyj1Lu4BPdZfMIFQw3STITauJq4Acmp1J9nBrKuClWURNfX6bS
	 WU8NA/z+95EnOKHC9S7Rht/xsA2ytkygtL9l69M7lLp2HKKtSimKJMYT4ht27ZHHo/
	 QHGbcmLueHlxA==
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <0D45FEC273BAD5EF+20261118021134.3827729-1-tuhaowen@uniontech.com>
References: <0D45FEC273BAD5EF+20261118021134.3827729-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: da7213: Disable runtime PM on component
 registration failure
Message-Id: <179546054110.25092.12023244729326576501.b4-ty@b4>
Date: Mon, 23 Nov 2026 19:02:21 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=f5RzvjBn+O5QMC2DL+F/6WIFTUQxESMJHaFFkUbi2Qk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZ6yc1PfjFXCbmOPGcekiY2fFVCtx7/kusUbCqkTXbI
 /xNy3x9RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTAC6ygeGf0fyghR9e1Qmv3vd1
 ydQFl2tkl/0UydvUtmW63tuoyss96YwMB4JKuc9NmyQycUuG80XXkp69b/4xHTNc2pjjaKOZ6Ov
 KBQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 10:11:34 +0800, Haowen Tu wrote:
> ASoC: da7213: Disable runtime PM on component registration failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: da7213: Disable runtime PM on component registration failure
      https://git.kernel.org/broonie/sound/c/9af3cacff4ad

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

