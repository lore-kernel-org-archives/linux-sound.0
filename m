Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A03C2C1598
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771370015; cv=none; b=a8QLIuS8AOz3RLFxi6p7zow5oC69eSm5uEb/kgLIOpjsfBw3bXYMzaX5m1nEIlk86QBVby7TM5rFMTjpBV93u/v0Uxj53HpiDhwxooE5B9QB88mtlGYOsNtFTeDlQHyLD6ryC9rDhBc1GoSZZpto+E/x61qp/+tyNPb5Do/Ncy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771370015; c=relaxed/simple;
	bh=8CXx5KGYHmTT1pcaXlh1JWyPSkCdfVKWKnhkw/+2UD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjgnkNAEY+ZBVNGFg5TAAzm6zqm5jhSxX6FSUN9hdaQJgAqCnGk6CJ3j5MX5NoRAs7lsQ8MbwDkkWA+poPIB+LDH0ITB8FfmgyIWPzbCB9sJBH1oTBEv7bDp2jyTVQCJ1B12v2UmVDj7od+//lktkQsk7EKzcpVoZkcTLA1CyDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhiT89QU; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhiT89QU"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65a36583ef9so622077a12.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 15:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771370011; x=1771974811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TuCtFSo1/BpbElvw/aCMIq5QPc8B+MlFWaQWA/8BJQM=;
        b=LhiT89QUcJVX7auNCjmargZvDpmQ50z+kT0GMcSkZnRmDVBlW+ZSwT1k1a/4n8Kaqs
         oQ77YxqHjCtFG2I7u0bcNey4nwhGsZWKB52xqI9Hav/cXpOl1D7Iag20BRKnAU0blQMg
         0DeIDU3TZFJmuZfhvYM6pifx6/lV8XC1IdOiqE2UQw8IBtAtYp3oS2b28M7FP6SV9hg8
         gbmix/T3BsF0lA64l99KJcqEFlad+bRXpiOkjOw2IJQzvgjnnVhyjquBrX7xhCoGo4j1
         6jgjYy2hFbxafdhgcBVeBowaklRJzSyyxZdH+xjNebN2IuSL26DlMd6uerBY33dF0L21
         js0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771370011; x=1771974811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuCtFSo1/BpbElvw/aCMIq5QPc8B+MlFWaQWA/8BJQM=;
        b=GJopUldv3h+OBKlO7PLZ+6dyxynAXq+f8+ckEA/8KZTfZrpe1uI/0QQmLS0ifeUkrC
         VB9DCsa1OWd42F2YxtvAoN9U2uk9Lie2Bjski0xwHDgRtEgTSUoW1dyodSi+ukfuo2iO
         RDFDc81t/PGAsNiV8Milu9tVzjLqwe2NNo8rjw3kXqllvLuZ8oT+b9M80VwE3evA5vlM
         GfJsevvxhKs4K3bAaBjCx/1f9CzL3hcQVANnlcfpO7AbWzNfIdigCh11te3UVLN4P1s6
         K/39rVLX0HyLA6AlYZxaweMdArZwUZBlfr4qu19x1tWG1UfimQJNPVwfXMAp/bgn6sDQ
         yLXA==
X-Gm-Message-State: AOJu0YxZFuXB3RzSD6HJIF7UF77kV8jW3Rac13Dqs7ICj6bRnGBK2J67
	wwzO7BsBqsivQwwrYOydjiZPhTyCZbvba3Vro7IizP6nMn5Y7qD7+/yvZiIalw==
X-Gm-Gg: AZuq6aKGwVxogQVQvj8538ZW9QTXpIna+oKbux67QvRxqX52Dxh2gMrjIC1mkUaw0iU
	aYcQWgOgcOGj6Ig794MUerKb5dfbW2+hKUp5wRo/pspszYAs5ogGJtLn0jM0o5iOfe4SRiaGnd/
	lRp5q/QHZgeabqEiOr1N4B/gZ/FHN4Eou1jXcTd5KzwXuiIqeLOF2O4uoOsRMHgDGqhP3LVMEBK
	DF3+FKHIaiv7Qup6X+CdD6dpk9dIODmSWe4U2GYMZ2O4Ts4rI3kPYObq5mxAOszm2qt1+tJqdTC
	lxBqZlP8hP1jTcdduIBIOTYE+3/gDnp+DltHKUFAgr87iqhOXlOKcgLOKjZjUc/oWExuBVHR66M
	+DCB74pEz19Kwn9275GxFX0rF0w7Qj9v1uYrSsCFEL8Q8ggwq93wdSflGjnSmFfUmSBs6wJ7gwv
	DgBlwvmGImhpI+2A==
X-Received: by 2002:a05:6402:34cf:b0:65b:94e0:a593 with SMTP id 4fb4d7f45d1cf-65c771b4037mr23303a12.1.1771370010832;
        Tue, 17 Feb 2026 15:13:30 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f137dsm2661375a12.27.2026.02.17.15.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 15:13:30 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v1 0/2] Add ASoC machine driver for Lenovo YB1 tablets
Date: Wed, 18 Feb 2026 01:13:22 +0200
Message-ID: <20260217231324.1319392-1-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the first iteration of my submission for sound support for Lenovo
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

The driver requires support for the RT5677 definition as an ACPI node or
i2c_board_info, submitted earlier in [1].

1. https://lore.kernel.org/linux-sound/20260211002255.4090440-1-jekhor@gmail.com/

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


Yauhen Kharuzhy (2):
  ASoC: Intel: cht_yogabook: Add driver for Lenovo Yoga Book tablets
  ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book entries

 sound/soc/intel/boards/Kconfig                |  15 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_yogabook.c         | 602 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   | 144 +++--
 4 files changed, 713 insertions(+), 50 deletions(-)
 create mode 100644 sound/soc/intel/boards/cht_yogabook.c


base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
message-id: 20260211002255.4090440-1-jekhor@gmail.com

-- 
2.51.0

