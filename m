Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC641A4FB
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135533; cv=none; b=g37j86Isp5FstESBwcb91JgjFCaDPOlkFXEjUzbt0m1YBvG7niWh1CNLxYKKCHoaTn3MlbGY1nWgbf9TjEymbfhml2boGyVr3y9EDiitbsVRH2Z+spmS4kIia4DHDjEDfyZcKv57gMnPfo9gVAJhn/lruJBoRup+Ro6EoW4tZj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135533; c=relaxed/simple;
	bh=D+vOEhwlr3x8JS7KbxNy10G5LLJF4/eBW+XnshUSRSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgpsVuGH+IYdAcSMKYuWL2r7Rw4r65YNM/eQ7BS8hyImXbrAa706bpA01zQViuJllZg92QE71Px//5rTsnVq+S7Rbar9M6PKxmQduOmqW606MvlJgiXM1vfTVsizT7/67JNTNzTU5Z0hPMNCgXCPemJGG9N8K/fo97RK28S565I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0BsfBi/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0BsfBi/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-872024e2b4eso2735984b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135530; x=1792740330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJ2JlcJcvp7Gk9bd1vkqr/DtPQNJxUytPo1QOhpsSWE=;
        b=C0BsfBi/SqzPF3V7fWa3T7XKUYnGxSwCGoaQlXL9wPplBHSwKo2Cmjhu/NWFjN2omr
         7bnAtqVDqvUExtBp8Ah9pXLlyJ08cwo+cwLeb2Dhtxv6hV8Wg7mbPZpJ2oJyvcrvHq0I
         Ep6PWDJVXuDZw344mtF1B6/E/12X1cbNFVNfLK+euUbspHhTZqyetRMlMaoLWyA6ITjO
         sAMiYbA+h3dFTghwsjEbbBfJqWaBmqsX4QUw+iDK3JFB/QX4hz2C0qtDJ3QLcuvz5Oak
         2qZ8J3RG2vWTFMjwMfFcPO4xoLuHBUZ0jQUvtzx54mQ097zYYU+ZhzH0wvlusg1VxcDr
         YJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135530; x=1792740330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJ2JlcJcvp7Gk9bd1vkqr/DtPQNJxUytPo1QOhpsSWE=;
        b=PTmvarf3xwsIBGa+unh+TXbydh5sDpcjzd8Kvvnw3p0DfR/j2LxXQmDuhKxPDo/HP4
         UNMmn2TTlN+SyIwtwviyUksTwBdqlhNmdolUNEL2cmpuLeK0SymW475H3gMSsBpimEvT
         2CtDMoDx0QDLNtslfdmn1D7P6O9ezioLaSzqK1buGkvbS/yoD5yf9dOlmpjuA2woKzAG
         jsygKikCm+LboBz8JaptX7OJ6IrYc9eJSRKIIbk+gD7RzFtvKH/vWoDQ5+yRxx7GZt/E
         fuE8LTs4qA/YRoFXOL908/2SuhncbXnjq9gDSqRuXkWqu9SNk/BQxAn4tqGgMrMFUzL6
         Yl5A==
X-Forwarded-Encrypted: i=1; AKwUvBx0hxLAE5/rh9xCcqGsK8hW6XTEXvwrXwMzQ9s2gxrTTODnvryYnAUzeJhR5E+BzwtuFNaE6YIAbcA5gw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQjaxyrDzva1Vl77n4aFwPcTkkBZerngmHAuuAhb65VZlUUHSy
	YwjPWE+kEpjwf3Ajytc/tJEzwfsqfRzT866pBXxkoxW3gV29XRqPyPVsBWd9lQsG
X-Gm-Gg: AYBFou00FfRLlrLLK6kJtAH2Xa1lw3g36AzFmZIXffNdA13SoBPRszWWYqL4mGvHKi5
	TapmsZUECp4uJw7c/zBJVevrcNS2mcn16A/CBvYht0qBKr1bRTiRyaQVanqQP6KZbiEa1rQDSpy
	Xmx/NpktFHEQv0loa3ThTjMhRchv3iZ0wp1i+8mAupL4xo/QWyPuM34Z5sLFjr8SX1FeK0DFi5K
	w2xEko8lF9feyxNWy1HMGm6BIIDCDkpcvvDlcChz40EO8eVWsgcF9UpflQTXRX00+CPtbLoPeza
	PaXjlByP699DkwINchsX52SM62XuaKQcs4Iu+pdUpYqeDgE5v+jfCR0vk9dUplgFRp5QukGaG2J
	nXARkNBjAjr3CLYwlpsYRQ/ZoabHMJq84Pl6UEyNo8lzEOfwQCpeKSkcWacM/yPKPVdsvpLWvYt
	FNhauydSkt++qQNdbRolx8kBKZvaMRIOiUVoY0TcPkT1kiJpCQjAPV7gg0y785aKoNqNcQdFKRn
	m7ENf7HV6WMFGqkO5hLhaSU7yESWP9TuS1r9vuZku9oJr8QgEuBZfnLAV37cTR9/C2QuFuci5E=
X-Received: by 2002:a05:6a21:4c85:b0:3dd:85a8:cacd with SMTP id adf61e73a8af0-3e16be428c6mr15938189637.36.1792135530335;
        Fri, 16 Oct 2026 00:25:30 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:29 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	support.opensource@diasemi.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: codecs: tlv320adc3xxx: Fix definition of AGC Target Level control
Date: Fri, 16 Oct 2026 16:25:17 +0900
Message-ID: <09cad9ec9bb382e44cad079a680bdf0f6163567e.1792135144.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135144.git.sammiee5311@gmail.com>
References: <cover.1792135144.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The right channel AGC target level is in RIGHT_CHN_AGC_1, as on the
left, not in RIGHT_CHN_AGC_2, which holds the right noise threshold
and hysteresis.

Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 528c44446482..79f4abc245dd 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -691,7 +691,7 @@ static const struct snd_kcontrol_new adc3xxx_snd_controls[] = {
 	SOC_DOUBLE_R("AGC Capture Switch", ADC3XXX_LEFT_CHN_AGC_1,
 		     ADC3XXX_RIGHT_CHN_AGC_1, 7, 1, 0),
 	SOC_DOUBLE_R_TLV("AGC Target Level Capture Volume", ADC3XXX_LEFT_CHN_AGC_1,
-		     ADC3XXX_RIGHT_CHN_AGC_2, 4, 0x07, 1, agc_target_tlv),
+		     ADC3XXX_RIGHT_CHN_AGC_1, 4, 0x07, 1, agc_target_tlv),
 	SOC_DOUBLE_R_TLV("AGC Noise Threshold Capture Volume", ADC3XXX_LEFT_CHN_AGC_2,
 		     ADC3XXX_RIGHT_CHN_AGC_2, 1, 0x1f, 1, agc_thresh_tlv),
 	SOC_DOUBLE_R_TLV("AGC Hysteresis Capture Volume", ADC3XXX_LEFT_CHN_AGC_2,
-- 
2.43.0

