Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09073B4407
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 23:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781135536; cv=none; b=SyUjZsbzmLXZysVq3oJHYAwzsOJEuKJ86l0LjzCLZMsP/9B+AT7h/40w7vSMyBcIS+nz2+nnL2SydabyONa7zELFAUisGQxux/n3pYBggyWXpXJBPB2NpjGPtbpXY24sGg84rEruVj8pr2M5VNnQOj6SdaSchUiPDRUfETk55aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781135536; c=relaxed/simple;
	bh=GerYjjWYFTrsHb6FnX4NV4P82wObY0cWFl/5KAIY0n8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oLbG1gpCw+j42QT/m35qwEZarL2Vrol+6x5EwCDeA7o9GkIMntTIqXv/dALS7tK2RtozhCv0eSwxftYKNS3F6+uWOTRD049aAmFwCxhWIpI4OKazswG28Tj/SpWY0BV14mdEw7bSRSIcJujLUcp/otJugTfXDXXSUvWW8QDRqm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC6vxsHr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC6vxsHr"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso9923916a12.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 16:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781135530; x=1781740330; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/CHPfL3kQ1kskyB8zBWlowViCMrW6SC9Pz9yVVbBrKY=;
        b=nC6vxsHru3BF9qtkZ+3XrWnU9mbliISs0je31sDfOxfV/6f+OR4a4MUE6kwqseriP6
         TMBuekMYN096S7FSMK1EBmlFbAsCLSf3z+iCRVlWkDyHbiB1ZvGMivXCpBxy9bHsynum
         t8Bi1bjxOORyBHGa29rfMLXkq0WjG7l1qNY7T/3ituo+t988piIcw2E0FKs4Effn2KIL
         7YOGiT13jvYzfr7IWHv//cOz1/kYoGs+zp5e8Hvq1/nu+e+Ithr4ZiMTEDv4FsKuFxL+
         Tg4XpiS3UpP9RP5MqUo7MRp/GuvmiF6KbbKbiqoXfYFumoBNn0R0xnCbSl0J/EXNn6uz
         2Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781135530; x=1781740330;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CHPfL3kQ1kskyB8zBWlowViCMrW6SC9Pz9yVVbBrKY=;
        b=TC834PRv45F8lSXiRttc3oDDUgCmRH9UfP2uRDixSV3WYBi8qabFpqN5o5nn5E6E3X
         qfuBQ6O4j8sPR3LBdCz1P37OBaOgEUDQz2zVBkIkvXGzcb3h/xjo9H73/BTjdC4Z0q80
         3ThP8hdobE+2zwSQR8vMQqUS5MufBAJ7inLpbARq2c+/h5yFIKYOUsIzRR20m9xJXCan
         kHQgGsbAmQLpp3a6d3fBP+G1ewLEfF/gp27kBnFzyvmvnsaL51W/9XYsUCKw9wc5Gz35
         TP1KOb4SyknG/0VP8XRmojm2m6i5FuYT6JSjFj5djl6YbHPqqprJoCQj4WNBfZY8xldB
         qopA==
X-Gm-Message-State: AOJu0YzTDi2hY8aT118EZgJTcC+wRQErTqc00dJdTm76E8Liyy15qN0i
	XwGEmlUPe5z9L8njDvUH/9kRSiI+RK3GjPiuiNfimHfjOO4yCR6PS3CA
X-Gm-Gg: Acq92OGQRWyr1CrSJLLpl3EPUG1OCzN4WVPqtRGrxTh91/euya8IjGKqG6CLsyjIFAX
	7vtJrxiI/FCg6Jz73WW7IyS/Cs5gF0GfIJcbrPPmnRb3K55/070IeSxHhHzz4jrMXXzWI2J16xO
	pZ4xyFUbE5AuSjsXaew8VLODGf6NElxMi/hGv9PBsrttUgY9vJFJYIvWBdX8mHaEHOFzEMOrFPQ
	9sOVc6YIynjii4cfqW6BoCV+FjdROvvz8mK14L/pT1Vv4vpLRDo34ahr7HiQEelhYLMEkWJbcgs
	+jMW1/4oUNTVrnOpVM6EuYz8Mp3XLwsUkCaJYqPuJJPx9sLgn3wEIclpWO8J60Kcf/JPb9uPXp3
	qk1a4YATpMV+lhq04yL4s668jIsKJAFAMJ/EV+0LndmCjw+Rlrw19Rvq1a5P6DhsVoCiQquWTqB
	cFqzv1QIzeXREYqDhHZJn2xp9txfJy
X-Received: by 2002:a17:907:a0c7:b0:be2:cd33:2142 with SMTP id a640c23a62f3a-bfc85d877e9mr2459666b.15.1781135529624;
        Wed, 10 Jun 2026 16:52:09 -0700 (PDT)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03716sm1225741366b.34.2026.06.10.16.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 16:52:09 -0700 (PDT)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v3 0/3] Add ASoC machine driver for Cherryview tablets with
 RT5677
Date: Thu, 11 Jun 2026 02:51:54 +0300
Message-Id: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJr4KWoC/2WOQQ6CMBBFr0Jmbc20IAgr72FYlHbERqHaVgIh3
 N1aliazeTP5b/4KnpwhD022gqPJeGPHCPkhA3WXY0/M6MggUJQoeM2kt4ottpedtQ82CVah4kW
 ZV1wLhBh7ObqZOSmv7c6O3p9oDvsSOumJKTsMJjTZSHNgyV5iDb/A3fhg3ZIqTSIl0j1H/v89D
 jKplapIF1ifT5d+kOZ5jHpot237AvKYzv/hAAAA
X-Change-ID: 20260219-asoc-yogabook-v2-70c146371d20
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781135528; l=6679;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=GerYjjWYFTrsHb6FnX4NV4P82wObY0cWFl/5KAIY0n8=;
 b=/L4RCK6PSIWdi3MK55hRzxr7YIokbhsxwsIM2LzaIkZgwPl8Xg71LwBefD6tMMN+gBQNSXFZa
 spBW0IHwnCAA2Uv7V7PEIrjDeWo6Db0uaddBENLwIjdp1jXVKeY24ql
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

This is the third iteration of my submission for sound support for Lenovo
    Yoga Book YB1-X90/X91 tablets.

    These are Cherry Trail-based platforms that use the RT5677 codec and
    TS3A227E jack detection IC.

    The YB1-X90 is an Android-designated device and has incorrect ACPI entries
    for many onboard peripherals, including sound devices. The YB1-X91 has a
    DSDT node for the codec, and the same node is shared with the TS3A227E
    jack detection IC (see below).

    Matching with ACPI entries is somewhat tricky; see the corresponding
    commit. Jack detection IC info is defined in the x86-android-tablets driver
    for both platforms to simplify the code.

    The ASoC machine driver is called 'cht_rt5677' but has some
    device-specific things hardcoded because no other known
    Cherry Trail-based platforms use an RT5677 codec.

v3:
- Rename cht_yogabook driver to cht_rt5677;
- Allocate snd_soc_card structure dynamically;
- Reset the codec name in the global dailink array back to the default
  at driver remove() method to prevent use-after-free error;
- Apply small fixes like removing code duplication and renaming variables in
  the probe method;
- Remove support for SOF;
- Skip checking if ctx->mclk is valid since probe() will fail if not;
- Ensure error codes are included in error messages during initialization;
- Eliminate debug messages;
- Split cht_rt5677_platform_clock_control() function into enable/disable
  subroutines;
- Move GPIOs initialization from codec init to probe and use gpiod_*
  functions instead of devm_gpiod_* versions because GPIOs are linked to
  another device;
- Rename variable 'k' to 'kctl' for struct snd_kcontrol arguments;
- Remove ambiguous copyright statements;
- Switch from using *-objs to *-y in the Makefile;
- Correct alignment warnings reported by checkpatch;
- Update ACPI matching code: rename cht_quirk_nocodec() to cht_quirk_strict(),
  and use a default entry for the YB1-X91 tablet.
- Link to v2: https://lore.kernel.org/r/20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com

v2:
 cht_yogabook driver:
 - Remove likely obsolete code from the driver: GPIO magic manipulations
   when enabling the speaker amplifier and msleep() calls when turning
   the speaker/headphones on and off.
 - Remove MICBIAS1 manipulation on headphone jack insertion (click
   prevention): the TS3A227E should handle it by itself.
 - Rename struct cht_mc_private to cht_yb_private.

 ACPI matching code:
 - Split the changes into two commits: reworking existing entries and adding
   new ones.
 - Use dmi_system_id.driver_data to specify matched machine data instead
   of callbacks.

For reference, there is an ACPI node for sound configuration from YB1-X91
DSDT below:

HID: 10EC5677
_CRS resources:

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

Decompiled fragment of ACPI dump:

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
Yauhen Kharuzhy (3):
      ASoC: Intel: soc-acpi-cht: Unify device quirks
      ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book entries
      ASoC: Intel: Add cht_rt5677 driver

 sound/soc/intel/boards/Kconfig                    |  18 +
 sound/soc/intel/boards/Makefile                   |   2 +
 sound/soc/intel/boards/cht_rt5677.c               | 564 ++++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 121 ++---
 4 files changed, 648 insertions(+), 57 deletions(-)
---
base-commit: 94a662ada263eb2238b85e1eb4b21fd03b9b5fa2
change-id: 20260219-asoc-yogabook-v2-70c146371d20

Best regards,
-- 
Yauhen Kharuzhy

