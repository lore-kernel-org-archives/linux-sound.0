Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E33D3486
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866351; cv=none; b=HaxdSlVv5naQiC6aPgb21bJu1W8bqBr3JchX3dZ4UXHlwO5Q8bipFiYMTOJFyVhgaWxSke2DodDP24AElrOIYd80yhSAg+KiHT7QZWOhS3L3J/kCGfAi7Ji3NIRr0SdxBefyrL7wBG67gc/lWmSIS+vSNcQOqaR+mwdm5cH26vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866351; c=relaxed/simple;
	bh=F+HI9weCrGvZqZdvGzT41fozcChUp0aiMuJIzq7Twlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwXcdrfjCLM4xA4Cof831JNwRfk3wEpPSdKopfmYDw11hAtcYjjN50ANH5Ifn4qkIVW5f+IiWeFZifE9pjiOYTTAwm6eXIB5dBsgTLtFBglwgntC5YKr5FDIa+ycuOdDHS3TZ4RXR0hVKaODr2B+4V0S6Hehiu3pBdyb4iOxMY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP89KCLu; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP89KCLu"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-93f4f04d9f6so1040956241.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 01:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866343; x=1768471143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNWaW5uyJY39Ee5wA6GOpA1sGvgkAjuELUOx96wJt9s=;
        b=nP89KCLuU1Vv13Wwvh+McCHDOX8iYB5ekpFoOSOYoHZanSpP0rkkLUWrUNghmfzhrc
         P04ZUhva0V39Xq6eBh9+06T0424SNYfYhNqYyVGYmaG9kgskUrgdY+39mCLfTYf2V1l/
         Fvd6ebDSHcGmAGGBIek8WMwO/hfxiMsGVd9ZB9v50Yv/bNJOAuMWzd+GhmYLIFrJig6l
         lbqyqCKKLUFcQ7MJIXgxMJF3eAssR1qKsz1G2JDnJz0k8FrJMiHeJ4Z7ICbX1d1oDjWe
         r2WYmExQUYM7BrupOIXT0XE4EoP6IIaUX4j8K1oKaDD2QRACdk9F9oh8X/4StciOHxd1
         HuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866343; x=1768471143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNWaW5uyJY39Ee5wA6GOpA1sGvgkAjuELUOx96wJt9s=;
        b=LA8bXBEpI8MAX28IoIZWSSmxPcfeeNLwKSZnMp1Dzu1sNVIo3qhE5FoloSihtW0ZPN
         S6y4xI2nkL4DmLuhGYgv2efe2nTGJl9uc7ZDyotUK4f9KinlTwHA0EjpRyQnjZBiiY6Z
         HozH1MVWuhVaCZ+/I5ZxF+y7BUGIuQUSxmYVe+yXU+XSTP7zz6zABaIcILBZUe26vTCN
         SGgbw6SyfCSYqPmFrWl3I3IMUEWWGUP65eitWCp2wG8yJ9nxRR+GjRBcPnZrwqzoIaqa
         Fwbk+JClU0L9oAzxZyn+eVkwQYD4hvdvVqKML4KdhHjb4o1bCxbGcP53q5Hfs+yCpLy8
         TWVA==
X-Forwarded-Encrypted: i=1; AJvYcCVTrexhbjOIALh09j15FO0lFld+HmtQLGjhJWIU59dmEN+A/he3qSJEa/7PFZAKBzHM7phv3bcZ/shxiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIdGHmkZpuCiYdxZNEV0+34F/Eby9lFfXtDxtpMO/KNyxSb7LT
	SHtu0yS7VvWi+NBJE5vYM/frFP1L7SZjo9P63fkKcTxa8oER8mY/6FS2
X-Gm-Gg: AY/fxX7U1j1LvGkYd+wA25PWvUCKeZuRXksMoiLASpJ/O09peq1+YRzc+Jd6bNwR6yh
	RVcPsZYQkygm0FmB8LtMgWmgxHvPWpVst9cKFlFPPDfXeXYBN9K2IMPWQsAWrIrTrnOLp+oqslZ
	qoM2kNhOXrN8nE/cGyykoghTUnUFBA48HuSO7FN/G3I8u3Q+d7a9EV4BZT3E/TElIguaO+9yqBK
	3uoUCHDQ8J0vBWrb0Q+Jd8vnmNyfmoqQp2wLE73M34mMviR3z2/nkkcJmlSkxdxMNAzKbYwDoZz
	4qcX4f9FEZzIbwBzlf1+LuZmoo4CHYb3dLDk88youAWGSGdu1HIw1CjxS5n4UJ8MeOskNsEOGmE
	el1kuo/xUNxDYdyWLo/Q+dtQ0I9c1xf6dQ6D4Ewy0KadLb+1WvYYcZP4IptADn13ZrGt8aql1Gp
	c5XQq34/t+nhKMCg09icpdVUpdl6zDtnMG4u1fc16BFJxvJGFN1SuV/5fBvu/7P8DinB1dbLM8i
	w1B7D/ANuI0hSZKFQwlPPD6QqkCAQD/
X-Google-Smtp-Source: AGHT+IHWNlnOIQoHRnNghuP/KuzB06upezljxGJd8aibyns6gUrJ5zRj9QVDAk4WOeIpJQ1oogEYew==
X-Received: by 2002:a17:90b:314a:b0:343:3898:e7c9 with SMTP id 98e67ed59e1d1-34f5f831c74mr8109800a91.2.1767859745886;
        Thu, 08 Jan 2026 00:09:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:05 -0800 (PST)
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
	krzysztof.kozlowski@oss.qualcomm.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:30 +0000
Message-ID: <20260108080836.3777829-1-visitorckw@gmail.com>
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
Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

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

