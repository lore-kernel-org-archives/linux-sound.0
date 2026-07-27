Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBA448EBC3;
	Wed, 29 Jul 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331963; cv=none; b=qAlWBSyNZwhF0+1jnDNxmFGZgZP/s3whnl9T5mqKBrUAu2wIDIJGc9rfA0eJzhhTmQy7dXui0ZeKQ6xfL2vHjj4Ny4jLoCiF/5W4wOK3n3JqsiWvk8WeOUU0CyO90RUHMInh27Y28AtwRE/t6HxPQfv4WcWIhJPYiyn8lgsZLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331963; c=relaxed/simple;
	bh=+wW+l36q/INLZ3UEDPE5HeaDYiDtkj8r4hVyf8KjyjE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MYhjVUpN6QAlNd67NjnjMfz5xt/K7BmxhinBryo1ixCcSlbcnRP2DGcCxBPPWbadPH6sv5EswGrmtIX1X5g1V+EsysP34+nWxMD35TWlnSa0gXnQ7HCjqM8JWGg89FgkbdVNm4saA2C2zsHmPjLzAz3fbzX3R90L0+EeS/Cflv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJgQ7iNV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJgQ7iNV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F1F1F000E9;
	Wed, 29 Jul 2026 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331958;
	bh=sXat4/wO3I9N40BaXssvvSMMJCWz+4vn9sa/eW2N5Hk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KJgQ7iNV9OWkoUQgOsBEeIsbUBO1VWsyYcMz0+DvUsHBLQOmRWHhVlVGs6W3NMl6t
	 7pd3J3P1Kkoj9CRkzLjS8APsQZdm6zPWwBmI8OBNKSgJcXC3ZwFzlCc6FkIilhGWIT
	 bafe6X6GZw361zZs98HgMDRj3nOkxgTWi+gzYvL0UsIdS5UPu2+45J79sRsm/WSFD5
	 i4fnuDmKjPnPXrcrzMGN3xcGohOMC/1bBiEBU+wdo/9NTu2EqC9mqyZjYSq2o8YMmb
	 bjtbHLQP44kf4E7G/P0kmjomIlWvDsKCKaaDsfxXq7336EB8exUrfQMT0I/sOWpfYb
	 aUIKB8eGbmqJw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, kr494167@gmail.com
Cc: stavinsky@gmail.com, chen.wang@linux.dev, inochiama@gmail.com, 
 linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260727053804.25599-1-kr494167@gmail.com>
References: <20260727053804.25599-1-kr494167@gmail.com>
Subject: Re: [PATCH] ASoC: sophgo: return 1 on volume change in
 cv1800b_adc_volume_set()
Message-Id: <178519394359.552178.18240351256217472749.b4-ty@b4>
Date: Tue, 28 Jul 2026 00:12:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+wW+l36q/INLZ3UEDPE5HeaDYiDtkj8r4hVyf8KjyjE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqagDzOaZwVnhTNhodhl0xqboDfC5/wlowu7Rj4
 mCAnthM6wKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamoA8wAKCRAk1otyXVSH
 0H/cB/93ojKJ1guXpWt4bBKbBsNBKcm4QhvHCu5UinIP+FJT0mZ699khPkyl+NeFX8JnICBBotu
 pk2WohHuJEktA8FdSsA4cVKelHcp6xpXXe00M1fXV8SYfRkhW2M7Fzmmqjz0BZT4hMERk/6QTcE
 4MhbUH5PTaCulKM7MbbY0Kg72aY/r+4IeFDtPKnf1q7eRvrg+XbkTgkje+j3ao6LmtYJeXyQyue
 zeOj5jNjJts69qvILDKMzE7bEkb9LwwoZ1NfGygg+ARmzQKi+KcmeDmtX5lLU+4kbKkqckDYQNb
 6dPSXwrlcrCaoBTSKAZsN7xis3A+MsqcdYZ9ua6L3VwCRHHc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 27 Jul 2026 11:08:04 +0530, kr494167@gmail.com wrote:
> ASoC: sophgo: return 1 on volume change in cv1800b_adc_volume_set()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sophgo: return 1 on volume change in cv1800b_adc_volume_set()
      https://git.kernel.org/broonie/sound/c/f47064c970d3

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

