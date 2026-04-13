Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1C43B892D
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074862; cv=none; b=kKgrZR0Cr1UXj300oeBtgWtsS91NSuX1DsTcqxCFLkRtBFsGMp9IKI0qmoCIzHH08OuoB/bzz/MV0zuzNOuno7eOEQFPX4NbKhp9tv6DpXqlgew+EQy25dwQh2xE61bpw/amvmwSM4rPYu/FjZOdQakRzxkVHGh/DDUwtqD+YNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074862; c=relaxed/simple;
	bh=D+s8GVQ/QM2vK0xezQUADaOx11u8s9xPf3kKowcoFZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W08skXcFENOXFjmNBf/bvkfOAnJI4DyydLm+A9TMBEuqGnBCXc/dDJvfTNRbrUFpYAY4nvqoG1AtAwxvdLNKWPPdczYG45hw6vI7Y+4e+UDikU232Y0FKePOf9zDA1DW1IWu6zimybsjxuQBXkBVyYSxzUtm5U6H2vZiJMOD6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0IVQzUJ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0IVQzUJ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f28e0ac23so619516b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074861; x=1776679661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2PgkH4WVSPSDvO10sNeJhrjoQgLFADjIHpjqVVMmPg=;
        b=o0IVQzUJsIVAaREADYj0S7ac0lmYXDnHZx8vYYm1XtLq3Ofx6yoILvwfUGf2mkwTcs
         irpZhMIJNC3J3uUn8dUtG2j2epBKl4uLaO5YEEPnlRI7lniPL16MNfEMPJAnsT5KaLlu
         HwKmTI/9y2ms8Ej5iCcKA843LWhJByN0I2td/Z8P7wvystKVZ87uF5/HtwP0aMcRiL9C
         42Q0P5/36HdYb9Cr4ZLAl7SeQpXw9Jf3CAdXwUF5s8qiU7NQlfgy9J66cHZXPlI+Iwsm
         G4j2Klj5jvPSiAatde9C/ZfLeCH1iA4KnH3Fn6lGGbPIWvHEa3fJ+3qg23W30kV8nlPy
         wBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074861; x=1776679661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2PgkH4WVSPSDvO10sNeJhrjoQgLFADjIHpjqVVMmPg=;
        b=EZyeYAG/A70tBymk6pB8upMLwMfPovGduHy04yye7nm5F0s58ttb+OHv3LDmFkJZih
         dWbxKLwfZbpM4UtHx8IoHjYhd4bztHBcqQmSGDRStwXmUni0fN000tKpVuf8BWo97wx8
         JlwUXDk5rw7zREcq5t8eh+FOhhOP5AssX1wsfp+MGAacRAJucC5SuByeNJzs20P7vTI5
         2yxNOgkChu3hcxU+vzufHhnX6ksHFqVasj8SF7nRfSojsVIppzOoqohaXKx0voX/rerU
         Be1F7xTIgV6QTH71amtTeYD0SEOfOAxWwo7WDHWpLkZ5UHit85BkBnxkAv+p/ExMhwec
         O9Sg==
X-Forwarded-Encrypted: i=1; AFNElJ930cJh46DKOIKMaGQ3OIuXOllu1Mu7lh2F0asZ/WdLPtZFcNPLsoA4paYpMNhkhpEjlwlT4jc609Rv+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LK3TcqnwxmGn4Cske9d8uk1JOnlJynUTcmSHZuFN6NsaC1Ez
	7HEterv9/d/TlUW/cjJwqy60pxz2CPyFIonYMjNcz65dLobJ0nIiaxTMGyuGbw==
X-Gm-Gg: AeBDievWDDgWyAIskPJHyFb0b7U76PYdb53rBnuj8bVbHyHs8Tfd6MgRgsQf+Ulwg7w
	1oXEwfIpgcTQo9axNJgIdlU/J1GLAeZTT88h/eOzNBC55yUv7UovR1hmAPWTAtIAckRTaW04wcN
	onpl0nnOx3AHJCnWzRXOSq3WxkGS8EsESe/yRS7KLm0mB4RNgy1w1XcmdQ4a0zSxEj6X+y0aupu
	XNoshm/rwufn3icIymZ5zZ9ZeBiesx92YD+/Q9WCw0Jb8FT4tae2J/9evNmmGX7ji3H1cwR9BRQ
	Fq4XnjXETtC1YmZiW8DxCmQOKER96ieN+1jdKhlb88GVPs6OY2R8OW9JjjcWBdWRPpvxAlyvMGi
	nCjnFEpEbD0CsGK453+H6GgWcrbcAp/gr3/AqImP71frapHWhBkZYqRtlZSCruicIA2wMXHI0if
	jZ4MFgONOF/avoY3lPJnxwMmT0Ov8966oZf3pZhWZcpB4zUh8WAhdNhANZlQ==
X-Received: by 2002:a05:6a00:4218:b0:818:1e8c:a513 with SMTP id d2e1a72fcca58-82f0d1ec525mr9578297b3a.17.1776074860694;
        Mon, 13 Apr 2026 03:07:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Mon, 13 Apr 2026 17:06:57 +0700
Message-ID: <20260413100700.30995-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
This ensures that all register accesses are completed before the clock is
disabled, preventing the system hang observed on r8a7740.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 109e06b5f32d..9df3e91ac79c 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1606,9 +1606,9 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
+		fsi_stream_stop(fsi, io);
 		if (!ret)
 			ret = fsi_hw_shutdown(fsi, dai->dev);
-		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
 		break;
 	}
-- 
2.43.0

