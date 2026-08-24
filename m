Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706B374185;
	Mon, 24 Aug 2026 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563554; cv=none; b=MPYsmT3mBLCn9s7lEvjVty6RnthNelK3hDB+lbONHqsTYEIXi68SFnLoElbHfUiS3GXKqRXzj4IWnySIorpuj3vsUKMe+8nB+fUBpfv2eQmjqMH4hW9LHKcqUrJ69UDpeYkXyR3ARsZxGoky7lOteHE87fBDHxrsH90HCHnU1J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563554; c=relaxed/simple;
	bh=KZy83leTHRVpqpF16/Ku0U89Haiv3Ln1dQuxBgviagU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=L/D1uCkduZ/xx9it0R/UtBtv+rTbzAP/tKUMNbRdXC59T/LpsUrdd4yBt1K0sbuGhkJN94gsPgf/D/HbvdQVzFkWIk6W1hQ5ey5ARJB6lYcY13DO3RcTD0eiihg5KAyzh9GG5TqS+0vjbz3xHdT8dagVB1FbTV4Kh0Ob2q636pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=GWo4oyN2; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="GWo4oyN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787563531; x=1788168331; i=markus.elfring@web.de;
	bh=rNv8Zp/w4Hgh32sXahptz04Hka8TlTqKMPD+izguuHU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GWo4oyN2c0HZsmY3kbVi5JAdIENFgWI9+3//jownviMHVta3tFHnDum0iEqtcAjD
	 MSY3ynfYWxit9IHnLHIJ0waT73ckxe1I2V9ezDPFQXIZcOD2cTJ5r8R6pN2Z5LvlC
	 DLUV4jz1HRT2Ib+92aL5Xl5sdtIj1PFwntY8fygFvRd+giKsYPNt3QZY3CQty+dEK
	 +7l3mWZFmr/dIhQ1UcawXEzkhyI3JIKry/P4JSSaskGjBqJmLczsdengxlzWCb8Zy
	 heL3Y3p3ibAokddocyAfAh9IEVDZPjVk5L/O1Nsft35czrgQSWYJKebsFxd53eSn3
	 IQTIFlCBOUBK1DtnDw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0PR-1x4EMg0Lmv-006k4y; Mon, 24
 Aug 2026 11:25:31 +0200
Message-ID: <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
Date: Mon, 24 Aug 2026 11:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>,
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
 Takashi Iwai <tiwai@suse.com>
References: <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/9] ASoC: qcom: Add QAIF PCM operations
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OpUpV8lIBkBSehLE+Gg9dR+ufkSXZo/IKhawiwkx5MzA2g8EQrD
 SFAKLXrALq3SSexCErCH2TUa/MNZWG+pEatb1ay43MbPLCKXK08B7p3ul2yYxa9xjsTrFTD
 GUHsBtjQworF53mubFN1awqJe/AQJw8ekFlKSoYHUKSD5uZ4hdqTlxgVTUt61jOu7zjYHpY
 Zc0g6AQ/hFKy7FxRvlwMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ejGKmdAPyNY=;MzGxJgI4epdTWfxBr3zZCEwFMgt
 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
 2PV9WgZLCiszdaF7j2yw=

=E2=80=A6
> +++ b/sound/soc/qcom/qaif-platform.c
> @@ -0,0 +1,544 @@
=E2=80=A6
> +static int qaif_platform_pcmops_close(struct snd_soc_component *compone=
nt,
> +				      struct snd_pcm_substream *substream)
> +{
=E2=80=A6
> +	mutex_lock(&drvdata->stream_lock);
> +	if (v->free_stream_dma_idx)
> +		v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai_id);
> +	mutex_unlock(&drvdata->stream_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&drvdata->stream_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.2/source/include/linux/mutex.h#L253

Regards,
Markus
