Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096369;
	b=oT5GsELAcdJv5tjGMArlqyYNtYLsZ/lCWKoICbh54wJE231R8iBnfRr1gP5rjJCkipg/
	 1Wya0IcddrRGHpw3pUrgjLmtDzvjP/qu9bxZkj6Ye8kgYwWXllujDAQcMaTaBdyy+I0nw
	 ziisnCmICGyTn2jCIWvrmNyZEprkCN6OjKlvGNuOGAo/wWFC60BfAosHE+yeLY7pQfXY0
	 lG1Z1DxuPN6SjeVS3AmmrdHns2PYIxaRrEimQn6+rmG7aKawRcY9t202zJDj1e4GwiQdV
	 fNJW5Aw7DLnCZglwx8EiohH1xw5ywUcZDvJS2tBmMnZId1nhPWJRSbDeW/IvDii+cmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096369;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ovHy7vPUeZ8GPCOkxDrDtsQl5G9m0dyo9PWAT7W79Nc=;
	b=PhTlZ8zNNOaQ2Kvdv2+0ZQSAnhXpzafgCYZp01HdbKZQt3gX3OMpykN3nsQ5FrdzX5k2
	 01rG4gYt/CijpSjccTGodLE8GYCqxNwmBR0Rhk9Cn+BM0Y89jhxRkos5t5/lF7NQntpdK
	 UN5i4aLnCAZZe+8MOlmoD+HxQJD3WXoFnDIX5/ALBtH5A3G/DCDbRr2ZGQtmWnSuCwiNX
	 a5qOUSPm7nRNnS9T+6JuoaRvGaUMxG/opFVef9MXSWSZSV8dItMnaz8iHOzqwKhHRzDz/
	 nqy7Pd0Pi7jk/MeDk1pGARPCnUyJRGTy6JgAQJPSAor95rd6wm3Fc1bSugRWv2dda5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Td0OYVro;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF56606A324
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Td0OYVro
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D241F000C7;
	Thu, 19 Nov 2026 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096369;
	bh=ovHy7vPUeZ8GPCOkxDrDtsQl5G9m0dyo9PWAT7W79Nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Td0OYVroanlxIY4sWHqBvkPS0IU+83r+q8atBGTStCyB5/liyO/tLCaCa6wbeiS5F
	 St6270FEAl46BugZ5SMcVTttbnXehRW8dWdUOnmd82sTtVTdmyr/ZQrhYjBcsJjCBh
	 ZckPJRv80XOtVbt2UFsSmoUa7Vqm0JxZOVbpm6nDUkzZC9GDmnJOgMS6L50+W1tWle
	 GggDcM2cdpLS49taRGAK46GvOirhEelVuV4gCwxjsqpp3xZYHhUlO7lkjITilo89+f
	 dtUn0QRGYmjIKWHtTKvVcaF6t2U/yOqbcAyDgDnCu5DB9oC0CXR5cmG0TVZDnoybcS
	 dJaGj2juXz5Xg==
From: Mark Brown <broonie@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261109174514.84903-1-olivier@mgcrea.io>
References: <20261109174514.84903-1-olivier@mgcrea.io>
Subject: Re: [PATCH v3] ASoC: cs43130: Take the frame layout from
 set_tdm_slot()
Message-Id: <179500978064.349622.6123160153674825478.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:49:40 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9DbEg3QhY0HzXMtuwRkAqgwg3TSSl4J2lwfqOhzaO0A=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/deLnHFHXsD8xlbvB7f2Mi+ovp3tzd6ov3r6gfZJr
 VVBl1+2dJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAihxYzMnQHnnh/cOP0Xl0e
 fSHhS/+2508vsqwNdu46a5h8Y905NU9GhgvZs5WOnp8p/G6WqY+DhOAuJb3NPDqXt305WJRzbtk
 zJUYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Nov 2026 18:45:14 +0100, Olivier Louvignes wrote:
> ASoC: cs43130: Take the frame layout from set_tdm_slot()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: cs43130: Take the frame layout from set_tdm_slot()
      https://git.kernel.org/broonie/sound/c/132ac7e51e25

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

