Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387342ECEAE
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775358; cv=none; b=VHJ3w3QqGggOqVIjEe7ufg83/2aAYNzKuAdOgK5q3st7wUpZ5i7VI7xpAKX0LOQLZ+101A2Rm0Nx7dlcYwPumlgi3z8EIcQN16dPJrLukGbNE505BbCYlzRTx3Ps45+yKoiKeA5uTJTLqeo2WlvQRaODevAsMq6UzBDpG/0k494=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775358; c=relaxed/simple;
	bh=7iBmMV3IeRy0dczSX2iF4AnGnzqaHOm6/o61iS3KdUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQ7KhfFaAe6TzENzIslvbZ5qLJbcR+otSe2Qi9YnxL6Hp2M5cSoa6GvljCqSB2GVPRBz0pbbGxVTI5RPzp+0Dj3cZ2xFj3ZQ+3QfgyGru0pWXQzEcMpD5R4KseqfSmBTukU0iTE99EFCCMp+8of+dEwTiBWzctY3B9lEh34TArM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJHO+cOq; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJHO+cOq"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8954ae375efso4243496d6.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775356; x=1771380156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3/DkbEFqHBXb0M+n8zjFECxKzYIFrSQHVAtTa88e6U=;
        b=RJHO+cOqU6ciJeMZF1f3ZWHVW2w+Ito1H5vvjIi5r9Co6ohbYaLewKbsm9Ko0DMAJy
         WSc+rna3ne9Rf9B9HGriwr3TaOeCWSmZz3YnVOanYClkiwdyMaqrkiaHadzAx5mbAe/I
         PTyMsoWnZPdpNnDAxVNjOVHDPOaWYXrw6T1bZ+Xek0iy5lcROOBGYqCphdMMiMWDF+1x
         B4a24cmGHhCRSTQhutPr75wZ7wEqc3Z2dQiJBOoSsGPpKUSItXi1xPnHkYW0r4Uettyw
         QCpxIjuoq9d6AhNrybFF5mCfF7FlhrD0lwucZc+v7cvBEEj5hwAE5KezA5iiGZcDGlAL
         krNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775356; x=1771380156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3/DkbEFqHBXb0M+n8zjFECxKzYIFrSQHVAtTa88e6U=;
        b=MapL/f7ZmJWkD6TVPmFWNeuPuYe15Av11FsQdeNSvwR/QwoHnW2SfNFEeCiQWB59S1
         port0r7k3bugVQpu+lXMqxx3iwjfSbEYwDL6zdenQqXE6lOUXS2iH7S3PMEaLcGs+Ara
         yQMgSXaB8byOlvN0b5kRWbY4/rKggTqIaxQ7XXH/PEKgf7jyLQK2w1GGtMCad8zUwMDu
         +7HtLPWAZervkQ+UCnhfonHWtpLxXuoFYKLRhYV1+6xTy3OTxLC+4h8Ymzzp1vf2X0zL
         2WijuTIHuwg2X+9AN/bWJ5CXu/Hn6mcx3IkCm02L7delrOMx/2OfuVOOSbDfQ6D/r5Lc
         wNiA==
X-Forwarded-Encrypted: i=1; AJvYcCVnggWoEaGC/OkGtS05wow8XILVoMfbMEkX4x20WQcAlV8Y9ayRylxJQnD+/57Kf4v02VVuvO/LQ+djDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPjlFZ3M1ZUXyKWepUv1BzbzaA3suKlZZ+8Zl2j2I47oxD+5r
	liS+PGhkD6KpQ6Dgp4eGnfqyzSnAMFWEK1EM9pTCVH05ozlY1NSrO3tZ
X-Gm-Gg: AZuq6aJ3Xs1moYHstEMQJSSl+6h5Xq2VCGfDocaePnG7C+JJnq0Au+FgAib1ehADaxK
	fVTCQsSGqPDhobR5jnu/bRuLTbWhKmRywCDehADCBH2ePzEqIaXDGK2ELuH4IA9QThxGFwAeIei
	kaZBa74H8MTf51JS7jmuYh6Oig5363qYsMFsVS6AtVUpE8gqzfQ8xnKxl6pd20Yhr1Z0sL82Sg0
	27mCb4ZrgayI1w6CoMKEL9Or1JaSQtIcUE3pq4sbfsl4MdbatIuNuF98Rblug88Z0vBrl8777ii
	SRQjDnlm4Q9JGkrUJZZXaWF7Kq7AuJ3Jug1glSTaHKAnhSuwSyo92xxUViNOPQFh7IW/KfnQUCm
	EeAuONWBISLRGmxfEdHuCd46BVt4E2I/b/wic65lY2/mg2jqHT6y1MUle5UxwGSC6IHe+d+P1kY
	EU2uSviX2oC/FVLO4mtI6lrgjW4Q==
X-Received: by 2002:ac8:57d6:0:b0:4ed:ba4c:bda8 with SMTP id d75a77b69052e-50672e01149mr50112371cf.18.1770775356032;
        Tue, 10 Feb 2026 18:02:36 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506849f8af5sm1685621cf.14.2026.02.10.18.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:35 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 00/10] SDM660 internal sound card support
Date: Tue, 10 Feb 2026 21:02:52 -0500
Message-ID: <20260211020302.2674-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the SDM660 internal sound card. It is used on the
Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece. It is
also used on the Google Pixel 3a for the headset.

Like MSM8916 and MSM8953, the SDM660 internal sound card connects to a
digital and analog codec. Its connection to the digital codec is through
special "internal" MI2S ports.

This series does not include devicetree patches.

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660-internal

Richard Acayan (9):
  ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add internal mi2s support
  ASoC: qcom: add sdm660 internal sound card support
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |   8 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   5 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |  14 +
 sound/soc/codecs/msm8916-wcd-analog.c         |  63 +++-
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  46 +++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 ++++
 sound/soc/qcom/qdsp6/q6afe.h                  |   2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 200 +++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c              |  78 ++++-
 sound/soc/qcom/sdm660-internal.c              | 271 ++++++++++++++++++
 14 files changed, 759 insertions(+), 7 deletions(-)
 create mode 100644 sound/soc/qcom/sdm660-internal.c

-- 
2.53.0

