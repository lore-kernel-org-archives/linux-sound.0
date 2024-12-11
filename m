Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7F41DDC29
	for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 20:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733947960; cv=none; b=FLUiexz+grybTdi4Vs3SC6ByHkQGvYRSwq+AidkBKmnnGsvyWMG8ZDmnWlCA2wt3R0jnFU74BFnFAheMlQ7QcPPqvsgWtzhr28Ti00nQpfe/EneuOKe0aDu/w4cjBTH295fFCERGFpZ438V7s+tYtF17wrLn9tVckbm882dazTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733947960; c=relaxed/simple;
	bh=/fVcvfI/nJgq0KL9QHFEEc3B//jpEClgu6sMbVc2hJE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ij/OydOoOz4khqG0+CIEks2lxwX2mS+/LseV1yN0rBtqbiMBRZr9PwCXBWen+xbkexxJj024Nr81pIgx+zEAi/m+ewF6b7HdvaHQHu2lO70T0YrHnuOKDHphqOwSQDQvBSStj/jptGerp/fEMrWFX2w33F9NoyJKq/5Lv+1kk30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FATNfFS1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FATNfFS1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3434168f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 12:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733947957; x=1734552757; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPN2+AhDq4P0SWNYP6pOLiBUFHEUMd0r1OKMpQRaBeY=;
        b=FATNfFS18kvqaKIJKr/FAXZZq8pJ/DSe7M5/JRLICn/BMsu08fL3+FZjtQ8m4JgnMf
         opTGKwMkj/aDAc5KoTV90802yFTRaaKVvfbnhqPtKXQcL5MgSBA0K4cNb08RJlVWMur9
         Bo8EH0L1D0ez1LbfxXYS3zE78TJPNRw/CE5xVP/OvqtBTk4l2iHy0Qhmj2wGGnY1Jt9T
         kMa9GWTIFfpM9YOnu4B5+7EbpePIh5tJ9DDb35Zes1aVxb4i4T0t3tQ51N1LKWXNMHi2
         CKdhHQUxhz35Vckk+VlLIMgNUiQKrHd4oHbwGxjgBmYanNhAwg0skyxrGtZEWHBrVCe2
         QhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733947957; x=1734552757;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TPN2+AhDq4P0SWNYP6pOLiBUFHEUMd0r1OKMpQRaBeY=;
        b=wGOPATCOG7+cMOyZDl6zF6M8/+MMRXcBiFJw5vm5NF53F9d57WmRJ+QvDq6HRooLJY
         OqX4mDgYUzFjkyiMIigEQWz/wLXjS9sHYIKPB5ZUNj0dO17FG9P0vci1kiwwdGZOqZ+h
         CvlnkuhU32/Y5txjo5FoGCIgPgla+G2PSEqUhM4IjFAB+8FpGAq1JN/4DN8Mtgt1lQCY
         KABJFMq7VCWOWopHFulvNxSc0ZmLFmovqus9cnQQkbML+7UbzLKgHy6FrlevtVWXXZi/
         08HJq7xZ8WpkXORWCUcnx0q7ZgUMAzwGSg+tszOd1ewMZMFJMZy9oaOQyY6VNOGXb0G9
         tjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVftOgQS6VQgUhiO/i+VIdW4Bm4dMJ+rnTcZBCGvqll2Vk3RSB+UuZacEWpKD8LTzXg8J3dBedVc0Jxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBphLbzd7bfYjFioc30jf/ogBa3JY1uucOdOgGUQrBbB4Lzkd
	aGtcRhtRX7YOikwPW1PTC5FwyoAyKldSqvkfN9Smow0YEHJoEEVQr1sid4z6MjE=
X-Gm-Gg: ASbGnctyG7hc5MJXRylQxuyqSEmm43H9oDl8BG3wZP2/g+1s4I4qBo9duyZAxD6AxuN
	RR92r/dCKTlfneFPgDQTk+Nh1OzgogVNERrp/ygBYRcwKxZ5nvHGNZ1EaG+btld0vVMKooxiXHa
	KiC0Rm/YfBhXUFKCK32jJqO5uPNiFxqMsM36DpMOvuZl6LWzWbNQ/MrCT37e6cG/nedfzgMXMnR
	Y7+SnGXpjpioHQVg3mgytbxqwn+oxfs240WF1Y/v2slh5F4772zJbwD
X-Google-Smtp-Source: AGHT+IGhKdHf66Trsg0Xay3Wa/RqDWr8rS+2Oi6F9OIapryWlc50G8eqxXs0nor3X97sj8+KlZI9gA==
X-Received: by 2002:a5d:5984:0:b0:385:edd1:2245 with SMTP id ffacd0b85a97d-3864cea45bbmr3619738f8f.30.1733947957412;
        Wed, 11 Dec 2024 12:12:37 -0800 (PST)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ee54736sm23968785e9.41.2024.12.11.12.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 12:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 20:12:36 +0000
Message-Id: <D69592H3JKB6.21HDMPXX9Q6OF@linaro.org>
Cc: <broonie@kernel.org>, <konradybcio@kernel.org>,
 <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
 <perex@perex.cz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 05/10] dt-bindings: arm: qcom-soc: extend pattern
 matching for QRB4210/QRB2210 SoCs
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.18.2
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-6-alexey.klimov@linaro.org>
 <ghlkqehfs5sagxrcvyywixfkt6ie3pwwtqm2j3n3c3xytjl3sb@d435kwmo3nki>
In-Reply-To: <ghlkqehfs5sagxrcvyywixfkt6ie3pwwtqm2j3n3c3xytjl3sb@d435kwmo3nki>

On Fri Nov 1, 2024 at 7:54 AM GMT, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 05:31:49AM +0000, Alexey Klimov wrote:
> > Add missing QRB platform name to the pattern matching Qualcomm compatib=
les.
> >=20
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Since I am not going to use "qrb" in this patches, should I resend
it as a separate patch? Because we have platforms qrb4210 and etc.?

