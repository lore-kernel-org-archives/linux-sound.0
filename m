Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF342727EE
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 21:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761858238; cv=none; b=l4yL4ZX+5jOfi6yyko+TQFmFuSXp9+upWIIrC/vulVeGo9VCutbRFIAx1aUvo7adyjh2DkfODDFJxFuyMl7tCcXY7y2JfOQ0hquHfqcgvZz0tkDyzrdd0ao6xTUkCAQ8pFfiM2dDuzgtcYAQQNwcLdqOy32W5taCppZ5Xi6NzK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761858238; c=relaxed/simple;
	bh=Mmg0QcOckoARFwLJXtWfFSkFuqQoLOpNDnE+ivjKx9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iqXwNpxvVE2kK8m05woZ8zi9XFW01cnFCk4IF6R3nLQmXJUPlTvz9Rbv77zelNeRZcJwj9a46LbO1psJ34KUvvu95PymLeF7AUheK8lEMJraLlo3jSTrIb7Tofvius9bcwrTWi+mtkrsj8lk4ed5Gg3GtZyxmZXTTLPZdgM+PcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkZ3/dam; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkZ3/dam"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4771b03267bso10716495e9.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761858236; x=1762463036; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmg0QcOckoARFwLJXtWfFSkFuqQoLOpNDnE+ivjKx9M=;
        b=UkZ3/damTIqvOWERo56XKIBZCdAm9AZkcsyynHOpmH/6mG6U03VaSjqxyFUPJBm0bU
         OP0F0NyyiR9YmK0u3w0Zi40A2+yOI85fEN60jSI6KCDZvrdh/lFK3o9+PYGMLQCOrW1s
         YZUSxmrVnjiGt+7hmpT9GHu2SzobUSEl9seEzz8gCMEqGF4ShmVRn0br2nOSM/78BEVt
         QGCm5Ju4UajqUY+AzPT++Q/n8owf7oP0nqteiumsbuu0WtM76lpdZmpdrmVau3Xpq2Us
         2DDpL30cNpE8shiEl3dIst+Fv62+t8JXpxKtPXpgBhPDyIPsN9/xuK1zVZTSX4+OHVF3
         pL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761858236; x=1762463036;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mmg0QcOckoARFwLJXtWfFSkFuqQoLOpNDnE+ivjKx9M=;
        b=pUpcKQiT7jEfA3L41H3/LAJDHGO7XleEVOx3MWIipjo7r3fUR2XrHE7BSIb9wHcTfh
         PZ+5uBRFKahGH+aea4zIOJop8IU2ZYBNgCZd4g3LiMIWS8uTx81zT86UMoY2QyP5ZlPE
         O2dhJ17zCYXe3UIcJgr08mwOKON3F8vCmzj6Iasxujs0tiyUTIlcR1hIMUtGKBnTA27g
         M6vcujVvkf8AbT3UADZr9L+u6qe1r2DqjWwPT4wnwpzvYCPezq7OcAaqZSUyaL0fqjRH
         1t+7IoxX42UDAhJkO/FWSvK/VO39RDjSXlpVmH9eFMQWoCJ0mIzG6GeQZWluWOqIk12Q
         gX4g==
X-Forwarded-Encrypted: i=1; AJvYcCUe1fyzY8Ol3IwCM9oiV0x0wNgkMXaVSxtsJhFkiF+orURaDo8eDWBA6ox+Zx8PSPsBS63+GRLtwop3JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6Oi4GW4L4V45hIebJJ7qHRiLcdEwsYrwBd33gOWWO57Oh2Lr
	QHvEQqmqWjASaLr2YkVZEz6t+5tP6QDhqdI7xXeCrOp0k0agV3JUBBEvwB1v+0KwI7Y=
X-Gm-Gg: ASbGncsnzzIW/2FrMN8FsuvJVcgAUqT0BFXxcJKiE6bDzVaFEiImkBGoa5pidtg2y4L
	8GCo24tmwjGCzXJTRe7GEe4cfnQ1M2TJkbu3+0/3NuJ4tOIUKVFQvvCnaQJGv3X7YMmlZkZqn5k
	FDvxJczs1iCkgl5WZDfHXKaMIZwHVFyokNWgC4zVSg4H5lQBRcYFTD//gTEhUTvoi+k7VaAZ5Qy
	GrxJwhoojsi3txhRwmSaX7O1ygtALAF8xShhQGuHEkCq1NLpXdcS7bAC59VHDslCqtJlVd77KRM
	ekCHihPhaOHkRwx7ICTTqlyu31DqlxPl7sPFzLxa8ShXWiIr7SpHJU59kFSZ+c4jwj5XVWQ8tsR
	aNwMOOzf+cO4WOXZWCuwMYUV9AzEHyvO1LFCED8A/dGw8yrTCm4QNBP7KeDuAeJoCJn1ZfyaxPr
	QsjiCVW4Xq3giArKf1TSVu0diRRA==
X-Google-Smtp-Source: AGHT+IGkeNaYKvyK6RfsmW9P2I2Bei9/3fDZq7zhXE2U6MX7ry6sRZVC9VoMigtpV+m4XtidjifL/g==
X-Received: by 2002:a05:600c:83ce:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4773086eb33mr8700635e9.26.1761858235643;
        Thu, 30 Oct 2025 14:03:55 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm34127953f8f.38.2025.10.30.14.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 21:03:51 +0000
Message-Id: <DDVYM9SMCT7O.17T5SIB9IEED4@linaro.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: pm4125-sdw: correct number of
 soundwire ports
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>, <srini@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 29, 2025 at 2:46 PM GMT, Srinivas Kandagatla wrote:
> For some reason we ended up limiting the number of soundwire ports to 2
> in the bindings, the actual codec supports 4 rx and 5 tx ports.

The reason is quite simple. The available _limited_ documentation at that
point suggested that there are two rx and two tx ports. There simply
were no better docs.
If you finally got access to the right docs then it is good to fix that.

> Fixes: 88d0d17192c5 ("ASoC: dt-bindings: add bindings for pm4125 audio co=
dec")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

You should run get_maintainer.pl script when sending patches and check who
should be put into c/c. See [1] too.
Here you should run smth like this:

get_maintainer.pl -f Documentation/devicetree/bindings/sound/qcom,pm4125-sd=
w.yaml=20

or check with b4 how it works.

The c/c list is not full.
Perhaps this is a consequence of putting all Qcom audio related things unde=
r
one entry in maintainers file.

Best regards,
Alexey

[1]: https://docs.kernel.org/process/submitting-patches.html#select-the-rec=
ipients-for-your-patch

