Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0CA28DD0
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422774; cv=none; b=YCAXGQn74FM25Q6pc4KqdKrDk7NfF3Db5MMhGjD+nNd+nFZlCDf4zta9sh/J/uvbh7yIk70iWRefANT8t5yIz+C/R4cl7Nbbt3ixiJho4ZCAfkL/mPcKq30/ZzyiB78pxf2gnkFkwfmXDnTrmx5SXmRPuba0by8djxN+4qX2E/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422774; c=relaxed/simple;
	bh=FU379s8mvRva31rty9JujdS04YmHXrpAzztd4t/2fpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8gY7pTnF6UQu6R74V9ebC2RUypydPnr8sParoKIeVqf8Pdhy1D1hNR1V74Y5d9S7wNWJtjaJFPqKIXwbIQgqZYe/49bSNzexMPeaky08AEWaHrQpI54qd5w/56OO/Kc5LInU8plqNqw977Cm9And8o8YT5ItBjYTEcoJCe4ZZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uIN1077A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uIN1077A"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so13417385e9.2
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422767; x=1731027567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PieXQqSCHfmGnEpV2Kk4rV11C01mRedDjCrdFDNwM/M=;
        b=uIN1077A/X2v+to07XBgxxdLeE7ruJlTTbDFPDVIXAH4VvL5PuVIHAxkNqlEOzlRX7
         v88OPsOM15PElyrDlthMm/xGw3KlRd96QnqWjmo7hu/TLvrC7hvU0Fy3bPOWieloAdhe
         Dftcdh7lkK8eK0e8GmKrsPvj3vz2T0eD28U3RIXXNTZVuux5hfhh3aGSw1XNtCpVhdR2
         A+BpdrRfKBpaoAEDxDhGPpioXyYwhmxmTPgGXFGO3IrEnOUnB26Sctdj25MIlKXm0S5B
         C2YjowzuZH2r6KPmGjiFsHSLDwmy7hls4/L0sjF5/iQPZxIvyXSdkHQJtQBFQ8ptL6tn
         B9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422767; x=1731027567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PieXQqSCHfmGnEpV2Kk4rV11C01mRedDjCrdFDNwM/M=;
        b=Ow31x/ZiX0v5geP4RkA0QNeQrdRnRQKpToXD773fmYuKeSX1J+v3yFE7LaJyB3lyt5
         /yDkvWp5jAODzddHOxUSivnBIWczVHYqr8NF1UCalkE6giiYvKHh0aTNFR7w4uGobuil
         v6bV16KKMqco+ptfWmmTyCR2Xw0aazKCvCF+2cWtbFAYHB6l3Vdf9dmXE70WBqVrkD1r
         dBVnvOND9e6Vo68q+ZRibX7GpxYf9mBQb9S0gUkILZOkzdNT7SS+PWtNYcxZEQFKzfLm
         sZgpdVmL+0Zd9NPzk6pV1kuYhlMBIFtDXNYStvyD0ci4qTxfZL2/8Zsis7lYiWgpRiUC
         uIFQ==
X-Gm-Message-State: AOJu0Yx4kvYvu8jSh6fFji39IDdnjzqcX6cKnraqtKXmRmIu23CKbSL1
	NMLwiJ5IBIweXUv1O4EoXfWySLE8y5Qe4cuz/PL9jEVLeOaYD0J1+VRNh7IFPGG+FhOoWyBVqKY
	60Eo=
X-Google-Smtp-Source: AGHT+IHqxItP2cM4Ot5dUREUP0W2CMB4uLuKVDROnIDTI+B7l0A6vFKtvV+10MvfFiHBZobiQ48BUg==
X-Received: by 2002:a5d:584a:0:b0:371:8eb3:603a with SMTP id ffacd0b85a97d-381be7d6144mr4596700f8f.27.1730422766456;
        Thu, 31 Oct 2024 17:59:26 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947a9fsm74208035e9.22.2024.10.31.17.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:59:26 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v4 0/5] qrb4210-rb2: add HDMI audio playback support
Date: Fri,  1 Nov 2024 00:59:20 +0000
Message-ID: <20241101005925.186696-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased on top of -next, re-tested.

Changes in v4 (or since v3):
 -- cleaned doubled spaces in the last patch as suggested by Konrad;
 -- added Reviewed-by tag to patch 4.

URL to previous series:
https://lore.kernel.org/linux-sound/20241018025452.1362293-1-alexey.klimov@linaro.org/

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

Alexey Klimov (5):
  ASoC: qcom: sm8250: add handling of secondary MI2S clock
  arm64: dts: qcom: sm6115: add apr and its services
  arm64: dts: qcom: sm6115: add LPASS LPI pin controller
  arm64: dts: qcom: sm4250: add LPASS LPI pin controller
  arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 59 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi     | 39 +++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 87 ++++++++++++++++++++++++
 sound/soc/qcom/sm8250.c                  |  8 +++
 4 files changed, 193 insertions(+)

-- 
2.45.2

