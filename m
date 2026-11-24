Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543380;
	b=N6TYtu5XocvcyGT8mxciBzFf8GTHAMFBwdwVx+3cu0Ia141BLTvAqg0Km4ZLmu8mmecH
	 KTrqyt6ZHqIwFKP7zHYPdluXvNWkgX1kby5piKXuDsnBmVyIKlAsgyr6B8Jb+K0AJmhqu
	 Qy+YCMJJcV7Vo50j+Yxa+0IBOon37zBsCHm8lGyjAj9l2uQ0SIPNBR5KqABS1qsN50NcB
	 60e54yF2n1J1VCklU2tG1sd/IUe5iW1y5VpTxwPsY9/+XazRzaDMrThz0QCQkyMbZGALQ
	 /dTpfUId+OknwlKQSR2/eZZX1tgIq1I2pfWs0duFmpFBGU3/yXesPGpPixeMxqXqi+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543380;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+s/pSWYEicfBjwGMsJ0V5M+5lqwSaSDECXGtDKSmQ04=;
	b=I63yCMlJDbOAdpjRVtUWF3NGZk51y4+QTWr1HRZ6NUWvDaFcZMYjIJ3xqbaCs2Hxwkm0
	 CxdTR5SCs4o1/HY1EdaMOWZpgN2yVfs4PoQ51G5GXakrbqHN6hXDCSr/1YKQibgP8yO6j
	 MNxiiz3FeUyNDhDcyosAScC7TA2RrTJY1OCUWDTHmUum1Jg10ubORpClc37jWImWVfGsn
	 hfHkkyxFh80Hd8ncmJ49TyOGiuHVI9lhpLRjtpSwOVPO2p6F6r3a0r0r+EELO1aDvonME
	 hA+0m7+kxmkYJqxA2fqBsdK0hen8xP5WKP4PYN5R+WtYlCp77jODhWMcwoqEjhwDOXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClDp25Df;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5BF606A31E;
	Tue, 24 Nov 2026 18:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClDp25Df
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD501F000C4;
	Tue, 24 Nov 2026 18:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543379;
	bh=+s/pSWYEicfBjwGMsJ0V5M+5lqwSaSDECXGtDKSmQ04=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ClDp25DfPkorfz8AIyXtWi0fQxZ56izXBcw/49/a4ORshdCwZikRsC4WG1jBERGSe
	 +28ZBwp7OB1mnkUHU67bDf5jzdO4DvPJMzSDA8EKWwrPEUEEQ0dsL4GOxrBuVZEAfc
	 bUBWhBtw0k7kEdXTnpmS0CUD83/IG2ESFZt5+LQKQxvyjN5HKDSLf6xs/GgfDNq4ki
	 WM6S//jDysHo2C/bIQWKFgFbidJoCej8lLowQ3BHgyh4SNpb7zA5AktzQYZs25RNqT
	 hX4tCGU6o2UFlawjZnNEOc3CWLEiv7Gc1iFTa0KObSbtLlWWYW7HHB1sP/zdFi/88T
	 kYVdGEjOnanGw==
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
Subject: Re: [PATCH 1/4] ASoC: tlv320aic32x4: Add missing DAC and driver
 output mixer routes
From: Mark Brown <broonie@kernel.org>
To: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261123234050.150364-2-gianfranco.mariotti94@gmail.com>
References: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
 <20261123234050.150364-2-gianfranco.mariotti94@gmail.com>
Date: Tue, 24 Nov 2026 18:02:55 +0000
Message-Id: <179554337505.947306.7216985666736610034.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZBR7L1W394LeicZssVSWRjbC5NHnyZ1U+Hl8ykMixMc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZL/obTJ7GFtjMdNv/TcL+h/f+8M76k3vk+vKL8WZHt
 5zy0Aw811HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJKB5g+B/76A37iWsm0xMO
 l8mGFrY1F7rH/79usfdxQ/WXiNDZBjsZ/jvOrH9jfFnxut1ah1Vx39YELjgtK9B0LzJp58bry/5
 0JfIBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The HPR and LOL output routing selection registers (Page 1, Registers 13
> and 14) support routing the opposite DAC channel's negative
> reconstruction filter terminal as well as bridging the HPL and LOR
> output amplifier stages for mono differential configurations:
> - AIC32X4_HPRROUTE bit 4: Left DAC negative terminal to HPR
> - AIC32X4_HPRROUTE bit 0: HPL output driver to HPR
> - AIC32X4_LOLROUTE bit 4: Right DAC negative terminal to LOL
> - AIC32X4_LOLROUTE bit 0: LOR output driver to LOL

>  static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
> +	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPRROUTE, 4, 1, 0),
>  	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_HPRROUTE, 3, 1, 0),
>  	SOC_DAPM_SINGLE("IN1_R Switch", AIC32X4_HPRROUTE, 2, 1, 0),
> +	SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),

Is this supported for all the devices covered by the driver?  See

   https://www.ti.com/lit/pdf/slaa463
   https://www.ti.com/lit/pdf/slau306

-- 
Mark Brown <broonie@kernel.org>
