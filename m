Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153183;
	b=t6CckPAZBV19WEZt136dzX+lbfvDLhMSYRP7si2hNzubmwgySQZytQyIQCTQS6FLZlsB
	 P+RSTXvFiL7AYunGrGz/cG/qVfesOmzMfwqp7+TFa23sGWKTQoQQ4wRK4yYqe6PZTo8sA
	 /UK1enuaFXuS80R271OAHlvoXgWGqyntaiFelChsiLys6huiLgKsm/OK9qkKD8F1iED2A
	 uTapx/nIL+rqbAqV07Cz9dVffD1KjXHYmYEThbomOi47g9UxuoYA5WQO9SAf79/JW5wno
	 K0S9eB4BK7L0r4X2eDNKUX16cE5LnPhhHGfknLP1S7FQ1/XbjNSmNodLLsBRX5YySLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ujp7wEgF5GnwypspT/Uw9jL/PIu44zMErxzMd9ka+Jo=;
	b=h/AyY6LbBzmppgJiFiuMt25KW6yX5e+kzrJrLjS3hSSSxRgGK5f5pXto1xwn/Ocjqjcl
	 kwwfyWWZptjOdtvE2ZMZ2NgwSsEJoP+woArFxzlywC9qsscHi4uEqpyFc6giqWfeT//+i
	 Obh+Ebjqf7nhwXbAcStjI9B1SvXTa/wXqDj3lPn8UsH/jaftlMGtkpreK9N6CYAtDiuLu
	 F5OnYuRA0sh/XSVqo5Pi841cr84CGygQpD5avuwJ5tX6RtRL3wbnMiK5vXUdkFFo68e9K
	 OgbZihXSowgDaX4AFZJTn7GDnlXxImSF9i+VHNyjKhlK9sF8olVuvE7CVDg1O9jxTdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqGxUVOG;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63425606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63425606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqGxUVOG
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843cf077f10so605134a34.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153182; x=1793757982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ujp7wEgF5GnwypspT/Uw9jL/PIu44zMErxzMd9ka+Jo=;
        b=EqGxUVOGGpOXBcA0dQv3THmaFw4rX3Vq3bURL+O/PSbIjj3rPADTMnivnztehA4NrH
         7rjHA7isIWKEh/8Zc9j8AkxcrPOhEwzzjy0k9KbTsL7U0/w2zcz18UTuwDGDDAX0RMJ3
         txWPfmq+XmDOF0M4kvaQawsOL78KIVb6BsoRWzkf6twoTyDweaA6WX6Sh5fTAU2sO3GF
         rwm+TBTFITj8jQOLe6+R3ZELqe165uCUXx/2Kz/m79ApdSLsMNFHD471dwjw1psjW//Y
         q5roV24uo+bQ/9tyN3Sb+lJ82G14FWc4mBcLOi/mG6A5Fryn8p5vGVaanUsgor05ba4+
         ydkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153182; x=1793757982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ujp7wEgF5GnwypspT/Uw9jL/PIu44zMErxzMd9ka+Jo=;
        b=weRb5QpNUi8Kb1qfx7MrVRXec2VwvxR34uZm7BO9mpSKwdIPyPIcHTsCH7hEek/nPN
         AGbO6J+php8ux9V2aWxW7M39RY8XeGwmYXoTkRypVwyUwgVdsBTO2U6ZQeiBs7xEhfkI
         fPy6GkEe7Pp04+A/SFAhwWoMCpf8oGM0mlwmfWu09QmYi825Lrnu+xrPRDPb36s3MFRU
         e/OVu4Y2SSyrRnunfoz9YCdXdlU2Yt5/YPNWNsjspXDZ5M5Y4JUBEofKGZ3ofhsA9u97
         JhoQLQdOenxZCxnbQH9Q+riukf7lroqSavkFxnpwmSnaJC90h1KcDyIkGks+AZDUDMKE
         W3aA==
X-Gm-Message-State: AFq9FYJ3Jh7RIB5ci02PDeP0K84EhL82NV0mmCDGjAZSveaj3GdWnIcl
	NnX5c+XTgX+PIprVXDhSPlnWucXariXY7YbaZ+KU1EKamekT7YHO5aChUzZYw7aFTN8=
X-Gm-Gg: AYBFou1LYnPzd66CSfvakRGmbH3LBPMiqXypDvycqkpX6ZZTQj1VLPHinnvxp0goXFK
	ja9jt3xHyHv0RKEsbjMaKdcArc6yV7lnwVCl8ZkeoWYLrwtIDhpeva46nklzzYMTyydIkLdIwTS
	ljVzO6/Vxvzz4ytHPo26T5QG6DjwU5AFTVTSVYU5YGlYPRWwkRzSJoq7r1XihDvXePOYHuETDd7
	NHSw6sR0P7jsvTt2W7DtMkndOJXcblCho3faEbAurIeznblMfIEVxAh5JR76moBX1a09zd3P4DZ
	HQH7QR2oJTeqQ8Lsgw5fwYvVRAGzABjD2c8fWveembDExZuIFIeHW/hLW5zeFrdMtN427d2RdoE
	mjaaiEDk6qVDDE5+AQAMGh2nDYOHR7gi0lpYs3h6DkT+30g8CmvSMxREqb7s8+KSIKL8su+dShE
	c96dQSFrSyKvLDr9RVxIrGBQzbpgl0taoWzm419kW0kyZVE7NQmVx3TfwZZnZg8arh4l9mu+olK
	6OTSc7nDpoV7/mdKNEzys4NAa4FqU7uJpFkDVWqCpzlFFlpwNgzvii5ytZ5Co4mp0pzRx+Ef2y2
	hfsfrNvypSdohv4NZYSiAQBn5Hi0cUS3eli5FTfu/1aDK+6AQxnsX+3mRAkAu1Qdqd82S5s3gPV
	AHCWWksj1aTrPXgLXdoeq5uVWTfuzY/OhFVtYAfVWbbDH
X-Received: by 2002:a05:6830:410f:b0:83c:1efb:6424 with SMTP id 46e09a7af769-85abd809e87mr1088508a34.1.1793153182367;
        Tue, 27 Oct 2026 19:06:22 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:21 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 3/11] ASoC: amd: ps: add ACP6x PCI revision ids
Date: Tue, 27 Oct 2026 22:05:44 -0400
Message-ID: <20261028020552.35278-4-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ACP6x (Rembrandt) PCI revision ids, the ACP6x register range
and the ACPI address of the ACP SoundWire controller child
(\_SB.PCI0.GP17.ACP.SDWC, _ADR 0x02) to the ACP6.3/7.x platform header
so the Pink Sardine driver can bind to ACP6x as well.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 sound/soc/amd/ps/acp63.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 62cb6be..a8d178d 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -9,8 +9,12 @@
 #include <sound/acp63_chip_offset_byte.h>
 
 #define ACP_DEVICE_ID 0x15E2
+#define ACP6X_REG_START		0x1240000
+#define ACP6X_REG_END		0x1250200
 #define ACP63_REG_START		0x1240000
 #define ACP63_REG_END		0x125C000
+#define ACP6X_PCI_REV		0x60
+#define ACP6XR_PCI_REV		0x6f
 #define ACP63_PCI_REV		0x63
 #define ACP70_PCI_REV		0x70
 #define ACP71_PCI_REV		0x71
@@ -60,6 +64,7 @@
 #define ACP_DMIC_DEV	2
 
 #define ACP63_DMIC_ADDR			2
+#define ACP6X_SDW_ADDR			2
 #define ACP63_SDW_ADDR			5
 #define AMD_SDW_MAX_MANAGERS		2
 
