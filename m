Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88511F76A9
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 10:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853172; cv=none; b=KG1F8Ui1LsXKGlOFUjhaTm7KRnBN/8d71wRaSE7E270d3whvsLPipYG02hMZz/7b4j+CWY8XQg/XU9lh3scVJN08yl4gteE5MUocnOVw94yByGYqjY4r0SjTImSLA+G1+uNq0Fi14rpqE5YH5cTML6GamybxYGrcP3J93HpVA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853172; c=relaxed/simple;
	bh=49/xKwp90A3nUA7tjT2wsW3FlqT957A383Rxrkqteo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCWJV1bAiwTKhEn0RO2nTn6iuCpPYzxwl4xKfNZegVF1hwHgiyw8eqwT358FE+9dnsrluFiOu5T+aANyclRN/XajoJKE9NnhIIexC20cdb/uiY+BVkYiPDl/3YaGTrfnSpyYleRgF6Mr+0z/od8/ELAM/9xCENjFwc3ReX6n0fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F4wPASpT; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F4wPASpT"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7edb3f93369so1035082a12.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 03:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853170; x=1730457970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x425G6dEYUoUHrFlVfLmksWom/x1l9U5kI5PEjY+YTY=;
        b=F4wPASpTRpww9QXezOSUTGHhiQakLAUMNhw2+Aj59S6w2gD4MVGnyJOSn3+pyFUD89
         z+qKkmXqOjHLAMNQDSYEEibzbB13RFfzCPPgrSw96APtvFVXDV6Aqyc+dPIcagQauOnv
         gryZKu589FyMkbCOzAdHlvGNndO5GwfbF6czM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853170; x=1730457970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x425G6dEYUoUHrFlVfLmksWom/x1l9U5kI5PEjY+YTY=;
        b=gqSAQrMBqkcXIB2f33YX+b20mApJmbe28iigHitEF2WCvLXf5gyS3jHnpRBCYumXYB
         NcaQQqlTZmWw7VqlCiY2WIbeBcj8x2Dyg55ljNzKF26jt4pd1orVV0uqFNZtENMqS+Mr
         ueoIdDckA0DMXJGq5aN1iQz071jmfX3GO2NaT3BDX5161bZCSYxdR2xiuXrljJi+rWZD
         dSrxMKXqqu6KKVpuY4u/RAPKDs1LQUzW/RmyhcxOJB6lv5VfTRuf4TMA0BKqwlJSGn2U
         cmEGDZCVzwKR5nKRs+El+vqz0NRP1JNiqDcRncZT3BUijpXRac0ooIexDH1GQ2/ZQiVf
         yqYA==
X-Forwarded-Encrypted: i=1; AJvYcCX+jPT7dPuAWIi16r5o5pZ70ccv9/cz9lWwv/s46o86h5T0UAW0V2YvsVc+b/Nf6n3dQVqC9dHfn2smUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVZBlzHq7xUHG5bHrtKOUniEsePFKgtq4lwfz/8N2o7DKRJa4
	h51PHuHfSCWb8MyAkQPytluMg2p4fA75hvBBgASlwx0c4tXJbNXuEUcBmufsIg==
X-Google-Smtp-Source: AGHT+IEMFtoeeLC2uQXYFxaWamey1ztw33rudPnMqbRU3YeS/y2Io32Jyg8kyssaMwHSNQ2DL5ZuzA==
X-Received: by 2002:a05:6a21:3942:b0:1d9:2bed:c7d8 with SMTP id adf61e73a8af0-1d978bd541cmr12258372637.43.1729853170180;
        Fri, 25 Oct 2024 03:46:10 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d089sm829548b3a.99.2024.10.25.03.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:46:09 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Steve Lee <steves.lee@maximintegrated.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ASoC: dt-bindings: maxim,max98390: Document maxim,dsm_param_name property
Date: Fri, 25 Oct 2024 18:44:44 +0800
Message-ID: <20241025104548.1220076-5-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025104548.1220076-1-fshao@chromium.org>
References: <20241025104548.1220076-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing "maxim,dsm_param_name" property in the binding.
This property specifies the customized DSM parameter binary name.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/sound/maxim,max98390.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
index 5bd235cf15e6..fa4749735070 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
@@ -32,6 +32,10 @@ properties:
     minimum: 1
     maximum: 8388607
 
+  maxim,dsm_param_name:
+    description: The DSM parameter binary name (e.g. dsm_param.bin).
+    $ref: /schemas/types.yaml#/definitions/string
+
   reset-gpios:
     maxItems: 1
 
-- 
2.47.0.163.g1226f6d8fa-goog

