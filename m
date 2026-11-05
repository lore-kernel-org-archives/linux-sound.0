Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878698;
	b=APRhnN2ifjgXtAXfk4uKALCOScy4gl2Gk/+ddD2j2awmkpTMXiOrzlN9N1w+8ebcNIy0
	 yFkcaxXhn+DBHyWCEJLY/qTHeEdWKazF4xk3PuKF5JztjUffJX3UK7RTk/eEXtcfnwfIJ
	 7+WH+3D7bRkB+Msdj2OCE07qkLnPudTGQ42yTO9iVdOPFO4Msb5pfMthgH1b2RU4pK6o4
	 IydAJ8WuBQ04uUKoTsTbnypUZ2SBUjgl7Q9ysjXQBxpxDnVqyfjZM1bLSkXUDC/GHhAzt
	 UfXpSShl6J7bW1wKh8iKc2akBps5l3W24nzGH+a78Z96lW4Lqe8HOJpl03oT4lNMkYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878698;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Q6jCznp4FWJivYaq4sEsBkt+UeNYwPtuXVwM6XHYKto=;
	b=OUdXgX2QJ8bnavA8mhvfSf7C+ezL9j5qhIk4CQvaN+lSEcKQLkaUjmwnPxUv7PmARSLb
	 7JDWgA+F9iyRknmStMMzFvsu5qBraAtDOdu0vQQTpVFilYQjU71Ktv14SHtlo4dANKDsw
	 hV35F9dFb0OXfbNc3HU1vLwAW0WHPakA5EjfwIVZ91DHEL085xCpJ6rHsEYNn3jCLxkx3
	 vKP+YgQqYEUmZcMEKMYtCN1JjcUBtLV61zz/ZNu1vn1JNRY1z7LxkGUOai7wUjWemTj9J
	 p1jjgpTIaSQwh7+qqNE9vswRC4fji72PcDo9XwZTO6Kbi5+8Exk3YwNZSKUlI9cIoZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nAlbBku/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58026606A33F
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 11:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nAlbBku/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8D01F000C1;
	Thu,  5 Nov 2026 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878698;
	bh=Q6jCznp4FWJivYaq4sEsBkt+UeNYwPtuXVwM6XHYKto=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nAlbBku/jMZW1pzpQWX2EYVDI5jl2psLJDTua7Y4l3zFqI6Px9qwIo3wJtAsL6wef
	 17kRaXCXC8dCWckbtoecK8Nms9XOkSPZzAi70qyBr2OTHlRZ++s9278LlUWVdl4hum
	 r6KvZijRnGg70BszT5LmNcqqCl7mzV+z4/fuOxry5oBIazt0p0ilxcOhFVICABBEWE
	 ifnEVqLbO67CVcYp4jKf2PkVy/iOJOSrMOldsTyHNi9X9U1BQ+O0p6ezh8NguHqcl2
	 Y2GG6Mc22dSz1wtA16DgkXIYyK8Bj8BNaUiq4RhXtpTFVLhPuABl59UR7L5QIgcTD/
	 J6VYYVJlrZ9lQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 5147A272E986;
	Thu, 05 Nov 2026 11:38:16 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261104022814.1484284-1-vulab@iscas.ac.cn>
References: <20261104022814.1484284-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: madera: release runtime PM ref on FLL
 config failure
Message-Id: <179383949624.2186205.3567258255805511183.b4-ty@b4>
Date: Thu, 05 Nov 2026 00:44:56 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kxRk7kahlwN3RhYDXvJ6myKB24z6XKy7DHmIMIL/e1M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeZK3IvW8oK9ibsOOw5bmaw8+XKiTf6fIr+vF5YcqNi
 4/Da/jNOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRvCZGhj0JTVf4snS6rB/+
 Y+7acpBb7dfH7fKe19bqP865dXqv7EKGf+quh+TWzbrKJiRmftRqwjul2UFvqx44hNwQr7HjqA7
 LZQUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:28:14 +0000, Wentao Liang wrote:
> ASoC: codecs: madera: release runtime PM ref on FLL config failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: codecs: madera: release runtime PM ref on FLL config failure
      https://git.kernel.org/broonie/sound/c/1ba6a1d89d11

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

