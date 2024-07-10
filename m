Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB3F193067
	for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619564; cv=none; b=Hqsnv1cIwoRQwSTI98sAdFqhBO7a5yWmJ3g3hkNUPPQ+DxID541222Me/OMraZUcaqn1JNaxgOaBoSYV7QLWVvec8F8yJlpL0MtR9bSMRHN0b5jinbcekHpKQvskwc36qIsj3SHRv6B+WliXgALv6Jz5YKU7OLliShQhdEUAPSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619564; c=relaxed/simple;
	bh=xCLRTG7ipn4tiGh+nXkgwfMZfAsmNK9dFGTdCsvf/7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qAR4GpVrnCMHL17Zr5H4Cqx/AOyKZE8hI/WRgGprFMEM2XZK6yW+HFQKoH++J5vBVdRITebkh7cPdoJh62qM4+/6hu17DYXbeyaiNJyfmsANyNOaFFac+5noc7dtsMSfvm90KzUtoKXpQ3/3FjBYspOI6RFpq6LRzsnvDLvkIeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z30DtUh9; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z30DtUh9"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e97e5a84bso9650474e87.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619561; x=1721224361; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eG+Sr5tcj4iLYaVgjAszjSri4jbIahacA3U2hkyfLzQ=;
        b=Z30DtUh9N6QdpXwDi9fRAFVXM5278EZUIjTiilVZ64Kr3iW5kngSc/zAcEa/iXvwPn
         SKl10LTI+QrUb6Gz+jY+oHQ4sEHXVMw18T6Civ5C2GXUL08SgBEk7Du5MlVbbP+9k9xo
         VDjRACERs3JfRO4ctVMoQPqMv3QCyPgZtq63k1R9xXn8SPU0Ki2NYnp3u6G1ZCEoa/H3
         a0CwcPFD2uM+BI4kvzFi2Lgy4ahTHowTVNOtCcYOcb6HgVHg7r+TXg6czMuBWUweF5XW
         ni6F2pEZ9/rJ1M/63a8axS14IcQ4ZmbCKUFimjOCgKGga14SHs4sz3Omb6D33iLPZ2wI
         epLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619561; x=1721224361;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eG+Sr5tcj4iLYaVgjAszjSri4jbIahacA3U2hkyfLzQ=;
        b=G2zAkXt5Vz61WuBi8ZsFRPCJCTNPu+QFTqdHBFmioXShyccQJ1Jhb4S5XJCYhHA0Hf
         QCdbMk38gBbZft74HeIfFlD8/lEdjDwXHt8755LOlowCy1cBdVqRSGLh/wl0ZTTlkfPa
         1CmqZYHr80JuS5tGbqBPVqv4EJAQc8fV44SB+y/2JtJsx5Ztuzfln7trzAWmFZIRWkdf
         T/2gGrGKZGLdpbII0/sbetFxksv/L0VoAerzr2e6FMTid0p8HSsR118j5Tu44zdRL3AN
         XfSctvvefdlwYEWzROniiBSAZor+Ibn5xrE0dg4NC/JxUYM7wsIyOUsj/EpbLGot+UkO
         vgtg==
X-Forwarded-Encrypted: i=1; AJvYcCWWeyc/1fF2jAZpkpCjERXh8cPw1P0s+uVNxbOJ5iq8gWhgJ1EGrXANtt3UWCZS40+WKdIGmRaO1r6EKDQ8ktZHjbYvjmgUR3qEI/g=
X-Gm-Message-State: AOJu0YxbPgBNaYSs065aqcsjPru6h9aediaAzJnIhWrOPwaf+qjitqaO
	F2eu1V/wmohJla/e0VQMIAoXbZQDF9AAUO8L+c7p7PUGbFChxcIIz7nNgobQZas=
X-Google-Smtp-Source: AGHT+IGI74Tkk+bMOUOiLt7ShAbiFrBfr/fOEAEBbMRa7tJDzVxniq8rJ4ZAffl1kUcxrWh4qs60mQ==
X-Received: by 2002:a19:7708:0:b0:52e:9921:6dff with SMTP id 2adb3069b0e04-52eb999c2damr3844744e87.26.1720619560886;
        Wed, 10 Jul 2024 06:52:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ASoC: codecs: wsa88xx: Few cleanups
Date: Wed, 10 Jul 2024 15:52:29 +0200
Message-Id: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2SjmYC/x3MPQqAMAxA4atIZgOx/nsVcSg2ahaVBrRQvLvV8
 Q3fi6DshRWGLILnS1SOPUWRZzBvdl8ZxaUGQ6aitiC0esx4q+26EPBi/wF0jqjsTVObqoZET8+
 LhH87Ts/zAvQQhONmAAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xCLRTG7ipn4tiGh+nXkgwfMZfAsmNK9dFGTdCsvf/7E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIgOoSVr2Zwu1wsDHRIcZrveKRJRSIuDq8nt
 RPtif7BrGWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SIAAKCRDBN2bmhouD
 1wh/D/9lsgACXVjSoXDNyKh/50MNApgsGUF1FAG7hSEA8wgGCwfXTAlF+T6iLK/CwOAkjjYnr/X
 cmNfVrwGDq8BVLYIMRKbC2HNV2obW+l+Ujo07/fLa+g9aQUhC7ZEP4tHAm8qrlY/m3aK5hPDBuf
 z6IZTOW4byybU0zESW2OFb82RYXE1kt2ykvp+Q10qcYohOJloV/KKrC0YByHeLAv1/58adeBjeo
 gcSIsfPleSMx29G2WjbpQ7tXT5wWDIANzMl4+PkUGgZrbd27unoL+xYm+0NqyGqis0G/BXI4JqH
 +yErT3gQKDJaI4RNI8edaxLj3mkY5KYSQbSiQ75wklEz+xLdGmiQ7hdduSwxr+JagfZNuKIeaZe
 jEuRBkbyQ4lQGu4kzyMJkXOWgFTWo1gDOSBVIvc0HcWvRtWs+Xtw3jiNjg7EJVGEnxyAy36AjBq
 f2hQCZncbX3Kz85G7x/ARpGU79aXANhLFec/a/mWVqG5sqowgfvYq4Yh4Jax9Vyzfe1DODtHWLz
 Y+Z39HzUJqBiosEnlz/+5ptF4y+/rUSDig+76co81LY2E3B6BzDxg7II0oZtO8pwoVfS9ivMuzv
 C20tQU+/QOyG+ZDA2TVW688bOr4jgRDpAGFngu4vigPD0N5Of9bXOj5fnwQQWS1reYa49NMsF2u
 B8nHm7ztuwmkKjA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Few cleanups around wsa88xx codecs.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: codecs: wsa881x: Drop unused version readout
      ASoC: codecs: wsa883x: Handle reading version failure
      ASoC: codecs: wsa883x: Simplify handling variant/version
      ASoC: codecs: wsa884x: Simplify handling variant

 sound/soc/codecs/wsa881x.c |  2 --
 sound/soc/codecs/wsa883x.c | 33 ++++++++++++++++++---------------
 sound/soc/codecs/wsa884x.c |  5 ++---
 3 files changed, 20 insertions(+), 20 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240710-asoc-wsa88xx-version-dd0039265245

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

