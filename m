Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C768277007
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982043; cv=none; b=JVKBvSiD4vaZjjxfTA6FI92wVweWHgx3xHNAcU8yE8W3VREByYz4VEhKfoTwpKiiWTZCEgfbBOdDnm0FE78vkrCiA1QZQqHChqpBNysjjGPNQjm5qaRcVBGX9r2y6BsoQ9+I09zpiMa1Cqnb5/QnnAGsYTuU6rnABvTdvZlOroY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982043; c=relaxed/simple;
	bh=wzHHP2feP6wHuqFLANo3CTLOjrw0/TxeFUFRj7B0ILE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLiMZ1z3WHt6hBQBN+QOI4vygPzQ6SIelRRv8j3uQiCdfaW2ooRC3oENg8W8Ah+kXwTh0Ms/Lxj6Qn4ou6+ECM7gy3OK3Ywqewyz9vnAOLavUPaY1899/06yez/H/NCfXPlWEBVY4PePhnq6YT843X2iTGGIZlEjD9Pipnfo1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lRXLUmeE; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lRXLUmeE"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so2892493a12.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982039; x=1745586839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seRyYYSYhDxZAINukYkT14l+opP0XSBbrpJYZxHqS48=;
        b=lRXLUmeEL5AQDEvjNFCo7nX20BT818ObDRsW7bNGHHmmn996HXjOSBgMA/gX9/4QXY
         ueNyKPDPQjb96TUsxT6bdpoEMWkoD4REzIe1WonQlqiiX6RbyVKaGJgaw7XGEl2EZNLV
         R+LvQzeUTGfXEo5xY+ehfFIshlJdnYK57PeaOH8OMRIZ8S5IsfwoXGruvPanWVZTXEkG
         hmEi3bdMq8tCr5A7nsHmItE4B+rQj+d/S/NmhfjvoSARqiwtMBRDihgaPPWjJYY8Z3c6
         fAmwRKI5JlEM7tihczRUbWnbPufqngK85hEgSsZXl0MmTiKD12iIu8/JIfDR45q3fKXa
         mUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982039; x=1745586839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seRyYYSYhDxZAINukYkT14l+opP0XSBbrpJYZxHqS48=;
        b=JcrOMAZlSvXpmt7TIZXdUL7L3jgQKRGrWaE+y/BKMaTAuw+H73hlgog7iHe3zqmMYO
         DPSwFd7+c3Z09ZFOpsX+FOOhw4UeNw/m2+mft8z7//ccjpnDuWiTm9UxMyiIepPKTMGE
         nAp0QW+1csRPZxAG+kn6RqSvOTZyOeNypl2Hdn3KXLclcOjkpMs4S2CHvVspJu3xzC1k
         NLrhBtrQSuoGf9+jNrZmacqqXOwISeNmU/sNS/TWEuzaqLOOfSzNIhnTUnswcctLTUT2
         9hpKivVWLAi/yHdJstgyT7oWa5roGmb4kCN94Q7mKtCOrSJsMnAwaetLjFr/XIHBsvxp
         /oXw==
X-Forwarded-Encrypted: i=1; AJvYcCXD7ijE/1nynYsFfbAiah6K+cXMZ/p405WEikb/1Dlu395Jq4fPkpN+B1Jwgp1W689BYTcS52n2W4i4Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybIjR+9TORHQPqUEzpMPvb5LqJeHPTZBsTeHfKz8vF4cPkAgKc
	bXstlYgdYV2KCjNtg2zKMT0VyeCALP76BYXL1ihgw8UsQknKbGGrCYo+YLf8Vds=
X-Gm-Gg: ASbGnctAsDVOkcyb6SVwl/rH8Y8rIKOG4ja0H2JD28M3ToV+hdcJBG4WDcYJuMBWk99
	wmXnB65huu7ApJcMmzoyGoVrjKKEyH884ds6XMMPWEW/nyI8SNWatRmAc2sAjihv9e4HDiQkhKG
	Erw9BkGel4VZu52brrb0IBjU1NRTR8KnqYh+SLIUTLN7jb64SMJ/LEv/FBxRRQUwNm5xPN1mQxL
	eNU018X1wsf6Wh7ialf6swI5M79iWRyHHprIlQA5xolo8ZTPUyCTDLg5Y+vUXzvdUaqH73Mq/DA
	Z+3i3NWa5GmDe5p2P5bnww7v58uCnhIM1wGXyioY5ujB7UVLlkQSfy7ML5Dt4EhsLFwm9cpuvGe
	QoKnpBosoLF2Lmg==
X-Google-Smtp-Source: AGHT+IGK0w5o/tIazZ37+NXFgqNftZQkULjK7rkiUpRoTJsf3DztGjPOr0fER0jSN21I7Sk2h/cvdA==
X-Received: by 2002:a17:907:7247:b0:acb:1908:6873 with SMTP id a640c23a62f3a-acb74d65b95mr270159466b.48.1744982038650;
        Fri, 18 Apr 2025 06:13:58 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:13:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:42 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-1-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 5 which uses the
older non-audioreach audio architecture.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c61adfd4b687227038d275f849480a..57f62a228c262f38e703816efdcf443355052619 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.49.0

