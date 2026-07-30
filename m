Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC3E446833
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433452; cv=none; b=ovgOnQbdtxvHrs4sOyZYQvGNkaGCFljgtpVjMzoPbp+ypfg/OzDE1t0Fo/ARrYbqX/zJqWEpbTnIf5INVsyk0nN582nQtsuP8Si5M8cWd3M9tzIPhVJbAddu42KDVW28Ph/4wEUSIeiIOgW5D1Jb+21pHFVnAp7Y117lyp98EfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433452; c=relaxed/simple;
	bh=khfiSS0XIlKu5DSCQEk7RiTjxSUSShB3Tb8nSjkW9UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnbHbuTK9SrcxMq9zNAV9wdYRXhf7sMSgJVfK8n8ttCaelcoLRXL5NTLWkiguj5bTRuqENQovatYf0fbKYXiWgYEoqj1LAipsK/noTjeyzLnfWqg8MMI5fHniqG7+lXOBNmHUF6qnbZlWPOqSP40vmSoJhFYuQhrXu/C3GXlwTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaKbZZ7H; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaKbZZ7H"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-930f618435cso5963785a.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433450; x=1786038250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXeESfthaaswCT1+YBVYrBR9m/03EesiVa1toHE2g3o=;
        b=PaKbZZ7H1GUp57lmBFAKPTprCiJVqFbX1ukAfMj4z91sE7Qe3EGpKKU4pSq7amzBC0
         PO+JYOtlFnXgKkxdpjoIYqGjWqaY9tEIY5eCjGNIcaIAFddvEaPW87lfGSzb/J2YxbIZ
         IVd0lPSuAV2SqivIcGYpGi/qXtPW37+kb+MfHIcr+rvIEj+J+yOdhninn6I9yxyoZuLb
         whL6HZt6NAvHPmzSB/tnaOXOeAapKBE/yroBuun9lcevGpN5wnSJKyiiIxEK+Ia00oxL
         JFesG/pK/n2C7/cGOecSqoTAhIkwBac/f2krMFMoAuKTtu9gYBXjenxaojqxp5lhu2dq
         RKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433450; x=1786038250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXeESfthaaswCT1+YBVYrBR9m/03EesiVa1toHE2g3o=;
        b=YqSMvu4dwo0EH8XezACsTOVk+rKSuvboSHRygdX5yxn11px9+MdZYYOn19mSu7LK7L
         NqeidCOnGyoRd4FFHw0Yx7bwDHqNkJXxkaOfnrMuDAqNUMFFMPezMh80jpXjoYTBCp3w
         Nth3DKaGOweDqLwLkOz61xjOZlnjuHBW8RzC3BpGMgYgsqP0ZSlKcua6z/dsfJQVnezT
         ncdIishvbRI2iL2+bPeKp9in8ZBe5Dizo6juwAlCOipTanKNNI5Mczx1wB1vgmQ6oHZL
         qh3Ez0i5plvJV9ED7SaTrVixFErn6Gv6AqRypZnsaVjJUhTajJRk6K7IxjdYh2si6+Sk
         x1hQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzxlEKrZQVIXdksFCGbRV8XzAUErZRyGzbE7bvVy5CBQb0bFqI893+R18SkLdSVvJqDQIJD4uWiAGCow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/gZZaIY6tq6Ck2DYrhGanGRpGuSe9GeHu7bmMD+Frd0juJ/Bj
	BbG0GXgKXR5dMr2m/eYDWJaJGMathi3qQTbBrHVxe7VyVe0DS+qOZWP9
X-Gm-Gg: AR+sD10zOjmeCX/gJREnav4EZo1L1b6rypltnV2uaR6trc9CJVcHRkZxZKBgyhRzRyo
	XC1j+xvP0PhG8KkBclbxqhu4CB4ljRzajoI5Q2G8KeVXMC/Wun3AE1U16ZDGiKhhJV6dfbFxD6R
	FQYR72KMtq82PAXy8EUPy4/pVWhZsCtd+7qw+u7jlxn13TkhSaKNKL1Ifx8eikyn9FtsB5mIS1t
	1gr0Z2XoufBxdBzz8oPXRKwcc2S6KgKbz+VFGEhKWc0nYO41BXhv1I2hZ22xwvvCcdcTSJMA8zz
	4MoADhOANg6+jbkbuz97/VXpv51rwtz4YwDtaUuY7RU9KjRl9Ols+BFimVWyf4i+Swzt3ua1w7o
	3kRs1Zm7Nn5GaKjHt3p4CI5Z+BHm3Mh2frAUdVS0vSs+0vnf9M+y7QpA8vfhhpwsN/H4IHJ7Bl2
	FmtuXXyS3IcqJAWw/86YQOPxXMDkW4MTTTkBnFW/GG8IM4YFW9wxZ/927F2YM=
X-Received: by 2002:a05:620a:7115:b0:925:56bc:b8bb with SMTP id af79cd13be357-93485f9902amr409114385a.9.1785433449557;
        Thu, 30 Jul 2026 10:44:09 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3221c71sm469990085a.2.2026.07.30.10.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:09 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v6 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
Date: Thu, 30 Jul 2026 13:43:41 -0400
Message-ID: <20260730174353.108023-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Skladowski <a39.skl@gmail.com>

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[richard: add back empty line]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..15389645a3e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    enum:
+      - qcom,pm8916-wcd-analog-codec
+      - qcom,pm8950-wcd-analog-codec
+      - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.55.0

