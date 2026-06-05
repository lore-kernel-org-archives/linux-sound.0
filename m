Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72024CA28C
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662031; cv=none; b=pfRSuvpbnu0nGumydIaNequTchTpt9QLkRIY9tIA5rMP7eHeP4bTJzCgLROb+WNf9fIf4TqeQ5MnhgLiSeqBYE7/Ks3UJgHswM/9umFsyAHrTd8+5ughpRsoHJ9luJTV5GKLEaFBQps+8Hf099hmLbfPH3p7yWik27kQ/POoLUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662031; c=relaxed/simple;
	bh=3GFYui5kLq2EPiPzoe/M8PI+Cp/RAZZ4lW+BTGGq+Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2kylMuDzICth7opksLfmJULnOvGPUodFbwmBAeTFlaO7/s9jH6517Rp6/YZwDvmTiKwzrV4AjKcZGRLixGUlUvjVI17CIfvKg9x1K9ts4ID4fPX9wnOz8cIYcc/sBFeMmHhT7H2lhhHcrgktawh06b0/TvDR67bGauCfvzxH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoyrZdZJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoyrZdZJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36b9033d230so1006996a91.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662029; x=1781266829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D54NjRtBiVnrkV6UxtLEigo2q3b/zdX4gpDk/FWxcIk=;
        b=JoyrZdZJTYhx7vKXz+rSHnM47/Q1UP5z/goI1JJOwb1mwEF1hVuvD4tX06BUl7V22s
         9UyiwjPfE6rbJwgGL520fvsdg2K9vVG3o/mmObeQe5cPW0uk5PMyw9d0/D24T1/eGGaQ
         w4uFrakrfPX4G+rN0hof7zugWjteRhk3fSFLdZJvlEDDyyG4oejcjUTLbMatrqjWQbxv
         a22vWshJWo/OmLQlL19LsJ+D77OdeOTOO32rCbDURPjgIr8a1CGaWvOv3RcfN1DC7LgU
         uOPYn6v4E1EBha/B9SmnSuyI4M3qOcVxgTXfFQYaDRGB7QDDy4B7WLqMZME009MjbGRm
         riVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662029; x=1781266829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D54NjRtBiVnrkV6UxtLEigo2q3b/zdX4gpDk/FWxcIk=;
        b=I+PgRUcXCQsCe31LvjBHdbNz9Do9MulIMvwOXbX7Jd0tjm+HGt21CoWhaSbvASiwiW
         hPvELBwmr5K7X7+Gp9XcRO3pIw15yUqXJjJyWQ44lxlGJZDpqChrnzVr+MNfuQSRPerP
         +AmnylKyVCB9L/fOkW5yJusOUlDDvoUdaAwkEGt7Yr8Q/RBh0pDBqXe4wc9Hx3KU0oQp
         LvEQqiR0cMRyCtnQT5HMaEg+0AxxvHXqws5cSSm0UXi82VaZHnCpENgMgxwvAq8h6/Bp
         /oAikL7oKtHX9JirmiiXb/0nyh09N5xP19k2Kss++lUj1aZBBj0jlBSDV2iiyULiCJfv
         oanQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Q3ZOpprlvy880E4o8QZjnUTTeFlLtAnlEeWsG6d8T89Xdw4czI+brvWCabwbk+jqVt+DMwcQVBewqPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIR4JlU87AiYt+8aE5eTJpYeEiMSXW9QJxWs4cnsOg89r30FYL
	EfSt0Q0sJaQ16B0Gh8epEAMz26832k/uSsYIFK5bD2cqPWCqCwyIRvAC
X-Gm-Gg: Acq92OGcZHvLMDPbgxT4xygoqkYMuuR2QMuYeZXB0E2HloBHwt/m+nYjRyzTQDYLeOl
	WUtxcJ8g6DT0ZDCqBk6JIU0A9278/pwjp7v9UYpSdtTY/X4DkuLGilXuPBGUtEc6jw0sKEIbl4g
	ANuxqGW38opG+iQH9Y/Ha6BoTW3jTK+mVDsBd1yWNVRHwj3Ig8G4zkFtlFjP29loei08rCE6pRm
	PlXjWvVdEr1F4SNAj69KH1HmNxDX+SqOVs/+zhujGVeZsxK1CQrgHmP/7OdAB8gdw9/iqsMEIj0
	vVv+8loLQirDkRNhfqBmn7awglJiE3eOiemrCrNIG+80jKkhNQzpz3XFgbUxjMy0+j3aeTnrVp6
	WT3C05b3SbDlaUEpNZ9TjeUezSUva7YEo9boYqb+lU/W+FZeL/5EKQyFNhM//WNJEYRWoDCyo4E
	N3ysAiRAjW0zKD+uXWZztxC3n6wgHFiajMu+cjMTdMUma6KvRrx1/cK8m2RG2epkbwFwt5
X-Received: by 2002:a17:90b:2f0d:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-37131041514mr2123116a91.7.1780662029184;
        Fri, 05 Jun 2026 05:20:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:28 -0700 (PDT)
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
Subject: [PATCH v4 03/10] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Fri,  5 Jun 2026 19:19:47 +0700
Message-ID: <20260605121955.105661-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
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

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - update commit messages 

 sound/soc/renesas/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..94ab2e490810 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1586,9 +1586,9 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
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

