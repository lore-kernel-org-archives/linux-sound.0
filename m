Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD7323E325
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700867; cv=none; b=IPgFnICkUkjAXyVvf4WsJYvZcbgmYNaBcOFflyWdk5CeKbRgm8FyyfGlKvVkuvmIYnpxr6jTSl3E0rDf/a1gpsxUKFB1RT8tzDvl8EL4j6iGrjcOZ52QZpR7b2eZeMj0pUZd8axM7k7logYHds8nDXuc4fsJ4GjzgU9Dbaaq6gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700867; c=relaxed/simple;
	bh=oXqKGb+1PtWRWpEgixBmUR2HmjglMMAslNteJX0DZVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XcXu6l1zuHvXn9DnJM0vykVFms7VmkCtvqGyav6O7smTOlDYJBjdXugqV9IH58zhdb1s8acWpQnbatXEraZ6DFyRG236RG/riF8LhW9YO+/YfLUWAY+488PL8OHyKi6Whk26cG4aquD7cqWX6m5ggsbf5XeE+sxMNoN+/xRTov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=g9nGcRpm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="g9nGcRpm"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449de065cb3so9068985f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1779700860; x=1780305660; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRUsp5/fssPeTOpCVfkJlRfBAwaroq/U91hxb4HJCnE=;
        b=g9nGcRpmRn2x5PyqeafUtaNQjMTytcXJA7FvgftkKhfqITbETnMPIkFP/Y2aEi8emv
         C2hVCStY9wsOo+FRV3rtIZ97/03i3zrVVwS0l5d+ngxJF7OjG6lTuSrfnKZCImrpMJOO
         H4Et5e8eut2PPk7BT+6C013wZGCUomqqd+A1b6KqZ+Q+incLuO5D3smpB41PxODnfc6d
         uOwEn+aLlQ27L2adqQg/rMGkGzR7pnzi47QGqeI8hBXfoHpyvtzcBXQvPITPcVVBreW8
         /yooflQnyVa8HEpJ9FR7+btTMcQHq+20wPiSbnLA8cPrjcsMSR93DyFzKgJpnTfDkmTx
         +H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700860; x=1780305660;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRUsp5/fssPeTOpCVfkJlRfBAwaroq/U91hxb4HJCnE=;
        b=sXdAwxBdpMCjFDPPo2mnKQWmlTKNjMe9fheBWy29CU8j7zJmMYtJDqmpBQ+nYBH5Be
         OM03leroCqrxvQfagzuL8e/X8GIlToN+GCp3we60oxyatBqPTAwoR588todI5ERjGUGx
         Tp0DNuaiGq3RspG1UqkTbIV07sAmo36P0HPKEyPHIuaWv3MEq6DYFsE4+LybOgP0JsKg
         xyDnsGBsC4KDikOEcqCcfWFVRkxbYM+I8M5s73Fw0y3R23cVjzMK34p/GLJGZAnHcOdo
         I1Wj3JM0EfHIWjLtQbPYs21o150R8crDl5E/7Tx9/HY01FCgbcYBvF7RWykURb1BaYqn
         pjpg==
X-Gm-Message-State: AOJu0YwL7RDGQEPy63E4jZnm5WehBLS1ORKAnr2XGNUlMP6W9/1C01w1
	yk5qAtww57F8JB5AkM9OE0ijabtHitf5+sGNMeJeeRD2Gk/LQ3a0a7XULAU+gmfr6wvhZwsw1kr
	yYos9+S8=
X-Gm-Gg: Acq92OGGT/aYnEZBVX5SuBrK0jo/c4G/kEgCOoawFFpasGBXXI/BSlBIAxFuZyVkdL0
	V3H2N5SHj9sHkTTAJQWnYU3DCTaV+z3KhTq6Ty5LdciH4aGwpbcshEdVTHUuf3kc8VbrFnjumTl
	+Dzz2/Hjrw1OF0pWNxmq8BdVEWqmwcmErth1tBM/wmjvMwejgDMS+Gz4zvRC5/wI1WLsPHkvL21
	qti2vAr534GXm6f5xZOdecQrMQnSw0wxwA8NFPyq7mUjU7lQ2ZvQlVzFe/qJiMhl0ut2Yyuqb1r
	ZAHIjhaexVp5nfLbjv2Svf0ph/E9YX0I3FcZbE4bJiVV1nVhD2K5gcyJaeXUniJSXkh5m+NN2Bj
	g+jqxOvmOxvVILH8ufcPjGAsgV2UAZDttZ0oNAUv8fShyx+8AwoJ+g3Af78cP67Q+pGQOKDUaBl
	ebCAA4kc3dj5WVhK1LaFMGc7012CHrn0xLJWEUxtDX
X-Received: by 2002:a05:6000:1ac7:b0:441:202e:3d2d with SMTP id ffacd0b85a97d-45eb3688844mr23666418f8f.19.1779700859989;
        Mon, 25 May 2026 02:20:59 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm25399989f8f.18.2026.05.25.02.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:20:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/2] ASoC: nau8822: add support for supply regulators
Date: Mon, 25 May 2026 13:20:44 +0400
Message-Id: <20260525-nau8822-reg-v2-0-7d37ae393e46@flipper.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwUFGoC/23MQQ7CIBCF4as0sxYD04DoynuYLigM7SSGNlAbT
 dO7i127/F/yvg0KZaYCt2aDTCsXnlINPDXgR5cGEhxqA0o0UqtWJPeyFlFkGkRPPur+YkywEup
 jzhT5fWiPrvbIZZny58BX9Vv/O6sSUnjdIilLV3ThHp88z5TPiRbo9n3/AkhJ+JqoAAAA
X-Change-ID: 20260513-nau8822-reg-becf5b766d80
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=alchark@flipper.net;
 h=from:subject:message-id; bh=oXqKGb+1PtWRWpEgixBmUR2HmjglMMAslNteJX0DZVU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSJiJRZvw9cs/f41NVHmgrMQxUzl9wMlLuleeZes2s4w
 6HHVqn3OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq4vcM/zNC/zJu+ahw4r/t9fDkG123Vdt3ldsdYROM63z4+9+6/1GMDGs+XdL
 zesZVeyG6yyk7oOJN7srSr2+X39ixoLZn+dsnLhwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The Nuvoton NAU8822 codec has four power supply pins: VDDA, VDDB, VDDC
and VDDSPK, which must be online and stable before the device can be
accessed over I2C. On boards where these rails are software-controlled,
probing the codec before the regulators are up results in -ENXIO errors
during register access.

This short series adds optional regulator support to both the device
tree binding and the driver, so platforms that need explicit power
sequencing can describe and enforce it:

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Added the regulators to the DT binding example (thanks Krzysztof)
- Switch to regulator_bulk_* APIs instead of "optional" (thanks Mark)
- Enable and disable the regulators at probe/remove and suspend/resume (thanks Sashiko)
- Include the required regulator header (thanks Sashiko)
- Add a power on reset stabilization delay before register access (thanks Sashiko)
- Link to v1: https://lore.kernel.org/r/20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net

---
Alexey Charkov (2):
      ASoC: dt-bindings: nau8822: Add supply regulators
      ASoC: codecs: nau8822: add support for supply regulators

 .../devicetree/bindings/sound/nuvoton,nau8822.yaml | 18 +++++++++
 sound/soc/codecs/nau8822.c                         | 46 ++++++++++++++++++++--
 sound/soc/codecs/nau8822.h                         |  3 ++
 3 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260513-nau8822-reg-becf5b766d80

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

