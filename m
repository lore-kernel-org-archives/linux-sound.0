Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136733;
	b=GqfdMYqeVuUFpYmpna3Qg0aAi2DeLAxNX6XpR+MbBap0W8dAQ+Y/UEUieATUS8DEUupN
	 g0qD8JDU4EQVg3r3bSuZ2w1NGvSm96Cmm7X4TscgrOLdnHDF0vRyvP/Wr7+fUHkfCAmdh
	 v5r39NJycPjf+/W+JEE4trAPYud9aWoYf0E1qx4z/wnuWNFiLBlY2L4YQ4uFOB1+io1CC
	 S2Pnw5jtMBo3KKk4MjZOYkdGuzxmiKyPejOmeTP6Utc6kiwhL1tlXTMyYfD/kZogb41x/
	 u4VgjvCOilDOHqdgO8b5UZdZp7IEg38ETtJLTPfH1Z1VvmLzMt2WYh/hpdePEplHCAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
	b=QXdTpme8DaKnKUwiub7obna6BE4tYJaqzf9vQu44snDg7I6j2HJA46pSQEDjKdqTJBvG
	 7DAlOD3yM4kq4xhvQe65bq7rIEk0MbzePynbw7PPnNErS+mgiS5lhMBFkted9RrD0Y+HS
	 2DIoLrpZ6tYGVX1FZPBTSTOk41rH1MKy1oSL/f43eiY+ZPAPhKwUr0AYgTUKozL6JblG3
	 U6zJBSLyFMskUuRduvXjBZBfOobBHesHGdMRq4JprDI6AmNTdWbQsHQkcD8C5eF4I7ID0
	 F2S+zBDIesz/xoxb1EbmOTZRrT38ugx8joCZOqYxyFtpPtE5Dz77ZkujxZgUIj2rQMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0IBx9JU;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10395606A334
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 21:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10395606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0IBx9JU
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f3e9e431so233630eec.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136732; x=1793741532; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
        b=p0IBx9JUeqLNQKKLgrDYtI9hCHfsipOF+VRGSGZFhrAy0spjEU4EHRrZKKovrYz4Rc
         RcDEV8+9d3MQoV0Gf2/oUpywHi8OO+b/NjKIxbq902elA4BvzwXjzgU/Wrj4nuqhsiis
         9BfxNsq9c28+btj3j4fxeUQqeVFhTXffpY1WwwcIF8Uk2LXvmlyiOPqongxcvaUpgzoq
         CQ644GdTW2dZJOGWO53sPVN2LDYXpLogY59psQlgdpI86Eh5QFy7CR5bKwHshjLUCriO
         nGsnvHCjpJm3Fey03vtRohjfOrZqz36nI3fa5Lg/cQ5LqEAdMWdYiM6RgP42Fw3ZyyP+
         9coQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136732; x=1793741532;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
        b=SfXnJb/lJrZ6ZzpK55dKzbH0ZQduSAVX2tx6HsKdeHZSi+qgMMkDV0P1+XbmsDWCAx
         x6OmKe5HjFlNA8mihm3FKA44n7oaaQg1s7N7ITjyStY+IHw3Pn1Q46q9KikxUEvW36Ir
         yoS5jXjdoLisnymbXrH8tXcmOC0qNVqPLYMg8QAy0680PWJubvmuKS3EP/x9qva1zejX
         lWUhI0o0qbqwufAHL4924ts/LZQ8FM7cL8eTEJD9ksoT+6IrHmWiwlCDjY7O6aaB2p5l
         W9fSE1Xw5q/ZmyzjXgoXXaYvNhY7BnCpxWvtqR99B4jDahTFlWb2oAyXpbA2PueK5tdI
         z+eA==
X-Gm-Message-State: AFq9FYINQ1nCajDQ4JHkXWrDtwGINMxFTkymfkNnCRz1PHA0r0Zal0sx
	x1Uf8wW4r+n95sOHywILX9zjTDgJF6WLBnxKEDmsDzvkQOcq97ZdLVlg
X-Gm-Gg: AYBFou1L3xOq6e0hpqKOoD+1qKZ1yUtNwqK79XlXFdeGiK3D156iW05A8l/gN6g9GKN
	/88UM4v3WFtSq04is0+e05gbF6iUIqWc6j7s+CVIy6EXd97ArsWTwV1/oeyeWLDkv/1Lk/P3TSU
	/LCPI1UcCVh8tJeoM870Lj8zIOAGINgJ63astvd6vJcg8tcMiBSDcwj6qfjmiX7i94NR+vnaR5i
	amBdlt9p9ZG/wR+nRvbZALY12pHf3yqhwyTFUHZGocAOx0nhL3YNMdSKu6Dvh6Fd4r6F5wd8FLa
	FyCUHFVdg0vwlOAmHGbGQ8BBul09AuHCi33pgSQgTeKV8LAzFz1rOauHHiiTANb3ZCvjmyZNN/K
	+qXes2E9y5vVcw5x1wKvnQ413LO4QzHORxqGyGpyzPdoPej+8sSKbpi6b3egfeUVVroQ0B5x8Ay
	U3b1qMfAHOB/WGGMaF6rUV2aZ+RDzvaQm6+n+ZfCBG2esDOo4bDpWTqIifUWvTLjTK5A8fFqV7O
	axH/efFScwE6/xmvRyekEJA2ea+iQBCQ1NGVUvFZjteUK8s7jpYQCztBbYEQ8eB9VuNAN8ex5m8
	2Kjc995HakbkG1GTBTJbEqyPJRcB0brbCW91axk5tSP2
X-Received: by 2002:a05:7301:578c:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2253a951mr181484eec.8.1793136731987;
        Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm61693125eec.25.2026.10.27.14.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] ASoC: codecs: twl4030: external mute GPIO lookup
 fix and binding update
Date: Tue, 27 Oct 2026 14:32:07 -0700
Message-Id: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFcY4WoC/3WNyw6CMBBFf4XM2prpIE1w5X8YFkAHGMMrbUEM4
 d8FXLs8ybnnruDZCXu4Rys4nsXL0O9AlwjKJu9rVmJ3BkIyGolUeLc3jFHxEropsEpSTrSpkDE
 xsK9Gx5UsZ/GZ/dhPxYvLcGQOoxEfBvc5L2d9eP/rs1aoYku2YDJoq/RRd7m013LoINu27QvXg
 8U+wAAAAA==
X-Change-ID: 20261022-twl4030-extmute-59e516f0e056
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

This series fixes external mute GPIO lookup for the TWL4030 codec driver
and updates the corresponding device tree binding.

The twl4030-codec platform device created by the twl4030-audio MFD does
not have its own of_node or fwnode assigned, as its DT properties reside
in the "codec" child node of the parent MFD device. Consequently,
standard devm_gpiod_get_optional() calls on the codec device never
succeed. Fix this by looking up the GPIO descriptor directly from the
codec child firmware node. Also update the device tree binding to
document the standard "ti,hs_extmute-gpios" property name.

Note that to fully restore external mute GPIO lookup on existing device
trees that still use the legacy "ti,hs_extmute_gpio" property name (with
an underscore), the companion gpiolib OF quirk [1] is also needed at
runtime. There is no build-time dependency between the two changes, so
they can be merged independently via the ASoC and GPIO trees.

[1] https://lore.kernel.org/r/20261022-gpiolib-of-v3-3-42c3b6439fba@gmail.com

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Drop redundant $ref on ti,hs_extmute-gpios and add deprecated: true
  to ti,hs_extmute_gpio in DT binding schema.
- Link to v1: https://patch.msgid.link/20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com

---
Dmitry Torokhov (2):
      ASoC: codecs: twl4030: fix external mute GPIO lookup
      dt-bindings: mfd: twl4030-audio: document preferred name for external mute

 .../bindings/sound/ti,twl4030-audio.yaml           |   8 +-
 sound/soc/codecs/twl4030.c                         | 108 +++++++++++----------
 2 files changed, 62 insertions(+), 54 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261022-twl4030-extmute-59e516f0e056

Thanks.

-- 
Dmitry

