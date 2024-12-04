Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55BE1F7099
	for <linux-sound@vger.kernel.org>; Wed,  4 Dec 2024 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320834; cv=none; b=YOIafZ3C4TgFOVLLKmhTSr/+kh13HVwf290HTuhKAyEY5z0HQN8rdY9kOSersFyO+tE4J1FXpHcVSZ6bBpGR5XVyM3UFx31gGxnIxBaTzYD2I69Yk+dqTgTv3BE42JHmBC/jWXMrg6NiCOPU5Ff2lZj1VFf7BvFc9XC+yVuRl6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320834; c=relaxed/simple;
	bh=H95Tmerwf6ocgqV3ped1L/uCM+XW/SsZT8LrQqWk1rY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wq4U1AH8/QzpgvL6AtfY5rHBrTWP1w4LiZLgSHnzgIa1KEUn8VRwNIQpPFGNdeRnsYj6NjA8X/ZrdFaRCKmJ1RU2wX3anjUto1dDFRUcNECRDQTtNxSvE9rCenjCxf2UvJVW7OjbWQwP8tnktBQthvkizImR77OD+pfWntSnAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nmk0FaYr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nmk0FaYr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e06af753so2871162f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Dec 2024 06:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320831; x=1733925631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bV8QY5eukfrq2lN4tsY/+E6/ZMZn3nftpYsTU/xeZxU=;
        b=Nmk0FaYrPQV8A9JmNGvpL2rDFDNf/+2O/YO83w5WYDnnnnj0DlxHrSTyAejK5aV0Nz
         g125rnY6aat4CZBhtYYj7HYL3LRcEHzxaYFJUA0szyeV3hCzrRSJ14O9XK/4ZQ7Z9Ev6
         1sYVSZfHzwWHHep0IyDghd6cNwVoSFLQico2mfK6icHWBaObnz4bjyLvun+2CdFe+u8n
         Eo8Yh7ul853RMPrNO5SepJW2cJCXQWT0p6KlNH/GreozGIG1cypXjr/GGNDCpsq0bv7+
         ob+i+2DUhCWB+4WWWgb+WQCgs7F0m546N3nmWziIhkIMSzGBQp90jS2PE/65VJ1Eum/2
         4hyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320831; x=1733925631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV8QY5eukfrq2lN4tsY/+E6/ZMZn3nftpYsTU/xeZxU=;
        b=MF9cIDREIWt12W0eIsSiBbGYiczXz0Ob8ZRSaK1fCAeLXHJXFv+nS7t1mjUEmjZ/45
         n/M9AEgxvMIVaoUVpSgist1/0FeHqgrS7GNKSzQI5vDTZoJ1WakULazczYpDVDA3itDY
         1H9Kef+65uqDLPTHY/6g4Ko/8KV6fWNXSa4iKzZ50PiIn+Ssixnx7K6kP9aBh1Upt3f9
         xoxMovpA5JVQRM7uwVPopr4qPmk55tZhDF6jZMm9hEHaHl4QBxq6r6VvxqzxpAR/sF9R
         av+tQVzF6iwyNdXrCvn6djXDX6uX6TGSigNgV0swEqh39OdWxsWsIzGE4Th/lyHKHw/y
         W7Nw==
X-Gm-Message-State: AOJu0YyPm8MyZ9aK9lwCw8Ei8dxwbzYvSr4wIeIDPRNUDQZyKJy3Btk3
	4gTl7M7tDHRVTS1/EXdytAnI3bw5kIwSfq9mikA/ji0AT76DocTfAS/pZjdp8ic=
X-Gm-Gg: ASbGncuhOW43QGUDTnFEG+rhnoAJ9PCWvecIF12pVaSDIkbWt9CFzWUpIQHDq/XLWY1
	1RH+aK+dp6pVi6LWimz8/rGveynTebmeinjRsRsi/oN9v4nP6olyihFhL59xshQwx4h+iZGt2b+
	5XwofvNyoCYc4i4g64CMlm6qmci7YRjT0/3hrHlLOzjsHyt17TwyBTLLW4niIfkfOz3T/8wr3n7
	ed5jzMHmGjeEonXUbW94XOXzen7K3emgeMVVMMmr9RBtYKxLO9Wgha5njtjFG4T0N9gFII=
X-Google-Smtp-Source: AGHT+IEwNi9zQ3A7BISJyLzoaI8unrHh3ncETKsF78rBfn5vGpXEDRRpfEKjoscYnK+ZRjyytNSKlA==
X-Received: by 2002:a5d:598c:0:b0:382:4110:ecb with SMTP id ffacd0b85a97d-385fd3e905amr6274200f8f.26.1733320829865;
        Wed, 04 Dec 2024 06:00:29 -0800 (PST)
Received: from localhost.localdomain ([2a00:2381:fd67:101:8e2:966d:36c4:3579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm13689978f8f.49.2024.12.04.06.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:00:29 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] qrb4210-rb2: add HDMI/I2S audio playback support
Date: Wed,  4 Dec 2024 14:00:23 +0000
Message-ID: <20241204140027.2198763-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased, re-tested.

Changes in v6:
-- updated tags;
-- corrected dai reg number in q6afedai;
-- changed dai link name to hdmi-i2s and updated commit message to reflect
that HDMI playback can be used as i2s playback;
-- removed excessive dai-link from sound node (it should be a part of
another patchset).

URL to previous series:
https://lore.kernel.org/linux-arm-msm/20241112025306.712122-1-alexey.klimov@linaro.org/

Changes in v5:
-- drop MI2S clock in sm8250 patch (seems to be merged);
-- fix gpio-ranges in lpass_tlmm (Dmitry);
-- added reviewed-by tags from Konrad and Dmitry.

Changes in v4 (or since v3):
-- cleaned doubled spaces in the last patch as suggested by Konrad;
-- added Reviewed-by tag to patch 4.

Changes since v2:
-- added tags, updated commit messages, added Cc;
-- updated LT9611 -> LT9611UXC comment in qrb4210-rb2.dts;
-- updated addresses in DT to 8 hex digits as requested by Dmitry;
-- added lpass pinctrl to sm6115.dtsi as suggested by Dmitry;
-- added lpass pinctrl override and pins description to sm4250.dtsi,
pins are the property of sm4250;
-- verified with make dtbs_check as suggested by Krzysztof and Rob's bot.
-- dropped two patches (they seem to be merged):
[PATCH v2 1/7] ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
[PATCH v2 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
-- stopped Cc-ing out-of-date emails.

Changes since v1:
-- removed handling of MI2S clock in sm2450_snd_shutdown(): setting clock rate
   and disabling it causes audio delay on playback start;
-- removed empty sound { } node from sm6115.dtsi as suggested by Krzysztof;
-- moved lpi_i2s2_active pins description to qrb423310 board-specific file
   as suggested by Dmitry Baryshkov;
-- moved q6asmdai DAIs to apr soc node as suggested by Konrad Dybcio;
-- lpass_tlmm is not disabled;
-- lpass_tlmm node moved to sm4250.dtsi;
-- kept MultiMedia DAIs as is, without them the sound card driver doesn't initialise;
-- added some reviewed-by tags.

Alexey Klimov (4):
  arm64: dts: qcom: sm6115: add apr and its services
  arm64: dts: qcom: sm6115: add LPASS LPI pin controller
  arm64: dts: qcom: sm4250: add LPASS LPI pin controller
  arm64: dts: qcom: qrb4210-rb2: add HDMI/I2S audio playback support

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 51 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi     | 39 +++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 87 ++++++++++++++++++++++++
 3 files changed, 177 insertions(+)

-- 
2.45.2

