Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5773D75A1
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654267; cv=none; b=dmgAiq9s90ptr7XLZO4PsNMcJ5A3Sl1HvyJ4DSpqJjmmxy9O+b4dYeBkJdzWEk1/1UWpKNuCh4wj5Fo3NuLG7odAumvgKU10Mxb+3iDPYVe27fdIKyBOXHITNpfd98/8md2aI0AZwtpvLh+mWJURz7Q4jnxZCcb7YWOgX5OgZtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654267; c=relaxed/simple;
	bh=BgdtRCrG+UT4Wjl3MNPFweAAAvfm5+xVSgZzPOCJs5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y+PLtTJp9m1OfWoUzNWqOCBcXptgQviNzSTLRwHsgf1+k2Z30Mrd4wJDEE7gH3LSleEeYuKZJFpIx5cqgLlJV8AoRYGvedIcXKVCxt7xTXyeo9ia+Gu0eQ8mg5IBA/aDrBCXD66S74QrA7+s+8Ol+8yvaJNuqfRwb3oTOKbQpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF4V1Ie2; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF4V1Ie2"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89a07f66f4eso33163686d6.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654265; x=1773259065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZuBqMqdE2cR1Kb9L+99KXcjTlaXgNSs2txRlLKnKaA=;
        b=OF4V1Ie2vaqPUvtWXOIagQfe3oQZchFCCIEXpik9fK0YwPOeg3Ao1cmYKy29tUZyXY
         J3gOR4oHo0KJkWOkgRZ/Fl30twFijBZL8d4cVAPKZGZYkVY5dc+/S1VMoKaQqhS0rMPA
         s/kR/Y9kAaYLSs5+S4rMJwZrwSzvjdSfZNUUQy5ml9HIkiCL84mGr7sMUlHjtu+1jUwJ
         llxZzfAKu5wn+M2pFdyYz2qGYWPrPZ0usOpbVGk6p290G3sefmms858+0SSRIQ+3O4hg
         WlQSEaB1GL/0uSX2gCVVvYyJFvnxIwuF1vNvMlmMTGqta6ZjN19kCe22YxAphT3uHTG6
         lH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654265; x=1773259065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZuBqMqdE2cR1Kb9L+99KXcjTlaXgNSs2txRlLKnKaA=;
        b=Ic56G0LRZaDku7RyTIGsdIQafxSVWcNckgXNPKUOvqb6HFIDWTCc1sNEUG69UZ+XAJ
         BXfFrVKDQ2SniLO7iPZ4+o42C5SBLxrCR3P+iM7gyp+TMekMb3CVZjISgvp4vBVtF+RV
         uHToJWd5yoKvjH4hrp4wsxk5IFyLhtjwEbv0nYKe3GVAkhg3LEduV3ZiASH0IBX87zyX
         njwswuJkqwNRBQNQYYbKbovcfSRy+S9+VjqkMA2D05k8uGzDVMF4jfe0jEwuLafoE5As
         IUW4oSongj7QWtWGf3dLlcdcp3uZyDcbtG7+80thvkHQoA4clbZsle4kLQtWB9/RkcgD
         QdTg==
X-Forwarded-Encrypted: i=1; AJvYcCUcu3aJ8IiKN5RswNT8hBgRFvGkofvOtlohdofelMystQYSbur3apr/c9brcdTn1qok6plzqnTZatkn1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYy0EFYDJrHfviZWptGPzEi15tAs3oNQbcNcaYdE1W4YE/hKOf
	z00NRX/wG6PKWDo+/F/oPjoN14j1Vh65/QyDpN5AO0hWiadlxx+shWVZ
X-Gm-Gg: ATEYQzwlie1jqF/lS7sjI4D2ARUoG5H+jrr+TFXXY+83x7AUIRnQqk9qXP8K4KZ0sQ4
	FjzaDt1DYfW+E5E7rrAZMC9lZZLHHv9m4wwhxgxGw4bbHRuwQnazinucKjYuK4WLW8OxE61EU13
	DnYPUqktVWx6BYRcKVm+HqxZ04NaeXW4ZCHG9QUNBhRChIHpGgMlJwqE3H+qo4Owd3OOt9QY+ST
	sFlvMxttjSIYK2+VB+epzFLGH6YscwlY83Tf/ATJQCVRZRyQflCxh+ypgtfiqW6Psd0gUWd5Naf
	kNOk8FmvjVCMwyhy7cRrMzAIZp3UGX1eBtdVZxPzIAd0r5BhVBarib7tem+g4DLCmq6yaxtf5iP
	BcAzcQbpxxU8Yu6Xip5nTW0TEWR53WreZB8z9tEHrjfo99PdFmCG32h1HUraCkFehr0irqojbQn
	C5gdZuCz0RcUDBLixZfVhnIiSkbAtW51LtxI7b
X-Received: by 2002:a05:6214:21c2:b0:899:f8c4:5c with SMTP id 6a1803df08f44-89a199acacfmr47559586d6.22.1772654265116;
        Wed, 04 Mar 2026 11:57:45 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899fc21676fsm76028846d6.22.2026.03.04.11.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:57:44 -0800 (PST)
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
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 00/11] SDM660 sound card and internal MI2S support
Date: Wed,  4 Mar 2026 14:58:04 -0500
Message-ID: <20260304195815.52347-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the SDM660 (formerly "SDM660 internal") sound
card and support for WCD codecs over internal MI2S.

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

Changes since v1 (https://lore.kernel.org/r/20260211020302.2674-1-mailingradian@gmail.com):
- rename sound card to drop "internal" (1/11, 10/11)
- use common headphone jack code (9/11, 10/11)
- remove no-op code in sound card driver (10/11)
- remove inaccurate comment about clock consumer/producer (10/11)
- add review tags (3/11, 4/11)

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660

Richard Acayan (10):
  ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add internal mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to internal
    mi2s
  ASoC: qcom: add sdm660 sound card support
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |   8 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   5 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |  14 ++
 sound/soc/codecs/msm8916-wcd-analog.c         |  63 +++++-
 sound/soc/qcom/Kconfig                        |  12 ++
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  46 ++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++
 sound/soc/qcom/qdsp6/q6afe.h                  |   2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 200 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c              |  78 ++++++-
 sound/soc/qcom/sdm660.c                       | 192 +++++++++++++++++
 15 files changed, 681 insertions(+), 7 deletions(-)
 create mode 100644 sound/soc/qcom/sdm660.c

-- 
2.53.0

