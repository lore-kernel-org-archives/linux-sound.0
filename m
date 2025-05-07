Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80580220F22
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604930; cv=none; b=huGqkZtkrQUWKGknFBcd2tTC0AIfpynjSx7FP1XthCVciK7ipRM2qXW92sVU62nyjRBp5RARkgW+xzXjf6wlNFGienkoKauej8xUIp3eO51NeqLpS2hvTuuOU2ABaYZzTvKYE5j9SLgoJQqwTIl3f3ORZg83O5dvhMoErHCrnGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604930; c=relaxed/simple;
	bh=4r9tJ+EcKTSeTDqTruse8d4E3SvZHkJ5ztPCJLWlUSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2Zr47N/nuEfu6ayY5Go1AYvurSDDLczutsZmP6ETV0qSAkTs/dKqyjPUPWq7tIM1eQ3N2gDx1SSTt2lFzkrSgzgefDCqWEkE2OOQ5KJY/XGxOzzXJH6cY3uA1tVuJ2m1nEFK26uX6FM5JgxXVHKcdjpySmCNRSBdLqWNFGdysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YnV3zjdf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YnV3zjdf"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so1260581a12.0
        for <linux-sound@vger.kernel.org>; Wed, 07 May 2025 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604925; x=1747209725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=YnV3zjdfl85huB5rFrTm7ILrhcQVcGxJqJVQJwCQl6ZGbIl8PxVn/ZghhjUZfXpoB8
         o7THwPVwhuwbQoyp3tnHbTfIiubh79ibODjk8+R9J6aqB0HX0wrAmlFfdFZhYuwrHwYS
         6oiFAhF2qGd9FVdNBAs9QoYKXQbzxIQ4OLTIur5YPpxwK6rvctw/7W56A9gcAe+EEd14
         1bYqJko43S/UJTVhLXw8XSD8lW8VuIr/NnaL0C71olo6w560hsrHHQVfy/meDifhw5V5
         A2G8Zf+fWSjoXEaAGYLj2aorwyBqfg+HuXtvnq6RWzsV0gaQqKpA9i6RCUH2FnNBhcjF
         1jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604925; x=1747209725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=mskbU1OgL+Bzw3OAa0AETRppBsIpBXHj2WBG3k2R64Mv5a+Y5awr0QIDiWCTcau1w7
         EBveTrEo2WEygGdC3ceeGOE9oj39D++eMIoxsqu0/ykSyUV9HUBl6SqiRQlBgPvL2JtB
         ONyyoz+0GgR4aXojrYgWYCaCEDexKCgXFDjUAF9R0z+LNIK32mxfeIwL3ssCV749pR36
         EuOv19qLsYlB22tC+OJSFE3VjVcFMw40G5t5yg1+bquah9uYIiD11GiZIBRm0fJ08n+S
         CYbbbGc+UBCkxnQ9hjn7oKkDbbRReZ2qaTkrRP2KjdRfRWiHQZjgrGCuRtmjwwEJz/SW
         65YA==
X-Forwarded-Encrypted: i=1; AJvYcCX8s2IO0fQGfo5u+pOS3kJ3AJZn64vYX1O13UfqmzMoWzGfJIYHY18phzHrcTr3k3BxtqVs3/5/ZNVMrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8JPUfYL0+GBsVyheeyj+Xi22/2n58vNtBODshUPgmWvo8dAt
	1yp4wkiLRinqwbqT2aoen7JfAauaj95vFGmiCfWtGiEvx8fhbDE+TnQuL/OIAXc=
X-Gm-Gg: ASbGncvvKNZwSEYM8bTYLZttz9x4gIsZnLr3ivsYraPH5I+0Z73rONiPlkJ5JAdz9z6
	U6GEfVqCk6oiBBHaSrrZPKwnRAqsztr0irqVmj+Zm+UPkwtuhfQrjvLvQ1FR6l3NJKRcwV999fq
	mCiLundhx/fC74x9+l16K0yvs0Dx+gZYSh1/9gFK7Dvps7AyAb6huCIQkOFS08SmaZhcL+uHBa3
	V5iO4uObXMOu91Kc85EC7JiWiSL8R4PkP/T1ZDERYad6eCqIge+/ipEbxtd8tvrR5jEcKFRBtup
	Tn3Ahm+MHAzvPoZ/XiwAE3dnGwYN9k8rxz4bF4FP4qYzQ5/3FGZxnjtL2PQTLa9sFQ6t64QtGJQ
	pGcrLRulhTVTlMg==
X-Google-Smtp-Source: AGHT+IHM5j4LY8EC3by1L+VBxZrB2eMd8q7F5KhX7WQLdSlljTQckz7uR7Y8+kHuY5+YyPBVE5qv7A==
X-Received: by 2002:a17:907:8dc3:b0:ad1:d0e7:a698 with SMTP id a640c23a62f3a-ad1eaefad5cmr195699266b.2.1746604925541;
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:37 +0200
Subject: [PATCH v4 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-1-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

