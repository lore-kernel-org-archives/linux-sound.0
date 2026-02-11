Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC502F25FB
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775364; cv=none; b=FLUbkJEs7+E8OhOR+2X3DlVtDN4ytV+IwftKbSM/f+MZaV5vAi8F/SS53UM+HbV9GQAIZHbN/o/Q7LasDjQg3rxtYC6c1g/fxKWf11xx7ZHLnYkY7PD+HufPZ+eMiILZxUWwlnZh6ryInYkU5dTtYd17rZ6assrEG0BhWLWnqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775364; c=relaxed/simple;
	bh=UemTT/Ea45TkyWQXQtnhTSn5rytRaDiczph1i8Pdn9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKhN0wS2j/cRUrRer5hmPzaMZeHZ25rhddKtgG/d+4bzw5M+SCikiT/hljhk57lCItLeY3qOZztQFwT/2QGe6tcK0KZSBnlPpjE9csm3svhJg4kuGE9DbsBmH5K5uiFj58i82/ZN7SHyXvV1zXHSc/TWqJaMY80Y4UjbqU8nGrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwCCH51t; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwCCH51t"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c6b16bd040so614982385a.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775362; x=1771380162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SQooQVS6z7NQlPoa6keMGq9s98T9K22xL0ks0nYRhw=;
        b=VwCCH51tLnkPu27Zj+fbW0XVjAhDCkbwCQI4REHpj/9mKy9TMpdycoUhilmr7FuO0y
         XhuR5nzdGOetk56/rP6PdC8eswpuK7whm8Z1ZapOb6H7rTppSumQ6oPsUsRkt5oDeipm
         mdQ4WZa+hVFP7i/HimB/4c0LkSRn5QTI+qXUscpYsnx/IV+9bHPvIPwAIg0moyhRdob1
         lvStSbBuBb1w4qrP7TywduFFzBWiNcLGcLY0qquJQLB3oel2a32UlgEF5TYfvCk6B7nz
         ck1MsPvqQz7AgJK/p3L39/BEfIDctYiawDAlRwToE21JZPcfBjEtu+fGgo/hFBqGZRmr
         Ukmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775362; x=1771380162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SQooQVS6z7NQlPoa6keMGq9s98T9K22xL0ks0nYRhw=;
        b=iHMboqnEQCXOCyB9WTZJrSUWv0OKgiRpRzzwJ90/za4trowiT3SKftHkKm4d3+AGA8
         02kUv1f4JgP4RUcI0TzhOb7NmZUdd3+dz56wx5UnoSTmwl6NKmTImm6NbBP9fWfQOs4A
         jE8tCxQZLXRASMoA0tiSp9RW5YMTSefA55JiW3WYxJ0iBhecRAImU6fwmZTbcgQvpk5U
         7qFmpPjNXSVND9m9SQydpFwLNazPWRRTkyH4Jq+wRLUZWFThc/ro+Y0I/9KWqTFodCL7
         9k4kTbyZLYxqYjZsufFxKyvJxcTiAqDaiXz/4b/t8uF9F8okY8q9BmhSEKOGtTKbT8Nw
         3EKw==
X-Forwarded-Encrypted: i=1; AJvYcCWvJeYp8dEgyIkDCTR39TBb6EF61Te3BicD6YZU+GOM/udVNEx0IlOPl592Kk6JMkOuOCCiyp+7USZCAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gFiVUd0FMzD4rFqKGRMVw6dI+QojYiwsp09MMpDSnTHOAMyd
	0LqAgmPK1mrUDS4maUs2H68CBd4DWQaMmQoMdW6dniBcLJNl66TuYsnC
X-Gm-Gg: AZuq6aKUAMthE1uAh+FFtvmyayC+370G4bfDnfdxbM+IRBaaI8ZqyNuYeX7V+zHHq/4
	aJKk5k5dq9lGoOxchP+IXLeOs412+UeYoLbgnoEnNavSeZqb7fxipKftZaSTN2pa9vx75jQI3dm
	AQ5qysRdpF6sEN6oOBWLtNer+iNInfE1nHVc0ALUS+L88sOuasxVxsiNFwFW6zynULUGkCbi9of
	qUEFK6huXovVtVyA+YXdZcvyMS5f3qx4KeS0M5UKrdH6uVp5AP7AuvVoXXqLIR+67OW3W/+dJYr
	vTyUHOyiSHzV04S5cCMOyt2KPZPPGft/NA4adsw4TtCv5vkxZhkEkpRLVcdnYejqPNalZZTMuop
	ok9Dk84/ZhmQh2mKBvBAZXtn5BkrZ5ckqniOYyVhhXyiu/HOOijhGaJY9sCTcvNOI7Vu/8hwq4m
	TTJNtKKfbBtRP5aIiE7AMgePBfeK7JaJYj0ohtFDCuD8hPYRhXUcD5RR7Up/Wv8OTjqH21ouPSR
	ji8KBrG65S0xxM=
X-Received: by 2002:a05:620a:40c9:b0:8a4:107a:6772 with SMTP id af79cd13be357-8cb1f72a954mr610497285a.76.1770775362468;
        Tue, 10 Feb 2026 18:02:42 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc054sm12410585a.7.2026.02.10.18.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:42 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 03/10] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Tue, 10 Feb 2026 21:02:55 -0500
Message-ID: <20260211020302.2674-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8916 analog codec is also found on PM660L, typically connected to
the SDM660 internal sound card via the digital codec. Provide a space
for specific compatibles and add the compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..c7424d755cd8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8916-wcd-analog-codec
+
+      - const: qcom,pm8916-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.53.0

