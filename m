Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808581;
	b=sxj90ETAc+JSBJgwqWwG4XCgkXRn4N0frqy7e+CdEGZZ2yt+pXPspp2ISLqrBOTdtte2
	 dmmT2oBUjJZeYqAjjHjt/sao62FMeNKkFlPrPt7oEBzgwdTgKhcXVXq77yf13orn/t0Gk
	 w/FkT/aQi20NHjm3TLUkogdf1Tzq4/dY6tZIB+GmpBoUVGcaHOtfc/XsyPDx80PXnruU6
	 eM4AAoUMqZWYT93PSHdH40LEi24daRWp2vI3EFDRkdkHpQxAM6A3tGDKNJZrh+bfHv+Je
	 5Ka0avpHmh3ws+co1lIwcFsI2YWmZR+hV0liWtARfg9B3yDc3qq7cYLTQb/uZTJhyPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
	b=gfT4Y2HvczeB3FxDzNFlPfbR0ANyrNkAKeIjqt2onfnhrj+j3bkBBi9RQMF+Zy/ag1sF
	 nqeiky9ovumEQvfVk6aI8IzyZcfwBZOrjdxONb5/JLzQLJIZQu3V06kOhzWE1BtZdTedq
	 MWjR3JQD4pSO2HVfM8ByrtcvNpV1X1MxCYp5ekPHPFHK47KLK0j53nFQR7ZkpeeKi0HhX
	 OAfBi/zcxPzUQNcvGW7j5OCZsmr3h/9OGfW88Hp7wJbKuSCKKwaOnfJsJ5E0A2FFmfKlL
	 qP6GIuYT13qmnw3NRm7Lazjy3hGTRpRWFH8mkL4QioYB6vyXtTUn3LTJn/3MvtNVhHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LASKncoP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A8606A32C
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 16:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53A8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LASKncoP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so9818345e9.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 08:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793808579; x=1794413379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
        b=LASKncoPj+DC6eRfOvbvLJRVuD30FXYsGdf91pLHBjrH8tqqVZoeDgSZbQSo2wvvkY
         LW3BbUjIhOSPyvCMOM3iRo8l6s2i5YxVCD2QZi7ZEeJQDIItW8iAuWDIJ3OfQVOxfd/x
         vpbqabnxVDYnaO9daH6hmfSjfHSznyGvI6A6JtdTcRVcQBRWLAcRKtuad9slHsOKT+vq
         m8lr4fd+b+D+KIdnDh4vw3UnWkMgciAcxPSGUrLQfk9PBPDNgU0rW/TMYBkh1cR0n+Wo
         hspP8+/9qDf8Wy4922qY7GTy+8uFyUiYDu1P8I11E17ARYrHP/LPTno61GfWEq0xcm/h
         NhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808579; x=1794413379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
        b=utsNLyA5aolqAL8qm07w0yqE/Pl26BcxzNuG8iVrVeTwjvheaZT89KGpUKYX3nKZO1
         fOTgXBPTM498mUfdmB32teieUAvjTfi59i0uai884Wk9VNfa2veszdJPK3AWOLks9xfW
         PdzQ7sd553gMfX/WhU4mr77VLWfhrcksG65aa1TKmss0k7jAjFZElNdaDSLbISvqhd3u
         t6mJE/e5gdBr03efrrlg7oYzSZenX2YTbJ3P87bjmMDNDrvLSI8PxpropE0h3e55qH3l
         QL2zJZ6U52gn7WDxCPsxx1tv2SbCJujWuThIrPryVW4NtFg+uEPshIsu8hoL7rK+jHfS
         Ugcw==
X-Forwarded-Encrypted: i=1; AKwUvBx6VEHrK1tr0Gdr9E8XYyao3U3TtvDdY6P+Gg+XoH+4Qa5Lt+ZFKn73BKcwvx/FHLwBcQgrD2ZcJeuRzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z94fp73ykr6ezsc8+amhh3Po3oteGPSQhgmu+gu36c10B7x4EBv
	aM/cJX+OnDKoF9QTsblnUEg4deB8bmw07HEJfT/PnofLNh4VRahsXr3pFKCgfhwzdgo=
X-Gm-Gg: AYBFou0sv5Eco7cA25Hxjmvq7Z4PlMcCAg8RLPok5OBmxftIDpPWkTtv+6s0CsyDR7n
	M6rrI0ZFJPQUxH2nShIyTH6AmILS0V+taGR1qc5gy0Z3PWycfxu6DtBGjiBSG8RLHxPoFUQf4Ht
	KkID3bknRt9ucMvkR5J4Sbtx0wVrivSjg2nheov1Zm9TFNUHpHoe/CoO/6JKafmsggRpkv2YD8H
	3yLNe2cxnWP9qrLPX02tWb3PkCKQvpN8szjrvJAtCAmd8CwokaGACX8g9Fp+h80ozLDQzRlYrVv
	NTbRPzryXjGjJjbj6gtEEbjiqnM+R6FBR2AHe7wlIMtBQz7mJBv4lKYFhKra61WwLO/mr9pftmJ
	sb1TlPVvYapigdHD92O/D5XF1mrhEglixkTINrZkh1HsErWOBLkdhflFXt+FMgrnbokkL59WCz9
	DW4Pd5ySkw2jjsaFD4m+oV/7wxiiB5WdmMRcMHQALac0mxpZ/Luae2k+C3Kq/ldmdhVApdQNmch
	nTD/Ekob42YtoEYYcbYt8aGoA9Wp/IUgmuMDcHC2NY6qQQKPdP/4su9ht3CukoWLnx5oG9STzwM
	ECULCYbIuMGdygWqD8+hPai5JILeVjVtpw5SXm1jN82zqg==
X-Received: by 2002:a05:600c:1d02:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ac16bc4731mr408199185e9.8.1793808579070;
        Wed, 04 Nov 2026 08:09:39 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:458e:d526:4eee:2f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm85089815e9.3.2026.11.04.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:38 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/2] mfd: use designated initializers for acpi_device_id
Date: Wed, 04 Nov 2026 16:09:29 +0000
Message-Id: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBBFr0JmbUmnJlVceQ/DorQDjMaWtEA0h
 LtbYOHyJe+/v0CiyJTgViwQaebEwWdQpwJsb3xHgl1mUFJplGcpjB1YvFsnjDa2cqj1BRvI+hC
 p5c+eetQHp6l5kh23/Wb0nMYQv/vXjJt3ZFGqf3ZGgcLlL1VVuUzX+9hTF4IbyHcT+9KGcnpBv
 a7rD6JmhzW9AAAA
X-Change-ID: 20261030-acpi-mfd-a6ac9d16671b
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-crypto@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793808577; l=3284;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=VoE1Fm0xZu0mayKQlGhQQZLIaRumf/QdmutseQMZPwA=;
 b=uybqUEyxjF7iAKy9pKtXAKAQ4dhu98wji8c2TC5h8NLcf/sZMMgMUqqVTNiO6oIJkkWAN26vq
 nWMg9/1QuTnB3bWLAzs8CkPtkkNt8REQo+74FNLy12d6dPmtivfG8A+
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Changes in v2:
- Split Intel LPSS into its own patch.
- Added a review tag from V1.
- Link to v1: https://patch.msgid.link/20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Zha Qipeng <qipeng.zha@intel.com>
To: Andy Shevchenko <andy@kernel.org>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: linux-crypto@vger.kernel.org

---
Pawel Zalewski (2):
      mfd: intel-lpss-acpi: Use named initializers for acpi_device_id
      mfd: Use named initializers for acpi_device_id

 drivers/mfd/axp20x-i2c.c              |  2 +-
 drivers/mfd/cs42l43-i2c.c             |  8 ++---
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++++++++------------------
 drivers/mfd/intel_pmc_bxt.c           |  2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c |  4 +--
 drivers/mfd/intel_soc_pmic_chtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_crc.c      |  4 +--
 drivers/mfd/intel_soc_pmic_mrfld.c    |  4 +--
 drivers/mfd/kempld-core.c             |  6 ++--
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/upboard-fpga.c            |  6 ++--
 12 files changed, 50 insertions(+), 50 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261030-acpi-mfd-a6ac9d16671b

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

