Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95F23958D
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105535; cv=none; b=EXfpx6v3EpFyfWUsApp78Hw6HsRNksCdBvy6fXvB0lJicu4kdqjAbhXsMIMe62xTVkslahz98IJhoSnSb1nbFymdO9+W2gtsYcd2fjGw9/42Qoco0v4VncYxwCrsL+IcV7n5KINoanOQ3PpB42cieMjr4yy7xrcavW5o6Uf6xt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105535; c=relaxed/simple;
	bh=VkwRwoyvKaQ5QVA7JKJ0O3zkd+6+dznsjpyKtm6MHtE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UaUtMpd5tANGooyNu39PuR7yoXZZk1FhEy5blqZfqGYoEikZHWJN1bb7bFjUKxbYwi+6X6FwLx0tiCplqYVHxNVl67QI5LHzWDm7U/cMsAR9p4Kc+44E/tnEq9dV9P91fb4raKxJAuc7LobMC7UdgFsxx4qeBWKiF9HGoxrtCxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ci/T0A5V; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ci/T0A5V"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42421b1514fso3922545f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 20:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761105532; x=1761710332; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2ZSDEAy1hrlTsCtb6+Des1vPZi3/b+xnBthz/KUkPk=;
        b=ci/T0A5Vje/VYkRvOVaHE/DxhSklRucuUpkXLEgbY+grV8AYie+j/4bh+yiZ/yZ7t8
         G/eHYFEml6NAEW+jnMXb9R13mXKKTnI4a5WfW+ZORpvuWgL/gJJctqAcG3hHOjVEOxdr
         PEWPt66pHhMlLhWVgHEuoBdc1XG1YVYBIj4vxSdlsaYPhpKzWK0WRbUE7O84Lcix/EK7
         fa6+vT1TJNNIM/fbDH6h5sU+Y0ANBQ2E2WfnQXs//HYMe+n3K7SvampE+ht32fgal8Xy
         o5tj3sQ+CxeF847pqzDm83686GLwoLeVCLbQGzAkXXFhPQBWsHk9gnwAdamDQJ6Af/q1
         kpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105532; x=1761710332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2ZSDEAy1hrlTsCtb6+Des1vPZi3/b+xnBthz/KUkPk=;
        b=nULMBpxdRhcjprO/2Tsj7jvAk3E5j/u4cvYos04TleohuoHyTWXTBclzVJtnZ+Iijm
         /zXSFxTBnpCy6iyFaWWfgMA0dOvU62kd2iaAp6J/yAzEzNvzmiW0N3cmesgyJnTDitj9
         /ddRzCCEmIfD+23GsOWhswEwdLYmZLIf3bqizD5pBK4gIh/KO+JZnMB32iUJNcuahEo8
         imtzo0B1Pmg/ZCrHGrunC6O3ccpL04+9EjbGh/BCmhhZxTI2CU5BJplHZH/41U9HYWd9
         YoilNicFR0Mfy3zetBPQD8Spq5WSX16OICwKCt+bl/LWSvt4dASaUMlDCZqHfUce94zO
         BVjA==
X-Forwarded-Encrypted: i=1; AJvYcCXRD70PiV9Jq6iw1TPYR0tKnAkptdMG8+IA4R+ZwjNjGcXywWfFC/R/Ivt5LdZPfiZfH6dYm9ziKrORHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx912iY5RBTopJSbyfO17O5NlK/xux+LuJ9EMBtRWth5ho8fGSU
	GcdoKPv1jNJ7iYJiuB8xE0jLmEJDHBM+L4NdAKA4mGboYPbp3ky0RSFo6d3Y1zO8gpo=
X-Gm-Gg: ASbGncugeXJJ9SQCxaJhdaErQcnh701Ac9Evr3GDcjmZcpoU9jrDiu9lMWvjje20k4Y
	g1+CqcLkUnmbb8rVpLtYGJLgUfmf/K3L/vmrrWIrc6flps0fe9QEz3nnYM2ctf8oZp9TV4rqBsc
	1m4ztJk5zoU0okKhiV4djO1168qSxZrp/FPk520CKA/qcjE5eMTStmJ1w2a3SeWOOyWCEgF0POB
	+zQWxkZ63OcZOLcPDGmnmJq6YSkZXVqCzg41SoW/kU5KvlwmyNiPIRULccqfn7TVMiQDc0aoBhI
	sGGg5dvdyWwydCygPbtqRHy8ZuLHPpwpgx1d0Jd1L1ZtAAZkWt8EZebpD+mwT0JtLI8TYH/MlsG
	ppKVPZYxQ3VHcuKsPlaqp3AMYz5q3qjK2QEwfURcmGfFZWZ1VI+gkb4BAVvWK7+cSKndBzVlBOo
	Cr5TWamQ==
X-Google-Smtp-Source: AGHT+IGUG+W0wf+mP42MvzRZOU9r8TQGApLm+D0SYiWzeMUaEK7m1AadbWpswXMeOq5qzD8NLou4HA==
X-Received: by 2002:a05:6000:612:b0:411:f07a:67fb with SMTP id ffacd0b85a97d-42704e0ed95mr12103418f8f.55.1761105532102;
        Tue, 21 Oct 2025 20:58:52 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm23637639f8f.28.2025.10.21.20.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:58:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Sndcard compatible for qrb2210/qcm2290
Date: Wed, 22 Oct 2025 04:58:48 +0100
Message-Id: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhW+GgC/4WNQQ6CMBBFr0Jm7Zh2LEFceQ/DYmgLNNFWpoZoC
 He3cgGX7//891fIXoLPcKlWEL+EHFIsQIcK7MRx9BhcYSBFtVaqwVl6Iq1wtg+iVmGOzrI4dFw
 bMjWzPw1Q1k/xQ3jv5ltXeAr5leSzHy36l/53LhoVnql0RveWm/Z6D5ElHZOM0G3b9gUW/Strv
 wAAAA==
X-Change-ID: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2

This is a small patch series that serves as a preparation for
adding HDMI audio playback support on QRB2210 RB1 board.
The patches here are for sound subsystem. The other series
will focus on qcom DT files.

The original series where one of the patches here were taken from is
https://lore.kernel.org/linux-sound/20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org/
and sndcard compable patch was added as new one.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- rewrote commit description and subjects/titles where applicable;
- switched to SoC-level compatible for qrb2210 sndcard, therefore adjusted
  DT schema changes;
- Link to v1: https://lore.kernel.org/r/20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org

---
Alexey Klimov (2):
      ASoC: dt-bindings: qcom,sm8250: add QRB2210 soundcard
      ASoC: qcom: sm8250: add qrb2210-sndcard compatible string

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sm8250.c                                  | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

