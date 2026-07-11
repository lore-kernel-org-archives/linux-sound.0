Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4002246781
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 01:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732338; cv=none; b=nCKIADUI54SnpVCOsbaV1sGKcAqznwrVATGfTvPO5RiAhLm3VvHp/AV95ReFaunMJvcyQ0SGgNdU+TO61e/dKM444HhemlJTvr4KPw7xzKp8i0RfKlNw9Irri8h1EBp8XHJsF3upurClCDUSoo66Fniz5SxBDvMHN1FMaxsx6Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732338; c=relaxed/simple;
	bh=5F6Wpn2wEPSmmQLDtQuHy5iGCnuqtiFIo0tJtr1nPuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLMdybCuc++i09uRRbfERy/R6ha4GJBwpcp97xPaGWbW6uDOqETo8iPnlymSluKwYlTrIMzGptpICKyOYyoV2rT2SfF2MHYHomRKcp2ecPfC+uF+sGrAz6crz/mTEeO2jaKjSlbtQpUAUveHA0MJN5IqxDlqNnB/wEO5a/PqnjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxF8muE9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxF8muE9"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848d21bbaffso19527b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 18:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732336; x=1784337136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmMcSTCtgId6XKkksH0TURh3OjzppyxEGWxNMVEqaKU=;
        b=FxF8muE9Nt6NLfLBH9xnRApFRciDF8cm4sRPrQpSrVUvxreYm1jm5MIkmCLhdo8iWb
         ZkiZNbOoE+xDlTVZ/DFPC3geWrlE5lLOgFDiCvgNj4kr1MDhAIhdQcMeNctOICm1xQZo
         NFUINhQ4udSei6wMpHUYMh/oQ4JsfYqSS8eibabgzaRp4MqcCankUBUVPn34uzRqHsm8
         s034vnSBAFPTY9nhc5CxB/wb4MEZG2GE2vD0sDnOml6GxzkRYsJS3CvZMXGPz8veLAGm
         NFotKyg7GQhQrgtN0+N9J4XjzpFgtOR30ygICv+2jJsoZ/RYCydezjEwoffuknNOijie
         TavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732336; x=1784337136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmMcSTCtgId6XKkksH0TURh3OjzppyxEGWxNMVEqaKU=;
        b=WY/REK8ZxK8cdsE6JaECN5lj9rTPHNHo4SD+dTKqOhgHA8dynQsQVwYsWtJc5rQmXK
         9WlVf/y9obJfjJDuPMVPxFvpqbTyE7hrRgtC7fWQSH8YeNHu0TaadohA7fMdePkcGtdM
         Id8Zcxa7Ec5Vp59seiaMpMpiTC1v+SLJeFvsw6CILAClKx7iNw68650rlf6nV3pQT6Cd
         YyNLBfxS7uAmjKhXzCxYA6KMfiddox2Ij+TU5ywDzb9p9v22Ng1Uv81kekfpUOKBviuz
         GRVKqc+r342lf0re3MT+cldR2FArkTpUsJ3n52mPeJeAFANDSPnWcdk3IaQn8Xlco/Ld
         IinQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdBFEh3GY+03UmzIoj0ZW81u5cH5xRufS5XuTD8VSVmSdlIfcIfd+ySurwyhhgA3AlAmpfUfNdeChIxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeyV7xFY6LOJBUOpEhUcQX9ovWVmDMm6O0ny81UALK0gJ4MfID
	dVDOFapZIVEPpKS4sqYhVSSe8WLyA5eAbxk9JSgaz7qsbauMUAoTPrpW/KrGwQ==
X-Gm-Gg: AfdE7cmqTTt73cye5w6E8bZWKBH7uIFjgkwXFhzr9Dgwk1rcrotnqLBogOMrIbL6X/l
	deCDK3KpGnqFdmse+CCtwd/w9zp/o+o3FzKlbQydwfYOGD8qAQ/kOoOmSVrh6GndBHSjosbFzDE
	fSc+pO+sTC9xR1+WMRf2H+r/N+jlj/gKXX2GG6I4OrIaXy9kzc0/PQ0j4UAbdHdQCqIWm74UL0g
	daUxU+Jna0jkfT0ZkzhyMeLWLBSV5ELn9w4cPzTRqXdBDUwFEufbmHqqoFHzvQ9LTGBxsKHtIod
	3zJdRTRWblglOAgIQiKm2wfQXDYns556Y+P+pnCIFO5Xx3BgmuHba5W+8MFFB2NE8zuDQj4M0s7
	JdvI7tnIsMMsnKYRmgrK/3XXWrqgMhkYMJ88z4l+1sAJRhMhmczRabyMGckLdwW/nVSa9BxS1Pl
	DhEJUayAJ1hO4ehfCnZ6x0kWfC0ZITo/QWgiYqTi7q+Czw0mtCrc812mfLq7Iuc1jIzZHAqbkVB
	XRG5jcahbMW03T/FThBMSD2LOpRbGVprPxXXnQRq0ACa6zePz3Q4FZPpeZLguNJjg==
X-Received: by 2002:a05:6a00:139c:b0:848:4c3d:659f with SMTP id d2e1a72fcca58-8488990d0b4mr1091981b3a.75.1783732336282;
        Fri, 10 Jul 2026 18:12:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:12:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:25 +1000
Subject: [PATCH v4 7/7] ASoC: apple: mca: Add delay after configuring clock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-apple-audio-redux-v4-7-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YuGvJxGd7rMKWAmYwBfPtKfCWVffFa0TGyJifMJaBa0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7yV9qluP/feca3d3d46e3/JI5sObNq/6039+WU8t
 7nqv7CrdkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbaR4Dhf9r3Z9Gn2WWEWJZHTq4yZGU9cHiKtmqAnoWgj/7bcrEZ9YwMTVL3P7F
 Ebr/It3yGMZdyxPVMzUyWbxk9D7YtDFh1MNmeAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Right after the early FE setup, ADMAC gets told to start the DMA. This
can end up in a weird "slip" state with the channels transposed. Waiting
a bit fixes this; presumably this allows the clock to stabilize.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 322dd8771111..afb3754a8883 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -225,6 +225,12 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
+		/*
+		 * ADMAC gets started right after this. This delay seems
+		 * to be needed for that to be reliable, e.g. ensure the
+		 * clock is stable?
+		 */
+		udelay(100);
 		break;
 	default:
 		break;

-- 
2.55.0

