Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792921856;
	b=VR1veexhtXzh0cp5Ca5sfjm4BpPUZHWUJTfi88WxjPx45O7ebgpNjC+oOO4v3UfIRkLA
	 DNTdid5mkrwaUzPCo+7+zmIXSR+Vt9KqFcsFxv34T3Hvxtmdq1WBJqO6MpUBTtXmQHEiV
	 EN7EPxq9pzBixP4Ge4BOQbou6FASdMQPd6C3KXNKMwdG5Z6s58pqxhCrBabGvsriV0Qe9
	 ZGUhiGiPbQqtuScJvCzZ1ycWo6iyY9xBIPmOdI+NRPVz24HmrNVbp/tPhvMnKzbGrCj0s
	 HpRGugR32iEsTExhkVwkf8MzYJ2phmVnCnDBLwbK/6fIY4N4ot/HqFFeOihlmO4q/Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792921856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZZ/dz/zvcgw6BMp5lO+qKEfF81xHiazGSYx2xRkXccw=;
	b=Qu8tJzCAZhbyDDooT6y6UJqvqpdXy1LiwuxvNqn8VmRgiFBaSMl9NUm4eD4hsfh8gW5+
	 6fXrV86a3b0DgUFP+Gd03XeQqMhwZgjLMjF2we4qt5cmvKulPTSqNIaqeRUsrUGDlatcz
	 bzG3IdZyf/jfXW9uDpvbN41X2j+ezN7id5WdXvjnyvNL+AH/fD3dlm2MZgYGaH14msYh7
	 SdKwqXVRI8iqzVTnFK3o8TRiFbdPnTEGh6XU4lo3kllq956Gdx8NQAArrAZS4iA2lby5v
	 0UQ994xOl9kIOv6TRj8N1DMjM0HACRBHs//+/OM+46xDu6owXk3E6dIHLZP0WFsbPsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DIoTUM7e;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED4606A31B
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 09:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87ED4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DIoTUM7e
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19903715e9.1
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792921855; x=1793526655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ/dz/zvcgw6BMp5lO+qKEfF81xHiazGSYx2xRkXccw=;
        b=DIoTUM7eDXO2AZZf1D6mdll8m4itIZVK95/sqvPnwrofi/2rdiZ9jyNjHCvRfDA3tI
         HutJxHwAoVzRX0/QoMNaH4Xh0itQEzO027z7EIUK1b2a5Zuc3ElbU4rZ9cTDp3BW+jtK
         /kE/BxoaDqBPyau0aK+A5qEOJI5wq73/l1/L6nUtVdHr4VffcHAsePEMcWU7m0vHmTgj
         lRYk7Iqz4RWljYySgw1eCS4wDLFdiT08l5Ky3tmEsnQncKphC3VPEhIR5M2IvlOi/HHj
         phnEWNxk9296sA73yhdTP3phc6q8NjXjZ28qXMZsi4A6fL2ffLkEWuEkEuwkd4l9jZCW
         pDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792921855; x=1793526655;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZ/dz/zvcgw6BMp5lO+qKEfF81xHiazGSYx2xRkXccw=;
        b=aS9wJ8LbRejURsypBbqXlLM8e77JLscyYZTvLEtx0LuIB5HEXt7KIDlDNbvPc8iwMI
         CaKsRgcrn8GkeOhw3glyGK/T/8CTU1kEqXQj7B+XLy+faIeLMKmw0oKEu1Ll/J811MN+
         ASGzH1LyvvIy6P214gMGR5lTxea1ClynaD0+S0VusjOxXkfSSHw6GuO6rDxM2KVdKR9v
         Nq2fD2iinCSg4kduef556mktAG+S4l+UjpGwrVSiDKwpeUCF2jZd0N7BcJFl3W7eao8U
         SSHLB2RL66QVB6Glr+EhZfCbbNkUK8glk1ax13nJEu4DOF35AESrDTdr8cbOQWE+3lQt
         lyiQ==
X-Gm-Message-State: AFq9FYKH5IKIvdIWhgUs0kYMPK0/1BJW+NDNjb1pXPWP2pwIUxsa1IrT
	fZ0VHIXKFqwQAZ6+abfMSs2Rm6N7gzB/TNMtFzkT8vfvvFb/zgTlmfHj
X-Gm-Gg: AYBFou19yGO95spwEVZVdjd36gfhbx+TWE6RASXfAv7T+azATuvF8475XbPLL5JcWsz
	FA9Gq1ML9ARUt+lIzaC7kIpJm1ATh6nsz6Wvzh58R8CmQrZD+s4ZdK0pG2mKX25pGynWOmSpJca
	rnynLNc9gppFxTpqe3ULqb8vrslJyLokibpV5UuB0vC7eqt2wcO31ShiKwrp9lotmU6eZp8CKbp
	wPTzBVfN4qVDr5lE2RbYqlip428ma+9aVtQEJVKz2pIXnM4J5UJ52fFE5pdI91wZeCwcQPFL1UL
	OL7Vg11FSyukMDs24DHjlW9FGjj/T6SqKpvi7fiBwPgI4M+/lK5tdpCmx0XwIFuJ9Ljsyg30Ewq
	Yu9hxaxdFnBtQQ1ldO9EncuYzf8l72Kzm6SvZedSGD2kv1LnP0FZsgbOKaVgXdRXTBNkoWC0Kuw
	lhLfMjbqdQuki4+mi/Zg607SNTho5955dwMbHSF0OSsymy6gwOaioEgBL1W+w9soYQ4xDhsDQzh
	TSXQ5zGyco/p+V5FboCzGUWTMlMyHYgRx0pWyhdAAvG2eAbngR5rGwZIF7Tyh4=
X-Received: by 2002:a05:600c:6212:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a35acdd912mr60693725e9.27.1792921854775;
        Sun, 25 Oct 2026 02:50:54 -0700 (PDT)
Received: from laptop.home ([2a01:cb1c:1280:4300:c4c5:93ba:d899:122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm9341433f8f.33.2026.10.25.02.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 02:50:54 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Rodon?= <jeremie.rodon@gmail.com>
To: broonie@kernel.org,
	rf@opensource.cirrus.com,
	david.rhodes@cirrus.com
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=A9mie=20Rodon?= <jeremie.rodon@gmail.com>
Subject: [PATCH] spi: cs42l43: Add speaker ID quirk for Dell XPS 13 DX13260 SKU 0E54
Date: Sun, 25 Oct 2026 10:50:37 +0100
Message-ID: <20261025095037.18891-1-jeremie.rodon@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Dell XPS 13 DX13260 is also sold with SKU 0E54, which has the same
ACPI speaker ID layout as SKU 0E53: two pins in one GpioIo() while the
spk-id-gpios _DSD property references only the first. Without the quirk
the speaker ID is wrong (0), so there is no speaker audio and no amp
firmware is loaded.

Add a DMI entry for SKU 0E54 using the same handler.

Fixes: cad16d850e37 ("spi: cs42l43: Workaround for wrong speaker ID on Dell XPS 13 DX13260")
Signed-off-by: Jérémie Rodon <jeremie.rodon@gmail.com>
---
 drivers/spi/spi-cs42l43.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index 6772abb483dd..46eeb44130dd 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -301,6 +301,14 @@ static const struct dmi_system_id cs42l43_spk_id_quirks[] = {
 		},
 		.driver_data = cs42l43_get_2bit_speaker_id_from_one_gpioio,
 	},
+	{
+		.ident = "Dell XPS 13 DX13260",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0E54"),
+		},
+		.driver_data = cs42l43_get_2bit_speaker_id_from_one_gpioio,
+	},
 	{ }
 };
 
-- 
2.56.0

