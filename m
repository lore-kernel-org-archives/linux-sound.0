Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444721;
	b=qqgHwSP+QJZ7TEt/lnkhstwswZVs6scdkQ9WRrUrHt0g45kJtBpa02nrYkixjYDudpTN
	 hFQz+S5LWFvHjom4jvh6L8/gIbmm0siztYu3mLKQQtkWJqeEFLkXOT5dXXro7fQ1lH5hZ
	 GCeU6ir0s1SJE5DN+dCY5yXzYAgd0ZDqoyKFol2MB/C8lHHYYgq50203opYWx9aoY3zS2
	 Mu2iXGW9Usa0BqL+yoAE694Ws+XCmgsGyqBDtfvKBePwUN1gFFbe71a0cguNdvj6JGGv0
	 mrZmy0rl+LMptSa27ZkEfSq1pNqjecowFEVO7xZvRsGbXhLR/xdtaweIbxh4f0uvvdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444721;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ElnJnUvUONCYMyWH4v3Z1J8/nDxv4XxaYgKcKV3wz2c=;
	b=wTvG+JlPkpKlCS7Y6Lg8j5WvqxAvufG+G+Pb38ljvsRJ6f8Z+zCJVKLbW7deDS+//euS
	 wue/J8trtyi1GkjAfqjIqV5XGCD6Es9PIwwQ7tWBVjr3fwJiJe5Nh6qhvSN5Ra+7QwdbQ
	 HVR+Rml7wqGeSFk1jC9+NZivB1w/m5bC4lhINhSht/rQgBgVUYu01N8jj5uRaAtAXviWw
	 w+jmnz9iERi1KR+8fTVtxFRWYHkfFBlqnKb+hPdwVwxFmHI6nZjiz3yLD6hnCrqNe+Jp+
	 pSC6dZJ3QFF9IGvzFYKeb43c1ok542EaAYseiHiakROF/hyMTPJ04dOiEP7AqifgO0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6jwh8JX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203B606A321;
	Mon, 23 Nov 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6jwh8JX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2DE1F000EB;
	Mon, 23 Nov 2026 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444720;
	bh=ElnJnUvUONCYMyWH4v3Z1J8/nDxv4XxaYgKcKV3wz2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e6jwh8JX3eAm5AxuoygXdtgqOKlnvkFAfbdNFRr6D2I5Zby23YY2FqEsrqAa5scNC
	 idDAL9IKKlOm5UVW37dFntNmZHfIKL5Upoo0PdPzOcExxqk4evjR5yVH9KhCMuPwYm
	 XWdQZ/H0BJfP68R51m4KvgjYCP+XGJ5grlk0x0Vr7xbM/YCTJuoqXkCAHEqPpL88h6
	 7JSE/khCWpBASDMfOLE2GlaLdtMQ4bt2KxltS22s+OmuHwOI+lBv2oeXbu55FxAxHX
	 qI/tAZqF2V8nnT2AvunXpjBTFFfjeQD5KRzQs1jSsiV8TENcPRMJxGDAYw+4ziUSQs
	 3w63+VS4tRSHQ==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261119075912.50227-1-zhujun2@cmss.chinamobile.com>
References: <20261119075912.50227-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: max98520: Handle reset and register restore
 errors on resume
Message-Id: <179544084265.25092.11972036072313832635.b4-ty@b4>
Date: Mon, 23 Nov 2026 13:34:02 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XOquuh/RF1E9WzeSslw6gYCQFnZZXbSz7EKjTMqnn48=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZ/N9t1po7M7nmifSeidITg/bNfSQSFXH54II5llIa1
 3hC/R0nd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAii9wZGXaaOD9YsWrZ3uLD
 3o6SbId+6L59s1fkxaY7Bq5/XPXaS9kY/vsecsvSk7OcedH8J5teZPIe7Zf52SfTBbVbs7JUJOu
 F+AA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:59:12 +0800, Zhu Jun wrote:
> ASoC: max98520: Handle reset and register restore errors on resume

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: max98520: Handle reset and register restore errors on resume
      https://git.kernel.org/broonie/sound/c/b633d6547dd0

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

