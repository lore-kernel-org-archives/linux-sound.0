Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0BE3DBD54;
	Tue,  2 Jun 2026 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402088; cv=none; b=MtKZaehAscz0cH6ddRL2oWYI1k1/ILR5qL1pFPGHffDrDwDWNIfXfAoW79CtrFJ/XMz+ccfetcLUp9l2oWNNmzsIHZSJ/vNZiWA6PVQRg406mJDuypsf4gJwXz6eet9ymfDIcIeTrGpLchDkdMbstZJSKYWcGT42E+c2befrtl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402088; c=relaxed/simple;
	bh=wAp5PlSpaMKc01ROd4IGfMgTZuj6bXL4sJp7KzJ2ZjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EzRdxQrYC+6T3by0U+CSqOmY/EZe6zj3Uy9d06mPAas9CqM6KL9aebAvpSAZKvkCyUObZ4DgmhMtIqB1a/RXcqP3zeRWxs8vr3YYvyaKL+tS/5FWgLJazF7sIC6aav7TwY+laoiH6fgXFlDUYfYaXuuQBFoOjxQIjEGaOFR7Ajc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+cA2ekh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+cA2ekh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8411F00893;
	Tue,  2 Jun 2026 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402087;
	bh=gYd219WrFrrp7TENHUD8ikSvXHyRtOBVcPadMvRq8/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=S+cA2ekh4AbcXugDNm5FjAPj/U3aAZhUBQjnt9VMDhIukJHKuRjW8zoWy98qftsCj
	 WXyevxxJlZr/tEYcZPiWG7KJf7bb1sosbT5aihiVQd8y+Xn4Jpsf2h2LIwo5UDmh2R
	 dEtQLCO9KJGJw1C6L+X9MGmqJ1EAhCYNxlVmHcq90O9HJJ4A2F72Al/ULE3ajZKEYp
	 d25an7ZwX4YnZYWtbeSJhB10e0nQvhp0WccdjiLQIF818U7ScD1LETubVOuHpv/cS2
	 moAJ/7NqxoJFANwncpRbaYhfJc1OePdbdm6wuaKH1HeeIhiBYsW2aY2k/PQk2kWVsa
	 KtVoosQu0nnNQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Jackie Dong <xy-jackie@139.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260527102005.58528-1-xy-jackie@139.com>
References: <20260527102005.58528-1-xy-jackie@139.com>
Subject: Re: [PATCH] ASoC:amd:acp:Add DMI quirk for Lenovo Yoga Pro 7
 15ASH11
Message-Id: <178033011660.44654.13966829321338054554.b4-ty@b4>
Date: Mon, 01 Jun 2026 17:08:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wAp5PlSpaMKc01ROd4IGfMgTZuj6bXL4sJp7KzJ2ZjA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHsekHLfl7r0kf9vt5n3L6kUyeOVLxy/U4/2kg
 B6pk+ea+p2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HpAAKCRAk1otyXVSH
 0BuRB/4m+PqMskjQNJKBNyXGdfQFS8O80ybHu+Vt8o9MysqE8HkOfVex8DWhqaXN4AecMGQDfyv
 XI9Xry89vbrLWSYOKuG92onakcqH0WI8DyW+uX1ayzD/fmnzUj9eUfUPHeA+ewjAhoZCF8M3mrj
 utPsq3Qr7iA9bH8REiZV3yfGIgSZyPpnzGo46tEnTwZun4QPOy6+W/1bSYYp6oUmKNg7kwMOwUV
 fbeZrha8PtVs+O+cox+oI12b4iUraKd5ysjjEwWzFU+3xT+5VgpkxnwEQdOsd48fKCwh9lmFWry
 1Co0eYKbxSiN0L4N9yw2/49ir+79aulayYUkO2juhrIXnirr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 27 May 2026 18:20:05 +0800, Jackie Dong wrote:
> ASoC:amd:acp:Add DMI quirk for Lenovo Yoga Pro 7 15ASH11

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC:amd:acp:Add DMI quirk for Lenovo Yoga Pro 7 15ASH11
      https://git.kernel.org/broonie/sound/c/fc12cf16df9a

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

