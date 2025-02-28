Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779317A2E8
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740759793; cv=none; b=mFxRMEryEHAblCoF9dDa9D57AyB9cuEGcdxLh0GXLMxI7VKm3Cwm5v4QN15BcnUYex2bpchAuYLbZscnSbPMbywokPEs44rCjQ3s/gWw9dcXk2pWzXc3J7Hk7jcuTSvf6DoxamHSa86IJQnKX/jwsduItGSFUzEs51G37YVIuac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740759793; c=relaxed/simple;
	bh=UMUMB04Duvtt1hisoD9El/5o2j4ORykTX88imss5UUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FAuj4RZ8gNHGujhFkcNje7Eyg42XjMc6aqF24WZJvhquB+Dw9VkYWB8kuzzJ9LDieRyJycuY044xsZpPd7SdXNR2frk/6tgWbSO405yyUGf/dzsttfJNs6zxmwZuLuGBOhu7f2BLl200LjWLb3IYtoxpHueQ9ywXNlOs31Yg778=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yS5wuYoh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yS5wuYoh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390dd362848so1821004f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 08:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740759790; x=1741364590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B9NRbb2H47YH88i6L1c0H91IgGIN8sJwVUopLL7++Gk=;
        b=yS5wuYoh+WcM+/mRR6da1K+ieuMlInn+BlRyHhDTw19oJmYi1C9XPzmAbCPotmUY9l
         +Zyr7wXdWZKsBBvzWV8+gCquHD8pu0NOYfoXAyN6KVo29kbt8r992QD7QKp1poBqduwN
         SQl8kaEd5HXITXH4/EbnUzgD9HLe/rpuxRibj2rkB+6ESnAPffyEGE6U3bNBKVaXxttV
         bORhgu4VE04xhUqcb4pcyG1s88q7jXWNwdWTRH2f3klmlyieLNVY8qJfeUdgo55jPrIq
         7u7gKmSwuH3NMrgEN1mITSn3Gb5PL1mq8nr150vy5szZQChE76tJX8yH3eZU2KJX1vwr
         IDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740759790; x=1741364590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9NRbb2H47YH88i6L1c0H91IgGIN8sJwVUopLL7++Gk=;
        b=TIZIMQf9eZrfFt1k9rekrwsk6dyH4Hqr1uL8F9RkQhZGswQ7XiNdcO13WRwwqOcG0n
         4WKcLAEj1XuUgsmGiM4Vrl5TmI4oatidRKzWTwaXPzDRvPbsR4er/VgotPjLt7HGwGAr
         FkWEmMJJhk6gdshou8bw56jt7wFgPMPv+Hx1Y3DX034Bsal0MagICjiRrLdyuRpo3noW
         +PCI18bbL1oVpH+WvbI4YQ4ntcX37ZxOv5ikAEPv4cULiCi/3W/SMRsfuJypiK16Sx/g
         O4twks8t3fYeYEp6bo20vTH9xBBO1Jm+rGc7lxIsvzY9FJQR2WCXekrrzIaGjbpLBvPJ
         adIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhxHPvpPqZDspyAEDF7kLEXl22ojuVZj3PhOhDIMBGyZqFZSt2dgxqaTRAnBUnsfbnOPmgs029nvzPjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUAuRSs7fweGTQ0zlcV59MBzs+okMX4Vy+ft3aJ44s775fT9S
	HK8A7Qwfv/7WSnudx7DS+s1navv0op+f4GkLTyeXxYkhs9tIBmRBs6TYUaOVvQE=
X-Gm-Gg: ASbGncsvsgl7GYLGT06chBXYTEZb6MLt2sQZMAI/UDNKtNvwB2haMSVTI8dt2RQdzB3
	6d2hh5NcweIUYbNbTBuouGVf5GuCoQioisy+5DGmhEjgowTF4RHPiqc0UsO7Q0SGP3lQWq9q2s3
	vCRtmTuz5Z+felX4v1Q1ONalT/sbUHEeIZx32lT/PV2Kz3/jKb2p4YE+N7BF1OmdrfGFxWZTkbS
	h92sazZsoizzGdWxuOcESZocF5UePNkmTN92kYhBDgPJ11OZ1VXkdByIa8fcewUXVPMhvHgBR0K
	X+Vc3z+PnA541PM1V3x6ajwkbiv3wvM=
X-Google-Smtp-Source: AGHT+IGtvBLdlQKwy4eRpJlFTD3uaH0lWK59AI4HrdVHengzh1kTNPMLeyRP3eg+L8x2PLVmtb6iXA==
X-Received: by 2002:a5d:5f91:0:b0:38f:3c8a:4bf4 with SMTP id ffacd0b85a97d-390ec7cd27fmr3516679f8f.6.1740759789972;
        Fri, 28 Feb 2025 08:23:09 -0800 (PST)
Received: from tux.Home ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba53945bsm93905965e9.23.2025.02.28.08.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 08:23:09 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qrb5165-rb5: add compressed playback support
Date: Fri, 28 Feb 2025 16:23:08 +0000
Message-ID: <20250228162308.388818-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Audio DSP supports compressed playback on this SoC. It is required
to add compressed DAI and separate MultimeMedia DAI link to enable this.

Fcplay or cplay tools from tinycompress can playback, say, mp3 files:
fcplay -c 0 -d 3 test.mp3

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 7afa5acac3fc..dcb7dca20415 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1018,6 +1018,12 @@ dai@1 {
 	dai@2 {
 		reg = <2>;
 	};
+
+	dai@3 {
+		direction = <Q6ASM_DAI_RX>;
+		is-compress-dai;
+		reg = <3>;
+	};
 };
 
 &sdhc_2 {
@@ -1044,7 +1050,8 @@ &sound {
 		"VA DMIC1", "vdd-micb",
 		"MM_DL1",  "MultiMedia1 Playback",
 		"MM_DL2",  "MultiMedia2 Playback",
-		"MultiMedia3 Capture", "MM_UL3";
+		"MultiMedia3 Capture", "MM_UL3",
+		"MM_DL4", "MultiMedia4 Playback";
 
 	mm1-dai-link {
 		link-name = "MultiMedia1";
@@ -1067,6 +1074,14 @@ cpu {
 		};
 	};
 
+	mm4-dai-link {
+		link-name = "MultiMedia4";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+		};
+	};
+
 	hdmi-dai-link {
 		link-name = "HDMI Playback";
 		cpu {
-- 
2.47.2

