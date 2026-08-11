Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709922652A2
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451631; cv=none; b=nfre5iwUgvQWZ7IfhLSiEclEqa2TgthqojR4DYW0Q8aso4vNqZM2YN88c+dN++hUl6mSpiqc+Oe//4LVKvr4FvGXDt7BAe5oCZ7RZAEV+ynjfrAzzuMDlKjT9/V1WT86J8YdIG5iD2gMFiNOqwFOnYFKrQu6AU9Ctgm3fhhkGec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451631; c=relaxed/simple;
	bh=fM4A4RvSJdXQU5IWNC6uNmGJtOnQHDrbg765e8x/TBs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KSrP5hoHfLaH/XjCPpV65uGP1iwXP7AG5ElZ1FfG+63G6RlJBSjeszpHNjZg+siLBK6sNVaOn0b8ok39zHNNjJsq92BohN55YqFLuONm203AinGeTNubabCA3Zhw0lqVnSLL0d8rjBNiKAgj+sv3B0QytIaYONC2WdypBkaIl90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Nc1iWPd1; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Nc1iWPd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1786451622; x=1786710822;
	bh=bTVdHirDPsYxRp3i1yC3/ECJK47gcXgM1DUGjKYKqWE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Nc1iWPd1U7ton5WB5zdUteUCR6J3CHdlq7dDflPWgz9rt1Qs/joWVUjXURIcJokkS
	 yvY+pofjaKV1XCaiAjzEl/tObyIiplOmuhytx2HKBuYVTzrwLj13omsbKJH7rGU+NC
	 Sur5RXgVGrp2IXzIsIoiDPp3+GS6K84rlAIIAgAFM9d0i5HhZgHE1KukYo88oHGB45
	 EM3VWOhRRH1RNlC4+7CQnpDT0VR8w7qNB4JwNsiW3JJ3bBiy7cSNX7+9CzhOCmSKyr
	 DicFLSbFCZkVnnLB/GqIxOrk7GupStwvVYWBOVuMIh4Z9bnlGntb/JVxNhBjmnO0Yf
	 NPJSdaKh5LiPg==
Date: Tue, 11 Aug 2026 12:33:39 +0000
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <Mario.Limonciello@amd.com>, "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Message-ID: <20260811123336.197402-1-robineveraars@pm.me>
In-Reply-To: <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: e8d871e82df86e38a461ff2570217156a2b012d0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------79678eb47aeaf3e8251ff97e07fcfac4ba273bc7c642159c996267c457dc1eef"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------79678eb47aeaf3e8251ff97e07fcfac4ba273bc7c642159c996267c457dc1eef
Content-Type: multipart/mixed;
 boundary=42e204f71643965355edc46287ffdcd677477b998e62292670afb3047ce3
From: Robin Everaars <robineveraars@pm.me>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
	linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
Date: Tue, 11 Aug 2026 14:33:36 +0200
Message-ID: <20260811123336.197402-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me> <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com>
MIME-Version: 1.0

--42e204f71643965355edc46287ffdcd677477b998e62292670afb3047ce3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Could you please try attached patch?

Thanks. I checked the bound driver before building it and found an error in my
original report: I named acp-pdm.c, but that is not the path used by this
machine.

The PX13 is bound as follows:

  /sys/bus/platform/devices/acp_ps_pdm_dma.0/driver/module
    -> /sys/module/snd_ps_pdm_dma

  snd_ps_pdm_dma:
    sound/soc/amd/ps/snd-ps-pdm-dma.ko.xz
    platform alias acp_ps_pdm_dma

The attached patch changes sound/soc/amd/acp/acp-pdm.c, which builds
snd-acp-pdm. That module is installed but does not own this PCM, so applying the
patch as-is would not exercise the reported hardware.

The corresponding start sequence is acp63_start_pdm_dma() in
sound/soc/amd/ps/ps-pdm-dma.c. It also enables the PDM clock, decimator and DMA
without a settling interval. I can port the 300 ms delay and FIFO flush there
and test it, but I would prefer to test the exact shape you want upstream. Would
you send an equivalent patch for snd-ps-pdm-dma, 
or would you like me to prepare
the test diff?

One detail may also need handling in both versions. PAUSE_PUSH currently takes
the stop path and disables PDM. After moving PDM_ENABLE to prepare(),
PAUSE_RELEASE arms only the DMA, and ALSA does not necessarily call prepare()
between those commands. Should PAUSE_PUSH leave the decimator running, or
should PAUSE_RELEASE use a separate non-sleeping re-enable path?

Sorry for pointing the original report at the wrong driver. The measurements
and PCM are unchanged; only my source attribution was wrong.

--42e204f71643965355edc46287ffdcd677477b998e62292670afb3047ce3
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - robineveraars@pm.me -
 0x8B6BA132.asc"; name="publickey - robineveraars@pm.me - 0x8B6BA132.asc"
Content-Type: application/pgp-keys; filename="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"; name="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFoOGxaUllKS3dZQkJBSGFS
dzhCQVFkQWFSa3p2ZTQ5ckJFSk1LSkg3NDZSWEhZKzJmVDc3b3hST2k1ZAo4SnBMKzY3TktYSnZZ
bWx1WlhabGNtRmhjbk5BY0cwdWJXVWdQSEp2WW1sdVpYWmxjbUZoY25OQWNHMHViV1UrCndzQVJC
Qk1XQ2dDREJZSnFIeVZsQXdzSkJ3a1FIY1YvYThzR0dvcEZGQUFBQUFBQUhBQWdjMkZzZEVCdWIz
UmgKZEdsdmJuTXViM0JsYm5CbmNHcHpMbTl5Wng2VjVxUzg5dzdDRFlTSXNjNU54dVBKSTFyZ29F
eVkvdjhkYlAzSApxa29OQXhVS0NBUVdBQUlCQWhrQkFwc0RBaDRCRmlFRWkydWhNcmIyWHVqRm5G
akxIY1YvYThzR0dvb0FBQVpzCkFQOXpJS1d3dWJDbEZFczBKNmpwUUhUS1hGVHErOTlNUmtmREtx
SVRidW1RelFEL1IyT2F6VHA0b0NKTzJiT0QKTkZsaVZBbTh5WFA2QSs1ODZ6UjJZS3QwUkFiT09B
UnFIeVZsRWdvckJnRUVBWmRWQVFVQkFRZEEzcDVGN2I1TwpGc1dLclNXRW1FSGlhL29lN25vLyta
MVcwT1BmZllyRFB5OERBUWdId3I0RUdCWUtBSEFGZ21vZkpXVUpFQjNGCmYydkxCaHFLUlJRQUFB
QUFBQndBSUhOaGJIUkFibTkwWVhScGIyNXpMbTl3Wlc1d1ozQnFjeTV2Y21ldlVkUisKViszVWd2
SVZqcURMRk9XeXlHcDVoNEpYQVBmWVpzRC8vUkhndlFLYkRCWWhCSXRyb1RLMjlsN294WnhZeXgz
RgpmMnZMQmhxS0FBQm9GZ0VBOGU0ZVNMU2FMbXY4L2UyVzFMOS9WS0FiajJaN0pFUzZLQXBpOUJa
Nm5RZ0JBTmhaCkZoTUZ6c3l6dTJZWXRhQjhTWXRWdGhKSjYvZUlRVFQ2VWRRRUlZc0YKPVlLaE0K
LS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ==
--42e204f71643965355edc46287ffdcd677477b998e62292670afb3047ce3--

--------79678eb47aeaf3e8251ff97e07fcfac4ba273bc7c642159c996267c457dc1eef
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmp7FqMJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfR/pKPBjtmEJAto47zNopPFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAAx0AQD6dNfHdzgKahl84GmLfVxtGgu/iaHciLlbtGJb
m2WcTAEA/e1bSv7CbAWOQxiXAKFXOMZJI9xO1CDLWxZzY//4TQ0=
=ONiH
-----END PGP SIGNATURE-----


--------79678eb47aeaf3e8251ff97e07fcfac4ba273bc7c642159c996267c457dc1eef--

