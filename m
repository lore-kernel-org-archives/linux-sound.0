Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53BE38BF70
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985942; cv=none; b=Kedo4ZxFqb9wu5eZNc00zvQ07KHNZz0aegm+1qC/tIaW+hKXWkP1DEnECpCKUIqDmX4JTUiZSui4p9Hb53Kq4ieZQYnzS2NofzGbh9vqfHObBt/ZNj1tJo+jijtYzpXDTt+GIrFYqDTbw8dpSHCRWboeTsJFtKYM2h9vrS2sl5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985942; c=relaxed/simple;
	bh=md7ZgyJKci1oL67mwHChonuZy799l2+wru4xchUlLE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNlTlz8u/FlZF8lzJU/6KHRzARbUkhHH0TpyGDUihMcm692Oa2Od+ujPTwKqS3DjuhSY96zPagi0VS32Re4rdB5VjX+jhU4+yA2vTMvV1y2qNBATxBiIkCOwmLsma7fHlvvUMmnoidZp4hyxZbuLf+Ms1ZuyzxmSEMC3s8Bml68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcJQZTI3; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcJQZTI3"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cfd122d78fso966345185a.3
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985940; x=1775590740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8PeiigyZeO1TReQFmzOYp1g+SjtZC0Tv13VfVdNAnw=;
        b=YcJQZTI3egIel3Boxoxkifz3IOHjSFkT/nmX2NTArEqDC8W1PteE8GOJjPqcgBSfJE
         sRsfniMWKCiFBLZHf8oJKMVKk8wtgL7VoUZuLqaZV/ARPxOUvcXyDi6bhM6OB9ZTVsDb
         abYjVzQxLjW+q3NkCQSa6gGNVOhDWJJHZ5BqhGZuQan1ANJfEABZkYRkoUBCD86oeiA5
         3ijE8nUr8ARUzste8GdykxYjtYA8Dph9R2KoH7ilOSmRp6g319AGARlwZi7UdZHbdP7j
         HEzVVYs0hFYODRgpKoUVeYx1FEws3NmbivT2HAAi0d7ta+lf9Pg/Ch6KN/AEWoYxS+cd
         +I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985940; x=1775590740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8PeiigyZeO1TReQFmzOYp1g+SjtZC0Tv13VfVdNAnw=;
        b=EZ8Spq6PVc91tY6J6YXQggFmsJX5rGetF/BLfxRuMxxVRLWGmjXJz2gWzzsdP81YHD
         wW3cldjT9l6zq74Z3CX+qPkUo/6XTgyDh2afABubToz7SUwPmwPs7aD5cOPOlf9XeIQ7
         iZsPn78mGr5KwUsaAk0bmA301ldVoYuFNTOmvTIVZuUcKkhXu+vE932ywVNM0rGVx9Ru
         HqagZ8j0dCeaFlkEXa5MN7mqhmWppvZgFnyaTYbP5B3QUSpLjNDzfZN9CzOGAjjIABAQ
         /dQRuqmksu78mpHykIq9+9aPXGYRG5g2qRC9uSXckC69lzCU+dJuYLWbzE5RN/+ZXc5B
         Bs3w==
X-Forwarded-Encrypted: i=1; AJvYcCXidphZD9MkeDZiSJb03bEMDih5rRlkeSFlCXnCZw+dWap6Ylpln39f/AUp4jUxPEhSMWx1YMHI5H96xA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Pi/o/rFExW9c8ToJx/HEXb/om4k4FtMz1mHImYvz541fdFwl
	jaNkKOsG13WK/jMxipRVITJHnHQWDgnZQnzE3EL031xGHN7y6zVD/EH9
X-Gm-Gg: ATEYQzxYQ7KYASw2kPsfDFJj5WV5u/GNJ17T79QKbH4utVIJhcijB0OKLYpJNda4kCx
	JZ/9uKNmOhY4ilM2gtke6BLuZG9pvysLrGbK/szB/UWM3O92bh014pVCV11eWYF+rdI0TJDOhkI
	CirPxslJ4cWuSvcDCXpwYF/zMS/RAoJQmQayQrNZf7+ZFt9VyCj/OIGG6GSo6OcTO/vSE8B6hPP
	8KzEuVZUdRAJIBXd4tgh/3svB7EU/IJBzmNbad4reHnskX7x44nPuMjIAnOG2belaHQwDuaaG55
	dsEDBMijupOkP0Z4M8jDJmSqMJjyA6ZgV7qUqwgMFfOSr5J5+XrICM1Y+mTjhgFcMnXV1bAobGv
	MAfIKM4zdRH8oeN+PeRxu2/FqYW//yW+p8KOXrjrsnWHy+s5FYmz2/ZpFu5K8N58v9OQJ3BRwtK
	QyaMLsr+YFntEURU3LRNksK1aM
X-Received: by 2002:a05:620a:bc8:b0:8cd:dfe9:60f8 with SMTP id af79cd13be357-8d1b5aeef3bmr142663785a.23.1774985939822;
        Tue, 31 Mar 2026 12:38:59 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02806a36fsm936924485a.35.2026.03.31.12.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:38:59 -0700 (PDT)
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
Subject: [PATCH v3 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Tue, 31 Mar 2026 15:39:25 -0400
Message-ID: <20260331193939.40636-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
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
2.53.0

