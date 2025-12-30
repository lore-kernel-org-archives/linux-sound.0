Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03541321F3E
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118250; cv=none; b=PstRN+AEo03es23AJXNg4efrv5QdXJD5Rpy1q7z5hYLVUXgHHIWNH0i8drAB7A+hZ0DeXT18Td/+uRr3/0VDkayyui2TZBMF10AHdd7q7bVJGsUNzBzGShlGpHZaOzP070Z/+oBimuYyHxO10QIJ8Wg2jlh2VoagS2whblIJVkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118250; c=relaxed/simple;
	bh=FgJuNpgaVD0m6yaXMmc2AfRGD+fA194iC5P4RORcRWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vw57ZO+LP9rz+5RL4WK7ihK80cCo/STbR2ej5xCXCN83Pn9ouhtbe4yC4Knn1Y0T1Oh7DOuQlMAw5E1+qaFfgmSFOaRZP2Qv9Ui/nB3XSA+xS6PFNIh6UiWSYJAgtXavSKLl6o1dsdTO3OGjXaNL6HEsXedWcjzTLDB0Y4e6zfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRzCiLdG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRzCiLdG"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7f121c00dedso13642254b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 10:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767118248; x=1767723048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4o2F4BeHSek0PRiyhvtGksMp+wv7OaL4BHi8U8EOKo=;
        b=jRzCiLdGMBSfGpEhCtHyr/JU/LptiDCZJEfmCo3lyH4ZesMzZhDixX+HxuZEFyPObA
         ZDvpl/Gxs1yfacsLRce18+COii2z9dVuDBajN4FRNV78pFxUkv235fbCPaJq4XQg9O6n
         j1CPpchgDgEKuoLO6HeY1VlDvlyTMlGtBrkuuMf02sobB+f7Fex4MrA/cgfJxIAvRD0Q
         cPlPgIPQviFjZavRoU2bCBZ8o6bk67sLSC4lDj2emB4fzAV4YxoZQj8R3buNGfYso0s7
         8OYHmLp5igt5IcVWyeK1rJLulTvO9gGkS60xrtl5lNH0d556kwNYk4hz0L93gmf+YsQe
         R9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118248; x=1767723048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4o2F4BeHSek0PRiyhvtGksMp+wv7OaL4BHi8U8EOKo=;
        b=u0c3lE68L+pKVaDPxeVG/vskM4lBXoGxJvPdhh/0c3bVqGSyBAjoUm8ALi2b3U5OtV
         K02e3CwSCq0Wk1UvPfwro/FznFEENE/UWSFkvIppaIDU+LFE+I/nioMjYuw+Q4a8N4MF
         /GHHIEQvM84p2MGDfVv8SK2jDmaVY929vHmBVtOt3DgbFgG72pE73ZR/ADlurWjh0BWh
         xQBQU/0uwVVJELA3AMjhqzXRuH0EeJKMq8jcTu8kua1LnyOpzBotkk8sIf9oNeTi38v9
         yPMM3ZkdI8eJBkS4cH3LAGT6HHNjZMq22BMhXzl49E2v/3uP1aUzjSZ7eQBuN8YEuWjB
         iTFg==
X-Forwarded-Encrypted: i=1; AJvYcCVFQmFH5X2lYWxMGDdvKB6ushsyNjq2NRggSGmHDGVtPWi2P/65Xt/uBHKgL2jTtzhFdF1j7HJ5e4lhEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmszE+BQGnK080o30dDUNu8zJmE+3tg3QHb58v5Yy4Uq9gZxCg
	0Q9KUQdskHmZCG2p3HwSFkUbxf+iW7Wwo66ScXO1X9d4xCpge7tSZ3Td
X-Gm-Gg: AY/fxX5/c//WoCYO9GMal7V4Pdm64mwQNyr81OqTxAbzOe/Zv/hKm2cDk5OmhZLojwz
	g8Dab+1aWZhuO+ywZBR+1E9TwG0izOg3cbDoEPRGXmxjro48RYyMHy9l876Y09RlvEq/edPaw3F
	dT5jXa752VZSp6OlhmiwtnZc04y0BzUrzAv7Tr9RXdh5jktxfnX4t/5e/idEqBnzm8YeCjYn+nQ
	5QQVhTiBY5JdFojER8D3CZ8/W3oEo0iSDytG5rMcF/FvA8IcAVynrSE8U6NqMjC8EsdqHdI5L+j
	EGTMUiiG/o7z1BWfwQ2tV1pZWOTyTdrr5fqw0x30HJ50t55bIDdEHGTEobAxATPknZtiEKoZq1w
	373Ck4YgUrcL7yPU86GcN9TJKKA43TQUJ2SGxGD2pCh+3tGjqPZo5iP7vfiKW3Q+8IaN2rVKxQV
	eMAcHUG9VJYuTOGCeRk6aM1OlFsF41NMGIkhxAFGG0lRBarxwOfXmyn1S1KZPOW0eShAFvoFAfu
	ZcYj09lkaGprwp5TK0CUhgB1YYepFLy
X-Google-Smtp-Source: AGHT+IF7WV9lO2SRprnaSS6rXcXG+rahUOdxgA9XI3QZjssiw/UqNuh+1y3CwU7o6es14BggMVW//A==
X-Received: by 2002:a05:6a00:420e:b0:7e8:450c:61ae with SMTP id d2e1a72fcca58-7ff67063910mr30261999b3a.69.1767118248003;
        Tue, 30 Dec 2025 10:10:48 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:10:47 -0800 (PST)
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
Subject: [PATCH 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:25 +0000
Message-ID: <20251230181031.3191565-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
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

Kuan-Wei Chiu (6):
  dt-bindings: serial: google,goldfish-tty: Convert to DT schema
  dt-bindings: misc: google,android-pipe: Convert to DT schema
  dt-bindings: input: google,goldfish-events-keypad: Convert to DT
    schema
  dt-bindings: power: supply: google,goldfish-battery: Convert to DT
    schema
  dt-bindings: sound: google,goldfish-audio: Convert to DT schema
  dt-bindings: display: google,goldfish-fb: Convert to DT schema

 .../bindings/display/google,goldfish-fb.txt   | 17 ---------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++++
 .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
 .../devicetree/bindings/goldfish/battery.txt  | 17 ---------
 .../devicetree/bindings/goldfish/events.txt   | 17 ---------
 .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
 .../devicetree/bindings/goldfish/tty.txt      | 17 ---------
 .../input/google,goldfish-events-keypad.yaml  | 38 +++++++++++++++++++
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
 .../power/supply/google,goldfish-battery.yaml | 38 +++++++++++++++++++
 .../bindings/serial/google,goldfish-tty.yaml  | 38 +++++++++++++++++++
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
 12 files changed, 228 insertions(+), 102 deletions(-)
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
2.52.0.358.g0dd7633a29-goog

