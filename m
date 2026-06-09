Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A75F3B2FD4
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022181; cv=none; b=lWYFdpNs1BJNDke+wib49BhuP3OHQyH5FG93wCOxdOBtEsHzdQk2qfSZYGn0o9AISHWc71XTLserd0erGd2oO4XpvyHelwCBevYN4dAXmPG6ZWEwevOjp9IYnU3EHiYWjC276QetSaY/pFRHyvbRZNBkr5naJzeYvJLnKP4KUcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022181; c=relaxed/simple;
	bh=EixlG3+pSd1+umoQcq597TULbcew8judyFI9QjElm5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUqbs2qiYg3vwxX0yooQ3a0F9EuXCjVxA6M8wvuVbY/5KjMby5ahEiUEZp+AznyeH3dEUAs53yF/TumjBv8JdgI1qq3s64XNmkSopa14cUudg1YK5F7CjNyt7egD18J4SSp9oIAmhJRsHvKY4dwseP4BT6H+jYrJXm11xMP5z8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7IqhGFj; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7IqhGFj"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-915ab38ac14so628633385a.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022179; x=1781626979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H6CVxdwvbBnHBwu5wTdK915OM3mOvFPgDPWam3xl2Q=;
        b=o7IqhGFjshO4GfpWCc5WtIsUhEdrWQuu99r4h8PUVp4b3K3NXD6xT3xYVPZ8xCDNg7
         fZQG+VZNOt5zDoUCzFUa/sDTCdfwTEi8+/UpxDdJ7bWTJpUWxaDBTIKNl/8zs32VmT2X
         VzU4WYXHAOJeEMryHzeDcfo4594/Zz4w2h9wr2iT46jZUUSqbzsJnIFGUyCbxwIDcZnJ
         ixmaalT+baYSOh9zirSDAN/6V2Kfy3ktLX5OwIVJs0sQdHpVuehcyITqL4AxFqBqlgAD
         EIyF8IhNUH3IW2JiTHknYcS8HbGIoV6JfX9OEtESfedV+d2b+Q8jAxckOtoYLCVhapBx
         oXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022179; x=1781626979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7H6CVxdwvbBnHBwu5wTdK915OM3mOvFPgDPWam3xl2Q=;
        b=cueZKM8hYndPjpwwl0/TtRthKFBo0DWzVjqjAyoDymyGy2oabI4+jfeXkTVpVvJ3Lx
         j41J8RvprblmMdaHUyx70PHA36eXkU9XxyTiiRu07n5mPqukgVI1wI43qnAh2FOkFb4+
         kBjgE0g89WsSaOXrU3IdeI8xXUAW5Ts8bZC+WhPzylxwWKINqWlAS90OAFJP6jk6qg9v
         11UyftU153SmrkrLrTbxx5+2wMjTR9947Als0W+QnuPh9cdm7ntFsL+l54mbbx6VkLr2
         t2yY49bEdh/KYQPs1tk/bVUlwCtxY6FLfUpRkLxa4zzgAV/ojn/S0a2jbIWlDAUncFV5
         0y8g==
X-Forwarded-Encrypted: i=1; AFNElJ8SBnE8mfk1Jb+jjRDnJK8dm85sh2mevC9f2NvgYrGizhCF7yogYIXPBo24r5PibmjLOGy9F09Z/8NDbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QWjR3ktVYowAb54DYFNYTTFZQpk+nP4XjL5W4d8Q1MkY5YW2
	Iw3hBW5llU0kE41wzGb9huGwLL3y6yfbELtN3Fcsnn6aPHlegCzkhoIW
X-Gm-Gg: Acq92OEHrF8HlSe9JNUjy+IWiDbtgYg2lssJSovBOf3eEVFXcG0iDxdQJAlG8dIgBKO
	PjyCQlpQC4d/wYY6IX0ntu01Q5A5qmoo7fE7NtWrp1f8z/3+bKi9xa+eRlOWhtn7y6nETN7oyWW
	zQeJbOhugXC3jJxsUlbATuxoOGi8nbQ22/A9IQQ2BASSDI0EdxSEVAjrg7arg/Ex9hQMKET5yNj
	+xffqSHG4EbgXUs0puq6dKErYn4YO8FYFGJsrMBkhyL8apOi27u1T9AG8qp/fW2tI96pBaQ5CRO
	NuebIzx4hLJBx1O/JWyuc/V2W4Ro4W6zbkPPhbwTwjT+BI5SH679+tqxsu8YOHuaA1Z7PfGgcRX
	aXMv1zn+VVtXa7EEwiP3vMTMxSZm596wrp8zKKCXdux1ZwDcttmGBRcQhSZ2jd5wTXvGzu42g7t
	frxAd5r4yCVao5WGykXAwjQYfAwXS5GEs5u8KMVg==
X-Received: by 2002:a05:620a:3723:b0:915:c7ad:8bd2 with SMTP id af79cd13be357-915c7ad8e62mr1920782085a.30.1781022179141;
        Tue, 09 Jun 2026 09:22:59 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d3a0esm2184525585a.40.2026.06.09.09.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:22:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Tue,  9 Jun 2026 12:22:41 -0400
Message-ID: <20260609162255.31074-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.54.0

