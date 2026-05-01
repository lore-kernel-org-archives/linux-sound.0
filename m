Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895723CBE6D
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649480; cv=none; b=WIcBxRko+qG8Y/ppCZKlW8749Z9OAgryUIy4DVz0/DE4kw/qbuA8Foxscnr3PYIDuZCkRwZmVZ7JaMwYKcijp7PlzFQwocrG1kSgzSFa7PlTx2SBYil9A5OeYipbMxHPGDxkmQ4RjYWbiplFJT/3I52FOH6QcwMgEeoIZotEsPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649480; c=relaxed/simple;
	bh=nX2DQcNOQ7oifqcJcA+EmU1Zu+DWtc8KYmMM1NgKSzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiKog4TCA1pNvlMpxqTK//N+or7mbYYKlCQC7b+ovpYEOygG8rXtmKe+0ybuyVn/6V7GDjBsC/18hAmP8ijQkzm+6ghIjZcQ/RpMeMPGbabIVGtlJIPbn8ec5oGBiaMDBmFVUqx+TFBSZTlkT33YFiAdOuWIQyRDbtAXcJN2RPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjbwUwtR; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjbwUwtR"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8ef5776530bso228159585a.0
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649478; x=1778254278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch7rE1VNln7POTB3wB90DrTGP4Xd3D2qhejjp+e/HWA=;
        b=XjbwUwtRofmq7hG+qrM7BxgTzamnYrmTCyYS0qruK3pbV7wbuhar8oAJqKWqs3Bv2f
         SVqE5TrUmL4lTvBijPCZsOjpAJ/V6R6lkk/mLeln3QIKhfDwWL/+i59Te9AT6J3tRCCt
         3I9LWYUETy8icoGFF+8lYbA0XQ8VNtaSoxPu6pCrNErYrSNu2bJ2phwBLO5YUW7s3E2i
         FsOlpd5IIXKiVoki4CqsYaRXJibsV9N9j6y5ty02+9ed0mcEEhdVBfk6+AQc/AOxUOe6
         M+xnx3oCf8N8+cygPq0bGGjsmJ1BmvxoS7nOZJO0s6SbJ/Q7tlyb5qrBFUp+60srYO4I
         45wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649478; x=1778254278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ch7rE1VNln7POTB3wB90DrTGP4Xd3D2qhejjp+e/HWA=;
        b=TBRaPwgYuPBfS9bF/vlRCY3TjTnksMfZQSNbV16ePhS2NkjFBQJk34uBhgmgc8Hu4w
         LcSKDcoeiZZbNw2cD5xxDlZPmxFfDRVzdNNanXgqUwaByym2pF9x0DiNdTPOIvae5jvl
         YtZ2GK4BCutE2KalUj3z/JWHgcLxt7zwkdpFy78v9XBmSRPPkWv0M85CeraA0gtwd5cE
         +5drZyxDrBN6XM8sGqfrWEud7ZjeNqqTvgg214fO3FDEcCLew7omBBIdYb98VIP5C9L9
         3+/iNufONJpJpvi93oCyIJhwHix95HHN3UTJK54z7aN4y1YamVKkDrDdGe+us3bCtCAk
         3ZFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zOn2MPgQ4hnNNRWqzk1B0G9hkeJo98Vt0IhHxNUHARyfqXWH/nI+cugjeIK5ht54q4OhBNjg7qXnrvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHW3TZnT0EWwwQSGHsmEr8Ix8rPt5e/MhMtf35EcPDofwJR/WZ
	sMwYmUf12NU8iM0DuOMDdHfdZZ+WLXfnUIM3MgELn2ltEm77AvuWTAyU
X-Gm-Gg: AeBDieskHOeKjoYSOHHUPQryVito1sG65pwcSX/QWJt5e6yLXLGaRjVaPs3O6Mz6Seg
	7Ul6v1Q8D5n+PHgpEPYGC8HOZg+jhpB9CfqJ2HPgk3SuMJpfwsAxaiKq73UzEdDGXo+iHs85Up5
	puTXfsFVR1g7buv66fFcnVurwHBnSva2741oRA2BQ/wxmT9Ou3b1VxQtObMPQgfsibgF7CGFgid
	cTS7hY1hMsr8CpP5z5WmF0kk8w5r91MK8ZilfDfo9HLuWF8jUwLvOd094IhlqDNLvQjmaQQY3hM
	FM7EdMarYMoNHxH3EmQRakXprkTmxnKf8uDj9mTghwj9t+R3JEKYJUxrAow+j0bKXXAfyqXbwru
	ik/GmY7ssBSlV9eB6Pjof+yqrrNiMlGhArPrdOjV/AnnUXS+aUjbdVdCMWvgLiojsPJKo0rBY0k
	mvzLlzr8nlYela7CZX7heTixNqwz+LK62HX7iS
X-Received: by 2002:a05:620a:4510:b0:8ed:c0bf:2c44 with SMTP id af79cd13be357-8fbf43ff3afmr503046485a.56.1777649471865;
        Fri, 01 May 2026 08:31:11 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c253259sm186122285a.24.2026.05.01.08.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:11 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
Date: Fri,  1 May 2026 11:31:16 -0400
Message-ID: <20260501153128.8152-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
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
2.54.0

