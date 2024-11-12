Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F925BE6C
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 02:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379993; cv=none; b=XMqovqmga7cU1977xonGjJdKGlLJXgWJrKXDJk63z1BLD4JyJL3FgmDY+6/D048JppXlWm+iBCTo/ig818YX54/LphJJqvTsQrJokM8A6QodjuGKbSnBfG+SEa3AqnoUQVNq46JI8ZGPuE3HjMZj/l8EUFLLXbE5jDvT608NZeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379993; c=relaxed/simple;
	bh=zRjmLB73FoKBtKABZdlS/4UbbMfV+Vfzmmt8HeVipXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTE+7Lb6MV9lGekSTm5DqN5q3DPlze8ULrCRRZgI9E+zClprxifsz2ljL+rptJX3ENW0UhfCBT4nvowR1FHE2z7dLymTGGGQz50DZOsFFtJ2KeJhrswS68POs5A4/YHUHasVPO8KkbAOsyBPyXtYIJIiI+sykGp/OdvV/lyXhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lqu8lYgo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lqu8lYgo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d47b38336so3979533f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 18:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731379989; x=1731984789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18HziUDPDuk5Q3iAQWZEK5eNd/SL/SlFF3wmf8V8Iy0=;
        b=Lqu8lYgon0Nq8So+W0/5o1+x1R+gSkfX0n7AIybPobVjScKZ1Mcg4SYVBmAeN4lgK6
         wVbPiydPR2O96dmmnZpUrToHwITFwm10NRWWtTpeEeTWSaTdT+iKcXtySuX7LmLW2SZ4
         WxHod6+D+7eROJAIyWidGwHjOm7Ld58SeVsKK1blkHhBV2isAeRbk6GddOg4sWpK/E37
         zD/HNA1m7IdHKCfU4MiWPrh/4V/NnUMfd2AJvYphzJm1Er7ECCIfYCR08z1e5RhqM+jv
         0oBOzQ4RFWOSG66DRBxxl5x/FI+e2F5bgomkHcq4i+vnhlUVzpysurINI1GDoIp9LrEB
         ftlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379989; x=1731984789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18HziUDPDuk5Q3iAQWZEK5eNd/SL/SlFF3wmf8V8Iy0=;
        b=RtTDEUub2/eqBonQJtcC0eOL9atExhr3Ubn9RenRCYx+48dhvHGtgaWS444LhiT4gI
         0Ulh1xq8RoJyHE2jnxeCMF0yewGwpf4vKbvKu5fIsZInZ/wDdCIuzaCbQbVUrv447J1N
         9VUCXEFZqo18zsMNGavxag4nNErZOvD+4JWKyvwLg2E1G2fMNyURi8WvZWaQssPGufNf
         RnKz2dlD2ibS+3pdX1/jjmExJhjiBmSmFKd/eSJ53Zd+zYDZ/iDBKCf2s4XrK5AevpN8
         absUeIe1on1jGATU/V54YbPX/g/BZGrMtkvOfxGm5p291QI4uMoHeWrqWx3lVfArVStM
         j3/Q==
X-Gm-Message-State: AOJu0YyNsxsVM74AsnT1qkMiWB/uF926HqQS5qG+wA7cwXCWiLIu/+Mu
	/oUiNrDCHJby+HfzAYflNUNDtnh7nKz0Pd3RLklgqLOQkdPFzHTvXzMf+OA83Wo=
X-Google-Smtp-Source: AGHT+IGXBhvjg18rNz8X8SGfiBMEM8XCIEey0FZ/8rDRwsOHEf6SS9kM97100SW+eFpnCAGUW2ZRsQ==
X-Received: by 2002:a05:6000:784:b0:382:5af:e993 with SMTP id ffacd0b85a97d-38205afeb31mr2179145f8f.54.1731379989367;
        Mon, 11 Nov 2024 18:53:09 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed999e0csm14056380f8f.59.2024.11.11.18.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:53:08 -0800 (PST)
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
Subject: [PATCH v5 0/4] qrb4210-rb2: add HDMI audio playback support
Date: Tue, 12 Nov 2024 02:53:02 +0000
Message-ID: <20241112025306.712122-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased on top of today's -next and re-tested.

Changes in v5:
-- drop MI2S clock in sm8250 patch (seems to be merged);
-- fix gpio-ranges in lpass_tlmm (Dmitry);
-- added reviewed-by tags from Konrad and Dmitry.

URL to previous series:
https://lore.kernel.org/linux-sound/20241101005925.186696-1-alexey.klimov@linaro.org/

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
  arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 59 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi     | 39 +++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 87 ++++++++++++++++++++++++
 3 files changed, 185 insertions(+)

-- 
2.45.2

