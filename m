Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3882DECA8
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 03:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778125263; cv=none; b=Bu7A0HSPveopWRcpOv8zZ96in+/XlaGonZ/pBlGwPgmKU3h1o0GAwb1bDH++pu7iXcOI/bT7tsYk5hsOwjWJ9yvwROknpSeGiHUON3V+4VixkOKgeGmV4oSqnJ2o57UYkenUTrdR9s+UuQXlkvt+ia8QlMto+aPrTN0u1pwkUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778125263; c=relaxed/simple;
	bh=eYcgf+oz5hbuznP2Lx2/af6e4LKOlFWw/HZ70VnGKjk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gcOwUZiI7PeLV6MbRTMFqbih5E70VxeER8ygloLck9/3TaUFurFPXtFesR8Yi5psSKPBJUEsEKxDer6TioNtQBMMtBm8ad8/YOAos9HACJFnTegoS7IKBDzz513mh/TPNJ+kEt5G1hWDgFAdnLnQMv1EtBS8oKFXNAkd+6tOqBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCxJdmIN; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCxJdmIN"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso160742eec.0
        for <linux-sound@vger.kernel.org>; Wed, 06 May 2026 20:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778125261; x=1778730061; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgW6TooXSeb0tZLK2I82glQ6UXGdUU/uKulCwpNUrQs=;
        b=XCxJdmINsfziPF92BupJ5JrSWZqgqIVsrLdPnj/QrNn2oRq8htuJfefyC2t+U6hgTj
         joSUlQSVWG1PhKrIE13uW6/wDVCbxjEcK0zT53jFisQauGDIWmKUo4bUeX7NjE59wB4m
         RGlMbkoKD82XUV0N2kwjn68PxqH4Ux2mPXlpP5L6Fz48FeGcXGu/Mbxr9WFLgGMw8rJ5
         lTzN8zHH0VfH3Hq/Puy3CeqckJOlXEXvQFBfx45L674gPSDhLZbi37RK0qkxDwyl7OIA
         BYbep92MaI6FQxEzWj5gwJSSV6Ak8/cezTFIXOaMv6caKoqu1uDFPdV9e0KRJxjYvj8f
         Vnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778125261; x=1778730061;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgW6TooXSeb0tZLK2I82glQ6UXGdUU/uKulCwpNUrQs=;
        b=XexME241agmsehwAlHSuhrBTNS7mE9dCPCtclEHbPoLvIU0wF48sAgMc1jLtoo2w8M
         tChGb4Ist3X78z1wMAWHYiesRTz24PNiEKpOp5/+FucSDi7qQF06zGdxEls+I7etMDS5
         g5Zy98sbYY2siaRq9mhlUX9KRTUznXCUu2HPBfe5t/elzzJS8UyChaJSc3+I7k7x7oTJ
         A0o9+hJohEE13YpkSWdQCHCHFOIaCSZrKvgC+Iu52vOQM8uDJAZ0dNMY1m2apFDKq+/y
         HWAPTh9jIHSqGbjh7jxl1vXqKVOyvbWGK9g1qZZFSnMGNztlnEssNcPGUGfS0TpmnPZ3
         lZVQ==
X-Gm-Message-State: AOJu0Ywv/yIoLgHGfqQAhKSZlYRV+KKeGfidS9upttVXpXRNOmSHlR3i
	trZ+aOYeKvcLj8iAtqyue1GP+R1yEMUudiWzzPhc8Dp10vs+IlDdJ7EUgSo2lCng
X-Gm-Gg: AeBDieuLlAWf4ZTufmWzkKd2TPQ0f1FkkoHTi223F8cqXSBdIZebYosW9TwtmlubuYu
	ZKcs0Ofp50jouBNOloYyBwnzGtPejNzniCUqUJCwO6TIk5b+6RvnN9foL/nFriznhCoalZsGNBQ
	4wlaJcBPV8Vzq4Refeeacsr2jhmShuOxbyzv0p3RZX2Yzd6pw2w+5YWkGOslGzCPVbir5rizhDd
	ynQS9+DAKBJHXNeAK3dy1fMVpgkDPdiMgioX8GdkF5UL1xk/W50eM2dCseRvmfeoL/hnZ64dHuS
	GeXJkO7H1UWuTdLEqwdswkhgOhJoTy/VqQTB49FJwZd70zUq4j3iw6IoJhD4Pb+Fh1kwQ596Egm
	fZTacl4PTGdba3SyH3cQlhy2Phjbx1vEQYBcqErAvHX/SYiGadHiRnkB2WasrdJIHHpCuQBmjdy
	z9gqof+r+m+1S5O8YHzjP4mHMm9VOWBmfZuw/W1PcqvOdYYDKXsh6mO+pq2TR9EOucJMvbZuop9
	QoyCVQe7Jz3
X-Received: by 2002:a05:7300:cc90:b0:2ed:6f94:9d94 with SMTP id 5a478bee46e88-2f549f5f684mr1845914eec.19.1778125260877;
        Wed, 06 May 2026 20:41:00 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm6882677eec.26.2026.05.06.20.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:41:00 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: usb-audio: Fix endpoint-extra bounds checks in
 USB MIDI parsers
Date: Thu, 07 May 2026 00:40:50 -0300
Message-Id: <20260507-usb-midi-endpoint-scan-bounds-v1-0-329d7348160e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwrCQAwA0KuUrA3U6UfwKuKimaQawUyZdEQov
 bujLt/mbeCSVRzOzQZZXuqarOJ4aCDeJ7sJKldDaMPY9qHD4oRPZUUxXpLaih4nQ0rF2LHj8US
 BhrkfItRjyTLr+/dfrn97oYfE9ZvCvn8AhVEGCoEAAAA=
X-Change-ID: 20260423-usb-midi-endpoint-scan-bounds-3d67b2b5f45c
To: Takashi Iwai <tiwai@suse.com>, Andreas Steinmetz <ast@domdv.de>, 
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=eYcgf+oz5hbuznP2Lx2/af6e4LKOlFWw/HZ70VnGKjk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJl/OE9eOnL5lO+FyOJFMWdby322eTVlcZmm+kzpOHVIW
 CazdL52RykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAExkhi0jw7f6rWkbBfpStoWq
 qy8w2MSqz3ebUeGqgsfHg+tTd2tUtzEyNDtutpt+Lu6HaJJH1uGTbY6PLGr7PYpnx1fHS2w49ze
 eEwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Both the legacy USB MIDI and USB MIDI 2.0 endpoint descriptor
walkers can return a class-specific endpoint descriptor without
first checking that bLength fits in the remaining endpoint-extra
scan.

The later parsers validate the internal flexible-array sizes
before reading baAssocJackID[] or baAssoGrpTrmBlkID[], but they
still trust the descriptor returned by the walker. A malformed
device can therefore make the parser consume bytes past
the walked descriptor span.

- Patch 1 bounds the legacy MIDI endpoint descriptor walk.
- Patch 2 applies the same fix to the MIDI 2.0 endpoint descriptor walk.

No behavior changes for valid devices; malformed endpoint-extra descriptors
are now rejected during parsing instead.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: usb-audio: Bound MIDI endpoint descriptor scans
      ALSA: usb-audio: Bound MIDI 2.0 endpoint descriptor scans

 sound/usb/midi.c  | 12 +++++++-----
 sound/usb/midi2.c | 12 +++++++-----
 2 files changed, 14 insertions(+), 10 deletions(-)
---
base-commit: 627f14c46d507a5f14a159d27c0042a6811903d6
change-id: 20260423-usb-midi-endpoint-scan-bounds-3d67b2b5f45c

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

