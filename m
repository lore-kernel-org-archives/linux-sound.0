Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251395;
	b=h4QVs0glVNlR5bM4HHFcieEukznoOGX8a3TudAJw1LZIticvt7+2hSL88p12yHp1fa/s
	 jnQIHIHDUWWlZIYqd1Yak3QUi+P9FnqJVwfwY0Sa+oQie53gux3yT86MYFl6NKwcySXiJ
	 to9FwKYVEZGmvcDXxZoT8ky17Ntm+i97+63iK9AqN4tkJ6WjTHJItmrPJ24EiED2hYsJv
	 +CxcdTuO1Vtnqz7gZyHyZ3/xwXn5LOZEzDr+9Rml8FAUvTemNuHCQRSYE5/jL4n9/7k0w
	 M8TZnfQ6PBwAOTfsQd+hB3Kw9aQMowgzszlcEO47cVB/61kex3ESj4YYyopHA27hNrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251395;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=j7qDWSNS5eYxL4Rk5EXH81DBDlz72KpGeSZMRcNhxOs=;
	b=1NSJWS1oP9WN3QhFG+Gsw+AQ+gXbOaRIK+XK9qCBNBUZInH8jqoY49bLhfnb50xqazhs
	 kpnOyLNTA6kbeTF/Rojun5Lr6thcSrNOhckql3YQ9D3dfKA3msxe+83LW0hQZ9MSfaxGq
	 zmq8QXCUtqSaCVOR9zoy9fGxhQ8B5I+9idXVxZLwH1Fa0nTZxgc3eKSoHV3lMl7RU60pI
	 tr/XwJmkvpxIyIZBiuMbGd6oxExFx8puoRQTcvAZ5dbMFMIhYQ05KNGpl12Syw+GP2Ta0
	 2XUX9RXagNr8kxrCoYvSUI7VV73lc3Reg122h5BzDffN/s81SMwoMP9IAn6jfeXud+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JK65Cm4f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769D1606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 19:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JK65Cm4f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845811F008A1;
	Mon,  9 Nov 2026 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251395;
	bh=j7qDWSNS5eYxL4Rk5EXH81DBDlz72KpGeSZMRcNhxOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JK65Cm4fJop2ojkEpJyM1+mXqVJ7mibbrj49cM84eeQZ0JJ0OnUGxMCLP5F6a6fIt
	 WaAlubqqhIG/hr9uWg3DS4MEuQu12YKJxHPagNfGWcQeAe3sL1P9+G+uZLuyE5AZu7
	 JbUOYDiSlBlt0z4awGMCRwNMaHkX4MYIRfK670ZWrTkLI6uibkWoGgsUexeJoQxbRw
	 T7YhRytwCWU3eT1RuYOCfjHqLdoL5yKJ73ktSmHflIj5jjXM2KIaRP1ccAKoE2gO9D
	 J64V+YZmemWzVHaNenB7aQSIS3imZ+iFques75kObudZG5TWwg1UI+USWcn1GCOPIJ
	 yuC6Ax5q2iJXg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 095322F707B3;
	Mon, 09 Nov 2026 19:09:44 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <179393727482.2060666.9057920361892304525@iscas.ac.cn>
References: <179393727482.2060666.9057920361892304525@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: stm32: spdifrx: keep the control DMA channel
 on config failure
Message-Id: <179424339281.3711751.15933496452450349349.b4-ty@b4>
Date: Mon, 09 Nov 2026 16:56:32 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=otm/DUqabjVv2tU74m8yyYAXxBMbuTd6OXTau+Ypj4Q=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+SZVvnLZ5zkFrcefUDfwzp5jsNJIW+bumt+eZqFT8z
 2O+DcflO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRpFRGhgvy+4oMu3O3XhC6
 c6TO4jmbnNwfq2Xqaob1jWXrFu7f+ojhDw93U0+/027+FBMvj5jtws6BDW+/Jac7p3wPtc47q1z
 KBgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Nov 2026 03:54:34 -0000, Wentao Liang wrote:
> ASoC: stm32: spdifrx: keep the control DMA channel on config failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: stm32: spdifrx: keep the control DMA channel on config failure
      https://git.kernel.org/broonie/sound/c/8f0650e4695d

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

