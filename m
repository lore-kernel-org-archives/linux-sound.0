Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205179;
	b=Eg2z2FVT7tzLlQyFXm1a46hJc7Uv4CgdLf5njagizt88kDzhSXd/rvc98HrLpEY5xgM5
	 lAfm9MzYhUaRYnBYgpvqx88KB4/jGHtucCLjwgpZRE2HwQpUGmuG+SqV0AfkdIKLJsOxb
	 pmlpwr9lXCAd4wQ4iYZ6puDYmvGzeTiDPQUFMe+9aLVFI2eqeAYUmgjDxcWInbXySbz2+
	 aZL1CdYc723chf+U4f1fBxVz+OebaqNSLTwDyztv/31Cay7Gt5W0myGsDpOW3CsLfV3/9
	 9WlOx/mGb86/kfG1SVqhEgvWTkpEMZFBTJ5aa9RM+PX19GzZldPKnFVVIlSoHAYQBgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
	b=JMwP/Bx5UYphuiwZDpJT92DG7IjIOAT2672KmQ/0PGwY7IOF/nnazxDpNyxNbKjsQ5cH
	 jIU9+XVBeucBmROsJvN2ZiXimy0f5FTEFkyBbvIG5x/eevvyK/ZFXy2J8fDHHsYbYG4h2
	 1hG6z096g42hx0/ApOdjfkHEgz97usYjRRUBgyu6kOmjCZjK6nySAoiJxqYfF0sFR0s6q
	 tAnZROpi4wUxw5aGh45fmBKBOkF8tlLKVQTdqPDYSZqrdCrAAhZh8JP1ag474VRzZQBG3
	 smPiYh4ZTYdcyG7F+fbH5PtsCBu5baETy00YfeGM/e4jLo9uCvwMs15U5RWS6t9Sp/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fielding.dev;
	spf=pass smtp.mailfrom=fieldingdsp.com;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F29606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F29606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fielding.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fieldingdsp.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so1825098a12.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fieldingdsp-com.20260707.gappssmtp.com; s=20260707; t=1793205167; x=1793809967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=eXbHX832eO7KCEIcf9QIePPynNTj3zpEb16xJdYbSQOpkoowvXm2FC7H6N9IvePrjc
         NYQ2YsaKAWrn2bA552yqC0m4jx9nYIEsJ+kAosssFdnCwTnhd1wrP5purilJVqmg7IW/
         9PyvNGGsC/J8INfibywsqgTj/qEsPfMTfKHOw4dM8efcKWBLZMUAodnHQ54JjxrTf6rN
         cUXimDERsjEyUBueSdi1MiLTD5lh4jvrY5h0wazj9l3ROl/0fZ8OLDTM2Vd6t6/kkAK3
         OMu88H+ojqLazQ53GiyqfkVyj8dVS6lmsTdc9R8SFLBxu3UN0Fq7XJUuj66hC7CQ5WNn
         GpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205167; x=1793809967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=up35o/2DLyW489fh+X4QflojMHUqYLCyMcZDVaxAJVP0I0dVZO/muIXot7eFurz9Y8
         UjAaKTxHAf1UIC9njMug9t8Pu7Ucaw1hx/KxzeKdAKNBIl5vTyl1Cgd9JOOSh9gHpTNG
         mfNMOPvtkvrmQbesGeuyH4wev407hQ25LbxZtYbFfN89vugApSlAkYFtbPB2cl2A55uI
         +zMVeohjWZx1gdr4sQtrx4BEogNNFhUGkHref0cmKpGKXwbhMyzzuhFLg3xdkKWj5iUd
         HDvjAoBdtOY/wZ1/RekTb/kwUXNzxKc1IF2QGgWp4sHvHau5uUQkZ/SHL88KXQY5MQcY
         2cHw==
X-Forwarded-Encrypted: i=1; AKwUvBzWzIziEf7PPP/H20b11oyIHvAqooGaOyV5ZS6WvUBG8ocZpwTEEGFn2cuvP9bvF4f/EJAuWJODyR8JBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+g6FtdSCNAGs1YAF5HZIHLsLz1empl2eoY7XgaZ7CL4t7Bf+2
	Bll6MbZYmpxJ4voZFdQ2C2JCRO8Dlyv0vOg7EaDRx3CjiCBPQa4UFgm5nWuW3uPkvHE=
X-Gm-Gg: AYBFou3K+zrBbd9OJ3Sb+sx3c8B1XZhnp0oXm2gwKEyyUTaFnOghj/nFMoHD8g0ZqE2
	nFz2HOk6uckldxG4410tFGeYZNaKZRnxAAcM9Uvn0xn18rPiKNyJtZ8rP7vxFRZQqCsHu1JCt3d
	kH6sGd4vECUEy0HkjzZ8UqC+UXSQaFaYzYJ0aqxMIDGQ2AhfRJyPFrSjMVXdfvMV5mCa1ttQr+S
	DIZyXmWfgrwscIpDFzhP/HHktmZfk3SUx7HuxRzch1v40W6OGPfFr1m48jwWXV5HHkJDrrK31p7
	VUG329qxYZohFE15vGYkqSImq1oGu3Z0/477Ap9QrwgDWsBFZ/e0ZFEZEzS6dqYhl73vJImZmLz
	vjaPE2c+r7+ZR0uXBXs6+THmu/t1VqMYyOfFYDoYDkYFF8HDSh1rsX9vJk3zwyJfZ8j+yT8xSlx
	YFPLHwSRB0jzn2mzsfoH99KJCjQCKfrXdVpNmmV0O5GXh3by3gKZBA6dIDeQt+iZVTujf06Us08
	MBjbqCDkpUrkiCEJjpAmqPc2lv+CGkX/CpjTiS9FSFkkvjTH+IJMBrf1X1C0FanCiaI6+y9j4rk
	cVjarAxn85e6A6lPUpxfKcFFzpe9yj58jC1QD08fGNcyX1wH/GOoKfVY/U8O1qHdzhQeUT0D75H
	Y9rGWfImBHD8l83SZ0d6hhTSVpnj/
X-Received: by 2002:a17:907:2d25:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c49bdfd85b2mr258903766b.43.1793205166976;
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
Received: from kneiselgnabe.duckdns.org (p5b03fe53.dip0.t-ipconnect.de. [91.3.254.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm637108266b.13.2026.10.28.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
From: Fabian Renn-Giles <fabian@fielding.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker protection for WSA884x
Date: Wed, 28 Oct 2026 17:31:52 +0100
Message-ID: <20261028163152.26892-1-fabian@fielding.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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

Hi Srinivas,

I tried this series on a Lenovo Yoga Slim 7x (X1E80100/Hamoa, 4x
WSA8845, Linux 7.3.0 based tree). I found one bug and have one open
problem.

1. Over-read in audioreach_get_module_priv_data() (oops on topology load)

The function allocates
struct_size(pdata, data, le32_to_cpu(mod_array->size)) and then
memcpy()s from the topology blob. It crashed on the first load of a
topology containing the speaker protection module config blob. The
cause is in the size computation. data[] is __le32, so struct_size()
counts elements while mod_array->size is in bytes. The allocation is
4x too large and the memcpy runs past the topology data. This is what
I used instead:

	size_t len = sizeof(*pdata) + le32_to_cpu(mod_array->size);

	pdata = kzalloc(len, GFP_KERNEL);
	if (!pdata)
		return ERR_PTR(-ENOMEM);

	memcpy(pdata, ((u8 *)private->data + sz), len);
	return pdata;

2. Slim 7x bring-up: V/I feedback never reaches the DSP

DT changes for the Slim 7x:
- The WSA codec list is extended with the VISENSE ports
  <&swr0 10>, <&swr0 11> on the left pair and the mirrored ports on
  swr3. The speaker nodes get #sound-dai-cells = <1>.
- The static port-mapping is <1 2 3 7 10 13> / <4 5 6 7 11 13>. On
  Hamoa the din ports are 10 and 11, versus 12 and 13 on Glymur.
- I cloned the CRD topology and UCM, using 4 speakers, with the
  WSA_CODEC_DMA_TX_0 VI capture at S32_LE/8 kHz.

What works:
- The card probes and the SP/VI controls appear.
- Normal playback through the SP graph runs without errors.

What doesn't:
- Calibration (Operation Mode set to Calibration, then silence
  played) times out waiting for V/I. R0/T0 stay 0.
- I read back the SoundWire master and slave port registers, the WSA
  macro SPKR_PROT TX path enables, and the DSP module config. They
  all looked as intended.
- With the SP graph active, the amp stays gated and playback is
  silent. This matches the calibration never completing.

Question: is there anything Hamoa-specific on the VISENSE path (din
port numbers or channel masks, the macro TX decimator routing,
multi_direction_codecs handling) that I should check? I can run any
debug patches you want on this machine.

Unrelated noise: SoundWire parity errors/clash messages appear in the
logs, but they also show up without the series applied, so I don't
think they relate to it.

Regards,
Fabian
