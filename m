Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C076FB0
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835623; cv=none; b=T2iWQtyMejlOeK/IFu6b4zBUv1koecOI+MIf0JGIVKU8K4C8tL/4omjZk09rSKf0pGr0USaebl/UdDnIIygdzSL3c+E6NyL5uEdeio0DoZrXaScR1/QocRbljD2B+WfXrmtXv3lzj38qC4qb0InidjGfn0oqjWTjOQkIpjDxdrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835623; c=relaxed/simple;
	bh=qDf4Q21OUR0O2CrvOwqoQ6MiuMMP4c/itFO4cayaOKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDO9Y+czoOfMxuOZvRzkYGumOr3CNSRTrTG9AuLmCqi6Gw9+AU4VGu6lMQsXxD4+3hRJZgWnoz3lvvPEHpiNFs/91GM0LvUIsYsJ9sA7RqUfaepADcksecUzZmVdhH5F+ShNZaTO6OQ6pTEcKnfDcbm+vLXpWwkkCRqjVuUNFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tA8/+rQR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tA8/+rQR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37cc5fb1e45so4217897f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Oct 2024 19:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835619; x=1728440419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJP6FxuMyrGQPzIx4I24nor0DhnXqA79XYYTGXwNkXg=;
        b=tA8/+rQR20kn1gBWDv8DBbSunZRM9WlFmDSTrNifY3Kk5z4/LiUXFLB1kC8+XEZ9jR
         VI50av13/0CQWbpdCebF6PLOpY5UaUPUHKLUPVdRuOMVaPN5KHqd934W5XOG59jHvXTV
         k/VetB30QeWD8lp53VIEwwOftn9RGeNqgIzXcvjMQFNXQesdbjfTXpmoehWW6Xdad7R9
         PjTyAg0N0iBKR1ABIBXDCXZFyPdg5I+m3pYUipFKekFVd3MW8EddoAnb2HveDCq4crk6
         L4dfzIXPe5aK4l3FGJqu8OOgXLv0dTu7fhOmSDbMFgqhw1/VnQvKrXt8OksqTuxKDFX0
         4PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835619; x=1728440419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJP6FxuMyrGQPzIx4I24nor0DhnXqA79XYYTGXwNkXg=;
        b=g11KWVoliqQFNH0dNFlRpcA3CmtfD05L1ssf6J+r1WtP16RTRFh1XSo7DZDq7s9Nz9
         aUU2IBopgvxHSlNAjXplyrR9CaH1nBzYaWnELrD+Oh19t/LG09t3G8CfX4tnJvXGeILx
         FMZMJk3FNQUEf4aWTdJNicqBMUleqwlCWxKXg6U3Fi1nQ7uaCl5h7N2FjasxW0Yl6lQp
         k7reZ7HYHW4WBxkVIAVtONosu+lSs03CcrmOViwwg99dzTytutR2ao+fdfY2BpOkTa1I
         MdrRNLMjOT95spNO7BPuOejYLNaONguUzFfv+l814+GRoeq4njRtGJysctVrVwovpph0
         6DmA==
X-Gm-Message-State: AOJu0YyzAHTFFn2M1iSi0Cd2jB9SUb2Z/EyOWQit9by/zlAHjF19/5FC
	XJE2E5PkXht1ECG2yOFBmmhd+j2fjxNm4cbLUoCMLL3HTkVo2SckQfcakrUKMfEti1YGtMPrec6
	Hsts=
X-Google-Smtp-Source: AGHT+IFs22+u0l81gOgbkwdFzWLkYNo/t5JE/s/V9n01odUb3GkqtgMLO52O3EfAFsS1MGoPOvkYtA==
X-Received: by 2002:adf:a388:0:b0:37c:cee1:acb5 with SMTP id ffacd0b85a97d-37cfb8b18aemr868706f8f.7.1727835618798;
        Tue, 01 Oct 2024 19:20:18 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 0/7] qrb4210-rb2: add HDMI audio playback support
Date: Wed,  2 Oct 2024 03:20:08 +0100
Message-ID: <20241002022015.867031-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased on top of -master, tested.

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

This series still keeps "qcom,qrb4210-rb2-sndcard" for sm8250 soundcard. As per
off the list discussion with Srini it was suggested to have it since in future it
may be required to add clocks, workarounds, quirks, model-specific things based on
this compatible. The same as for RB5 compatible in sm8250 snd driver.

This focuses on HDMI audio playback only hence there are no soundwire and dmic pins,
for instance. The work to enable playback via wcd+wsa8815 amplifier is in progress (it works)
and one of the routes is to merge such two patchsets together.

Link to prev series:
https://lore.kernel.org/linux-sound/20240628010715.438471-1-alexey.klimov@linaro.org/

Alexey Klimov (7):
  ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
  ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
  ASoC: qcom: sm8250: add handling of secondary MI2S clock
  arm64: dts: qcom: sm6115: add apr and its services
  arm64: dts: qcom: sm4250: add LPASS LPI pin controller
  arm64: dts: qcom: qrb4210-rb2: add description of lpi_i2s2 pins
  arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

 .../bindings/sound/qcom,sm8250.yaml           |  1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 91 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi          | 16 ++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 72 +++++++++++++++
 sound/soc/qcom/sm8250.c                       |  9 ++
 5 files changed, 189 insertions(+)

-- 
2.45.2

