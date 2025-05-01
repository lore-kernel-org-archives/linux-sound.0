Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712451A08B8
	for <linux-sound@vger.kernel.org>; Thu,  1 May 2025 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746111732; cv=none; b=MoOLfDmIYQufoeu3fb586tYyxtPW4XkQ0LH3hNkW6Szk/GtWSMtoFl0+66hJxgTMVZREZ0mV5ulZNdw4deL3SFrAXYI7IvA9PwhN9HEGhnY5B/MLA6GIOy91gkpPEIbMd+uaRt6wNrgsdFgRDivnTpgNtMB1YrKMGfnugEKR+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746111732; c=relaxed/simple;
	bh=1VWijjOveKM78Pbg6yVVTbPVhW2rlfQmcQFnP8XIqZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BIs7WTalLbnQwf3FQGT9MW2lekGaSnoCfiMYgnYH6946q5Haqru2lN9kz6VAdi2GqtYUQeAFtk5WJClT0G1UQCe/YlIUzCdFusb4zCExmYsRvcKixLyPbL3uaY7qBWMkJrYz+EYytkqD/xr0tp4xOIJKPaVYRg+ZPuwtDUCtaUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mStVbJ/2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mStVbJ/2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1639955e9.1
        for <linux-sound@vger.kernel.org>; Thu, 01 May 2025 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111728; x=1746716528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttrcVZYlqM0kZXU17grb522rcBK1Mj9yyOBAh163GPk=;
        b=mStVbJ/2begK4HcerftuSeurs0ZKybz3qaKT6KR9c8YFyfxtBjjtJFUxBhQZN4FF2t
         2ABBiw172fAVCRdM7klQ6LTM+0pNgpKuScRHhpcKgkDpJN48or7LKLTMC8c8jKafSZBT
         6aOsIdzRrRI7x8N+iy4bZPpQcA0SKEa2TlUOYX2snLZ3iBh3eUCCfopq6HsRmAhaibbL
         oZlgz9jnkseTa0l5FRa8eeCnW+q6ecAVYhxRPjCA8xn7Om27ZtM6DA/L9Iv/sW0gioX2
         +zLCOkekQ2hNPupsWkeNhDJvX6otHl5MdrVklFfgBFd8xVMT707pVyx4uL0ux7MBJNRP
         MVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111728; x=1746716528;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttrcVZYlqM0kZXU17grb522rcBK1Mj9yyOBAh163GPk=;
        b=nd3VZFQEr5TcEA5OkqDZ+EEyw+N1w0daBtdJjOHjpm6ZIMBtus/Pw7RT0J6wRAbWBB
         txmNTNARXrisJz8aBLs/sB8ICe8VqJNr1D2e/lOSIqMRRqTxscv6yl1I7uTXa7D3gQYg
         2MXoPdKfTWjY0f5yUj8QM5EnoNxoG9K+YDYaDE4CfMaTqDXyRoaYPNk15fhjZTTIbrCR
         zGQuZPdyIB/ZBbB78fVV+/Ads6bh6GYIaX7hdV84Vp/BtVh80EFWPTAyMk+zATv6uApf
         hVDP2Fl+KkucqLjatM+cssMlZ3P2uHKgT0sVyO9NtJDqTgzvu5CpyBo1XDgwS3zTTjN6
         WwFg==
X-Forwarded-Encrypted: i=1; AJvYcCVP/B0jzstqdoitjehKbDNXu9i/CNoHhcetTTbmwxpj1fMQYdwatbRqrWqhnJJKkvtU08QsdTOp986BAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0in6enYpS2RzBdhj1RK844aEZ3NkOIH1tzJxHSShXv0IJMgXB
	JllIil1SArM9MLCFJ+ItaFl1DO9wQ7zuspesQ3AVrGdG+Lylnt90Pea5oKfd5o4=
X-Gm-Gg: ASbGnctF00MwodYKpbfSvnC5KOsCq8nUi1g9SDVXvc7N0lXHfFVjNa7GV3bJcGIF3Gc
	87EgvoyzfaZVaHNWGfNU7pjQI0ZsrcWwFHdykV/YVfiDWs4vTaBws0O6t/oon99PLzQmtfbe6hK
	6SDI8LhyE8rTtXH3vcXMFQtQCD0iVdC/mxBswyVn1n0N/iLze3lVPqcLwDxGmX0QwVwvIY5OcII
	4PVjzbIqLBK2kkzVUnBMGjkdmug4ruZGnwt7tUbxkHzc7pe1n7DYn7yU06r+x8WtTacE6hh5ir+
	vv3MPUp+su6xZtw7PLpyUb3XnFxoTHTMdkVRVuMLfbK90UXrL3+QOj7Kmnc=
X-Google-Smtp-Source: AGHT+IGZ0ehud/ximXE2CMIJErpM4SI/FhJUBgX6fJOCUs66uW5nSEtDJMw+MUC0zHgypjkuk3SDZQ==
X-Received: by 2002:a05:6000:1866:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a09007e244mr2089279f8f.12.1746111727129;
        Thu, 01 May 2025 08:02:07 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4702csm1033190f8f.40.2025.05.01.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:02:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] spi: Minor smatch fixes
Date: Thu, 01 May 2025 17:01:58 +0200
Message-Id: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaME2gC/x3LwQpAQBRG4VfRXbs1RoRXkcVk/uEuDM2VlLy7y
 fLrdB5SJIHSUDyUcInKHjNsWdC8uriAxWeTNbYxjak4sm7unFcOckPZokfru+Br1JSnI+EP+Rm
 n9/0AxdzydWAAAAA=
X-Change-ID: 20250501-n-smatch-fixes-2e9e6d8fd3e3
To: Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1VWijjOveKM78Pbg6yVVTbPVhW2rlfQmcQFnP8XIqZ0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4zple8GyUEoL6IZq4zjpqAic8P29xT7tLZY/
 oehltltRHeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOM6QAKCRDBN2bmhouD
 10owD/9FVZ+pJ3mQzWF33wBIVcZ98/gdePGTPJk3U6ZXnM4XdSM93A8EysytmRSKp7mhypSC09S
 FG1Wog7SPakZpceFVwWPPrGY2hKwztfjXSqNvvBc+8dZrFaSEWCfcDXQbj/U8stZYVvLnWn2n+M
 ePWBE9BgqY4tVnCYizR8Ly6Uz4vq8Hd/oonDUaOetnq0k31z+QKYnGXL5MYWNJmVaqadmvjOHie
 hYusnzCyascIXdMkQmABsoD7Iy9WYp3xqi2jEk2Z7FrsHT26YGL7QlJei96DEMbhQDn+D8g3oJD
 MI+V1U5WUI/iy+w+1Y/10hyKKJocJDHxkobU93xbfHaHcJkB8r9of/gU698FNKF+Lh/b7WY96NZ
 zI7PcXajVysujp5u87R79aAfMiB8YZGZ0+gHy7vU5Q+ySZO2e9jGenhmcyYk1+zg+iL9mjK5fe7
 J9UUK1JDjVstLr133cuD1nGE6Sw7v0IgMS4aNWFpqvRaVMcnNE5/cB/TilOQGRX+TLUJX9QzSpC
 OpyD2tAVGgC1kI3A6okSAkKk4B7c6ZtK7Nbvd8lpdDjN8GZzoSJV07M4Ym4+7PK8ZwK+KFXnA4X
 si/kVQaqYfcvNnfJTrn7Lb0S+Q9BAXayQixDMKbVa8YjDsHsPbI2vn87cfFbihe7Be5gkOtN1q0
 4Oy9BANH0Pd/Djw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just few fixes.

Changes in v2:
1. IS_ERR_OR_NULL->IS_ERR in cs42l43
2. Drop patch which was already fixed in the meantime by other person

v1: https://lore.kernel.org/all/20250104205437.184782-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      spi: atmel-quadspi: Fix printed error code during DMA setup
      spi: cs42l43: Make handling missing spk-id GPIOs explicit
      spi: cadence-quadspi: Assume device could match via platform

 drivers/spi/atmel-quadspi.c       | 9 +++++----
 drivers/spi/spi-cadence-quadspi.c | 2 +-
 drivers/spi/spi-cs42l43.c         | 4 +++-
 3 files changed, 9 insertions(+), 6 deletions(-)
---
base-commit: 6b7e080d43429e85b40355986026eb69ef775df9
change-id: 20250501-n-smatch-fixes-2e9e6d8fd3e3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

