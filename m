Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAAA2517B7
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375873; cv=none; b=jL1+ysmAxxkQdNSOTdbd00EilSezDYZhpbixXFeNtIFx40qV2wPh53ua1pj/iWRv+j95iI1q4shjOOl1Z9xv9MQ3fdjgYUqt47PkP8wY7tEEqJXjyHcEIgJD/cfPZpXaix/oNYYgfYww61QZXZkjZk4+hm1g/W/8EEHCB4qRiU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375873; c=relaxed/simple;
	bh=VPh5eje9bAcWDgKXkvNDiNcxKVyg6L/lyX536kltyjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OxUiyGiQLpekZhq1HGtHgjXRiMoMZx2km1LNN9OfuzfOPfW9na+zdNTTXwnhHrDcHugsi2KUELusiNqyaCD/SXJDgrsErWIxGFmX05rXDQRd08511RYUydXeFPLQZpWIDq7BQ90dlhvQ/RumgQUJrNwjPD5Vmsws07pdQpzAfao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=psqRCYKa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="psqRCYKa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so37689935e9.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375870; x=1742980670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu9AneJ6jeTssLgq8R/dkhVI+8UdajKVGpFrU+v3rj4=;
        b=psqRCYKaXIvspoe0E0TDmR/BP5gsCMay1Pp6vir0zKoYOcoJVIgyw6O6Can4x4lTuB
         xFUf9vS6zEPzeTbMeqsrgoOw7D82kJ/nj0CNKqY1SECHlexuxaq3ugKMRpCKoc7T6Ss3
         JwDrUxzGUlRCegKoJ5qsWyN+jkUhNTgHiiofJhedVFhvS+KRdBZFwEP/A1yvGJiXCb0G
         VZZCmA78GLE1QgUQ4XBpC4gOPn1o7ccJZelqE1eVZMFEkUmEsCX8SxCCobVKoepC4kP5
         ChKxR5c7w9pdjUn+zB+n1Byc3Owa9bRdVQVj8RxT9TL3BSXsNjVfhNBA3TOqcy95Js1M
         kA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375870; x=1742980670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eu9AneJ6jeTssLgq8R/dkhVI+8UdajKVGpFrU+v3rj4=;
        b=bM1/0NuDZGZsi4MV7+m1casDwLaQI4QNgqJfk9WMyuYiRRQvVcDp+K5dSaoTIiX4Qk
         66YFBDuqbpqt34hOsGNgHUMNOPrQFkNR4tSzwEq3OhJaWOH3nA7I+e3/ceZm3K5InIB/
         qaiIvpYz3jLjcXcAvTP3rIWCxe97ypihP1A3llrFNVXwCbp9h5xZ0d087ULFTRVeO5iZ
         sktTu1z00plBGtcK1rKCvzZMrFJngnqNKN63DaD22VtpUAdqD9JQapz2eqGsBsvO8j9b
         hnj3yLNiODHzqlE+benn3U5w/N+qqktkcOi1fLccYCKh1aGaA3pCAOPqiYaQTAYWp56+
         eBJA==
X-Forwarded-Encrypted: i=1; AJvYcCWAigEyMaRcoTKxpuaXF/iG/FtDkRrZujV4baQleNJg8+FvIZOP80+IoTqltkmpFmu2vJFwsoMfBsm7Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ29lJaYyuQix1H2FYNFwkXrUdQhgsg4EdYHQ/c8m1HFbMniYC
	qUjXqMm7r1t5wqODfV7DTGbE47aqaVUsNU3H0k7XwoKAGmNEzaG2fXt9hOFClzc=
X-Gm-Gg: ASbGncttCf58qIt+e3tIcaaycw/wGOnxD8RzYrOVoFEC0rGIXlAiBJnOHpDLoaVkxwh
	4EVoxx3Hv1pPFIRKjuX4nn2Z3KQS7kli3ESkgO93IW6wCFlNNZHw1aSryXYhhfMNtGcMC36zKHT
	2Ah9IKtU0KwXOqianHvfCWPmLxcuuGOMyh1/NsMoZmZXs4S278WmuuXmfd32jPB2masWjzWGm3Z
	J5vsOtqeZybQW4RE8tdck8mjYVPXlvStHpwQ8yRVx9AEBCTeQBcHEoS/YmhT4zjiQ7EOtuas05z
	7EqyJ6ANRPx1/v7j9KWign159T/CXMEBYBbtUl55FHjUOJgcLFSommqqmDDadVXCiSt96A==
X-Google-Smtp-Source: AGHT+IFM+lzR/VCSJcNgqIaD4wovGQBkSyZQxDj6HuZig4PP75GSKCAEII3ZXglrni0En0micDVRvg==
X-Received: by 2002:a5d:6c61:0:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39973afaa73mr1518826f8f.37.1742375869548;
        Wed, 19 Mar 2025 02:17:49 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm20023810f8f.23.2025.03.19.02.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:17:49 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	andersson@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] ASoC: wcd938x: enable t14s audio headset
Date: Wed, 19 Mar 2025 09:16:34 +0000
Message-Id: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

This patchset adds required bindings and changes to codec and dts to   
tnable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.
   
Srinivas Kandagatla (3):
  ASoC: dt-bindings: wcd93xx: add bindings for audio switch controlling
    hp
  ASoC: codecs: wcd938x: add support power on hp audio switch
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../bindings/sound/qcom,wcd93xx-common.yaml    |  4 ++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 18 +++++++++++++++++-
 sound/soc/codecs/wcd938x.c                     |  7 +++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.39.5

