Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205233FFAD7
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005155; cv=none; b=DC046TwfYeb9lwyMrjpSUPu2YFQVYNv8JXEH15e5zv9OPxMzrbzwhvYVb/ysfhzi9GYOPElNaLNg969PUIVH3Gp6F2AOD+n4j5WMoDYxq26hpTEUECvwKL/7X/RInhzEgPuUO4UivYObHyY1weTXrhZ26WKvqXfxXhOOX+YuhDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005155; c=relaxed/simple;
	bh=+xrzJMsTkYG93fo+90IGUX9wUe4dn+/Qn2o113vfxno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dC85LipT0TSPzAnaASW6ykjEOOZklMGBFscqWgRspLqAEUdCjsi6jzmHikfwt41wPCVz3B658iYBxS0ckGgK3Ei2PrjYNiweXnvqWtAO1qxKAYksarDYilykxSZfElAqmS4O/+8jlC4KiWT43N0StiAldX4FOoZh63gh6az5WgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4KzTUZl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4KzTUZl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c35980fdso54641865ad.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005153; x=1781609953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSIuBNvqBaODcdv8iM12D2GiUh6JRLaoNHjKcJ+PWwc=;
        b=a4KzTUZlCQ+UAFKRAoD6QnjKWTpMRF/+MRjfgojPwaIA1d+1Nk6p7jqgSnTGCzkANI
         Lw+Lt9JN+zjNe5Wj0hKBNL9HO3MT0zRM1sZd2Nvss/4y6HJp71frTFoT0EyKI1L3CwHr
         mu2gE6VuVmgq0l+JjrHERyEEaykeDaUgRi2IilDfvhk5Qf7QxrkT/HKEgJEwXiH6Vy0C
         kx7H4H3ZD8Ae4wWrSwcS7nL0QlQiG+3YsSYakLFRg9uCbToD77Upltw4Ryt+5VIdrbf3
         ue0n9sG6H02dVvzrJZSOaXh3nNlztaa+Sv5roisfH682kTxEw/HEaQ+ZsCCbjVfNrt1i
         odGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005153; x=1781609953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSIuBNvqBaODcdv8iM12D2GiUh6JRLaoNHjKcJ+PWwc=;
        b=cJg0I9O6UfCBEe0AK1XcHsDlPqnTCjGW0E9zNdydaOy/QwrI7ZWIGLveO97BoAi20v
         I2Qg1JIaqufwRcm5QD4cY0J/pyUZtHxQlafX49jjnBcINBVrPpzfl6e8cpLShqR9siV5
         KCMcMRzLE7CrMpEpvoBCUcmH/k6iciDK0Ff++zg9WLuUFIN1GBj6yBg+fp4x4aAA2pzx
         n96HbzZuj/Go34QuSR0awTxjGgxjwr1bh4yhT8U+megNCFu74kCsyxFVg+plc+8TrSjJ
         ZBNO2XtnI8VFKZYAlNCj66VhJsxRbPUq3nCVJSoQOxXHgXY8ddeVKvrxo/3xVqzoCm+s
         ngHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/B0Ke0SHZomPHbBuwAGLU57qPF+6Jm2e/GIB5z2hYbttJJNc20SyHTacV84dsEQPm9BlGfR3Ku5smmqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmC9JhoRNtcaRpyL55txVRJ9JhSynhN35noca4Rau5Q7E3d6wo
	YNJElGWjs9dS1o5FPx7YYklztchm74yRXlv7xmIM+aYQpA8KT/jqrDZD
X-Gm-Gg: Acq92OFQ+lTHo1seZqECvM/oEv3umFALXiv66JV0A5gtrMITP9DQVaTl4P045BL7w6g
	l6V6MQuElFQBTM7EuoFZ1nNLTwe3LepeNTrftjYjFKo5+XOhtyKqUNo3glUIovDK702KwDETn3K
	UosepvBiWeVhZW8lj8cORXDuTOgcRHml7Om4iUt4f7ojxs2Jq4AE0pcW5NovlZSxcf8Ji6baQYB
	K86NCN4tBUK8cAfdt9OLqBsZ5AlU/EiazEpxeVf9+NdopcqxHfcF2/8K3QKYa48itVz21YSpfQ5
	rdh2LsC5757Z8hoRkNRfOrPf54beJmONNPlSQZ5uP0oL/6AlYeYdx0wh2VUVOFKRdM2QjRD9BJv
	8dJa2v3a4/RMkxsTG03FR9/PQCxorrzACrpv+llIOmxDnZszD47FBmmE09XQwvYAlUGv8EpRJGz
	GeP9kwFvFQIObqrk9pt+l9jiesoG6A92RYrdnbO2nskcgrTkMmnzu517as+9nDoVGaZZgbV6BrX
	CBYz1A=
X-Received: by 2002:a17:903:1b44:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2c1e85aef51mr248401615ad.29.1781005153477;
        Tue, 09 Jun 2026 04:39:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 03/11] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Tue,  9 Jun 2026 18:38:28 +0700
Message-ID: <20260609113836.45079-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Call fsi_stream_stop() before fsi_hw_shutdown(). This matches the existing
order in the suspend path.
This change ensures all register accesses during stream shutdown are fully
completed before disabling the clocks.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
Changes in v5:
 - Move fsi_hw_shutdown() after fsi_stream_quit() to prepare for
   subsequent patches that use fsi_stream_is_working() to handle
   in-flight IRQ handlers.
Changes in v4:
 - update commit messages 

 sound/soc/renesas/fsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..800ac40f9680 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1586,10 +1586,10 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		if (!ret)
-			ret = fsi_hw_shutdown(fsi, dai->dev);
 		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
+		if (!ret)
+			ret = fsi_hw_shutdown(fsi, dai->dev);
 		break;
 	}
 
-- 
2.43.0

