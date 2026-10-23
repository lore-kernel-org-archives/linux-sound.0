Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830175;
	b=bCj8JZ8+n7oVMP6rUgfePRWeAXFE0B0SV+c6xlUUECSlSGmFyG3tpFhwGwO3XAQgXw1O
	 zbelC5JYAiCi2C9sM6zuMyJnB4iu83wm9L5mytUlN1S1e1sJwsqPPCP5/HxGyfgzz7eGz
	 lKurwGE2SD8r7/QKkfexzMZQNLkBYpI4/ONNG7yhg/PMDcw+m8ioIcWKEL9R8ORy06qmw
	 7RV4uVSdJ5j2IbM7vilOSWyED7l4CJcher9tdttrIHd1oMLn3OVrwy3ykkQw6ae9MukTi
	 k6pEm72L87KetYC7M4ddIIfzRRx0lxXfwbONXuXTPBTW1ApiTuPFzlKNeYsf5Bg4gxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830175;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0+larXz66gZ3zQ0/y06nXt6mXmhYgMdCrNTB0Y+R9fc=;
	b=AruThAd/aQiMoQyAYXOaX3+HaEqs//hj5+l85NDKIn7jaiajC39u3xKDRXMOE3Rgj3IB
	 2gGEvqVphR8vceS+CBAnQK0uc1AKS+fJeffouPTb94CLqmcTHTgC90j9o1rN3JU5G3JjD
	 9cP6K/mfH0g9/ABl1J7XPVY0k4isonUwCFdpu6edVmiI3nLxIat6PuKG3pBkJ38wUSWaK
	 Ma4M0bib/g5SLas234seAvlEpPf77HRRNalBPFiZa450a6BTcoF74rKUailJkZ/Zgk2mG
	 TQ8m3ehmJfWMcEkNdbQTdKPPE7CadNmJeP6bfi21EDDaxNRrEu5CVax+L9FuSjwOgXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzpyKied;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930D2606A323
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzpyKied
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4C51F01828;
	Sat, 24 Oct 2026 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792830175;
	bh=0+larXz66gZ3zQ0/y06nXt6mXmhYgMdCrNTB0Y+R9fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WzpyKiedaKP17cl1lGO+Ha87Kc64H+Z89uE0onu9rGsLb249hzj+BtdNy8wdMevDO
	 vWqqQba1WU15hc3LqFnLkghuNvTPEJaWaeYkI6T/cQZ6zAXxHln7jX/r0ZZGuOyW+c
	 D7zIZ7lfVYcpFCsTF2GhMtGLtMjC5l9OUAdD3CbmpjSaa6SbHqz+cjWpatmtkJ7C+B
	 e0T/k1nwXZuckU0M651Ag0xVEWs67w7MNe9gCL78CMZFRON4OR9KLSgz5aJqf+y7I7
	 YyEI3s9IxXo6fuFI9GEYGtB+C0qGAT7XHH07kxS528eXfEzvCPxTNJriJVoz9xUUGH
	 Xu9GmTrKo6axQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 4760B1E1FC5E;
	Sat, 24 Oct 2026 09:22:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com
In-Reply-To: <20261022025309.24028-1-zhangyi@everest-semi.com>
References: <20261022025309.24028-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v2] ASoC: codecs: es8375: Modify Register Configuration
Message-Id: <179277745982.3909521.16811581688086143227.b4-ty@b4>
Date: Fri, 23 Oct 2026 18:44:19 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gvwqdHLm5PMsLFyN5lx3TjhBHRsHPJ7AqgR803Vl17g=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLuZN2JEHJYeHMqa5CS/TFVqbU/pwhbsm1ijrVx4FnDM
 9+79O/5jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwkK5/hn0r8p+t9J4NzHqra
 WPw6F8GwL9qz98e6nsTcfy4XntpYr2Rk+Pt06ePkuvzQl6Xt/TbF890SO99Efa/wcc+UZlrE0mn
 AAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 22 Oct 2026 10:53:09 +0800, Zhang Yi wrote:
> ASoC: codecs: es8375: Modify Register Configuration

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: es8375: Modify Register Configuration
      https://git.kernel.org/broonie/sound/c/bcb2efda7abf

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

