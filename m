Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F1253324
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375874; cv=none; b=uiIYIMC1xgC5s7la4qqsw/NZ7ewQQWjLfoeEtqdUfkBmwrEIuqHk1RqcHd4iNiR8z7PRhLDVOyYbybL8NElm3BLYS8wkdb+VIWsRKpG5YX7XLtTHGoU9OvqG3fkX8RYFPFe0B4SskDNLbByys2btkxQzChQEyphb0yXwNih0Les=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375874; c=relaxed/simple;
	bh=M6dCa9QbYlf7D6XIUvrH5DEVFVT265xiBP6CZshU2Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CMT+UHWMMCwkHrgTXjo796ZIbqyuNgXIpOIjzVnSzDIXz74lqwir8joaSxpMkTwJpD0uNMEd3zmFFcTRCtK38J20XLzwe7bf8SSnowGyH02M4NPN20JJBBCL53TjOGsW3K6BzgrTQdFKo8JrrczuRX2I83Sl1LeFbxK9R7L9jIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AaW7Ojnh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AaW7Ojnh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-399737f4fa4so340214f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375871; x=1742980671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfIpSAHZSkPf6dqXb1ymwuVLti0MmykrLRZH/yq3jag=;
        b=AaW7Ojnh8acQujWQcfpmN1uNS62gQSq8vhCZsgh6mPdlfTv1ueWr0h3aOhA5i/Ex4E
         jRJ0sfMScHjxbMDVjWt9vPU0c8QzGdOOR7fe+FtC5/ll2qSqT/YOCutViF1s34CvC58a
         p4RRDVG4610bA5xYj0tznu0ElAdtHWDDN2y63wS5TXhiQMItcdbkzAH2IvOpqpwOPoiO
         kumWd+9po5D+6Fb0ILcCB1dC3bj5wfIggAM1UjiycwGqz7a/H4+NG76UeBVnz/J34M12
         U4I/MyZ+Jf3XwS8Iz0gdPQsdNs1jK7SzIXhvkUtkcG6M48wml+lvzijyYseQGYnIELxM
         Ac2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375871; x=1742980671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfIpSAHZSkPf6dqXb1ymwuVLti0MmykrLRZH/yq3jag=;
        b=kZAQnrNq7EeqoYS3PaIY8Gv9ewpkcy6hmgz515+difi+sVh5WlX5EE3j9M1ITiGBBq
         i0IAeA6NbNOwGBZs6dm9z7NvyuSfzdTsQCYG6eOCj1LcejOotfqCipLhLqNceMVTiP8/
         4z/HYx14Bpnm50LOcQBTRvtAgSv+vgwwnYluoXdDveKGwhOpxnh4D2qj6WUww9pokuxu
         j4MymeAfAL5a30tODn7zqQ47U7EuxPDH8KVrA5gGjXuDQbr4jli8tN+1Lxx1LnnNoxuY
         I2Jtk++mThbJDaGPR+UBdVRlHGtogdj4g8scE2jsXm1kI3C3epBdgkrqbVCvfdilqGn4
         Vd6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUmD9goGw4HF6r2C8Akt2SnCMN+dt7Onh8tBC52s/TBiRFwi2dFEZmmibDpkfHUd6wSDY9DAyj3Y9XXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6FwvhW0AxW1RM9zrHWqv6gIdOmq2klFhnVYgqqNnI9jHTsGmb
	M3PhI6z4rr4sErL+5CbP+ACQfsme6waw0teHWjIX9Q4aJLHJ8x9IwJJGpZc4SIA=
X-Gm-Gg: ASbGncv73OlVDNQWVDPBtK6EoEpW4zKNRTMCgyRM3Tit0RvugbfhBoMzq+lvrWgB1vL
	BBS6yVg3D6sQ04Z666fmk6WX6b8g0maJDUbycmhgurONPP/qNV5lXeXtdsERYn81Zg+15NkC+77
	5S774DTZBu5677CJr+FwatiTBPEgsSYOELl/6/Eoy+bAmLbQdovFC/fqmRavhEQPEEmD/g37nQR
	dFq1AlsSPGX0l92wwYzrZplRmchf7Hdgz3EUl5H+iRlmPjL984HtMu64lZSqiN5ki15aWZ30Kp/
	udfXEaMhqWyqWk3szo1cN9H9DRffH7Y2W8b32i1QuXbbn0jNxfznNAb3Gra3W8MCHjqFTQ==
X-Google-Smtp-Source: AGHT+IFJ2iLmk8pAPqBAWEp0LzO+Z/VRz7gyRhBPaVCohInnwXkQ6lhGBk/Zng0hIIeJtYAjoAn+AQ==
X-Received: by 2002:adf:a40d:0:b0:391:2dea:c9a5 with SMTP id ffacd0b85a97d-399739c6b29mr1425261f8f.20.1742375870820;
        Wed, 19 Mar 2025 02:17:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm20023810f8f.23.2025.03.19.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:17:50 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	andersson@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio switch controlling hp
Date: Wed, 19 Mar 2025 09:16:35 +0000
Message-Id: <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

This patch adds required bindings to add such regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,wcd93xx-common.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
index f78ba148ad25..fa00570caf24 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
@@ -26,6 +26,10 @@ properties:
   vdd-mic-bias-supply:
     description: A reference to the 3.8V mic bias supply
 
+  vdd-hp-switch-supply:
+    description: A reference to the audio switch supply
+      for switching CTIA/OMTP Headset
+
   qcom,tx-device:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A reference to Soundwire tx device phandle
-- 
2.39.5

