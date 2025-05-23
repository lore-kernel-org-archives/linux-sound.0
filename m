Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FA922D9F7
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002704; cv=none; b=PvaKTP986sKQlZMku0pYHsrRGtcKvSpyVQTzAh63ajh7MXVv5PIur2PqquxTBL/V97wmNOSFEmMDsWPYysilVqr65ofaUtBS/bEzXWgmAP9UrDnQrK1S+4KKJHrKe27EaLk4fsFK1mwLc32w6pXy61J4jmdDVljYP+SumPBDAzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002704; c=relaxed/simple;
	bh=EmnIa5bxahXoKUt/S5C44wOjOlR5OJgPCbMNCuLC8qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syk+/yPF/H4s6ciR3P7IMG5D5k3uODKnUJ2Gl1SBa3B2M690ld3dO9/9ev+2XKTcsLGuxQ73CALsgIQIFkOhFksSv7wqRlTtryAHs7dQCpt1gL4ojnMnhDw97MnbwYBg2afKldS1En62ZdB0L9P/5MIST7GzJznaIdfO5YSzj9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iP3ebltT; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iP3ebltT"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-600c64d63f0so1372011a12.0
        for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748002701; x=1748607501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdpB0qfhicESu16Zbo93fW1Zw0Rp8XBYoEBa9VspgrA=;
        b=iP3ebltTpPe7NIV4DDWZVR3jjr7FvjWsi6rcorDzDpGNpIEcjqWIfUt91IfcfBCM/q
         KlW+xtSgYUxEwtyQege1olNnSQCsLpCC7d0Q2A8KhqmxbZOjYSjmAWcNmnsRwZg4CvHM
         Inusj3DRy3uLtkl2N4V/C4iMZ3o9AuTozCns4T1mi+2n6pyxo5WjT813TVATCOYRUvuw
         GxlrJBkuD5iqp/85JsiL+BGiN1dUpnmG4C7ZKUphp5NiO6NrKOwJFmK6TkkH5KihkzMO
         lDbT/C9cSTAVCMixS0tFY3HPYiuPwWKASDEEF4JAw6LFdz5VqEX9989YxCwtVGC6oOMy
         cA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748002701; x=1748607501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdpB0qfhicESu16Zbo93fW1Zw0Rp8XBYoEBa9VspgrA=;
        b=QBLL6HxD13uISzZAxa0CmQw6NccM33+UjCP0C3Fvs26ySyQ97KIiAiWcKkxaTpnv/K
         pYWcX8JhvpKSdgG+JW620kqKPfV9zN7Z4F0tyLrbMP4JNec8ehGxFpWq/mppELMxzKPZ
         jmtMOQNSY743G0wmBlwjXKmJKcRsyjSl9pLEuIYTEx9DMBroA/s8/allG9mPuSIJRZz7
         iBubKe9cLl29lWLrHcTaqVgHfcR6aZSbSicrYYyGIqeUt5D+giSwdjTEckT81JTfAy+4
         J8kqfnwcnNu+FKK7zLdpQ2Ohb6diKKGwXm6JZCrUE2zpR+ARG7Ge9sX3VHXbMUBTyuLa
         V4ww==
X-Forwarded-Encrypted: i=1; AJvYcCXIDZQmw2LzGaboJlIwAPaWOM24BthEzqCCVb/7go3S/cyIkVnW9d+GIdpdLSHKohxTHfpNih4/W4FlrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFHBoRlnLZUKgjrJeStZpkmcInaK0AbJLiltHoh3zcfgi3uN/h
	BOjot0SMxpIVuL5D4mWRfXo4hbffAv94FlZvjLvOo7opg1XXCv/uTbIF8xZGrrqkKMndapknPwk
	KnOV4
X-Gm-Gg: ASbGncvbzHzHK8LNolcA6gsEMtCM3aBww0PN0YJcO2yYcygCkH+1/Ct/skw5HMM+BG/
	d6gLk5iEFH1bk3fGVeyymmvMA3fJFEgmoBrNdVGiDdickwK8LhU/yT0GLypM7TAJUFPpv/k8udS
	pfHwQSfeM0H2kBtAznB+JkUrlDPpI7U9h9Sa1MK6sQu5um74eEbsNASaX+wt/EaGTp4J/HEmlYz
	8f0ogKG7zEmom/kZC2c3pDtPSy7eAXnRZhRqP0th1ORAR0xHs9+Yv0p/IwI4CK7kj0gXM7fYcnh
	X0u0jkiaWSCdQHhF8+0MNyi/kFlSiEKBamxCl/t6h5k7rGKjz8QbSQpmbzXILo3IqTLuHzD/
X-Google-Smtp-Source: AGHT+IGuUCA7Oe9SGILxIYOr/aJvu+oAYaQmdbp3H+NhgABClxo8WpcU+NOPljVJ1kPq2E048Bn5ug==
X-Received: by 2002:a05:6402:278d:b0:600:a6a9:bf9c with SMTP id 4fb4d7f45d1cf-6029530dd72mr774768a12.0.1748002700674;
        Fri, 23 May 2025 05:18:20 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3b630sm11795503a12.76.2025.05.23.05.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 05:18:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: lpass: Drop unused AIF_INVALID first DAI identifier
Date: Fri, 23 May 2025 14:18:12 +0200
Message-ID: <20250523121811.380045-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2605; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=EmnIa5bxahXoKUt/S5C44wOjOlR5OJgPCbMNCuLC8qc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoMGeDhyI/voW4y3XQKHLRLAxtYB4aQIK2+hzqS
 kC9o/2pCnmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDBngwAKCRDBN2bmhouD
 1zduEACEd4Rd/oULFcZsZLe5gz6ZaBvZopK9ZAUv1Q4fdhQ+UG8LPn81KKrFJ5RcNZ5YflsQmYk
 H95hG7XwCiw3W4alASJUp7D4o+bEPNRveIpdY+Yqqgs3Fo7nH2oqfaHJo02wdKJqU/1+hp5Eh84
 KIvrYp4W9wRkJWxbotH/uKWUvKlVUO9BqOxh2596hOfKpDGt05esVGXh5hbHxHow78Gy9CSNYxq
 H6d4v4sSzbAuM604c0egh7KF6mMl6gvfSYxApsIQj1d4XE1HHpO0ySL1C5g1wLu6SwEhYpPbkzF
 FVIsrVHriaprxH4SNMohfM7dQ7mkvg+pjOycut/PjomwGMB+kPl0JYkJWz8shvnQODiJLlY8aiB
 oAB6Q0wXQ1lRgBDHSZI+DNvgUiG0KPywv0yluP1vhPEJ393M7aekHS2X0ZjZYI7CO9r7fpR3tMA
 zeFACrYibzOsc5uOm4ANObmJ8D93SBgeb5IayRZ8xozzpMHflNpwnhmQ6pwuyC6LbVEAnhVBm5Y
 rHIunJeJ9qZ59EEq9/fBh2o2+TaKO0PfWfWcPUdSY9+ovqqayw2j5l7bneovFI5kCaAsP0rKfS4
 K7X7T9mBidpn7AQFX8U3S2VVwQSW981xSyBQWu7WFS2wQblO8Qg9sc/LO4Dg0u2dX/Oq5GPiQ7n 5GFoFOwMY52Xrng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

All four Qualcomm SoC macro codecs define DAI IDs in an enum starting
with AIF_INVALID=0, which is nowhere used in the code thus actual DAI
IDs start from 1.  Drivers do not have their own of_xlate_dai_name(),
thus snd_soc_get_dlc() expects the DTS to start numbering DAIs from 0,
which creates confusing debugging scenario, e.g. DTS should use
<&lpass_wsamacro 2> for WSA_MACRO_AIF_VI with dai->id=3.

This also wastes some space, because drivers allocate few arrays for all
DAIs and basically the [0] is never used.

Drop the confusing first AIF_INVALID DAI identifier so the enum with DAI
IDs will start from 0.  This has little functional impact and does not
affect the ABI, except saving a few bytes of memory per driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c  | 1 -
 sound/soc/codecs/lpass-tx-macro.c  | 1 -
 sound/soc/codecs/lpass-va-macro.c  | 1 -
 sound/soc/codecs/lpass-wsa-macro.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 45a6b83808b2..238dbdb46c18 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -619,7 +619,6 @@ static struct interp_sample_rate sr_val_tbl[] = {
 };
 
 enum {
-	RX_MACRO_AIF_INVALID = 0,
 	RX_MACRO_AIF1_PB,
 	RX_MACRO_AIF2_PB,
 	RX_MACRO_AIF3_PB,
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 27bae58f4072..40d79bee4584 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -208,7 +208,6 @@
 #define MCLK_FREQ		19200000
 
 enum {
-	TX_MACRO_AIF_INVALID = 0,
 	TX_MACRO_AIF1_CAP,
 	TX_MACRO_AIF2_CAP,
 	TX_MACRO_AIF3_CAP,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 74ada6e77526..a49551f3fb29 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -165,7 +165,6 @@
 static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 
 enum {
-	VA_MACRO_AIF_INVALID = 0,
 	VA_MACRO_AIF1_CAP,
 	VA_MACRO_AIF2_CAP,
 	VA_MACRO_AIF3_CAP,
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index c1fb71cfb5d0..da6adb3de21d 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -369,7 +369,6 @@ static struct interp_sample_rate int_mix_sample_rate_val[] = {
 };
 
 enum {
-	WSA_MACRO_AIF_INVALID = 0,
 	WSA_MACRO_AIF1_PB,
 	WSA_MACRO_AIF_MIX1_PB,
 	WSA_MACRO_AIF_VI,
-- 
2.45.2

