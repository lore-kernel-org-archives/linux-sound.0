Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DC527B4E1
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953680; cv=none; b=Tbm7Fy43w0syHGHtgCjj4rEGmweMRyle78RO64htFQmLMZDvHe0YLMBGZ+uHoqkxuwZ4jemqKK0KxE4iUQgQ0zFo0rgGRzbR/RAPrVfFasKSsXCT3vJtiv7LWFWT+57u83E2hhH24vSCa2vRoQqFoLyakW3gmUN8K3fI5NB7CiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953680; c=relaxed/simple;
	bh=byM1gA6NVIvRuKX+ikW9/WDAziLBwNxEBiTHEmh/nMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QkzVYxAfrta3LK45GXfOdGL1APcuS/VMtrf9fS4JK5LJ/3D4cKn2Ph3phJW1gl1B6RFYWnRSSz1Eg/mfpxXsNwLr2qkjIjdTDOqt+Zvl4DWXrMP4UGCaxepnJezCd8kC9E4IFQuhv7rUMfEw3Cwc1bZHDdjYYFm3BV4ayDIabHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q3xE58ip; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q3xE58ip"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ebf23c0d27so372957f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757953677; x=1758558477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seV1ou3zNHbYzr8foh2H3pTmGgfBvTOop43lTeUOhsE=;
        b=Q3xE58ipTos/IEQRJV7dxxcfzkEXK7y8F5twR/h6sizkSdroW1OvfObKrVXR9MfEm5
         BkeoTNY/3lzh+frdlwpXQxNklRa8TvKQGT4CYzICoNoKwQ0zDCOu7xTRj2/eCtGYrZZN
         91xOK0Bi+WwG86u+XMt+wYHPn/HlERpP1ehTcmPTtbQShPOpxJA67IqdvUyHxwQ4UYeK
         VQc/2ZR9bgiWo1CBahcqzGICp+jwngYdbxtZBdHTRfRiylJrmYDFHDpB4VtbEfeTeaXi
         NOSjLO/t8qxts56KMRPWVhtyo1LMlZTQF6UcL5V/zRXVnPoPpfZNunQ5yLcwqHEDPjZ5
         cydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757953677; x=1758558477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seV1ou3zNHbYzr8foh2H3pTmGgfBvTOop43lTeUOhsE=;
        b=CsJvW9q9qe/SCsalwzYvpEOO9o/bEELosVABHXbsIPBeK3Lz6hV+igG9Y2ljtlucVU
         qhaJBWtPpesC9ioY9+CZHXLruswg56Ag3wH+tk/WLwPWu5XD2wVvklmJbsKWOmfpTGxt
         qfRRnJsN2d+jeR85ZwXGSVfLPA4iJWkooXTn1+CLmyDtGZEONOKlCF6wf9nh8QE5mMEn
         vmKAN8n76f1G1zzc0LOY6tZ+aY7/6A6/CjNoR8WaDRmptUP7tsnMq49PXm08vTaBuu/9
         dj0ibS4xPShTidh5Y+Ve24WCSxueu8XBmqw3afnVg7gnOTGoJH/wK52aMDiqHotKxBjg
         bI9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUH/SiZcGryc6V4ZVLDZ0VphuHJe7HMULXIfhv8MHVced9wpax370GIpycgVXbWpOLvsqdf1Rqs4N4bzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKbVjhwkTobrXeN4DadmhmllC/0oA+lMPY4UuVhBs7m6nvdEr
	2I30FxD5tiVZ5UyqoLU014MxQ0Ua+osiMfr4RaW4gFctg0GImpTSW+d2CZJLrajETF0=
X-Gm-Gg: ASbGnctYs1Svks7iSik8ONNDpOYYKza7c8xpVFK8BPASQGd/5m87WXQexFH42sRCLRw
	vLXI5FgeA6XrajUXHY4tJ+CI+B6tHtWbJRQLLZUYPUCl27TGiSr6axZmSo/DT4MXI1LSuoIH7c1
	8S74mboWjgVk8TkNNKkVCDtzj+MCy2rR3/7XuASlwuIH5iACKQdv7Z7RKXF6mc3jpy6LfzXvy70
	2ph+igDMj3gPQcIk0nk0zDGfG/n/C4UzDdHbMjhbY2iSOrHxdq3jKROGYOKp5z0z52OK+nSw8iN
	CyQBFJ81e4yK6BgYZLa6j3LbxjaAu16HeNFT2FkfVFr5PKRyZq6cCHZYUHni7CjAOmPgQKSAIVb
	y9yvVumzlMHfsilJ3u7gsIYlrNm2YEK8zAh1koAU=
X-Google-Smtp-Source: AGHT+IHfqSjdbY1hyVmBlldv6pS0JxrU4vVEyDVh7UVEJQC2k7uVsawo4o6Z0mdIDJELMnXHIe67JQ==
X-Received: by 2002:a05:6000:2509:b0:3e3:6b81:b482 with SMTP id ffacd0b85a97d-3e7657995f7mr12205876f8f.28.1757953676692;
        Mon, 15 Sep 2025 09:27:56 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:e60f:4b6c:1734:808b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9a066366fsm7857989f8f.44.2025.09.15.09.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:27:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 15 Sep 2025 17:27:51 +0100
Subject: [PATCH v4 4/4] MAINTAINERS: add Qualcomm PM4125 audio codec to
 drivers list
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-pm4125_audio_codec_v1-v4-4-b247b64eec52@linaro.org>
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
In-Reply-To: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 christophe.jaillet@wanadoo.fr, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Since new audio codec driver is added the get_maintainers script
should catch the new files.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa7f80bd7b2f8bd2099acb9f38070498e7b1cc7e..b799748af2cbb47d048c70c7b30c9ad191199954 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20720,6 +20720,8 @@ F:	include/dt-bindings/sound/qcom,wcd93*
 F:	sound/soc/codecs/lpass-*.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
 F:	sound/soc/codecs/msm8916-wcd-digital.c
+F:	sound/soc/codecs/pm4125-sdw.c
+F:	sound/soc/codecs/pm4125.*
 F:	sound/soc/codecs/wcd-clsh-v2.*
 F:	sound/soc/codecs/wcd-mbhc-v2.*
 F:	sound/soc/codecs/wcd93*.*

-- 
2.47.3

