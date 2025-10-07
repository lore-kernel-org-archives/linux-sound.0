Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6CF194137
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 02:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802620; cv=none; b=lFdHbyLzY/1bQ3OGe8/F/ef/zsBBRqDsE9VrJowTn1sbuJLanM2w7zwbMA41MVjCXGFarfLsFxp4u7yjS1Pvwab6bcMo3FXdOsB+sAj5hfYMyjufMmorVdpYTE1VcvfX6cIhYjl906ru9ejGWW2Uht4VK4mzsnq7jcMPvNt3kSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802620; c=relaxed/simple;
	bh=RfNhaWLGRbdtrrGIfEYuYyqtlcjyyzdYih9p4WM74xA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eUXj4F/PjBlcfcNNgxe8DDkAk/SNHVlspIaZ75aNNTzdaY4yvyagW/Z3endCCV/djucARjJOhYMm+mqkTrGmez9naml8Jfne3BRRSWr2BxK6B0+I73zT1xJ3obQGPuMoWqth/+XV0ipoAhH+lcKS35Q+fr3E4ZFhWIWczpWDCIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IecgktYQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IecgktYQ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36a6a39752bso58615091fa.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 19:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802616; x=1760407416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVH75F2PB/hIhg3pTapevcz0FU+YjPLlBiSBEKhJKRI=;
        b=IecgktYQl++qRNXzeTovCp4QDkRypmJIrslJ7jvqg9PIf+gCZBXOLyeZq/PI0SheHd
         MQksw/qoCd/k1nzCx6+dw5HnOfqo653R2za10O7NIXuFP95v+CSflYUn4dISPOig1C6X
         /TX6/04tl/KelWFOS02I8o2m1n+VWeknVAq+e7JA4TrJwGvQWRAcpKMki/MfMewVXHAM
         PB8k2oTQFEI+4MdGcS2zWU3C6R4WjRaGCnE+PghKDoL6CFnxgW5FlN2BguwpNel6N2P7
         NHtyIpxwLHrBvCTXVyG64ePNYlCaZLQy+3q4WI+IpSew/t/OuwuF76OODAzsvRc9eIE3
         EMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802616; x=1760407416;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVH75F2PB/hIhg3pTapevcz0FU+YjPLlBiSBEKhJKRI=;
        b=I8OPlyyefJim2hMko2vbxeneeYaP/PfJT3KiTLANyrByk4X0n1GbYcae+m1KfKPcLI
         sIVZSIZMV938Ljg86s5FlG/1pPjdoxcKyE2R61++aZ/6lD4Kg5cjKgpL7kTtxtm/Hg1Z
         jaQXXMnRBER3czqH08dzmISMCuBNOg2/B/V4iVeJgXle4XpDzxRRvxPIIC65W7F3fUZX
         2X2O7D4Yj9mJEgV4QFoVLcs6d8iJv3H9XZqPcWEwl15atiDgeksKhvkRiknr/tgOzYQw
         RZphxeSKuZ7sLWfqrur7tI55imRdzTXimQmaSN4w9In2HW0uEyrZA/49KL1bhtbvIahn
         0oUw==
X-Forwarded-Encrypted: i=1; AJvYcCWP0tB99xwrJC56A/w5m1R652fi0+EmQciRLY6apgwAA4EN0IfQ5/BnlWZqhiark7sMeBDFPNlYCmptuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIeZ+jD+bcIxk7yIWJ3C5oopgUhAoaeJX8dPpNM9Klu/6ZrfHn
	JHZZbKnChjrnfLiMDiWeuUE2XRQlGJbCSPhCFqe098DNiLrjyWKXLYnZ8fhZYnQNoXQ=
X-Gm-Gg: ASbGncuDLz60cuHDccIwTHu14487P0Ka180NjFlP3BNllvyDh3Q132pmg1vj20vEg6W
	SchbRfGfGKl4gdhRz9zEERVp6idv2c4F4yA4gDybydiww6jY5BG743GinqI0hf8rEJiOZRKhxUR
	z4Xc123W5fMq71RLLII6VL2gQWwGp4bzDygG/F48TZfajuwF640539eOAfArHozEgz0+hA8FP3Q
	SesrYhfcRQ2OGepcFo1AMzKBqgnhvCrUlOesh+cuZntX8oXIlHakLTCOda2X/Y+uRYlL9dNU3Df
	/ifV9qDAsqn+aN8Ie+Vv92Ju9zyGShM2i4+ZHKNuUAsjyc32aOkqJ7QPuXo+mMjigD94f/mRuwr
	M1Z535HZta2R1RV8GXkmhjcER0HfiHfviey+PaluMYiSJ90DiOd6q0WP6XKCB0dLOpmw=
X-Google-Smtp-Source: AGHT+IHYpF/hJauL5pI8FzqJ8svbdfh/Bd/h6gQ27dVo1UcfsAhIfHsh/9IYIDD2N36bQ3USf6JKnQ==
X-Received: by 2002:a05:651c:12c1:b0:363:d806:7d5b with SMTP id 38308e7fff4ca-374c3402645mr40853581fa.0.1759802616329;
        Mon, 06 Oct 2025 19:03:36 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:34 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/4] qrb2210-rb1: HDMI/I2S audio playback support
Date: Tue, 07 Oct 2025 03:03:28 +0100
Message-Id: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPF05GgC/z2N0WoDIRBFf2XxuRZn1N24lNL/KCGMOpsIde1qE
 goh/16bQB/Pvdxzb6JxTdzEPNxE5Wtqqawd8GUQ4UTrkWWKnQUqtKDUJKuHwynmdKBLTEUCeR2
 i00twLProu/KSfh7Cz/2TK2+X7j0/Q5G5NXp45+HtX7tVjwhKbiEjOiXbGgPVKK8gldxh7wz4Q
 JP7+Eor1fJa6vH979BTYxlKzuk8D4YmsBrMBA5H1kE7GEfL7ILBxbBCZ8nYnRX7+/0XpHS7SPs
 AAAA=
X-Change-ID: 20251007-rb1_hdmi_audio-1ab3cd93fc9e
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2

This series adds a feature to playback/output audio via HDMI
on the Qualcomm RB1 board. Since RB1 and RB2 are very similar
to each and other and most likely use the same mainboard therefore
this series is pretty much a rework of the similar patchset for RB2.

Changes since v1:
- added tags;
- patch that adds sndcard compatble is moved into separate series
and also one new patch is added there;
here: https://lore.kernel.org/linux-sound/20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org/
- resorted cpu,codec,platform subnodes of HDMI DAI link
(as asked by Konrad);
- apt => APR in "arm64: dts: qcom: qcm2290: add apr and its services"
(as suggested by Dmitry);
- resorted pins in LPASS TLMM node (as asked by Konrad);

Previous version:
https://lore.kernel.org/linux-sound/20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (4):
      dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add QCM2290 compatible
      arm64: dts: qcom: qcm2290: add APR and its services
      arm64: dts: qcom: qcm2290: add LPASS LPI pin controller
      arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio playback support

 .../pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml     |   8 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 113 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  55 ++++++++++
 3 files changed, 175 insertions(+), 1 deletion(-)
---
base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
change-id: 20251007-rb1_hdmi_audio-1ab3cd93fc9e
prerequisite-message-id: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
prerequisite-patch-id: 0644af1b677a6f0aa2cf85736ccdfc2495a4c9d4
prerequisite-patch-id: 986319766f2f9e41cc702af7f6ebbb764f5117da

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

