Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85656283FE7
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 07:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614001; cv=none; b=G7k3Hu7rEbyTDMyB7zq1wIR2yxmMy9Xgj8dU2pC1WtZ6IIuRWo4/Km31WVCbudmUqxVNIDjF8qE45nsduwovR3g49frGfD13Yr6Fu71ybGG+3UavkycoKmsCEQE3yWgtgpZS+riYOn/sXAsJU4T3xZ0JjeF5+uq0kOFn4dapMus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614001; c=relaxed/simple;
	bh=APlujz3QqBIHliCa5cLij1ddIwxT5n25Q5hISvN8bJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pr/RlXpwyJJH1A5CK6PuhBf2ZRuLyiSdjAI07mF59CgmhaCnbB3s/6A0k4auNnQEym0aaBeIM5Qfk61Kwf/ivaS5lwJElqU12sSiPII9zvbfl7qi5cfTQvyjRcviKVXc3xm3nBO9Mwb5sBHSFyHRRGLqGZ581SNAY6wHIBvKltg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpgz9t1751613992t6c49a589
X-QQ-Originating-IP: NKnTRTQqlnTiWFdThzYKqoMVdamEtqPW1awdNrhl788=
Received: from localhost ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 15:26:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2485475499401928861
EX-QQ-RecipientCnt: 13
Date: Fri, 4 Jul 2025 15:26:30 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S
 audio amplifiers
Message-ID: <021E47BD8882DB2D+aGeCJvwdYAs8pny9@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-4-nick.li@foursemi.com>
 <20250703-primitive-puzzling-toucanet-2c4870@krzk-bin>
 <6e209f3c-1d24-4669-8a51-3b651a28420c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e209f3c-1d24-4669-8a51-3b651a28420c@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N+fE1vV13phxkowNfXZi+r2Gy6mcLoj5UqbV1FxQpaQH/5HJ3rPlamg1
	miYAlC/4WQcWFe+GX91lVy0kjDQDioZQ4lwLgd01b4vLT6wxB4h+OuM5hGdD/v1gGN5T0+J
	xuxuxbRJc8r2yZZqtDxUnzgdPgZoXUGg2iytl1adr6xRu/fymESwin7zkZslLrAAf6CrsSr
	BCxfVOzN5BBe8NL6Ihv54rHZnInT1giGaspwhdY165L+TtfDc20Jm7xqBgcig+r3WYB8SCp
	mq0MlF5iYUf0LnW/sQGqQGpso2k/qIKusMW5+JgIBcfanbLI+6FtbIPSZZkg/nnzo3wDuYa
	YpuDBmAl4LgFpjbwM5KwSmScaBko2rXwz4BbfrBpdp58WKzmDJk5A1kMHQPEb2COIHTbMkV
	hQCjtjb4nTvdgbXjLZ7ZLnRimf6ATPOwm6ElEd79WvPLy1JgGXZzjy11WrOQy+2sW50OH52
	0V7bHMbXmEp07UGY1w2GztPysT4hnCBsyLxzGEy6Ijo46T7pE1nKatXvt8mXrY0hPJHpbEl
	vh93Z7FcNdwQxzFwb2JqvGOOnzvX32BeozUBBUvW+R99+bzdxPmyTYg3LQncmHS7oOfy2wV
	S4WpqEjH51saBZ2fGFYVPSdefr1Vsenb/SH+CbZProjTK+of/BhmE71Gn4MMn5hv1u/W4br
	yswknyR0KWrYiW/KQYNphwpl288GflzBhiNzZ4yhVGIPaLQFMZqvFa3uebKLf3J7b052zOh
	JCH4oU9j2LbImL2GOaKbOx+SoRf0ByPs0NT1+jV3lQcg4R/0Xari5+ATvqpdLipGmkCgeCb
	7PQfZRP9w41QZ2PjjAcrIwzpGX2TFnRG+3ipcusW91pA0rXu9gVCgQMgicXqqXSxCGJ7HDy
	kFUOv2g/6JinniOOR1qXtBh/BhYEpaPUOtmS/8k2opxOW2CYMVfuOHoASJu8a7dciWrxeXv
	GXuIvL3k9bBC8gAee0OU23FKzXAwRSBvdZEcDPzV2MenD0TOE7sWxTuXAQfYgjwvINjA+L+
	NplVVcFZQPcGRXyelKFDbtqp003lRx7fwEug2HdxpELrAEl1WUZKsfMegTww/WKDbi+ppoF
	FI0VqCpf82QeYj7oXjXf/2xdzdzFIDV+CBEvg4XQEAa4VtgIWoiXi2vAIxeUxv22pTONVoE
	RVBDTJO7wONu9QwEEK90VOeKIVZiElu7nwYW
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Thu, Jul 03, 2025 at 09:15:36AM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2025 09:10, Krzysztof Kozlowski wrote:
> > On Thu, Jul 03, 2025 at 11:56:38AM +0800, Nick wrote:
> >> From: Nick Li <nick.li@foursemi.com>
> >>
> >> This patch adds bindings for FourSemi FS2104/5S audio amplifiers
> >> which can support both I2S and I2C interface.
> >>
> >> Signed-off-by: Nick Li <nick.li@foursemi.com>
> >> ---
> >>  .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
> >>  1 file changed, 95 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> >> new file mode 100644
> >> index 000000000..3a1aba9b8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> >> @@ -0,0 +1,95 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only
> > 
> > Please run scripts/checkpatch.pl on the patches and fix reported
> > warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> > patches and (probably) fix more warnings. Some warnings can be ignored,
> > especially from --strict run, but the code here looks like it needs a
> > fix. Feel free to get in touch if the warning is not clear.
> 
> 
> One more thing: Drop "dt-bindings for" from subject.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

OK, update it in next version.

> 
> 
> ... and that was my third email today... I apologize I did not send
> these as one review email, that's not really professional from my side
> but somehow coffee did not work good this morning.
> 

Thank you for taking your valuable time to review the code.

Best regards,
Nick

> Best regards,
> Krzysztof
> 
