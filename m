Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263890;
	b=zV4/2497eAMRj+nn6HM5itIKe4jD+SACFe7bLa0KHvV8bbsuvLijClNkUv6oyrp9opBG
	 p7rnIXFg5szmzdjex6oz8T2X+yS6foc+4IZCGAn7RvxSWyKXG7qjKSE7+IaNxNDuBDL2O
	 B4+Fe2uZCg468xVkarF7OUV8hY6L0g0EClTwtx/YQzKZ3I9vPeniwcnIl+TW8l2vKGyOK
	 EiMTgX0PNpxKuUzcGUTtU9LU6GxUGBG+hu/LDI56oa/7lArNAri5t70E3aw24F1aOjW74
	 tYF5ZOAPnyiWlVYNTM5fBaS/ew6NPdoX3Kobgy5BI3kKzx88zMB6UCCd+AfV7VJ5U3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=viEIUGzsY9ILx21DfIddqzcsMEtyeHrn+oLBbU+ltpWsK+XnJPKZUSHDJJ2aEZMOF28j
	 +yzj26VYnj453QxQQ461EScK/he+8LC6lk0HlAocodytdLVJP6V1hlgBHNukfL6WI++7d
	 9NlhgkyrvI7R7jJapQBZ/UC8Z0Ca726MxFbtQydyXaSH5jzArxMqw3Qa7fxjqL1pfOdp+
	 G69RGAypfKB2mCitTqY5Z8/3WnhaEAvHFQ9s4Zo0qPzUVB8BfopgEEyB/bG/guGkIiLI/
	 hxksPd0lH0llmIiiTv/6oqZTExGJ6n4ZL8iczBA4uBNHmha8F/hd97wL9ObI4ut01Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwmoa4L+;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127D3606A32D
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 127D3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwmoa4L+
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e831e86ebfso11153235ad.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263889; x=1793868689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=qwmoa4L+HNj5Q0fRNwQ9fO7IO1jY8UDZ4AzzzoGERhLqXvirZSUk4RvHLE3pEQjGND
         72sBMqdzJpub03Vemg/+JbXq4B0KN1WOnz8sbPTLmag5Qc2vxxXtLSMXuBhWH5h+sOm4
         ufXDOhG2fUyB6uT6AHC0jpODcP+nyc9TO4DJtV0SsDHktIlwGREbiUxzmUggQYmQYsCn
         GT1SwxqFniTQSeNc/R2FxtmabHtV7neWsR0cbB6vr2Jp3GfJjdwLp0KL21O0HMRVD9yb
         wYMm+daKpWullHSqYNh9Ugruc0C3NfUslQpOrLfZxY3nGRqhD6GsI2ilQMGKKwf8BJaJ
         CabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263889; x=1793868689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=RolH6GNeM4shtYzCTc+Has4u8mVLqXVmHxhYNUmsQCVDPdbX8vBDGFiaFh/KMFS9DE
         v5oXXj60uMP9sWdfygUlWap1eIl98M69pGAzAIE2lxI4rBhrKXNl8IPjrFkS9PT+A9q/
         hB4iyeiZOG/vtRX2KRkTWety/sQ5Xyp9b3WL6cf4xSH/5tXP/MWm1MDptNfSeHN8qU7r
         Kpj864g2fd9tKEGEMe/Ge48TpCmvVtV7DvVyQro0FIbnhBHxA7M2OpDLO5ZOBUOsiXjK
         YudNCfxbwulHOqdRVT7ah2vKlVohPGPmftiHbdUz3rOIP/LA0hr9lCzPuYmmhnujRPUP
         R5ew==
X-Gm-Message-State: AFq9FYKOX1k7/837ce1DL5tmDiouLt7+l3CcAwsWM30P3DPcZGf1m4sa
	u25C3Cnwa4K9+Eq/UOhnzgVCBH5zy0G12BfidfovWGVM/KUELsm1M49r6u7sWQ==
X-Gm-Gg: AYBFou2U7Jli15dJhamxJbenvG4qQ7xOmI2xKRbq8NSamuNig6PJmUnqeVl7LxV112c
	2p1JjEf/ksZaUK0+QkRhn7yMmmTYaE+rTdY8tcDuws794eshO2eWcCtoM+hb88xCF4eHGIV3Y2d
	oV8GxOYKWr+jBT3sI8/9XaLQ3vamFtZOI2lAXqzcaFFv9YTkbBi26Tni6qhG1bAoMWKRQ7YdfCO
	jciyTxrJnqB9xHOHF9A+4kIqTePpbEy2hxhbiRJ4XaFMY+wXZvW+9sbvs0TbKNEWOGOnCx4nES6
	0P7f8sBZm+A6BQE5qsJgh3C7xSfMSpB/qyThhb65GQU9/cDmjXVOYvThov3D1QvXeUmGxtdV1Ig
	/8RBUEcMWU69Z8cjS4oRibAJBvvfcfAKsXF2MYig9R0+5DNM5vHc5q/AsuIguUO/2dZUeT1+/fR
	rWeGYK+UKDMWEFxyDIG48b2bwwx0zL9C4rtmywRCgeAb3DH5F9uFAkqLkJ4AH0sDoQbeHQGKOaj
	7CmOI21vUNaB76tYBtDYEW9AYoZ3Fgw6gWe+MEnpxgo1gAEB+TzFwWH8cXh/ekM2mc4vpQ7bwTI
	cihx1z3l3C3h92AIPcXGdKmDN42M+U5yUdPfwr6DalY9Fjbaxb7bUd5hCtA+Bwyros1dCQnRDCB
	t0tobix8zv5xf1pu6tqsxXHgKsXQ3+lhO2PeyNsmYcg==
X-Received: by 2002:a17:902:f68c:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb00338bb4mr39809965ad.18.1793263889488;
        Thu, 29 Oct 2026 01:51:29 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:28 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v9 11/14] docs: describe virtio-sound capture options
Date: Thu, 29 Oct 2026 17:50:29 +0900
Message-ID: <20261029085032.70689-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 
