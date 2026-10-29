Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309110;
	b=pQZ3DV1I0N4CG0Xs2+l+9XQa84ler0q13wqtRB84DJ3KXZQhUGg5jQ1jQBMVReBtBtAS
	 XJubpUfXDUBNDUpjT3PAYYhCMx8u+O8v6bULnP5zfuF/83uvWkXSqWBrXKvOTuE0hxAcU
	 BBNrbr2Gv1Y12sTRI7cUsEBIUEvkPrqjaPX6du3HZG3T9+3xo/tEesCBVpCGW73QhQmVw
	 /0qsM2sq1PMdMwW7oBkMXcbbzooYxQgA05YUIOQ/9SsgsU9iAlPcg49GfC4P9u2dAXP0j
	 eFJcDBMka9iMCG+MoF/yOa6H8Nw2aLYmJWnKmSmbBVumYPFJ8fkckvnS0eSnKbf960A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1SuzwHSnhY9Y2jiz10v7EAdYBzQeXqjGVjeOmHpQR9s=;
	b=qul8W6gv+Uc1DXjWPJwkyzEMIimqAC3KT8s7FmnjTjADDBsdFTG9N4cOy5xJhk3iQNLH
	 s82OMasHqbOUR6VYLz6sCnxbmM81NE12zs6f7otYd4uSQMIvvepPdaTpB/Q3bda15NFhS
	 6P7EXC7YPIPKbvhUzvriG+hEVI86MVT5bI515jIgON6p+HCtO8+fjcpRqLS1KEOWiYwnU
	 2VmSsIFYz+voSVPqQdfTsIWY9WDhxrvagGVSMQDOfeWKFznJC3VZ2Ce1B9JC3ADlB+Spw
	 9TFELE2hDwb4PHbE26wM44PObVCWpGuHt57uP6UayXtbQzHR0dBrhZxyMxkTRKkshvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0wNUcDI;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E66606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 21:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0wNUcDI
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so34358f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793309108; x=1793913908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SuzwHSnhY9Y2jiz10v7EAdYBzQeXqjGVjeOmHpQR9s=;
        b=o0wNUcDIH7Y0/9J2mtVVORG6cqirZ170goS3FGW23LBVnh19o9i7YMzuYgQxA6pC/p
         IBlkh9HEhdwfkHvb+l+m6h36uiJZ+YYihW/YvLvWnuHhXpgC2xOXGaQQpkDcKVfnqfaw
         pDPzoBsZn33OhVEhbK6x45RysfrVqDCUFPeLsUzRheNOPHH2KuXjo1xajtBS8g3kXvDN
         GZ+hbo/RzEDAYfWiq4gbqns25XdDd3/oi3VWmIlTBFv1v7cmoSWOvMR9WbDkWEOL2nvq
         PCMWfeJcMfkwITYCFibpQC+rAwqT0LFvhKE0+GUF6jH6honHnLrqEptQWsZN9IffC3ej
         I/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309108; x=1793913908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SuzwHSnhY9Y2jiz10v7EAdYBzQeXqjGVjeOmHpQR9s=;
        b=PhYxYIurTDP2N5AaaAIWBQuf3mRS8gb3HFqq5S+273nImM/2XZ+x60T7nCmdyycxgh
         pQlf9awP7JyYc86bvV44F9qDLT2gQFw+iiaHy5zlqaxWHOZlsLSq0CO7r16K7lD/2yg4
         L93JP7QyXbY9yIrFXQKdyNvavkj1+qZ2n+2CUQpjkbK0jX/31xZ4y5CXzYEatwRSRCPK
         ki/2YZFZt5lX4yAYPrp754IZQ5Mhw4I9nNKcWeHmiKcA8m3czS8H9LuB7h8DXq+POumz
         +CkajINf8yj6hUzgsajXud6akGWgyAM/L6NPTMDTnaoUd80Nd1OHkzz9/iwef20pWcZ4
         09wA==
X-Forwarded-Encrypted: i=1; AKwUvBw4KJFGgw5Z23FgYoyMhN4UNtGo8uxbrCdO3czrdtv+y2OicOkL8COj/DQ5GeyxqXIkCpEeEG00bHJUQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzfrTKBaPfbm5rTq+VpH+AQlW5yLdmQ5hoChgIUZ+K5vlt6+Eo
	hdnRK3Bd4xIID1ILwIiCfFXoGDP1A2B/wONXZWiY9hnmdDm8jBREMGc=
X-Gm-Gg: AYBFou0i1kK5TxylOh07pTxzaiQtmnvDVPpt9G3U5UpUc4dPE86J1mpRsahOUCaYtJu
	3gWYqSLSjEAVmQKaoJkRZme+ZHmpZvwGL4nFnN7Gl5Jo4NiKSafWpykyEHTeQomwaeG17W1OMIv
	c9Uw9Gbr9nIP7UPTZmSRXfX3UQeh9g90cY4iXFOJ09hyOzEqoBrfvAg7gedyi5Knrk79yvB/Byz
	PMNcRPHkW9mkB5QWSGVq4Mkl/XVjzwr9RXP2RuHPnPCPfXtNF30IuniyTRaq3NGs4vpfFhN/+gz
	aGRZBk8DfyC2VsLJdkEzuWuLYS894zNEDlIp2IDnZGdhikW9k/Z1E4fEPhmMEDvhhsgnmgj6sOS
	DDNz2MFMKqFeLTyyGduu+R5O/xWsE3bmvSuZGv/kKw01kTPnSqvQlWKkeSNZLYmqsrUm43fUKq0
	Rop0OTH73FmHZce9xL2xkXkuy24XW1GhztglFZ1n3dfHNiXF0QAkdzc2MYhx9AU7yYMJRryOwjt
	UTk82ig/1q+BonmuxYrimfblzg6dA+xDzifRuCGl0XKO8u0BmYgiudWUMRjgMAZR0p4CNIbPg==
X-Received: by 2002:a05:6000:2f84:b0:48e:e98:8b64 with SMTP id ffacd0b85a97d-48e6e2eb232mr1243353f8f.19.1793309108442;
        Thu, 29 Oct 2026 14:25:08 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb82584sm714873f8f.27.2026.10.29.14.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:06 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/4] ASoC: cancel pending delayed works on codec removal
Date: Thu, 29 Oct 2026 21:25:00 +0000
Message-ID: <20261029212504.2997364-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Several ASoC codec drivers schedule delayed works for jack detection but
do not cancel them in the component remove callback.  If the device is
unbound while a work is pending or the IRQ fires shortly before removal,
the work handler can execute after resources are freed.

This series adds cancel_delayed_work_sync() calls in the remove (and
where applicable, probe error) paths of four affected codecs:

  1/4 rt5668 - jack_detect_work not cancelled on remove
  2/4 rt5659 - jack_detect_work not cancelled; INIT_DELAYED_WORK is
               conditional on jd_src, so a guard flag is needed
  3/4 twl6040 - hs_jack.work not cancelled before free_irq
  4/4 wm8994 - multiple delayed works (jackdet_bootstrap, mic_work,
               mic_complete_work, open_circuit_work) not cancelled

Changes in v2:
- Resend as unified series per Mark Brown request (previously sent as
  individual patches with inflated version numbers)
- wm8994: cancel mic_work both before and after jackdet_bootstrap to
  handle cyclic re-arming (mic_work -> DAPM -> jackdet_bootstrap ->
  jack detect -> mic_work)
- rt5659: unchanged from prior version (jack_detect_work_inited flag
  per Mark Brown feedback)

Tristan Madani (4):
  ASoC: rt5668: cancel jack_detect_work on component removal
  ASoC: rt5659: cancel jack_detect_work on component removal
  ASoC: twl6040: cancel headset jack work on component removal
  ASoC: wm8994: drain delayed works on remove and probe error

 sound/soc/codecs/rt5659.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h  |  3 +++
 sound/soc/codecs/rt5668.c  |  2 ++
 sound/soc/codecs/twl6040.c |  1 +
 sound/soc/codecs/wm8994.c  | 14 ++++++++++++++
 5 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.47.3
