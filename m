Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E77B231A3F
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568455; cv=none; b=T3cKYtDQqtVqNTeownna4+weWaSDSVWMq+KsK0RSXxh5De5l2HURzE/rnPbKd8WQc/FytuE91Dc/S/tPE7BbvlLphM2KvLw4IGFJqG3NUj/suT3hwNcJ6JZVX1twKbzMjYa2bZDMouwlaJXtdcRDINhJWRdOAYh5zQORSafLMXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568455; c=relaxed/simple;
	bh=IG5EYBIkkvxAjFWHA58vQMRAHNLYBMvaI/+axls57V4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VB4PIF4fxhGqd7DFSn4+Ozuly8mhR+Tim+7GvQWyCCBuVXhf5/2euSNyMdYiz7zjpv1Vnlc69uxVU9qvqFsOFcZGYnus8V4RpE8FGJs/I7EPLG79Z5fbombC6BUKVWcFXDxysXvsHqkPBMzaFeIMmd7qz6lZZqnI2sKADVwSt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cI1iGtz1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cI1iGtz1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1505198f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568451; x=1746173251; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwsfA2vx1w0Hd+MxkBOwMy08bPVFTSGUVL5IKHTSRSw=;
        b=cI1iGtz1IjGdprJaScSGS8CPYpwm/AHEfdJoZRU/q8qIvHOWz8lM0au8s075QFAYlX
         6S3HbVEhZCemaDOfDPwgiov/kQqRf0/z07U7CPIILT+KA+3I1kkuUicIRZeB1J8Hqrbj
         23mIgwjCHJD60Dxa+KtgOjDhgWxYScFyoRYGN3IruGS+uH39KfS2h4dw12r2WV6qCYym
         rjkRYYTnCezc/c/dRYV+922AbdDYszgRDHrW43jbnY8vlxwrVdJ6hL2lPA7BaUpt4v5+
         zrr0yLzpn7pPOvCvaV6yXqdBp21dUysARbg8fYoAB6xntpLwn3tuDfeCDiH6C/oQLl4e
         UkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568451; x=1746173251;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwsfA2vx1w0Hd+MxkBOwMy08bPVFTSGUVL5IKHTSRSw=;
        b=WSiDkCO02aeYWcv7OAmwO8g91ZXKu+Jjk+UBfd/YCNOan/m3u1hdMWBeVJ1o8zfaCO
         Lt9qSaRQwzAYLZ23Gd1i0xvkbe8NbXz6lBJ0THs1OP3+SDTyip1cCxDk85zB61z6OCTP
         /VQRQZ8+kbpdqoxLFWQsyW3XiDmmjEHXnanUoh8/JQU/H9lQlKAPyfAeMe7Q6ONK6WsO
         vS8+s2skMWpR/f5pu3/mVG5+63yiF04WYMxY0veGFDFaeMF77HqVjY7LxvUM+dP0Cr44
         7rXzImTZD43qTsDkkl80NvA36SC4nLeu/sM1Lu5+nTaH48KYOO4pIIDyvGAh36utosp+
         9I/g==
X-Forwarded-Encrypted: i=1; AJvYcCUiRPL44owgcvGzwC8v4PD0YWPiUOthlQ5PzdiHJ2oNZJgmaBndPYoT6UGzhRzgp9KIXSCy27KBLgnJOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQelHDeWUmqqPQue69Hs7GF+W1Csnbp/ngr5prtEAbiS+ANGCr
	IdffTAqlYSKf3Ou3Dr1XxVYzh8H9aPRDSlhFHrB+i3rjy6azK7h+yW/azu6TyVg=
X-Gm-Gg: ASbGncs1Z0yej58d/fQhxZwKvBATWGaOPZyYLRNaPHzaC8GNbKMbHlmqOliymPnkckD
	0EkiTLJByMhHZrIg6CSJahaZqiFIsAGhiEBU50fD3qAFz1tIRAp0F6YPchb+LkR5pRptFfAY9qW
	4Nx+NQlSt1uLoP2udWhuIS0ljJ1WxgFus6+Wf0bfiACBtYBbil6i67EcYAKbDe6yVf0i9JiDaEv
	jzVYZqMLGpFsxsgKG5vikjVct+fsT4lELtxIs/tM0+sQMuVXuB7Sv3bXCwVXajTvxAOVtqg0vNP
	tW6lVaDmv7WV4PVO0Mwg52hwOEn+4DYoPvTF+NhE8wFqDjKiKv7MiOIdlIGXk1gnS5HqB+VzeJi
	GSFz6CDxo7im21liMtK+F5SDIepFFKE5nd9ZaoXr2a6ik+tF8X9Kzb8NOmx9uENbPRCU=
X-Google-Smtp-Source: AGHT+IED++efpf5n1mpdrpKSqo0nctSBfmgC5H7SE7rg0sC07MwBn9G01Iz8pW4KpUWARaD7Nc47rg==
X-Received: by 2002:a05:6000:4203:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-3a074f39913mr987084f8f.43.1745568451325;
        Fri, 25 Apr 2025 01:07:31 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/5] Add DisplayPort sound support for Fairphone 5
 smartphone
Date: Fri, 25 Apr 2025 10:07:24 +0200
Message-Id: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxCC2gC/3XMsQ7CIBSF4VcxzF5zodBSJ9/DOJQClkEgoETT9
 N2lTVyaOP4nOd9MsknOZHI+zCSZ4rILvkZzPJBxGvzdgNO1CUPGUWIPNgrQEXJ4eQ2q6VppG6S
 90qReYjLWvTfueqs9ufwM6bPpha7rH6hQQNCdGtjIuG1Vf7GDS3EK3pzG8CArVtgPEMip3AGsA
 ih0KyxKrlDsgWVZvmKzgnbtAAAA
X-Change-ID: 20240809-fp5-dp-sound-b3768f3019bd
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Add the necessary sound card bits and some dts additions to enable sound
over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.

The UCM files can be found here:
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm

This series - in spirit - depends on the series enabling DisplayPort in
the first place, but can land pretty independently, especially the ASoC
bits:
https://lore.kernel.org/linux-arm-msm/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Simplify return qcom_snd_wcd_jack_setup in machine driver
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com

Changes in v2:
- Revamp series based on comments on v1, doesn't have much too much in
  common anymore
- Use sm8250 instead of sc8280xp sndcard file, so port other required
  changes from sc8280xp.c to sm8250.c
- This also changes the sound card compatible to from
  qcom,qcm6490-sndcard to fairphone,fp5-sndcard
- Link to v1: https://lore.kernel.org/r/20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com

---
Luca Weiss (5):
      ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5 sound card
      ASoC: qcom: sm8250: set card driver name from match data
      ASoC: qcom: sm8250: add DisplayPort Jack support
      ASoC: qcom: sm8250: Add Fairphone 5 soundcard compatible
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
 sound/soc/qcom/sm8250.c                            | 27 ++++++++++---------
 3 files changed, 47 insertions(+), 12 deletions(-)
---
base-commit: 7f1dd4e6634d085f3c9652d4e0f1903659fb96f9
change-id: 20240809-fp5-dp-sound-b3768f3019bd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

