Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35C31F1313
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 00:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769401; cv=none; b=lLPvHrwRmOJOu4R1uHuSuaQaXKK4jpVhEIfwitMHCCwfvH3QrAREW6f1oBJGYKeKCBHQp4gnRV0pv0GU5eo7pMtEvR+pL8+9mjGjz5UyupGzoI34wamIgEsjU39hoKGWD4v525DUeuyvjafmOUdpE7IP+uNx+uXLDYyoWNvRRDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769401; c=relaxed/simple;
	bh=pBYowSFXs4W63BB+daEZB7CWXgti/ugLPsgjljCktxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tC3GF6NUkhr6xA1RlqWEdrpGPgN/TJHv4HyJu44b1QDwFAM3k6ppsTfyHMj3MgGAdeidfhf+cthjs9iLabtenXcxXUVMlGuqXPSAoXT9tFsvKm7Xh0ogprIFX3tmjAb66R7NoL8WwcN+oxtATjJHsZ+sViGBwgEdwFWVHE249WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d40NJih/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d40NJih/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso10537509a12.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769398; x=1771374198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6JmkL+CRn+Pw5NCzGZqdOEyJTF9xPfYvca4al1/s8s=;
        b=d40NJih/XjPMP0J6hTJlbq6ncDOxTBXvUTkwBagSfYh7+OOnlv7vcvTRS7uRbTXX9t
         EdqyRDdehFB8ix61Eo6dEp4PjcGehLVmNh+yOSTmS0fK61QkayBJjMxN1lRFyVWq+Q8S
         ItPOtV9+bgLNGCvNnoOAEEPspnRrWeBJF58D8q3YM+tcERYWRdGqR/Rrxe24q8FXzzV7
         QsuSJVX9lQqXkK2BKcSHv7P7vUPuODqGo1ldvIySvS0PNmFHV/Hd5ijY2CvJFuFE4QVi
         oJ/oTwPgaN4sqD4Q20iF4xU4SmfDdJ2hHIMBHIR9YXkagEVqfjWOu40tzpumeD8SSkhF
         pXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769398; x=1771374198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x6JmkL+CRn+Pw5NCzGZqdOEyJTF9xPfYvca4al1/s8s=;
        b=CR4Cx2yK7ddSPOuSI1Fm0Be1AZQaWSolPL/FeHdNyahJrxuPhVRANvRx2hgTMG2vnh
         tOhNe4G7xFxY8h7VkDMjGlzRVEQvMW/Lhb6zXXgHTRJuxHN4F1PLpOa1KJxEzrZ083UR
         7OStmj5unqYI0eq3GODQ6YXYD7Ni4CLC7USuENIT77PUiZ6S0B6gMyz3L3e4b17pTpgU
         d55UVd2ipj6UN7/X5Bhd8QZAw4gsf1qd7lkZ2yC6+iVJYVqF/ZbDMtaGICKiZztBWo3t
         YtNVX/ns8FjfdRHSSNT6YASKGXZT2TAc8fY3/dYWJUw4fapxjP+jqFAGMIfCbL7Xi3Vz
         1YDA==
X-Forwarded-Encrypted: i=1; AJvYcCVshoC1Z0VTykjjk6Iih1RM1dtYch0J/2mWXZK0XxeAQZ6rnDXSCpgrIAOQccm8p7BnvQ+wPZalo2lDww==@vger.kernel.org
X-Gm-Message-State: AOJu0YweEKwq6JcJ+kjld3BXCjrHWt8mfn6+gCcb/PMSzNsLgFEkO98e
	rf0GvLnVNbU8J7tYln6l0V8dNiP1T8NVuWpjZicIY4hNWX7FFeAWmZgY
X-Gm-Gg: AZuq6aIfaRJC6enw3PrgOygMbfBsmCeGVGcFzRP9rVO4Dzakag1OqExLR8SD28VKabN
	Aaqh2Qqzwk2OVAbDuiZRiLHsr0Itt7/C04jKl2RbN8jTibulvXXzGOyne0D7BphJDhhkY9jiqcg
	YKdLwckl/Uwg+9EmXS6w6aQRLUkXIsJZJwjkuE46bhuar+73qZ5NHDmLKL7wGy7rwC4c4oV7S6s
	OI2nXR1jy84U9X29GyDZj3XC0x/QL0KwcbJJ8vi5O28snQ2scZ98v0VsxHZi1pSRMCT/ZaU9vK8
	SLPlEbYEd0JB2VxYwgHBZI7nGhNE7hXpXmGFomh+YZr97I2+QhCfg8C8mWecHOpnPrL+KONMvt4
	ebIrq0KrSHunBahhIjJrt8sZ8U8Vqs5YF7BEfC/oBHpjKMnuXy9QgM4yNaJC3ghsMbqpjr/omnc
	PZHqraKH+TvwgTfA==
X-Received: by 2002:a17:907:9612:b0:b79:fe73:3b18 with SMTP id a640c23a62f3a-b8f7159cfdamr5053866b.22.1770769398162;
        Tue, 10 Feb 2026 16:23:18 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1db0bsm9992866b.46.2026.02.10.16.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:17 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 5/7] ASoC: rt5677: Set up ACPI GPIO pins mapping table
Date: Wed, 11 Feb 2026 02:18:37 +0200
Message-ID: <20260211002255.4090440-6-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211002255.4090440-1-jekhor@gmail.com>
References: <20260211002255.4090440-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To get GPIO configuration from ACPI, define an ACPI GPIO mapping table,
linking GPIO names with CRS entries.

The only known device that has an ACPI entry for the RT5677 codec is
the Lenovo Yoga Book YB1-X91, and it uses this entry to describe the
entire sound system configuration: codec connections and jack detection
chip connections.

This ACPI definition looks YogaBook-specific, but codec GPIOs may be
recognized as generic, so add this lookup table for all devices.

Details about the YogaBook RT5677 ACPI entry are provided below.

CRS resources:
I2C devices:
0: rt5677 codec
1: ts3a227e jack detection IC

GPIOs:
0: rt5677 codec reset
1: rt5677 codec pow-ldo2
2: speaker enable

INTs:
0: rt5677 codec
1: ts3a227e jack detection IC

SPI device:
0: rt5677 codec SPI connection

ACPI decompiled dump fragment:

    Device (RTEK)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Name (_HID, "10EC5677")  // _HID: Hardware ID
        Name (_CID, "10EC5677")  // _CID: Compatible ID
        Name (_DDN, "Realtek IIS Audio Codec")  // _DDN: DOS Device Name
        Name (_SUB, "17AA7005")  // _SUB: Subsystem ID
        Name (_UID, One)  // _UID: Unique ID
        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            CLK3
        })
        Name (CHAN, Package (0x02)
        {
            One,
            0x0124F800
        })
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Name (SBUF, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x002C, ControllerInitiated, 0x000186A0,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
                I2cSerialBusV2 (0x003B, ControllerInitiated, 0x000186A0,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
                GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                    "\\_SB.GPO3", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0019
                    }
                GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                    "\\_SB.GPO3", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0012
                    }
                GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                    "\\_SB.GPO3", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0030
                    }
                GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
                    "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x005B
                    }
                GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
                    "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x004D
                    }
                SpiSerialBusV2 (0x0001, PolarityLow, FourWireMode, 0x08,
                    ControllerInitiated, 0x003D0900, ClockPolarityHigh,
                    ClockPhaseSecond, "\\_SB.PCI0.SPI1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            Return (SBUF) /* \_SB_.PCI0.I2C1.RTEK._CRS.SBUF */
        }
    }

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/codecs/rt5677.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 845385c1fb88..f56ac267f53b 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5536,6 +5536,15 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 	return ret;
 }
 
+static const struct acpi_gpio_params rt5677_acpi_reset_gpios = {0, 0, true};
+static const struct acpi_gpio_params rt5677_acpi_ldo2_gpios = {1, 0, false};
+
+static const struct acpi_gpio_mapping rt5677_acpi_gpios[] = {
+	{ "realtek,reset-gpios", &rt5677_acpi_reset_gpios, 1 },
+	{ "realtek,pow-ldo2-gpios", &rt5677_acpi_ldo2_gpios, 1 },
+	{},
+};
+
 static int rt5677_i2c_probe(struct i2c_client *i2c)
 {
 	struct rt5677_priv *rt5677;
@@ -5556,6 +5565,9 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 	if (rt5677->type == 0)
 		return -EINVAL;
 
+	if (devm_acpi_dev_add_driver_gpios(rt5677->dev, rt5677_acpi_gpios))
+		dev_warn(rt5677->dev, "Unable to add GPIO mapping table\n");
+
 	rt5677_read_device_properties(rt5677, &i2c->dev);
 
 	/* pow-ldo2 and reset are optional. The codec pins may be statically
-- 
2.51.0

