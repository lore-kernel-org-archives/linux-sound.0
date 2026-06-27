Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9983AEF21
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570063; cv=none; b=DxrtGMVUdto61uOnBD313ZimIgGbqYdTGoX650TNfI/loljJSxolHLWwZLbeEOk0u6puQ2F+trLoDcGuG6zxPBYUTVJ/D+VLXSn0XFi1rYF0KO5tO2lP/DLF3pA0XT+IeuEf7WNX9iGt7zZvxtbPw2e9BNpsOHaaa5hFJqY8bTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570063; c=relaxed/simple;
	bh=UjaUcqumMacUQ9KI5r4tiOS1vn4x2pFxKB8z2st3wU0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ubalY07DnzGvFTSRSYYfi6YjgtqGD8ufYIx2hikGX0T1H5AtWs2aoo9zp0moXi7OpEVHxxQr53h3L9K8lS8Cq9hOj7ISUgPiG8ecsb6279Oe4vNGwMGZpbiZggc/J6PscwD92DvsEhUQ82DFBsNDQhVT/1NpaDPRzvkWHFTFl1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drd9j8oA; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drd9j8oA"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39979c2cc8bso14907111fa.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782570059; x=1783174859; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjaUcqumMacUQ9KI5r4tiOS1vn4x2pFxKB8z2st3wU0=;
        b=drd9j8oAgovQZR3TgM4unhAakpdstwYs2mftRvmVeHBCYDWGVGXmtGt6LqMN5cmebU
         64/bIUBnLM+VVFddNAt6Epu+JkLPusKHjXxeGCTbgU3iJx6r2KfNNE/xc6NKRsIe4uWa
         lIpgfMtcfuOa50P2EZuQzdajcF3MBkxbiDjfaG1Sk+FFOT1kyg9CIRHqn3BfjPJhz2E1
         QBuHSXSu4j98drYUmQLszNsVQeobWAdkP3clmVIQ6KW8DxvLFCNVPll8+p+1EN/B50Px
         Oo9Ubkt8gjnKUxLcxhukRvegCwNFbPuREaOPmdHvJIrlVzYFW0iJ1rsxqcD51ziKy4EP
         x0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782570059; x=1783174859;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjaUcqumMacUQ9KI5r4tiOS1vn4x2pFxKB8z2st3wU0=;
        b=J+qhLQROvojCfdfblWW0OjNO9qIm2nbmcry6lE/R4IMyMOTH/ERL+WqCGh18KIt06J
         tJCpcRd0DvPW8OFR2aV4LS4ui4kBL7cL5Rtw459SU2xqHIJ1DImsncYAVMHH09Q+hX+W
         xeanbY1ezprD9MlFPtYWL+yzoUy1Qd+A7t5Eqo/Bk6n5t04nB11+TCS1+a5/mkKALOpi
         BX3j5iDqIRU6fkF5Hi8AZrrpur5b+zYGwy7HezePuO/rH7L/7HfCL/SniOtYv3tF9izx
         h6nGsQm2fKWtLG1HyFq6ocMr27mKgnv1pcEqhkry2/9yfM2bz+vyB5VmGmxd/mWbRGlz
         LgKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEOQitkcdHsN92PGrwGLqmhfa8H+Iqr5tBHbxciSZ55s48C0/W2DKy944M61ZcQRhxfPz8iPYygdmarw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyplGTY0UYWKP7gToF42UIaw9NNV+9IJ922NTEilLPAtPyfxu4d
	rGKhourDZbczJrDdAbgzmeJSC8yKB4XO7nrlm2bnF6+qZMkfny5Q4zx+
X-Gm-Gg: AfdE7ckt2HQl8YEgCUfYb2RdsuinESuoO9xGVHe3YkR1A+KrF1XWC5RHAUiFAwPMiHa
	hor8pe3m5SD2/Zd1xQ+PL91wUvL5eWL9J0CnTCtkW2VuSSUTNbtECDnwWDf67V1tl2kM+04CvL5
	3WPpFJiW+QxGcQVyvp2RzmWjjp4BI4pHcxZZeyG7ncwtaL5HAiwlC6UPgNdYK8fuqHmepbb9o5K
	UcU0qyr3B955SjP8GAMo1mmUmHjAbnK/2Nya+22rrz9osBS765MtJ6z/6TyaMopOk+7f8dkm06d
	EiZ5EwuNwTbDntHw5VWcCLM7hA09tmXevhWRdlv2Mk1bbV3LdpSx3Cqxo8D+C/MREvhloP/Ayya
	2U+xRMTY00+yfSowFsle63zB59ka07dLdg3MRQvmYrQvkm+IXVbQpynnMWunpwhLlB6jWszW1bs
	ohXU4WAvj76Qp/aOLsyfMj3FVyiEkMLAEetKZ1b9Sbeg==
X-Received: by 2002:a05:651c:435a:20b0:399:99f9:3a17 with SMTP id 38308e7fff4ca-39ae15d1919mr7629901fa.21.1782570058841;
        Sat, 27 Jun 2026 07:20:58 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b1a7esm59752681fa.40.2026.06.27.07.20.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jun 2026 07:20:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <thanni.i9bbkrc1oza2@postmarketos.org>
Date: Sat, 27 Jun 2026 18:20:43 +0400
Cc: linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D982B214-552D-4E21-AF98-4367C5ADC62D@gmail.com>
References: <20260627125030.808058-1-christianshewitt@gmail.com>
 <thanni.i9bbkrc1oza2@postmarketos.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

> On 27 Jun 2026, at 5:08=E2=80=AFpm, Ferass El Hafidi =
<funderscore@postmarketos.org> wrote:
>=20
> Hi Christian,
>=20
> On Sat, 27 Jun 2026 12:50, Christian Hewitt =
<christianshewitt@gmail.com> wrote:
>> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 =
+
>> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
>> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no =
equivalent:
>> it only toggles the IEC958 DCU, so a stale datapath FIFO can be =
replayed,
>> producing the "machine gun noise" buffer underrun - on start when =
switching
>> outputs, and on stop when playback ends. The latter is audible on =
devices
>> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek =
Play2).
>>=20
>> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) =
on
>> both enable and disable (audio_hw_958_enable), and when reconfiguring
>> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the =
same:
>> reset before enabling the DCU on start, and after disabling it on =
stop.
>>=20
>> Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>=20
> You may have forgotten to add Martin's R-b here.

100%, but I also missed amending the commit description for the v2 =
change so
there=E2=80=99s a v3 where it=E2=80=99s been added. Sorry for the noise =
everyone, seems I am
a little out of practice at submitting things.

CH.=
