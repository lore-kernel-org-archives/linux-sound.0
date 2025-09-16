Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78861202F70
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 04:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757996436; cv=none; b=DRCaYoWL+8oQivYLTmb61tFSLKSK8b0gM1KHKf+i2QH87WdQy+LG/m86lOtgjlCsa0KnR/ssDbv7FlBmI17kQrEberdD13V1GQE2gYm89YU9XYUuNVLf5rQ4CjMWQbNYVeJl5BnUhB7Bdnfp2aWILqv3JGo6poChi+iLokU4a8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757996436; c=relaxed/simple;
	bh=e1rcHmTFJkGfFB3VIKgcpCp3VNVyVXBAQwhAL8EFAI8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Hz6PxwEvZn23ndKyWX5Tn+KBCRB2L/ayhnJYldxpirZl4Ul7Ku3jN9lmr4sTR7cInk2zmixuQo6W49WDegrd9HYfio5l3hTzmmatF6MJN26Cp4aPGUmhEosds8zZWECVYQqYInc8CN7WsFW8uc2vcdMfMJTUHRCs9XMtMrgxdOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NJ7+qRQ5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJ7+qRQ5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so44836695e9.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 21:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757996433; x=1758601233; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbjhON1aEUjnmF86GNcLADSW2ksaPnb2/pfGFIezxSs=;
        b=NJ7+qRQ5Ol5iYGO1rt1gIExwdXi7YnGa7/TYNdT8YR/e7XWmUzi9rbdW1iQZXmNaT4
         6P37bhR8mHIkRmvevT8It7PcmGVeZiHPcctdNYhEkUa3/7m4lLeuMGIRX/bk44anHRMv
         YORrKAnMXGK1vykIgyt/vPt5qtNjdeVG8jsntsGodNy3VQ/3RirH5Emoz+svcT91bJPJ
         dtJn/aXJO/QSzQvyjXRpZDG9awAUZOr9fwBpK6n8pLQhtkIjOU5PMqeXCYfNfwdfmKUa
         bLqwck/CzLFq7F1Yg9ppR1tZ5QiJbCDzpPqr5WLSj/gXCbQv53GWTlcC/QcgrBlryzvW
         ih/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757996433; x=1758601233;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZbjhON1aEUjnmF86GNcLADSW2ksaPnb2/pfGFIezxSs=;
        b=ky6Hbtwhg2BkbpNh9TZGkyqS7mPpv4FlsSELYb0pRGgS+txaS5/1EY+wb4LMRvDl7i
         NKR16T5O8VmmuGGuXjmxsYjJQyZi6KVp2KIxJkfbBKqYJ+285pULy4jJLnBEFRO6vUmW
         HxcZCt0Jpex+IAYuZ9O9AU6cxSuTMjzwQLDd4h7Ky28jwy/Wx0R2jdh3siuW3ZDFsg7g
         IptQpUEzqJgFoUapTSLFIvHhBvVSKeXmCP0cDupD3Ma3ey6OLlr3ew6/pnbKMJP6EQC4
         zy94PCaAHfrII0NCp3LQF3RHFGIug8p1B3C+Eb+X7XM6dEe7hXNKkCgju4hHwMIxJqGd
         Du5g==
X-Forwarded-Encrypted: i=1; AJvYcCUdbqEBC1I/G/IqQXG7x9+fnp3YF8vykuRAVxzlL098u2ekyRdPX4IxiuSF9/xGatXIgnYX+Uym2cp5qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWwORLGgvaIY6bfGaXphA2JUD1Ke3c8UbUn2nnkaivBvcgyj6
	vx4uw3MNERJbWUrtYKY6qRw8dhCURwAoDDiHEByX93H2dd9ujJRUJb6JDyCZ72y63R8=
X-Gm-Gg: ASbGnct5Fu/6xLwjLab2jJmwnbwfCNrsLiJuGr81FjQxKZheBs6pln0I6qcYg/TxBVA
	04adsVcHCTOI648MB8nZbqnKS5lZSnwBnA38t4jCcSPHI8GMFAtNZCuQ/WBixhXEAfWSV/D5v8Z
	gwdBuin55PS/89eKFBSQLY4CeV1oW4Ebd1EotbsilohJLJaqInEMlbAW8QpISRE168TEyusNMvG
	aVCdYBV9MORc5xnceUIKwXsSWtE4QAt22k4wyBPFG+Xizibw0TCQIVAii0civd+UeJes3wfL+/p
	WmvYy5frwwk9PcMWs6PQc/LTImKSjVszHCCTdypfTEh634AlevP29YXFxfUb+DvV+nE8xnTVtG7
	HX5E2dcK0fmGNhJEyJu1UFniW34T1exwbMan9tbWAKSFxuZBrfzhF6dOtnw==
X-Google-Smtp-Source: AGHT+IEw4noloZfesZuLl9pvWno8XSHNkI3AdHX/BIJMPEdjVWwGHCpt+8W0ExziuokA3efqM7g6FQ==
X-Received: by 2002:a05:600c:22d4:b0:45c:b56c:4194 with SMTP id 5b1f17b1804b1-45f211ccb4emr96488815e9.2.1757996432784;
        Mon, 15 Sep 2025 21:20:32 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f28c193f9sm124282585e9.2.2025.09.15.21.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 21:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 05:20:31 +0100
Message-Id: <DCTXQ3F6UWDE.3OK991GHOLHAR@linaro.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Srinivas Kandagatla" <srini@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Patrick Lai" <plai@qti.qualcomm.com>, "Annemarie Porter"
 <annemari@quicinc.com>, <srinivas.kandagatla@oss.qualcomm.com>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <kernel@oss.qualcomm.com>, "Ekansh Gupta"
 <ekansh.gupta@oss.qualcomm.com>, "Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 1/2] ALSA: compress: add raw opus codec define and
 opus decoder structs
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Takashi Iwai" <tiwai@suse.de>
X-Mailer: aerc 0.20.0
References: <20250910-opus_codec_rfc_v1-v2-0-35fb6536df6b@linaro.org>
 <20250910-opus_codec_rfc_v1-v2-1-35fb6536df6b@linaro.org>
 <87zfb2vf86.wl-tiwai@suse.de>
In-Reply-To: <87zfb2vf86.wl-tiwai@suse.de>

Hi Takashi,

On Wed Sep 10, 2025 at 10:17 AM BST, Takashi Iwai wrote:
> On Wed, 10 Sep 2025 10:11:41 +0200,
> Alexey Klimov wrote:
>> +struct snd_dec_opus {
>> +	union {
>> +		struct {
>> +			__u8 minor:4;
>> +			__u8 major:4;
>> +		} __attribute__((packed)) fields;
>
> Bit fields aren't really good for ABI definition, as it's not well
> defined.  I'd rather leave it as a u8.  If any, you can provide a
> bitmask definition or a macro to retrieve the version numbers.

Okay.

> Also, don't forget to bump the API protocol number.
> It's been already increased to 0.4.0 for 64bit tstamp support, and
> yours need to increase one more.

Can you please advice if minor version should be increased i.e. it
should become 0.4.1? Or should it 0.5.0?

> (That is, please make sure to create patches based on linux-next, or
>  for-next branch of sound git tree.)

Previous and this one were (re)based on linux-next at the time of
sending. I didn't really verify against for-next branch of sound git
tree (I know I should).

Thanks,
Alexey
