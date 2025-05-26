Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03EB1FE444
	for <linux-sound@vger.kernel.org>; Mon, 26 May 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256615; cv=none; b=HcKdNSgLJH7xN1R+BLlWZd70pUA/9kRVl7ZVN8Ty+UKPLaCAY+FI1s+bWwcnn/P7QGITYozbatBogoVGg+EHsr/m3t2ebgGRFLxTV5uYRKrpUwTtEYVaGBDmlrMpHFsD416F/D/fvHjFvDulYUFJNZgtKYKSFrIp+8HRTw3DrZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256615; c=relaxed/simple;
	bh=BxJ2y+p3e45IzKOg0vhlHvkapbzztQvH0zmQluqHJV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWgQf3akWdqYSK8haeEBry3/oW+6wJoku2UTTRJzFi4j1uHCB+3Yayexrz3xWjg0IIV4CX4T0zUKlDvTJ+SHM/Q5guG7/JIeI/p2tv9X5efHY12S2ANBANFwjp2dNf728KlLXyyYh233oiF2q4akezltFkUd+kJIAcN4HN5nrtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y4vfCAsM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4vfCAsM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4cfa5c8ddso340116f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 26 May 2025 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748256612; x=1748861412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1F0JJbw/NsRmxDzxcjla28hDif9xWhQF3zZnWHAIyc=;
        b=Y4vfCAsMjZrHMN/+FSpKWZMoZ1M4FS2/SxaugAteNgqjJrn00BpiCOcmGZ9gloVYcH
         CIGjzvkA3hc9WC4bPaVMEFJV1xCqx99xBuKol4Dj071ji2jpXFy6sjYct/LIPAyauIwb
         peV1X6ZN6F4b8FuTPLmWigJZSPnv4reJyCfUbe8CO9Zzuh7WrHpT44nltphS0GgmPJsf
         imk5QyatvnX+Z0OYFspzR6lLeuv7nROpsfrPOI4ak+PqsdZRflaa7Gc24J0UfkTCAw1l
         KOBFviExJPrOlKcI07CnrdS633qWgmfhNAb5hUJpkDEUuA0KvdFSGepgdvjt/nnyvRMA
         7jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256612; x=1748861412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1F0JJbw/NsRmxDzxcjla28hDif9xWhQF3zZnWHAIyc=;
        b=N/x/ARaU0TaO3HSelcl/9NFl5g1sxdaVTOj4hBzNUDqaMq4t1JDzmZgMvJ6lPn3p/Q
         xkGKmj0NJktBoI5GAB0aiwFM/IUrs1Fkp0vMeG/iukXRKR5zAEriu7hNUPiAKmjPZv9A
         zOdfLvFUgFOICr2uyamCHZTLWjQty5bOwGAGKHoaV8UUZ/SJRw4OEQc/ck3ysD7T8LY/
         ZfD1bzWRKaB8edJp7AMhO/9Z7edxsSWAhKrhH7PLFHBnunxn7x+CHvw02cwv27IRi75S
         7wRVRIDOCyrYS+Q0XxKX8ez1F65dW/sIM8eW+yDk9XUs5iLI4G3M6k3rHcgQ379xX7VP
         rKAw==
X-Gm-Message-State: AOJu0Yx8OFA2coq3PiA0DtarCc8DO3aO6fmkZveqo0EID37S2h2INySs
	BBpOOEBsK137zbxDTvjDjPaAxBJXp/P8tMHI0TJ60N3tSlu9YE50dUapTPIwzZmu2Jo=
X-Gm-Gg: ASbGnct164QErIzmhsMs53NFpTr7yKVIrzBL+hMBPIjn5XsscokHUWGSbx4im6JGwU4
	V8ibGMU037XvbBmdL6dNYChJ699y2pONK+CvNt9mx1mqfVSHEjXoyFjlCUtFo7zOpbk1a3ryOWv
	7efS89zpqoUXAuPnFMdDQetSOUHpabcpUSIKF5PvgkM1PHsjp11A7DIfRAk7XXJkgl1t9WappFO
	brbaRFnAlpmWUwRWXrSngoAjs7bcXG3g02LvNZo5XJ5xA4dVVFO+e8iY+JiGFyBsd+v4ndDln83
	52JFGIMGnwD5w7PHPm0wAT+U9knj/49lgxuHabx5Pv80LB/762HjRiwGWv/RDDicL+NWYBk=
X-Google-Smtp-Source: AGHT+IEc+gSI4dz6PJb6XB2/tm1jAeKYruuziD5I3xYLt4dJi41VULpTVmWm9gG7qkHMbwUWLampxA==
X-Received: by 2002:a05:6000:2082:b0:3a2:133:b1a4 with SMTP id ffacd0b85a97d-3a4cb48a237mr2078199f8f.13.1748256612330;
        Mon, 26 May 2025 03:50:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm236337215e9.23.2025.05.26.03.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:50:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 12:49:55 +0200
Subject: [PATCH 6/6] ASoC: codecs: wcd939x: Add VDD_PX supply
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-asoc-wcd9395-vdd-px-v1-6-64d3cb60313b@linaro.org>
References: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
In-Reply-To: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BxJ2y+p3e45IzKOg0vhlHvkapbzztQvH0zmQluqHJV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNEdX6ua3vxOKUSyAOM3GRxHgAoDMRana3x+JM
 90uDzTcvgGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRHVwAKCRDBN2bmhouD
 13R7D/9pPE/aTDxvrefDXj5fjGmq+RVR1zaJ8Agf9aOCuT3EVvkdIo8lnsaXmJqllZsHEGXKfRY
 FFO/lYuKpmUDwSSgPRwij8JS+gidxWuCO8koyagq5HTwUNLPIuUl2k4m6k/KG12o31ALQsT/pMG
 L27VghMwOoDVf1EYL+2Te+O44EUiP/WqWSwQxHFi4Q+HuhynvtjGANzsz34PEapB9qfcdCORaez
 haOIa7lopyIwHUMFTkVfVkabOeMAK9E65AVzhmpB13eeOuKNtT3UT0jLBwA5XdGsgIpms9sqEAS
 /qwtNtbzrpDV0FbDqisgQwtpLbGlraj1S1yv9v7WMOQqQoZsx7Oc4xgWWGeNoaXd9yMSuWsh+Jw
 4gdkx4407sADLbOJGwC55BU5EYiw8Sj2fd1ilSayJA2Lu7nm9WspJXuQkhOsaXTLPNFzEwDwH5Y
 g8Gmi2cTPKM1Ev9K1Q4wjJLf5HkwBToMfSPDpjtj3eeYIYh3Ykrl29xMmE87rXiZY/UGSh4bwEg
 1kxK+BglD9gRf016XqgXa66rn5f9xzer/gUknqVSfTXZJiRgazqLzQu0Rcbp7Ma/Nz2q2nCET6D
 lC0eNpI12nxjFIgE4pupQr2AN+BjG9FqsfhgCvSv4vg4nv7H51ZLK/iQSje9VcZqi5UnubWVpn2
 coOXn/LkmU9OP1g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device has also VDD_PX supply, which should be acquired by the driver.
Regulator framework will provide a dummy supply, thus the change is
compatible with older DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 9592462f2d6e3067a2ed3339ddd5f676eaf3b5ed..690832037b5dcee0722e118536a45cb70e5c61c2 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -212,7 +212,7 @@ struct wcd939x_priv {
 };
 
 static const char * const wcd939x_supplies[] = {
-	"vdd-rxtx", "vdd-io", "vdd-buck", "vdd-mic-bias",
+	"vdd-rxtx", "vdd-io", "vdd-buck", "vdd-mic-bias", "vdd-px",
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);

-- 
2.45.2

