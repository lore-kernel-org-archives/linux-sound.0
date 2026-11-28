Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.252.153.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857763;
	b=kxmAtWyQABhRxbuxrHs2m61bBDDqLiz/G/qHbwrXg9WggKe5B2MIp8J9MjtC7Qiiwh0j
	 /2X6MldbSSODBcEfMzXOoeZ/n46KH5+ZHM5g7xPn73NLydi1kOSmOw9vyDlpvdPkZEgRJ
	 Rfc9+Bwk0aHfNdFRZ4HpouZUy5X5RGKYRQ81bPmfmdt/lS/1fUX+7RmATwQU17EhZ92H4
	 7QGehkdUKM+GnFVCX/JLDOM0KPigEixC4YyyT/ED5AZIvrxS7gOnyuU8m46mJHjfrTOK4
	 16HIneoS9jtfI79NUePuwlqkOAIlvunOwBlpDWo/khrKTDSn40tuOGE+OcqYkRJ49JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857763;
	h=DMARC-Filter:DKIM-Signature:Received:X-Riseup-User-ID:Received:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0VV6Ki8ww4ciolnUuuso1zfhvBfGpPEScyCrFGUeX1o=;
	b=y22kijXhorWyfCylGvUKXExlRbv9lggNiDs1GXAbIdcc8lK+SlQVsGfh8XwBOgjASdSR
	 Gso3QngTw4xvE1Zqujoq8PP71cFpFgX+vV6+Me0tf2l+JgUzNDeaMzgOTuVlA7dQ4I2Ir
	 3sMJxq+VxmJuAODyyEKx8vkpKjsOTB9QcKp/fDJtCwZwAopE0PfDxiBJlwKrb/CMKMelp
	 7Md6khmAsGU1InVG99rm+u3VTSdYHtV7Ae9DAbO7wS6AH/F3TTo2oTqBDaBDMYj4+idW7
	 76L3GsUcJ0THRFFQgx/+jaoCpeJ7We9rI5qhf5QJE0pmUqtYMvE6+5ZNXMMsELahzCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riseup.net;
	spf=pass smtp.mailfrom=riseup.net;
	dkim=pass header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=pKgdQiyd;
	arc=none smtp.remote-ip=198.252.153.6
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C0F606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 09:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=pKgdQiyd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1795857756; bh=0VV6Ki8ww4ciolnUuuso1zfhvBfGpPEScyCrFGUeX1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pKgdQiydCWZ1KSGiFEa9ldFj6FcpMprYQm7UgqAnIxhBuvK21x1C7d454J0P2WoJg
	 K5Hhc5s9pjmjKocXtXRJcdPsb5c5bCwdbloRJBtMrSZnNFwc6zMa84Rmz3WP2DLdfm
	 E8q43XPqmQffhVJPgs7kcqoDMXFbGTyRWmCNacfU=
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4jc4Z40mtqz9s6Y;
	Sat, 28 Nov 2026 09:22:36 +0000 (UTC)
X-Riseup-User-ID: A1E5E4DC2CE36F8501F4A25DA413625D31003BCD730FF82ED577C8D6C7F2F133
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4jc4Z16sr9z1y1c;
	Sat, 28 Nov 2026 09:22:33 +0000 (UTC)
From: Rafael Diniz <rafael@riseup.net>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: wm8731: power the converters together, activate the interface last
Date: Sat, 28 Nov 2026 09:22:21 +0000
Message-ID: <20261128092224.1565965-1-rafael@riseup.net>
In-Reply-To: <awAc35H1iSr7fk5Z@opensource.cirrus.com>
References: <20261120080825.2078162-1-rafael@riseup.net> <awAc35H1iSr7fk5Z@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 10:11:43AM +0000, Charles Keepax wrote:
> Would it be slightly neater to use an OUT_DRV widget instead?
> The wm8731 doesn't have any of the widgets that run after it (nor
> is it likely to acquire any) and it would allow for a slightly
> more symmetrical handling of the ACTIVE bit rather than splitting
> it across two widgets.

Thanks, and for the follow-up about the ADC going down before the
OUT_DRVs.  v3 keeps ACTIVE in a single widget another way: the supply
that powers the ADC and DAC sets ACTIVE in its POST_PMU
event and clears it in PRE_PMD.  That is symmetrical, it runs on any
power change rather than only on stream start and stop (as the POST
widget did), and as a supply it runs before the output mixer going up
and after it going down, which also takes care of Mark's point about
OUTPD.

> Should symmetric_rate not cover the SRATE case? And would adding
> setting symmetric_sample_bits fix the bit depth? Probably be
> nicer to split this into two patches, one for the power issues,
> one for this stuff. Better to have one patch per logic change.

Yes, symmetric_rate is already set, so the rate can't differ, and the
-EBUSY check goes.  v3 sets symmetric_sample_bits in a patch of its
own.  Rewriting SRATE and IFACE with the values already there under an
active interface was harmless on this hardware (12 of 12 trials), so
hw_params is otherwise left as it is.

Thanks,
Rafael
