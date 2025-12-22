Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E6D239E79
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 04:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766377354; cv=none; b=IzeSK7bx0T4kG0o2IiEyDvIIe4FH5UzsaWuNuqADjR6miYopQ+SuSI7jhBuZPpKYv7Ki5NRBy01oJIBwc/wzAQyJZOKCVN1/f2/gUuYTj3ohkaM/JgBlcPWsArKD7ICzsEGh5oahs0cjZC5YZDoI3j0/YUYI1RcdCSAInnyaiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766377354; c=relaxed/simple;
	bh=0LwOEmSLUvqtOCFnBOOkFA5xwF1Cm1Ys6DbVr/XikT0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YDGYjMVKXXLJIKPFIQMQeBl+aW0ZBaBpmIAzqN3W9kE12+4AcGAPgUrHPHZG+KlDWt1S2IcYqYdhN81jmtJ10UNKHYETzCwxvEul8TASbBuD+BtDLvvVbBMEMmVt7FPpX8b4gT7CYh8FQ8WJ2/D4Rg5ub5ZYyANuOaV0+kWQ05I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=awkLY/5o; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="awkLY/5o"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso11671875e9.1
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 20:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766377351; x=1766982151; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LwOEmSLUvqtOCFnBOOkFA5xwF1Cm1Ys6DbVr/XikT0=;
        b=awkLY/5oXNBRR1PTFM84o7+kdw8iRolfrYgnDWMFBE2DzbgjJxUt2nSCm/rbj17GAc
         DBZmqWnoUgSJuPSndUddgJWbWocTRYysorTvNsod3FykGCP75pkuPuyryO6GhuXsSNwt
         6/HwdDJ2SN8uMfAARMAc4xVPXsDAcMULDe8VgiAd+tNJmVw3BAg3hFIoKGKQio21RSxc
         Rs0VVpF+jJGKTaFg0nBn5q1/Dp5OQXC0dZ0akMdACraTvAP8v9vUIR2TRVoepx+dSJLV
         NpEVsGJLHA6woE1SdpyzB3ETVo8i/O9co5CNU/t2LFde1IZMssOkBis7HKMYuKhTlg4+
         MGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766377351; x=1766982151;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LwOEmSLUvqtOCFnBOOkFA5xwF1Cm1Ys6DbVr/XikT0=;
        b=R6H9wMzMNot+HHlwuiJd41dTTASOzwoZ5Vf52sFwnZBIitglmauZIQ3RXNyKJRf0fH
         YjMb20uD5/rUetVMOvGHw42g7asvmhd8SGGg04153lDv2iOGIMteDV4dpGkcP3olHsmL
         UQzejmpzTHfpX5qOkkm9hYdEbe7vog3rwQSqWEKJ50C/7Nq7PBZqovl6gf1bRDjFDxsV
         Nk9u1a0EhXeZeuFowRRm+wYxS8eHZ49siimO8SAab6d9IeoYRtzu5M0AIogC6vXfPZPs
         d/U08Z4i7rlMCjfGYkm4C8HnBOkzSi1EkqhBl5lVu0R/Z7vnGTr70lNVYkO7AH8tZBH7
         ZwNw==
X-Forwarded-Encrypted: i=1; AJvYcCWdn4BUZzQffByHV8PazAifYgixwhGZk8KZJHpWOFCRT2Nw3pNB4DiNtDiY/iCfqFOLY2jWsdRynq7C1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/jBZwtCfWsGRiAd/jIy1qV/FI70SJfmNamY9DAZy3K5lvlXRA
	k3oE8s2A1AjVpJNOxXlyl1jrJRkatz0LqzzlvdEwJ1D+rRHScfseCuiLrTIfoxZ9l1g=
X-Gm-Gg: AY/fxX6gqafv4OBhOiFGQc6hn1BgjGT1KeR9UMzD7LFK+vOSL5su5753fkXjt2qvWnK
	q+WZ8E3/yUW4wW3EgcpE4emGmrB/P0Ow1D9XoQFHDc73Nf1HZaknE2N9KHypQ3IsIEPaj302msZ
	co1pWPW5HdWNBYZmRTdFY3Sec1uoEArlIx1bfPYfSDiar7wgvu0sZkR2RB/uVj4OJGN4w1zscO8
	GuDATEhObI9ZwrsVpH4aehUAFC33Kn22b8egEzr67X3F6IbVVM1Hw1sQSJhVGRKtQYuMTq5UV7C
	jTU05OtInRqOt+cCW5E76DJWIW4yODpuz+fNUaQ2SIUXyXldnmP5KcPi52tSJCu4YENkWNFeMtC
	dXdWJ0KWv+1i2BUSWj33sLZNWn2xMvoM0szP0M0nxfYTcmVNC2xzlD5AJUoBmpZX28SSx+o88u9
	wwbGPn4xjdHqIBR0SG
X-Google-Smtp-Source: AGHT+IEs9e4aPSZitB+bwWgO0s/e++ZvJwYm1tGEu5X55DpbwZELF7OMqDSKx6sWEcr+z5bswR/5FQ==
X-Received: by 2002:a05:600c:350c:b0:477:7658:572a with SMTP id 5b1f17b1804b1-47d19584900mr84023475e9.20.1766377351470;
        Sun, 21 Dec 2025 20:22:31 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:7db7:794c:2c30:e530])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm19706896f8f.31.2025.12.21.20.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 20:22:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 04:22:28 +0000
Message-Id: <DF4GIFQ51LXM.243ZASZKP9NJ7@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] ASoC: codecs: pm4125: drop bogus container_of()
 error handling
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Johan Hovold" <johan@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251219142715.19254-1-johan@kernel.org>
 <20251219142715.19254-2-johan@kernel.org>
In-Reply-To: <20251219142715.19254-2-johan@kernel.org>

On Fri Dec 19, 2025 at 2:27 PM GMT, Johan Hovold wrote:
> The dev_to_sdw_dev() helper uses container_of() to return the containing
> soundwire device structure of its pointer argument and will never return
> NULL.
>
> Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
> Cc: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>

I was about to ask to check other drivers/codecs, most likely
wcd937x as one of the reference points to pm4125 codec,
but you already did. Thank you for checking this.

Acked-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey
