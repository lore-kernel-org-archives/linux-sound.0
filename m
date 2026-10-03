Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF6243A819
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050234; cv=none; b=FIU1f+esJHDq7wRnV+CpVt8nQT5oPp/dNwE77b0IjVh1MMY8iV7buleDWtdNW6dSC0RMQ6q0nEGIZ2Sko4MgyytRaX9UCv0/e/+qsFFhwJKzcLqArI9RZWoLsKGIgj2stxpsGPx0JxjMAvumq2osPgcv5bkjuB3yBP94yOipf88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050234; c=relaxed/simple;
	bh=8yWgSoYjBSNdU6Nh98oDiJF/XZdbU2DxciSxWFyxDpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Df+Qb41B723f7YotNlW3435bId0UWLpxUk1SyPvx+UO7Tsn1fLVq1ozMuDb6t/7Gt/XadplVouMUL4ibilA39y4VidmpwIBlMkNjWTQmZrFpH8LdGcCFxVGQBRlZCqqFXFtlwhUHW60+akMo/kvjHhxhs38pTsQRn3uaau1/Z3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwBdYDLM; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwBdYDLM"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91058dd77a2so10587876d6.3
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050231; x=1791655031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Em/JfgIRn8QRBLzYv+qkJFEh3n3+7GlE5/RkiH73XY=;
        b=pwBdYDLMWebcK6aQIGu389+dCMLnRWx9Pofb1Iv4kYQKejHBzsG2bwHw523N8+4kSC
         GXaTUHoH8ZznN3alstOAi90QMJSXCXyeKApnUq/PtdTDHj1HeJXyTA/t9Uv/ZoQAb1QB
         3YLMIuPOS7l9KWeW9Muv7ZS6J8X2yNqJRFWeI4rHjfrY4EvXeVPhGwyok72jvC7zXEvk
         Go5VRKxei5RTUdcatBk7vldylc2od55pOb6zMbMMrdnrdgC3lLjFfyPWjN7rYyUxhMfv
         ljoJXmVfFif7dW5tVnB1E4zDKhdnHX6Yqwua2+U5zEZqmJDSayq3mXK7du3B3OnoMf1Z
         MbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050231; x=1791655031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Em/JfgIRn8QRBLzYv+qkJFEh3n3+7GlE5/RkiH73XY=;
        b=aNArPXbt9NffviiggYGMpMSqKJFlphnVfbaz/7E6mHVd2bQylX3vVe2fUmqAtlAtL3
         C+mmYeSN+fnwHdNOXqZC5oEylqoCvy5LFOrfB8fUzMYo3ox/WBgxVZIYuUp8RJr/RDH2
         PPoBHFQl0OQYcuDtbwISbO8Ikzh58EOOheyDHzuYiQZAKHNyA/Hx21+fRVCxIUBEbze5
         jX7J/HziDOJD/jGoDqIe2rcFPNIkXM/7rvdKNpF+RSAfY4JYvhrmJGOPPs6cWxLNZv4w
         RekAScOZwJzX4ElC2SJAIoCn6ojXYCT0Ba2hnct9GKMr3nFla/779k1aiU3TN5QYQ7qN
         +v9g==
X-Forwarded-Encrypted: i=1; AKwUvBwtc86bkFwoU/LTCvYv5pkDu+wbT20paCLLMWzv6d7npNp6YV+looTgN4nF6Cpy3jdesuzPyGZlklKUkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbjNrU7hGNS6KfJTZ8wwxmmPuE5BM96nqqloxDRnJuX5b0qMga
	ojXi4f3KoRnRi3fQBrYETYM/XQq7r+XWNtZt9T2EfztEOeaXiGrzEot4
X-Gm-Gg: AYBFou1iwRBzoLpxXdtfsezq3y/i5RtTIvSPD0v3BApfwcrNH71//KC1KR8XTb+Mp3a
	/wZWLdHaMLB1zsNPZn+sJPaCDLaxgxjpyDHQL39P/IUVhAkl8i+HIid/sf0nVaPdSJcTxBlJvcA
	b0rufDrj2ux0AcBVX2TBDiZ5s2NX/IN/RMYAeKj7/Go7LDq3yL1XXIROasmqCDXsSrg5wG5OSlM
	QieR4hyL5Kyx3sCkbTt+M9APQIBtXsJ3O0/2rCt5FGHT8IoLWW0FrnY8l5BjewFW7lgpynmqKgq
	mnq2k77qURRCJhoWS8Y547aik49M0KHkkFTRvkTLmxpxrcMIHe5HgHKQVoMKiQTPQ4hD7E/atpw
	zXnVPBrW28qvM2+eCR2ZGVvP6AHG6djAc2tieNqQsor7It60gBtQxuOLxPcY6UUl69QoLOdxhIf
	ElujfYNpVvlZYV2WwqW/vzgEZg/4B6BzDaK67LZ7EwBZtp/bfpMe50fAFYk+7b+Sx57XLpqi7A9
	A==
X-Received: by 2002:a05:6214:1c0b:b0:912:340a:1dea with SMTP id 6a1803df08f44-917bff2b122mr122876166d6.1.1791050231430;
        Sat, 03 Oct 2026 10:57:11 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b691dasm49017826d6.23.2026.10.03.10.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:10 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 05/11] ASoC: dt-bindings: msm8916-digital-codec: Add SDM670 compatible
Date: Sat,  3 Oct 2026 13:56:53 -0400
Message-ID: <20261003175659.23536-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8916 digital codec is also found on SDM670, typically connected
to the sound card. Add the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index 33bc23b6176a..b603bb6eb9b7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - qcom,sdm660-wcd-digital-codec
+              - qcom,sdm670-wcd-digital-codec
           - const: qcom,msm8916-wcd-digital-codec
 
       - const: qcom,msm8916-wcd-digital-codec
-- 
2.56.0

