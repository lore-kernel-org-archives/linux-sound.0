Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C36A361662;
	Wed,  3 Jun 2026 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470269; cv=none; b=eTPt40kZamCNPx3B9YkfL0CwoGtZVbYYLVhb2vv6XMud2NuwbOwp/P1AJgHif1Y9uIjS7pvYBeSdpcudoK3DcRrqbCE3ksnhkNnHDXM6/aYk8sP3pzxnE1MYFy2AJNjLcL6yYIEWQJEPtCA4Hb+7+dAG91KSe7FQyHL9RX6LcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470269; c=relaxed/simple;
	bh=Sefd+d8L7l5Z0kCrC90QDtgxv7Qc+h2jmpfRcIY6Jmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hJR48G653RgGVEo+Yd+Qr/WyuScI0J8cbCqNSbU9MDvm7qvKSz6MysGfdd2GTsBMHi8hm9GMX4w3f43rcFp0G3G1P1j5jTcMP1wSORtuihIxkOWhJiocy2OmWH0BsKZKZrtofVVy1FOFGSJkCKu/seJ4Btf0IQ6O7h5dM2dmCG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcQWSD2v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcQWSD2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2291F00893;
	Wed,  3 Jun 2026 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470268;
	bh=iIz9JUnKd7SHC4UsxUqGa2v+TYJyr2GeOKfkJBBcuMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mcQWSD2vz2CsA1VAAb2QqKgXryc6nZ27hUeQENtn4vSd2uslgEduT+TAlC1mY4k69
	 DK8HquuFcUE5Be2WFUeZXGqXgUVn5o4WKDqlYRL6uG+WDb5dKJ+HfPobmhQHsaXySP
	 WO7DZMxC9uDABzP+X5JrrZEdRLYVG2LH4RaAQS7c+LD6Rgy9Dohm7/S9Y4PeT2iYG4
	 wA98nlC7/fKL/S2spVbcIU6PYBxSBkPHRZ4HRKxRjrdrCEjorDhL2FA7NDImp9E/Wd
	 +BIqs6o5Q7TdY/tBZYdemAjWBubSKXBAkOpO453i3zUkHBhwLzyfBFnsdU5hib2bIy
	 q0SxYuWN57TZg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525-asoc-rk3328-devm-resources-v1-1-2abde0006f89@gmail.com>
References: <20260525-asoc-rk3328-devm-resources-v1-1-2abde0006f89@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: rk3328: Use managed GPIO and clock
 helpers
Message-Id: <178041284353.93058.6927261750450841534.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Sefd+d8L7l5Z0kCrC90QDtgxv7Qc+h2jmpfRcIY6Jmk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9H56G0b9e8Zr6JJvazELK6et+7IKViI+wR3k
 2JQF55jWlOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/R+QAKCRAk1otyXVSH
 0II9B/45sJbqUedGAQAjcr3OgS2GK5Ruk77VKhrJzL14B8nU0Ub6Jemqsi8Af/rmC6DhnvsJhMB
 NbnD+p+lTxAl7qo+5DR4rq64/yd0cc0ULIKVHXByTrM6C8riNmtkXZNGHAoEPKgY9lyj38FfTH2
 wuJCk2X7U2omLVQTLW6ExsFQbdLTQBkIhe5kr4NyOis9dQ8Q9TXSxVjmeiq8yxGYTVudBI7P3XU
 Hvizl6MTgWPmu+X+twFElW7jP3RTQUXnFkSK8B3rqNxALf3EmSnlv52IO036salkbs8M2jj/rI7
 KYygY0BXTl+dDfEvzEVVO7Ia42usygKhZOw9ygbRbyA4b2xL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 25 May 2026 14:18:03 -0300, Cássio Gabriel wrote:
> ASoC: codecs: rk3328: Use managed GPIO and clock helpers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: codecs: rk3328: Use managed GPIO and clock helpers
      https://git.kernel.org/broonie/sound/c/0cf3489bba9a

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

