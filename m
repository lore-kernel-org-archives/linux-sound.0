Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4079229B2D
	for <linux-sound@vger.kernel.org>; Thu,  8 May 2025 12:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709079; cv=none; b=fxpqC6eJVMbAPwPtapdKA1k7U0bX2LAHbyiqx7HLNYjurmdAwGyUIjXioI5svfgAgljfNwcbwQ4QLARhE9lQdw+A73hHwb7gl/PoSxaPI6qpB/GTgJtpReqTsEUvteOUWmxVPyiGgqVR5eiqz0nvIq3fRVG/b2vsCG2A2VveRZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709079; c=relaxed/simple;
	bh=fie8ocClExZ/oy9M+sB0ZEiqCjjIW+Pu/7pCGbHETXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qi8Hz09kJAw2iIR89XAGXgiFQs9sUFCduhV0TUucMcg2BobPo87BOnDwkQ2ZaaENvQ2+EjSzVodJaM35jsvhJEu0qi7cWvAJqgvyfi2G2tRdsSOpZLA1MbPYsuDXhD9rSHvylTUb+6pmmTeWhr0b++9gQ3tRCpUBJT/F8MaXMP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P5q6afpg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P5q6afpg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso1240035e9.1
        for <linux-sound@vger.kernel.org>; Thu, 08 May 2025 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746709075; x=1747313875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyfX9coirJq8Cdaxq/W+11Z0EprDF7VsHit7r1SH4b0=;
        b=P5q6afpgQqcbcquSjaWapD6Jfnidy/bHerAnQhp92Rv9w5QHyvw1EQdhcOAnMGTbTN
         lxTZFH8kziCGqLdotsuSX9ifMnrGDffbZ9OTlj8xgEOPUb9gRIuU1ncho8jpiOCCyKSk
         4ozCaUzTflpGYASma6JWjUhcWsSg5c9RoelcbG49bovnIUdFOHwKd2S4aryeY21jljlw
         b2DCouK28BOXg5w5rD5SUJDl5YmlesDpUJ/H9w2ie35jILfYO26em366xpJC0EQbvKfh
         hg43P+9uksSbKNUR7H/cvlT1FS4T0OT9S59A4gWkqh61YshKh6MRfj9CaaYAy1L1E3zw
         fzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709075; x=1747313875;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyfX9coirJq8Cdaxq/W+11Z0EprDF7VsHit7r1SH4b0=;
        b=Bu/GQ3rHg1NdP57xBezAVmKjO14FTH97zFTJ1xnXPiDhUBD+mWMO6gpAmlniQqk3+r
         xKl0ImIN5kx08GaGOuviCaq6FkRZLNEFARrB9GHpCkn20ObEj/naU4BNfhG91GfryPmJ
         5jGdPlwVsG6SpT3Doh7tYwPj4Pv/fnP6sIqbXSX0bzJA9m6c7Df5/3FY76kUuvXVFfA8
         hLvkVSx//9zRg4Vn7aZO8VUg+5WFfW279U7tjNW+fmzTrAdnx+zRQF51l00180Xww0he
         YIPKoeYVMIkLYqUoalfU+mXQBZyKjz09oUN1aw1B5Uj/JWCvgo8wXQrQcQcAAvMkfTGj
         CPkA==
X-Forwarded-Encrypted: i=1; AJvYcCV/pRz/oMuysuH9BUKtwKDhXT+HcOZtyHCSrhE6wkg5GU532O0jIpybBm3jvi2jG/3qcVFDTRMQk46/mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN8eJMXc4lDcMLj9qPao55v091S3EP/+IiaUjmcztZOLtgyMUA
	m7a4WEwOB0IT+3XI7/+8ov0aBjmYG0/CUqz81M2Y07FWP5fzN2KbS4DQQC89Avw=
X-Gm-Gg: ASbGncse0Bkdi2GLeQDrS6G87oP+mgM1Aubm71HAaNuaMx2eqNZkRpI5WcCWn7K6rgc
	jE1b3qQed1Y1iIMHgXePcK3dRQr/UikUv9ryvMdASmd21tcHOsVaYQbQ2zQpmVOEpR9nX0qCxfB
	vLB6WIW/Lu2Exxqf9Fwrq9GWYuqb6phOgasrwYxkjwgBp/LGcYwaae/0jQMyjaj6xoLozxFkpzO
	FBgqNlxJqV3Qck4pB5ZAKVTDJUHMPPM13GtZkxHefMR9E00+HslnjJ0ItLtShZeyyCQshw+5v5D
	QVDECfEk8SEd17kF7+XwD/CpHdqVIQHIRhs1POEOaohuQsaJxJeolJrHzIk=
X-Google-Smtp-Source: AGHT+IEUVIi3T7YfyMxv2zjt1ItTGIIG2vX6ZluzfArIlt1K86WUAmIJcFc2kVGlurTkPNqOfZ9GHA==
X-Received: by 2002:a05:600c:1da8:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-441d44bbf97mr24647605e9.1.1746709074954;
        Thu, 08 May 2025 05:57:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd331221sm36183705e9.11.2025.05.08.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:57:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peda@axentia.se, broonie@kernel.org, andersson@kernel.org, 
 krzk+dt@kernel.org, srinivas.kandagatla@linaro.org
Cc: ivprusov@salutedevices.com, luca.ceresoli@bootlin.com, 
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com, 
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 johan+linaro@kernel.org, Christopher Obbard <christopher.obbard@linaro.org>
In-Reply-To: <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v6 2/6] mux: gpio: add optional regulator
 support
Message-Id: <174670907339.90037.743394782268502286.b4-ty@linaro.org>
Date: Thu, 08 May 2025 14:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 27 Mar 2025 10:06:29 +0000, srinivas.kandagatla@linaro.org wrote:
> Some of the external muxes needs powering up using a regulator.
> This is the case with Lenovo T14s laptop which has a external audio mux
> to handle US/EURO headsets.
> 
> Add support to the driver to handle this optional regulator.
> 
> 
> [...]

Applied, thanks!

[2/6] mux: gpio: add optional regulator support
      https://git.kernel.org/krzk/linux/c/12d3c69ba2734b5908e0ac8ac2dcbd0cc28fef3a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

