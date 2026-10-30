Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343296;
	b=Dm0t/ozleuz9hGLb8Ailllsgdwm0bSRDsIfvj+Ctgz5s87eoNzc9wowJe0loByE3CYDI
	 T8cbDBEwQgthrg5gxqBh8a6oDV9RYUzaSrW+KSbvW0TYymVGrkfwRtwu03Wu6aaLWuZ2c
	 o9JxxC/EIwlbvvtdRcLoKkn3XniQ1YMcorJZeSF6SNmfvG/XWD/qicviq8EeI7EB3+WyN
	 h0E+Epnc1Ts+rKaTg8MEeS8JlA0q3XNGej/fuRroCSGOSuwq8raJXkHziIdHvSlGj+eLz
	 VD7FM7XZSLwy7gLlWuRu2BI6KotRE83geJDsFNhllLkMHK38DCa0iAQCtUG0EjujLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EdL3xU39M250yhXR0YA2BQsQyrTGpVFqjouWU7wPHaI=;
	b=428vvOqXoBE9TSgx0U6JU/yuMecmHf3GSjY/wmXT5pTzxf/ETGP/I8ht0fc7Gm0q+9S0
	 f5l17c+ek5RaUL8kpfI0RW4FvG5dZArOWkQ3uyJdngVj23YQNASMEZ2MLC1i/63QWkL26
	 eVixw52f6VL5I3tm4w4hHtyXrvuMrLS+VZADk4FY/GPU38UzTw2y1abheWuSjDp0jlouK
	 +mZn7cvSX/Q2OFVme0iD+0PEt7KRK/5QlTucO7M5PuJ8+7tcPdnK4KFXjGIUQ61nWuX8v
	 AzozyzHppK+p6NFrvYCZjnqCTNgWeuqzs3rg9Owl9sAc/YTx1taeRDWHWUpUTYNHCkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJ7hyJGf;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43073606A31C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 06:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43073606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJ7hyJGf
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so2587545e9.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793343294; x=1793948094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdL3xU39M250yhXR0YA2BQsQyrTGpVFqjouWU7wPHaI=;
        b=fJ7hyJGfrq1M48BobdpTbCT1QjFd+oh2K+9sb9qNRJ4V1aiXbkNVpGZyb/oZnssWVd
         MtxX765CGslksF6KZuRiViFHvl6p8V0q8fITL7EtnvRAkjVKrjkvQq7C29bGZWtx873T
         8afSnj0HPxUIdycddPwpIads8VdNH+PbD3+vzbmi/S6PM4z9372bwINZ/ZeOTQ2KW9Zs
         u1KjnqBYaO064P+G+6SccCyHUf1MDiuY7S7gTr1+qIHgWihxWAuMVEr76iKoncftD1Yv
         aWb1pFAhc1r3/z4qOkbwuTyflojAU0/vr8uH1GOnNxB6YBU+byV+lWOYkYtt8QeC4f2I
         j8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793343294; x=1793948094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdL3xU39M250yhXR0YA2BQsQyrTGpVFqjouWU7wPHaI=;
        b=0ktWwAA5qYimUF5C2Cb5+fljBKdO1pIur8vJcY05qHPKshtj9zWPuOHIx/ltUmSVRj
         2iX0WbQfaTNJbDkFHlNCnlgFlCjs/cfRG/P5B45M7BLCh5zU2WWfBSXPOhTCISkhu9ph
         pN6HvsZCsbV9gZmDAasrr5PpLgiGiP4BQDsr466PqpXa4UytmJyzYPQAOcQtaLmbVPeo
         zJacWgM+k4r2ATgVubHVuCi/UuLIl9KwMKJKYn+FdUaswuS8HcSYLvDNKE4iOHrs7rio
         Ja0veIr93fR4m8UsYqfHgKZ2/SLVq/53oiN5QxaJqzHYDAJKZw+Tu3FtwWaWpBK42ZMx
         CQIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8jk5XIKmnfcp0JNdm1+w71ZqEXBuPVvXbPjWoXc2VSk0hNz5GNTPF42xVbh1zLMcbQnEDeqfOEJXgmg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLmhS5e1EfZ8TWnbVo/sRDZCIEsooQuzOyas6/AvsW6xiB/OpYO
	ujSo8FTItU+R+7la//6SohMbiqu++dITydUa80CICwHUyDp/nxfVcsXzdyPsHw==
X-Gm-Gg: AYBFou2Rvr/ANWh19sa9s81x1ciW/hy0VewARkrKuI8TxifLe9ppdzNopW95Uke+sYC
	OauH0GUW0beHUwbzaZt8+DDo9iWMLisfhPz1HvJWgDPCyHrza5Pw5uf/KDC6mcVlCI2cjiXHu+y
	TfYNDo+BahAiq/H1wDVw42cPX52M/6mOmbKGFXcj/YxMWQ6YZerbeZc7pwIhDOBwx3XrR4Ltzhs
	jaYnhW/HjzyUcehiZrL3AYrCj+SpjZPRkL3EPCkytBJV9Qyc1D9Jmz8/6m+Oejz2KCY2aZLTD+9
	QL41iZHgEPEC4WLRCNXkhd2Kcpo1DSnqzpqAYeUmOMzFpE9F1AqQJ20XhBoDH1/DiqU9IxsyLex
	4vWMRQHqyGz/Z4O+//9xM/dODbcb1sQnS4GPBA9OGmVNVUyhW/7kUApHL+cMwcCRO1Q2cQgKIRG
	qT7ZcI6aT6msVntgnfFHTby5mlux2SybunYL45wSTp7xxZHMz4fOWCrQGI23KI2xIKUogz9Swx7
	pDzYxpfKiiCzME65/SJTGipqkABX+/IJASZ5GM7DRzp+3vy+fh1WLkfbcwHJd6W/u1ViXezm52K
	eAPrdBGxnJDZTCMwYX3Os2Ess3GNJyxBxciK
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr25149735e9.2.1793343294400;
        Thu, 29 Oct 2026 23:54:54 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:6ca3:c7d9:c03f:68c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm1507704f8f.36.2026.10.29.23.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:54:53 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: es9356: propagate HID button read errors
Date: Fri, 30 Oct 2026 08:54:42 +0200
Message-ID: <20261030065441.2020789-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

es9356_sdca_button_detect() returns zero when a regmap read
fails, so the interrupt handler cannot distinguish the
error from a valid no-button result.

Return the original error and keep the button result signed
so the existing negative-result check also handles decoding
errors. Leave the ownership handoff unchanged.

Fixes: 5d9cb740cd38 ("ASoC: es9356-sdca: Add ES9356 SDCA driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 sound/soc/codecs/es9356.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 9c70ccd5b310..277d0ae56661 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -293,13 +293,15 @@ static int es9356_sdca_button(unsigned int *buffer)
 
 static int es9356_sdca_button_detect(struct es9356_sdw_priv *es9356)
 {
-	unsigned int btn_type = 0, offset, idx, val, owner;
+	unsigned int offset, idx, val, owner;
 	unsigned int button[3];
-	int ret;
+	int btn_type = 0, ret;
 
 	ret = regmap_read(es9356->regmap,
 		SDW_SDCA_CTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
-	if (ret < 0 || owner == 0x01)
+	if (ret < 0)
+		return ret;
+	if (owner == 0x01)
 		return 0;
 
 	ret = regmap_read(es9356->regmap, ES9356_BUF_ADDR_HID, &offset);
@@ -320,6 +322,9 @@ static int es9356_sdca_button_detect(struct es9356_sdw_priv *es9356)
 		regmap_write(es9356->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_HID, ES9356_SDCA_ENT_HID01, ES9356_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
 
+	if (ret < 0)
+		return ret;
+
 	return btn_type;
 }
 
