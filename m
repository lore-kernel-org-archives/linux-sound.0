Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2D31A044
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301946; cv=none; b=o67cgE7MjrpUnjuCr6fXFra7sQniuXeO8jmqomR+txKNg0NBWILEACAgmcFgQ9e10FE/2E5c0Y00oIrfaHNuoubOqjqNJmKVklfgoQph0NaThcYKB41po0VbUV0pdQ4xTK1LQM+TA0HgTSRLCWIehOHZEtmRnjSTfU9fwdZWIDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301946; c=relaxed/simple;
	bh=BxQThXKC8yeHVSgVuMqaQwxA6jCxwJIGPEfZiSybX3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cyK4WO+2EDMeyLD5Ykw/P9aSBBmpwEQZIWnAq1p+sET4G/1FKmqRQV5HarssBOtEFEubt0ceUum5VPWByPttzgG6UqMj3HrocmpApmcub+Od07eY7bLvcDz3HU0E2Yt48/n50z20V5Len+IdZMZCwZ5Blf5DK4MYXACX36itZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWnKISaL; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWnKISaL"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ae57f34e22so7443484eec.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 02:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768301944; x=1768906744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Sop77tdlghLGqlW2lD54uYlYaNgTrSImbZcSm1W050=;
        b=AWnKISaL2TQ5/Gy+DG9D8qQvYcAbxtnodjWrJMp1CknPdlQwFxyQ1DeNuAi/wmVe9G
         Ev+f7E+oowdv5HqFnd7Er2OMGSron1qvcxUB86MChq//gst9BAcSPAiLkzlKZ5y6bn5G
         FJGjyXwQIA9vKedIccyCZ6VAOc1BLbRXUd67y0VPIv/fsMiQylrKsv7gk6julDfcReRe
         RcpCkfhcxqkoVXu9W6o7m5P/N/qk5eumGn0E2PsJyco1Ew3nFNQuGg9G8d74spKEtR1p
         vI4D+7Fc6avKzhBSSkqCuNIoQG8/3kIMKty925lfcJ6Oo7kU1gdfRc3aH4a3z/ybJAhS
         a1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301944; x=1768906744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Sop77tdlghLGqlW2lD54uYlYaNgTrSImbZcSm1W050=;
        b=a9rzivj+DovFMj1+CqNfCba1EdxNGHYcYAmbXpGuZD+eI6HfdaNq3SzkYPt2brZun4
         l/8J8gvE1CggZsz7Ac7btbexinU9oobonv4ApKWwGMJR6DlJiMeofX4T4gCedbLz8xQb
         rVB60pr0n2/mQ4+4k00XLfvN0Qjk14AOWkGgirP/dCAExPScsiUBpnw0XxcfSUJHijm0
         T7dRqBj6hpxWtQjIrEMoUS8q/+LbCzje0EGd4b8HeWnmySq2shfen3BfFjwR7op9kqaY
         eKYkM755unR1BXMe/GlYNzdFQPE+uw2SkJa11gZJmqp7bCbgZLmIX8QLi2EekkoFewHq
         LB3w==
X-Forwarded-Encrypted: i=1; AJvYcCUzyw++I8cLZ1BQfAakTLmsPRrh89TDEiWH1DoItudoQEdchKCUs/6yOrHpwArEYhNBe1SQj13eW3bmKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmUJybJDXfTcZhJc7qOTwdrBuvpJ1YkFw0LrPvw43vMK5Dljx
	xUmrH4GtJ8C12r1eMPOthCoSzDBQ2KMAIXpgV33A+2DCs2zneIzwjMWaQe+bLQ==
X-Gm-Gg: AY/fxX5PnXKr+vzkmmlsHI8VlM4qiemPrxDuUfiiVssWJNNbEphWCzbDX0hmypPEXXh
	p326V5SDAmaTMSCZUJjTxHtQgmrDL8YhAIRqi5lmn+NJqBPL4+a8waUy3WTHPNPbbSEeSy44gq5
	ayZXV2Perm78U3HldjAjhhVm5UUNJeo+9FyNwaCPwRU67MZFcdBw5V5vHBr2NFChkXCE0EqoKn0
	A+JHMagrJeABNnweJl49x/tZAPRpW22VqXobZ2WsKETRPF75BjlBPutGn7hhoNEW1HLWoRBcVFd
	UGfO5zPsXvUkrb/9SgdDW2X25g9Z7BkWu0v9VA0cIFZCIs39VxaZAyWt+RzOI6k/q9rRYB/B8BU
	1J4RYkC6Dws4JDfdol4dtkTyaiBdk8Hc+SwnuOOF2ihIvdGN8ZVsV0wV7V8nVIRM280d51E7XaH
	ZPwIPzMxhvYLq4h7wlesH7QK6fCs3n96lyZ75eaA7L3BjZhqCx7OLKhUG+0N6VFEBiReHAY/a3l
	L2XuxGh6kP5GWNVWianoA==
X-Google-Smtp-Source: AGHT+IFDZv7qvFhhROPl5N9K7peOOsuOQ4CyM9RhLyedWdWjF2fUf/8J4j0bRoJff45OX+N60FkOeg==
X-Received: by 2002:a05:6a20:9193:b0:35d:3523:c90d with SMTP id adf61e73a8af0-3898f757a29mr19808618637.0.1768296379649;
        Tue, 13 Jan 2026 01:26:19 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:19 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v4 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:56 +0000
Message-ID: <20260113092602.3197681-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish emulator platform bindings from text
format to DT schema.

Most of these bindings are currently located in
Documentation/devicetree/bindings/goldfish/. Move them to the
appropriate subsystem directories (serial, input, power, sound, misc)
to align with the kernel directory structure.

Update the examples to use generic node names (e.g., 'serial' instead
of 'goldfish_tty') and fix minor inconsistencies in the original
documentation to comply with current DT specifications.
---
Changes in v4:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v3:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

v3: https://lore.kernel.org/lkml/20260112185044.1865605-1-visitorckw@gmail.com/
v2: https://lore.kernel.org/lkml/20260108080836.3777829-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20251230181031.3191565-1-visitorckw@gmail.com/

Kuan-Wei Chiu (6):
  dt-bindings: serial: google,goldfish-tty: Convert to DT schema
  dt-bindings: misc: google,android-pipe: Convert to DT schema
  dt-bindings: input: google,goldfish-events-keypad: Convert to DT
    schema
  dt-bindings: power: supply: google,goldfish-battery: Convert to DT
    schema
  dt-bindings: sound: google,goldfish-audio: Convert to DT schema
  dt-bindings: display: google,goldfish-fb: Convert to DT schema

 .../bindings/display/google,goldfish-fb.txt   | 17 --------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++
 .../devicetree/bindings/goldfish/audio.txt    | 17 --------
 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../devicetree/bindings/goldfish/events.txt   | 17 --------
 .../devicetree/bindings/goldfish/pipe.txt     | 17 --------
 .../devicetree/bindings/goldfish/tty.txt      | 17 --------
 .../input/google,goldfish-events-keypad.yaml  | 41 +++++++++++++++++++
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 .../bindings/serial/google,goldfish-tty.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++
 12 files changed, 237 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/events.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/tty.txt
 create mode 100644 Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

-- 
2.52.0.457.g6b5491de43-goog

