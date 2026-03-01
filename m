Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6DD175A7C
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 21:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400845; cv=none; b=puQhTvW83R7JbCInKWhhyMexu1uT/9nNUABOGdSZUbkL5826pe2gn+lpXxq24kNu7wCzoeA4yIDjmeMYHwbjgWtA48Woq3u+FE5QRzAmFSHs00SG3MLN0PJNuGkweVJAR7zP9FDtmWUqGY1gvfJMyIdeHX7vM7phONqJrdqiXxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400845; c=relaxed/simple;
	bh=3adXHxlAy4uOGz/aeO9bujs34BHHiPNGn2o2mdZ4cwA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rlM6wMJjpbJ+0dBJs6FFFrhqfYHCL2Vu3Li1pm4e3OC1qTF0zA8oZ0vwKjfjfNkXYEgIUcjjaDLecWjYir9hvYjCsQgHQ61LMbQt4WKLD5dvEoTNcYGRlnx680evUWbEskJKsQpdQrGu3js3YGapLWfB+yzht6yKIFrogjCO4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ev9ZMYe+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ev9ZMYe+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65fac0b51baso1020827a12.0
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 13:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400842; x=1773005642; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp59Ky7nLxvaPINObjCLeekzRD2DJZv3aDAKk1y7M5M=;
        b=Ev9ZMYe+CsiMgXtXcxNRbyIq+LqURZVaJ1fZRNGOnXmnpRmraJ3qnTkFrVvKJHKaDK
         n8RHkWSJfpp988D0NWEVdSYYctHsHKEF4DInlF3Q+z5gAMywoA1aZMItR7NnuEHnuM1P
         nfTddNsSNzIQe/a743Ty9e3q8//OXlbSMAzYxDYUsH5u5RJpgV++bUILKvfeC6UVIZjN
         qJQ2TGR3o5vesGknFnV+Cs2sFCns9TSmHBs01jys4FPgbMlg8ayRL3iub4H+D2ic/pjF
         C0X1TSxtKZQm0Q3ikQr45mH+dMqqx9SnFTBYILtCoJZfTqQGPuWaSiI9Q7N9ONCRjFbM
         ihow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400842; x=1773005642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp59Ky7nLxvaPINObjCLeekzRD2DJZv3aDAKk1y7M5M=;
        b=Gc+lxKD/JjQB5UJ43yrdmyKozQ0dzaWUXee3Aq1cNJ3ustNuegzuHnoTS5g2tQPZu3
         ErkX0LLmDjVP9wGLnN6c44Pb1c6d/U6s4SXt+l23l8io6HxtQsItq8KbZ9qCDu56OXe2
         8n+MNPBHOA4ziYNt24g/xqx9FT3VQt9LyJUpdV4ubxxLWUNTrYTdqvl1cIAGfkbgO4BK
         En9aXibbMlZeIRulkHZfzSUbb2zIhfhLOyqoVaTz/Ki7X6owsumZDIBF0PFFMFi2chA6
         bJyKCGlXv9Q6xIVimzQjedHwsj0dAzTP094UUAzITjxlAh/Z1ieIKkf/rVJkMqpdR8XH
         1l3A==
X-Gm-Message-State: AOJu0Yz0Hwo4VU4RKOiZyU8WFiEheJfvTZsvnDljYkhP5GRgqxsBr4zU
	m4PTWVL+Bgec9QJPgOcyu5DrLHtH2WMxDcmGndhF5mVapW7TQxgeJjEJ
X-Gm-Gg: ATEYQzwgPiDy+aS/GQj5y/mT7EWVSOYS1agueXEPgu/EWu/MJ8TY431z+piAKh85+W9
	ERDHmyR4ZmVeLTjLWEBYaX8HvRBRrZFQ5/9CQeovm2raYRErpKUKVWKdG6Kdwkx5gEVBlDsBUsa
	ervPf2irKIxw+hEvj67fx6Pn7UhK9kIUjNkXwLXG7insxd651Nq2vEEQIoO1gy0Wvc04Gi7ttOM
	GvTz8widPo4HjOXxpWc70nTwMuUtHgtufJryeRWzo6/jssur+lH4Ed2cKwbQRCuimRDglwAB+dc
	Ekv3Wey+G8D+voZ3RgNb3y6UU8OZoo4szUwZESRfaTNwqVLHlbaGrHEGQjOcRYiLsAHbxYo7dN0
	ZYJY7AxYdeyxwOna9X3MVO7V6+w5k5WrhtjNjdpgsNaKgjGsjPeW2SsXaB5JpdXQHcihyrKBIRA
	cMIiyGhXl+CEqyrMtCwg==
X-Received: by 2002:a05:6402:2744:b0:658:b9d8:1fbb with SMTP id 4fb4d7f45d1cf-65fe2d4829cmr6691590a12.10.1772400842085;
        Sun, 01 Mar 2026 13:34:02 -0800 (PST)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm2934793a12.22.2026.03.01.13.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:34:01 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2 0/3] Add ASoC machine driver for Lenovo YB1 tablets
Date: Sun, 01 Mar 2026 23:33:43 +0200
Message-Id: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALewpGkC/yXMQQrCMBCF4auEWTuQjNJgryJdpOlYgzSjSSyV0
 rsbzPJ/8L4dMqfAGXq1Q+I15CCxBp0U+IeLM2OYagNp6jSZK7osHr8yu1HkiSuh1d5curM1E2m
 ot1fie9j+5G1onfj9qXJpI4wuM3pZllB6FXkr2HSyMBzHD/b3DKSTAAAA
X-Change-ID: 20260219-asoc-yogabook-v2-70c146371d20
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772400841; l=5712;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=3adXHxlAy4uOGz/aeO9bujs34BHHiPNGn2o2mdZ4cwA=;
 b=iGoyfr8ESEqwXp+iCP2nQn27NVeIyL8iQHQf6l6oVuqUTcu9NBhaktOAlgBwrqNQ3vOKnXu/o
 K37JmsrYykAB0JzdW7kVXZwj/Urvc4jJcjAYRiiS07KK32dWAu2R5Tc
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

This is the second iteration of my submission for sound support for Lenovo
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

    The machine driver is called 'cht_yogabook' because it has some
    hardcoded device-specific elements and it seems this is the only known
    Cherry Trail platform using the RT5677 codec. This naming is open
    to discussion: a more generic name like 'cht_rt5677' or 'cht_bsw_rt5677'
    may be better (requiring reworking of the driver to make it
    more generic with device-specific quirks).

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
      ASoC: Intel: cht_yogabook: Add driver for Lenovo Yoga Book tablets

 sound/soc/intel/boards/Kconfig                    |  15 +
 sound/soc/intel/boards/Makefile                   |   2 +
 sound/soc/intel/boards/cht_yogabook.c             | 551 ++++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 138 +++---
 4 files changed, 649 insertions(+), 57 deletions(-)
---
base-commit: 7f30250e792515b42130564cb52a9d218bad4cb3
change-id: 20260219-asoc-yogabook-v2-70c146371d20

Best regards,
-- 
Yauhen Kharuzhy

