Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D6F33B6FE
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249908; cv=none; b=ik9uXSwqLahPCpvFME5IaXNFRxaPJoFyOXjN/Ow/3UteZkqGtpxNrI/Elb+iywWL+TlmbWNE9c5SEavLV11SBctmXbl9Dy1EC4l0DzDIN9Kf2/Jpy1Ruzu78w+XWcbh6DgVUoZcGojGGQoY8/Do39AYHBMIzYH7LPkfKx/1Z6i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249908; c=relaxed/simple;
	bh=qpCaq6TACL6eqM1utYs6sRZYduBCrJkOLynbCIHDvqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+z7utmt0TwCaEYeUZBHv5V50BU7s7jVtHaXo3BcSrJVbv0gq9A82etF1L4f2DcYaCCJFyZlHlFIyhuPlRI2JdK08/BzH7bMWy6mlOU8lgf65P3uISu+c2IL9plthAc6A67ldew3x3g5pB+jPvOeXePhQdg911xEYT/PL8x6P6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Glz0UtUe; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Glz0UtUe"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2a4b6876fso1047178785a.3
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 12:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768249903; x=1768854703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUq04sqpfNThT7kS3bI999/FPk05t6O1xEOGrVfWKpU=;
        b=Glz0UtUev5l4BtQ6J2+oaIIajiLictPxfur4iyfPbHGpywcRTnvNvEgU7M/bHvUChw
         pEXrHv9QY4eljhrcfZoKGnkxk1qTLybRnCNbmP83io3HdrkZjePmmgSH+xMZrIUtIdaE
         PIE9rUgwavC2y4j+EZO1E8Ef6f53VGGZW8TRX8dWxSYF0R02YELJSn80GT+ZXqxU85NU
         tnLkOzIsnd1txbeP1AzfJvssN/wSJnlOn54keawbYZz541So70EU2a6/XNxX4Gsp27HG
         JXYZdpN2/YUL+udgkHgIyrW2SvRJZjDYUn50aEKZjMkAnCpzHYQPjw5hMmXqk2eNA6mx
         vbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768249903; x=1768854703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUq04sqpfNThT7kS3bI999/FPk05t6O1xEOGrVfWKpU=;
        b=gXvKsDgnMT5orFbraNyiWafYd5rNOyThGgQPZEnCx66aA5h/AmrMZ/tAgK3WAx9zEC
         gMB7TWYgDu/ydxgrbFxFIo4mkz71u1LP4TF3XFYgye5h1U1eI7PrUOO+kPaRhf44LRna
         ZpEDwQ454v52lHf5CwtTK6lsoKpcmksT8SEMYmzzyun8ahYqN8c9Q1fvUWv0bs27LsUc
         vCyj3A3TSpxntYsoPdNJGapHbRHdOKNCES23VNhsogUmOjuKVKJx9yH7PxlMvNpKxpEt
         mc/zhF52Q2jkAb4tcsWrwERKRinqDWGd/cTYcnTO9+tH16D3RNP/+lvgjcTwlf6Hhwoo
         YF7w==
X-Forwarded-Encrypted: i=1; AJvYcCXNOhuN0Gyex5wpgFZQW7nr8Xd4uwNrf/atzJ/lQGFnibFVSHUSNsnLWGNLUFb2RGpkpaRqMIQU4x2lUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkaYfKir3aNAXbiWWjRxTNJnsbPB4l4Gr6ijd9EnxhfdgQREiT
	XsHQ5binBMul2EJFHAvezDIpst6FOn7FRsKUUwQt+tXp5/q/CCiWLB/Z4zEPxA==
X-Gm-Gg: AY/fxX7W0CYyZ1yLhlRP+ti+tQyrvKbHqPXiV/ZrkaBv1fGCKM4PqPrXBnJ3tkHM6om
	8oRcrePm/Lw+3heUtS5O+EFlpulkQMET3o+IVo034szpaML74RGm1MSQVSjsglCmWXwTyRlxgKy
	uoeB17C4FMVhx6AJgwr+umjCMjRjZ7YmjwELhviPw/tvvFFuU5gLC8hI/oMFxdScV4U8Bk/es/T
	yjXSakSdCEtJknBV0Lm13DH8eWSI24Rf018xr+ZKyzEUO3gq+TA0EUZcPLwjftZNSJwlukYk5X8
	UalZaCNqQtkjvgCjtzZLWaN8qFIRhAk0jMPdQt9aFy2ldYC8h4toawc5qQSEo9lQ+P1ceGLuZfP
	xZw0eJ3LgqGe/hXKMHhzsC8scPWDxKcCJxgUP6vWDb74HpqPROOrb6x1Q3HXsMPaYDtZIjvx9Q1
	82d3LNOzEfpy8pvV9s+BezuAUr1HJHm+j/ZVNvr8Z8D6rksXKcQ2lLj3W7bU9+KnVsjm45z4nn2
	ZpcqKTexIhDSFfCxWd9NQ==
X-Google-Smtp-Source: AGHT+IEj1k7cb2fd0Uhwg3rDL/Jbgy35/7F5lChJPW1hzU6BQQa/0pFpWI+28ikvSEYQSgMkRmokRA==
X-Received: by 2002:a05:6a20:7287:b0:35d:d477:a7f1 with SMTP id adf61e73a8af0-3898f99146bmr17183198637.43.1768243906956;
        Mon, 12 Jan 2026 10:51:46 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:51:46 -0800 (PST)
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
Subject: [PATCH v3 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:38 +0000
Message-ID: <20260112185044.1865605-1-visitorckw@gmail.com>
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
Changes in v3:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

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

