Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AD2F3613
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210182; cv=none; b=NSsJRCubSX+Z6nnNXC5nqhwRqcXlwsgSptg8cayzvXyl4I4jBdORH8XGCC3QgnVolHTBz6DQsVp3wM3XwwKc/HYB5wqZb4cUnUF3yeQIH5b6zC73DpR37indCBlgQwvwI2hi7JgXc+xa3xK6guveyVnO0uGKrDQKVsVo29li+OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210182; c=relaxed/simple;
	bh=yThxXVSm3+hK2gArS0hottDcHjOB+llPRjJdv2JM2fU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bcvp/DkoO2NpKETuGAfCsC5VS623tnzAN8ALKekIObNhAm4T97lPIHC814wxN5mWkDGx5C46ujx9WxZoA8ABjVCKQT7q9feILoesm+Cctr62wCgZ7PPAikQTWiu5MWhy7LzTQxrcfvS93CcZUZMkbR4ycdUZvXR4yawNqMbpFpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OYR8Ad8x; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYR8Ad8x"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-427087fce27so87628f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761210178; x=1761814978; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFuE0Qcs0juStrOxen2a+4uOIfGC8uiPTlRJqX3Rs48=;
        b=OYR8Ad8xdRpXqnLxdOiHx/F+ZVayo+t7QvNTuLKlohSM/VcwWJqGuz6w4Gs9cabP/N
         lGR5OD4MRbS5ijRqqGr9iVAlt3Aozit702/CzvpDuGPptptwxvD2RH3cDwpLsJgo+OO7
         MFlFVbLEMcAGJ6Mz6zcphhSViUTzbUFH5bY4S1LpkqrGVbDLCkESrgKY6SaB3L0YmKo9
         zgU4MC1KONRZZF1SCE31L6nilGYg4+yh2uEEUcb5erXGgFtOozrvPSwdp9dIzR300woo
         bVCKegVriSqdWH/OZ4Xj4sBtjStcw31QSrzSo1Af7UW9MLHBQIDRQicXj6tOUn4KhXcd
         N+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210178; x=1761814978;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFuE0Qcs0juStrOxen2a+4uOIfGC8uiPTlRJqX3Rs48=;
        b=F7UqrI2BgtIm057F6vWPvY/QxkPjNtGvGZbDeFcs3Uhrx3GDxmz/O/sa1qSvtfh0+h
         yIGHF+KPikqRzmx1dnZtZFHfsFL+YEB4u87OeB6fnBnqxKkMbOaLKhB22e/NUAV5LyoO
         OydXWQ33E4/HGKiL1wOi+WMiB5ZHC+Pn0W0bC4DFCIbBHAX0tn18XNOVcqUY1VXzB+a3
         amYSG55DjvzfdL5a/hGe2aYRnYxVI3EwKsmEzUrAoICAmSQ0zzaZkE6WkCGkNqQ0Wr9u
         22awyyBI4Qf0U8cRfkZxpXLP/+aZYZiH+FTkAehmNmE5jYHNcLggEbULUSoyYB+iPZuL
         OOUw==
X-Forwarded-Encrypted: i=1; AJvYcCWGITy77t7ZMyx3kXJ/vmiITqXfT3O3WMxsxPpP/okfWm3e1EG+iTYMk27xeQBaFKoOQQx38V65GM/7AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPwLbDYqyV+w6cmMn+SCYfHfblvu+nlqB7Yc6cEGXVZBYnwkM3
	kY++7+GE3pHPCgGc0rXFGDlrFmyRpuPu7bRCY2ORi6KGVI0fM0GC+BWm4JdgtuU/gkM=
X-Gm-Gg: ASbGncuxOuLHpCBz58OezzBih9ahw/jU/bCJIE5lcMsKeJxX0ot1K8oQIyNUQ/6vEm/
	8YZlQAxqnH/N5GM+6w+HhrBPaFCQVrS0WLKmPit/xNQdtJVjoVj/wg+DbInOxVAMFnMIAiQ/r1x
	H0yBQTjjQC436gsPpTlEiOXvkMr3MNpuHJMzMMcRNoe/YOF/4CxjUp3tAcB9OqwoTi7kUQlNJPe
	d9JUcaUucBYH8CfTuGyKBJ47OXD18RxHxafIC4bIoHKRqHif7faY40z0g/dLvRsPanZGa/1qgHH
	cOb2H16nHCQvq34TRw8+NAmtRwUt6m480plKuKeyPSdb8bSuahUhEOm05zibBhCf4hL3VlXBD8f
	HzGcew0tQjuFtYBZlVlfyQ3kCW6UOXHK9dRZFwM+WkTkFnICyqob4Y4Fg0WW+2G/mLcGzD8RKg3
	Bb+Bd9mkvha5kVa8VJ1f3T7xV1hcg=
X-Google-Smtp-Source: AGHT+IHpSYP1sR+pts4n30k13thGKI4DumOkmgxbujGbWwk5uMEc7QI6iqGk/fbOCQUf2LU81yrRFw==
X-Received: by 2002:a05:600c:154f:b0:46e:46de:ebdb with SMTP id 5b1f17b1804b1-474943c0ffbmr41606205e9.7.1761210178110;
        Thu, 23 Oct 2025 02:02:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-474949e0a3csm57557415e9.0.2025.10.23.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:02:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC 0/2] ASoC: codecs: pm4125: Two minor fixes for
 potential issues
Date: Thu, 23 Oct 2025 11:02:49 +0200
Message-Id: <20251023-asoc-regmap-irq-chip-v1-0-17ad32680913@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnv+WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyNj3cTi/GTdotT03MQC3cyiQt3kjMwC3aQkIwNT42RjI0MzCyWg1oK
 i1LTMCrCx0UpBbs5KsbW1AIGHIodrAAAA
X-Change-ID: 20251023-asoc-regmap-irq-chip-bb2053c32168
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yThxXVSm3+hK2gArS0hottDcHjOB+llPRjJdv2JM2fU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBo+e8+VfBvCz453H9L48zweVlc/PFeRm25E9jrU
 tSxJu2g8uWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaPnvPgAKCRDBN2bmhouD
 14pJD/43Ii/e8xuhwekZG8etRDVFVJAQrqlZeYMDNGzRRB+xOv6Kzypn0PKvQO1KxGjldLwKAcs
 zDULHHeCoTX5dyYh0E5lCrk6qbeCGFQXw+JmLbiRSpYPfeb3BXfqb5EotnWGdIeSGP+nzhffuJM
 uZxOMvMnuc+EW1LRZacYeS/Ab/9uJLyh8fYErntpt6FIs5kGGGtR9HBlj2wKRgtXwcGGkyL0TZB
 Xzz9K60En3o+7h4Tvs6oQdzY7DGCsNRxOKQRSgJCOKsZUG/fZbpuNX/OJf5va5wnuhZE570m3Il
 1rMiBgkKilzSimDCdKM3fgHyH5kxxh6Z/oNCpeuO+X3Df45EbwqE3OH6vKe4pOblKxD1zV+NT+1
 cWlkMmRS9r3GpQhjnzye4L5PFzbm7xVZablBNnn3CzWrcfUVmv0Sk0dv2zz8r8/zBK8Y3bl/eo+
 bfD1/+C0PL75HaUTzVtsJtLyBgyc4seIrzYxJnOF4vxYlYYfmDybHeqiUh1snrBjanHNEruyjOr
 md4uAvNuY+7/Ak6E6Su2GmYQDga1qNTn8tiDuYKyS8/qoIxPNbIqwTsjrXEVHVe6fYM4HICBlCB
 Y4cOFDND8kG4YXAKZiuEiYZLJd9GP2/kMzJcm+sSJVndHvdWvBE3ddZFKYblbOmw2FC2AMmj4U8
 it9HZ/qA3cuuVfQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

I marked these as fixes, but the issue is not likely to trigger in
normal conditions.

Not tested on hardware, please kindly provide tested-by, the best with
some probe bind/unbind cycle.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      ASoC: codecs: pm4125: Fix potential conflict when probing two devices
      ASoC: codecs: pm4125: Remove irq_chip on component unbind

 sound/soc/codecs/pm4125.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)
---
base-commit: d22122bd89bc5ce7b3e057d99679ca50a72a8245
change-id: 20251023-asoc-regmap-irq-chip-bb2053c32168

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

