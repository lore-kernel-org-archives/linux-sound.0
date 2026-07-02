Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE23147CC71
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984712; cv=none; b=YanAEe/y5m4wT5CiRjjEVqEys1vI/2llqgouujOK2qLRqjATWQfRDxdSBSSD6gWmw0yX1H5ZEqfmUHzedf5aEDCv7EVaf1aJwM5JaGQ+WJSKXdlSGcAROFtpi0y0+OTaq/3Uy6K090+lagyplQvQr65yJ7wg9ogrJHc4XU57UFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984712; c=relaxed/simple;
	bh=VLV6wU8QRGGOnGFH2E3sthlWCqQKEf1XkIhY/2Ftu4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MhlRG7Qt0EayY7Y9aR8AyosFTxufo3jGv7bVNAyNZfnlFMWYvWQqDicGdR1MaKvus1BkKlVLyoKEZzgZBBQ/ASgso9addmzCwEdLVgITHE3p4Nv8U+MSAJwviyM0lAxYA9vuBRrcfEXBgKZ5Vl2wUuvZL1xltMGNbsEFZ636ago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYvxx/8e; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYvxx/8e"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-461edb387ddso1466855f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984709; x=1783589509; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpWN5prfDcpDg4wTEr+SUZl03GRcoGKno1bsz3weOCk=;
        b=cYvxx/8e/SE4KRatonyM3uwuNABvdqRR62Kbsa8SIkNBOiC02BRFd6OYiSv0ha92Ik
         2xMlUQiRnMQYIN5WLhTpQOhkLwumck3+7ExuUP9WjzJDt9/ysd1DORgXEFA6ujSz91Ug
         ZXkcPROs5cVp9qgPDQDa5UVZivkBRZxxTrqntiRovxTnLAHDkpSWVK6f0lGFeDG9nVcx
         XphQtlYoh24lc7PZjumwicVH/Jmtn2sNX1qOdLz6PvBuXK70HsYVxBB8pOLqcSZNHeRZ
         MtjW92kOwN3Au5ZHATng1z4ebiJHRIEu7GzAZ1Lox4d0rTGfw965ZOGLKmbVElIrh8Mp
         HHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984709; x=1783589509;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpWN5prfDcpDg4wTEr+SUZl03GRcoGKno1bsz3weOCk=;
        b=k9V4TTery33unsyarEKS5wdEwzBaUJJ2D+3JDLcKBUuMZkK5GyKi3zuSxRz+McldWi
         1K1/yGvpkQAvYC+1gif84U0z21BmEwDwIgby1gKKvUQYNW8WjR28wBd6Yv8BaYOT1NMw
         cXfH1rbuUitf8ZUfQxgQsrE4xN+gkH2EJJWOkMqSJmN9Min91mPzB9V+crXROWu9M7a6
         10Qh5jGK+yVtJ3JkqwmmKNeVMmOQS+wkTHTiXo0W4NAOkEmS+63HmzEmo3mscg6PmVzw
         tHNWA3MxhsjtZp0aXTDfCbP5qXocx900MYF8YyZ10Nix2HHKGUaarWffj6bKAJxwMEZl
         Qp0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpsTRK+qzrr+SsBoPMvPvL7iJqGGxPfdswl8h/dBvw/3fUeaHTpoPX7kHjbSm63WIT5rj/KKPjupjFlYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzigvqPGXOTZHT5pZ7HYb9bju9Bmp0ss11oBlRDKNIf8MAxuSGZ
	ou2KUaF3McAk43phUk3+oD0zUjY6MlCQTIUy2oNgTrMM/ax/Y/rNTINfg9GUaHgeFFw=
X-Gm-Gg: AfdE7ckPzyDpV+UZGUPSuiEv3hMU0aMnTlq6ZWT5A5MA83On5DSusJZiSnJEROPy+2e
	erTFme/pJywQVMkH7+m7rJt1+895dDiyp/xIrFpn94RpdBnCZlJvz/yapRZoIgD5KTUDqYa2rFE
	LP7kkMIlXdfQgaMw+81RtBKrjmPm7276IDwh2nCot3ftmrOv/3UyMYJrbfIEin/PsGRew9AUYIR
	q4GExwFOcaJ1PbUviyXwnlrOhEwa75tvovLCnPFQxcCEH9dhDarQpuc+F7foyEJNMesf+ba0Qw4
	rJhYCljZ8yXY0/YgHPVsBg2TQg4ioIj/Fe7eRwjBriRHFiJWhLZbQyQBlj6gYiyUpJbe/fGJysL
	4iQrcuG9jMA8MJGnDRGLd/1JQR+CnT7ryYcpPcdjMjpBdw8iOYsOdjVfpLxAYg4YMWwnuBec0p/
	5FYSEr4CcqsRfgYYw4MXADDH/N25zgIv2TDg==
X-Received: by 2002:a05:6000:27c3:b0:472:55a:ef9c with SMTP id ffacd0b85a97d-477aeb5c6a4mr4678918f8f.9.1782984709236;
        Thu, 02 Jul 2026 02:31:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/4] sound: qcom: audioreach: support WSA speakers only
 on WSA2
Date: Thu, 02 Jul 2026 11:31:44 +0200
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAwRmoC/42PUW6DMBBEr4L83bVstxBAUZV7VPlYnCW4iTHxA
 m0U5e41kAP0Z6VZjebNPARTdMSizh4i0uzYhT4J85YJ22F/JnCnpIVRplCFqmAMg7PAvixyBXj
 HngIMwV5oBDbww2igdb9ATaXyYtcWFnORwoZI6b2Cvo6b5qn5Jjsu6YujczyGeF+bzHrxvaBa/
 Rc6a1Cgy6bRlc0tGnO4uh5jkCGexfG5YSPdpjRz3LqIBpnABu/dWGfzTuqliydmXLfX2f41vVT
 mXWktqw9jTAkafOjQezzJiK2T3KG7HAKzvE14XQJlOp8J+/wDb4OTN2UBAAA=
X-Change-ID: 20260609-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-eb90567f6ca5
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4384;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VLV6wU8QRGGOnGFH2E3sthlWCqQKEf1XkIhY/2Ftu4o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjACSRG0TFFDZKenmQTCQKoNjghpCtOXTh/uQEZF
 QVHlGVCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAgAKCRB33NvayMhJ0f54EA
 DG+4LM+Env4Hh+v74dbsuIVNi+hY62NSxgSFpjtnqURtu2FIlR/B7XMOmedQ0Ucy7bhNd41zwMySTi
 +B2zN/dsmYIsDq9UugKRFAfvVYOyTWY8JuXk9L/TNEqPmLfqfI7v6l6RRayvLcILybOI6+6ZjDx9C2
 AbmdtsWutum5fpJmQ/raSs3IsYfPEnJRPIcfu8s22J3tIAL4C7l13DzqTk2IyjATIKo0xHsjzB4i+S
 eeGP/PCsT5kEVqERRERZbfKhQq6fN5hXdDy/i5iVLHL28aQJyeYgfSw6Y2qSx33NfJl3O8EgoMlX5D
 uhleBDoqQYTuEThtTGrf+v12egjD3egFZgbAT5q5aAEqfM/3uDrqj9bSV1BWHdNSG3wGRgb8Xj7lhR
 mT/e8RgYr9+HF7srZxOYWGY2WOjRsl+OGg4Oln+uNVIsrVje/VT9mPHyJzTrjyHbDCc2ow0IiOS176
 Dm1hRhW621qyxcaKtolPUeU66sDDZQdLVVx065myo29KNRzHiF9HDwbMnSLkWoTt2Uxg7RUaRNzCPK
 TjMWgT36zBUKeetp5B+n4kr4Uo/uTVzelIpGeexFa2FPN1EcPrehl2g7GE4v8j4QJ28JUdUDv/GkIz
 dV9SOgOJhPg/SQY/DSqmzQHMpquG85knTD0nelRB2naUkCUHOxn/T+SPXU0Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
of 2 WSA speakers connected on the WSA2 lines.

But the Audioreach DSP only handles WSA2 in pair with the WSA
interface by using the upper bits of the active_channels_mask
for WSA2 and the lower bits for WSA:

 __________________________________________________
| Bits  |     3    |     2    |   1     |     0   |
---------------------------------------------------
| Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
---------------------------------------------------

Setting only the WSA2 upper bits is perfectly valid and
functional but the current Audioreach code builds the bitmask
from the channels count with:
	active_channels_mask = (1 << num_channels) - 1;

In order to enable the WSA2 bits the channel count should be 4,
but the lower WSA bits are then also enabled and the DSP errors
out when trying to play on the disabled WSA interface.

A solution would've been to add a fake WSA2 topology element which
would be translated into the top bits only, but it's not clean and
add some special exceptions in the generic Audioreach code.

The solution suggested by Srinivas is to use the channel mapping to
set this bitmask.

This works but makes all the other calls using the channel mapping fail
because the DSP requires the channel_mapping table to start from index 0
and using num_channel length in order to apply the mapping on the
active_channels_mask bits in order.

So if you have an active_channels_mask like:
 _______________________
| Bits  | 3 | 2 | 1 | 0 |
-------------------------
| Mask  | 1 | 1 | 0 | 0 |
------------------------

And the channel mapping:
 _________________________________
| Channel |  3 |  2 |   1  |   0  |
-----------------------------------
| Mapping | FR | FL | NULL | NULL |
-----------------------------------

Will need to be converted to:
 ____________________
| Channel |  1 |  0 |
---------------------
| Mapping | FR | FL |
---------------------

And the DSP will map FR on WSA2 Ch2 and FL on WSA2 Ch1 as:
 _________________________________
| Line    |  WSA2 Ch2 | WSA2 Ch1 |
----------------------------------
| Mapping |     FR    |     FL   |
----------------------------------

So we need to skip the empty channel mapping entries in all other
users of the channel_map to build valid channel_mapping tables.

This should not break any other usecases since the default channel
mapping always start from index 0, and will add flexibilty to allow
some special non linear mapping for other interfaces as well.

Finally we add a special prepare callback for the Ayaneo PS2 sound card
which sets the custom channel mapping for the WSA interface to make audio
work properly on the gaming device.

Depends on:
- https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Collected review tags
- Reordered bindings patch before card and DT changes
- Fixed DT patch commit message
- Link to v1: https://patch.msgid.link/20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org

---
Neil Armstrong (4):
      ASoC: qcom: audioreach: compute active channel maps from channel_map
      ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2 sound card
      ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with special WSA channel mapping
      arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound card to ayaneo,pocket-s2-sndcard

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |  2 +-
 sound/soc/qcom/qdsp6/audioreach.c                  | 47 ++++++++++++++----
 sound/soc/qcom/sc8280xp.c                          | 56 ++++++++++++++++++++++
 4 files changed, 95 insertions(+), 11 deletions(-)
---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260609-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-eb90567f6ca5
prerequisite-message-id: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
prerequisite-patch-id: 047b4fb1894b92109aa7afcebd7d5c7988ec5379
prerequisite-patch-id: 222630a15afc952683d954a3c66617a223546de0
prerequisite-patch-id: 3c55edb41f1e25920a350ce1c6f31fde67fee45a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

