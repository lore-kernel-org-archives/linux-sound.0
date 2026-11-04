Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808583;
	b=xX+YEa2Zegd0ZeH8arJF6HAe2hYr//dTyiPDRC1lXLSvHzlTLNHmk09+C1PtqLznfBsL
	 Vkh4NfOOCth+Bw5AAvNVtO7rpRi701P/y6B1zPzlWByND2wpx6np1mQhQstdA1shzwrc6
	 LGXFU92M0nMz1M6yubkCscw63jtepND/U04M6Yxb7aVRQgimEhBBIHTxFXXXTeGR4fgBG
	 rnLfBkqtegJ8dpp0Gs/OxZEPCd6TdIEJX9/0gDAOprOT1E0sfAAxhfw4Q+Z0ywNlgvN1F
	 M9k5igN0eD7RhHinW5x/dZJVeMRIJPUv04j+LNZZV7kmeYatzMxizKXsaK8Vg3C02zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PcOOxxq2ohI8gSGHxj1Mt9IYxr9F0UQJs5C2ymn1BC8=;
	b=CaFrtKMzX3mbgBiH2Z/N3hq01R/EpDKfmQNXu6kR1MNl1goQMM3GGnEbdvAMOBVfqOsP
	 ovfCow4rsTX4MX5etBFgXkeWKidEh1B5Ub9XAehV2EShPJHzpeaOzNmQCXhymh9DJoXMX
	 5SubncGJ6mM6rcSU5YDoVG0EyS82Em/SYWz/WOUN/8eZWt89od0BB7qNjKe51JbIqeOzL
	 Z7qg5oPYeA/rjvx/OTm43uVa7CQWzgvwuTSO2XOfBFHQJOxyRTo6KLGm7o90csnmidQk9
	 FuAIne69e6DqyQdSEzc9T0YzMGHQZCik10jbOFud9f5JJFL3prt4bM2ygvgCqMmvHOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gHqUEJHT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6F606A33C
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 16:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B6F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gHqUEJHT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so4882455e9.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 08:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793808581; x=1794413381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PcOOxxq2ohI8gSGHxj1Mt9IYxr9F0UQJs5C2ymn1BC8=;
        b=gHqUEJHTOSFMoWmpWqq6oQEH2usIb/kSoEgZ8IXiGFMNhY3ZfKdXVm2Xe+RdVR4lHD
         1dIuxpjeo2AINarJTFYGkRJY4FRE6LGy/RO2AgnJKMkBTI++1iz25kG1qpvqQeLH71/O
         T711TDPFwi6aoUffz0KTub0RCWNUp4SC0g205eKtH3aMZATrjJ9Z+Qe+Ize+Zv0vmUxu
         MjmeGTUlatriZ8Yf/2RR+y/8oFe/zi2ZCcIrnX66yC8YtpqbcdWcAkDwELbhZdGwbrcL
         k3cxsyFfqW1ES1qgua8q0I7rGHoeqKtnarVjPAz9eMGG0JNPvVKmvJVjd+grkNnSmeSG
         oWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808581; x=1794413381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcOOxxq2ohI8gSGHxj1Mt9IYxr9F0UQJs5C2ymn1BC8=;
        b=cI3jv0lD/ex18Cx8qUb0O+oth+3B8whh899wNz4leV69BXwsFHSMM2DZJ35IHsM2R9
         9wwMJwxVIwhiFLD7GGtSEisQz9pgoD9RxJmIoVKD5ldfzwSSd/Y/fmskTUHConoJqEg1
         I+gFdhzWLrxWTUKzmRrB6RCtCCNR0qe/kJGHp1/0JH/4uGlqNkCy5Q5dlK1kqs02s0AU
         9sYCjI9J0GI9+Tiv+fEZdWZxh5D4sQ46I+2SduOv+m0X7ylEVQ3QNg562hF86/qQj8Hk
         C69hdpG+6pZnNW5PiF+g9gP1woARyFcZvBO1yCqKRkWL17l/wKzjCBJknVnx7FntNLbt
         +3cg==
X-Forwarded-Encrypted: i=1; AKwUvBzCQWHenJZCqNHX05t4Qu22EkRllfUqxudEVyGPAQ9krI5yJdCXmuz47EKRzhfH/e/L6p9Ws0QdJe2FkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zAggm/dEuBHN7YU6iJEH2IOBATFv1qSC/q4Tn0ValZSKUnldM
	B6YO3asXyLpLA29/+wo+R328ANim6HLFWQFZr1NrMcuOVN0HPaI1eRdmkxGayd8CeqU=
X-Gm-Gg: AYBFou0kq4nF+O1KyKu4kp8vZ85SMJp3Kc/0wwlmPoZEAoX0MrT4IqHQ/Of+IUW9Evi
	9rBiCbNElR3op3ofQ9UVAX1btyHwKNJMr/1TZtZS9i01rIEkDh9c07bGMv9YZNCIu2ILoXmZCO5
	XcXPmkS08ilPhhPPF4dG+bP7p5PHfk1cFQs/3LadlIeifbJ6Wj7RpMDpWsNwUHgkq+P2Wx/+gTY
	0RODbW9Q0E8t3cbsO4XtVn0nigol/KujPTNdiDQlG0pps2sYD/6GYUO9tdBsR4Gp5xWjCocSFut
	ZUaKGiWdBCVHl3BoNFnGKRKUBqxyJwg/aphKynH9vZtREkfV9gQeLqXviml8wFPY8BflAf1cEK/
	ki9prdWfFXq41E+/eDSmRs9pIa2CjElyXVDcrP2jJ69ZziAcxSjYXC0iu5/ViMuTQxUEFIIL3Zn
	Y6QLfHf4E/+KporN8UvGFUJCMOmTNlYanQlixPKaHEpCAJPuuYZrJ2IpqtxBqoNqZlGaJ6S11St
	aaQYPPoQbCzEyIc5hvQgWCwBLAerJqk4h2466ZPlQxH4yOAgQBWbx6dS/lknz7MuJk/hVMV1L6I
	GZy60XI/OvNrJNGxIqtlGNTfLR5s4aQ5xr1HDEpyEi7TSw==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr414966515e9.11.1793808580996;
        Wed, 04 Nov 2026 08:09:40 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:458e:d526:4eee:2f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm85089815e9.3.2026.11.04.08.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:39 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 04 Nov 2026 16:09:30 +0000
Subject: [PATCH v2 1/2] mfd: intel-lpss-acpi: Use named initializers for
 acpi_device_id
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
Message-Id: <20261104-acpi-mfd-v2-1-64b9dee3baaf@thegoodpenguin.co.uk>
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
In-Reply-To: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
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
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793808577; l=4260;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Pb1xaEOBDiGouaBxIYgpbZgjIv3fCd5ArxVoKy6CMhI=;
 b=vFUUfugOugL4hmuAGOfxj0HO67PsTVAc5kdU64y3m1BVV7RANW3KRU1RgpXwoobUNowIYkytj
 Xz/5Ats9qjyBD7w7/RIJHOMWagDXEzyMW5nwxpIWaPuckHR9h2HRpOp
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mfd/intel-lpss-acpi.c | 58 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 720adb0ee21f..2f46a85066bd 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -137,38 +137,38 @@ static const struct intel_lpss_platform_info cnl_i2c_info = {
 
 static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 	/* SPT */
-	{ "INT3440", (kernel_ulong_t)&spt_info },
-	{ "INT3441", (kernel_ulong_t)&spt_info },
-	{ "INT3442", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3443", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3444", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3445", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3446", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3447", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3448", (kernel_ulong_t)&spt_uart_info },
-	{ "INT3449", (kernel_ulong_t)&spt_uart_info },
-	{ "INT344A", (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT3440", .driver_data = (kernel_ulong_t)&spt_info },
+	{ .id = "INT3441", .driver_data = (kernel_ulong_t)&spt_info },
+	{ .id = "INT3442", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3443", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3444", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3445", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3446", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3447", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3448", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT3449", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT344A", .driver_data = (kernel_ulong_t)&spt_uart_info },
 	/* CNL */
-	{ "INT34B0", (kernel_ulong_t)&cnl_info },
-	{ "INT34B1", (kernel_ulong_t)&cnl_info },
-	{ "INT34B2", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B3", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B4", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B5", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B6", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B7", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B8", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34B9", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34BA", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34BC", (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B0", .driver_data = (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B1", .driver_data = (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B2", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B3", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B4", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B5", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B6", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B7", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B8", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34B9", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34BA", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34BC", .driver_data = (kernel_ulong_t)&cnl_info },
 	/* BXT */
-	{ "80860AAC", (kernel_ulong_t)&bxt_i2c_info },
-	{ "80860ABC", (kernel_ulong_t)&bxt_info },
-	{ "80860AC2", (kernel_ulong_t)&bxt_info },
+	{ .id = "80860AAC", .driver_data = (kernel_ulong_t)&bxt_i2c_info },
+	{ .id = "80860ABC", .driver_data = (kernel_ulong_t)&bxt_info },
+	{ .id = "80860AC2", .driver_data = (kernel_ulong_t)&bxt_info },
 	/* APL */
-	{ "80865AAC", (kernel_ulong_t)&apl_i2c_info },
-	{ "80865ABC", (kernel_ulong_t)&bxt_info },
-	{ "80865AC2", (kernel_ulong_t)&bxt_info },
+	{ .id = "80865AAC", .driver_data = (kernel_ulong_t)&apl_i2c_info },
+	{ .id = "80865ABC", .driver_data = (kernel_ulong_t)&bxt_info },
+	{ .id = "80865AC2", .driver_data = (kernel_ulong_t)&bxt_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);

-- 
2.53.0

