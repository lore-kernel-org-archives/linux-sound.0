Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDB3314C2
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968705; cv=none; b=eiqUGKDX8P0Rxs0Rp4RKNXhLSTgfE5jZyqsZZT6ArU2KOXUA1VUZmLz5TkEIDZgTBY2M6gMS/ZrW58LyE70zOiJPGfcCDeJIM55HuiNgRDepyERVIYj2s8cn3B17HqKx46i6AJyShkgX0OO9PoaUDVIAHt+BSnui+jZdXCt/328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968705; c=relaxed/simple;
	bh=HR2XMi4IgvvxzIRMtqagLrtw+MsRURUfdGIgwEAiD3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bH2qquREAf0Q9xxRdsg4q4atAoaB1Zhm2P+Zr2B2st+muQxMpAmFUqTGr9fLomk4Ucc+0KkJgPobR7oj8cTsBOtUkTSx2etzC8itcXTkysWXY+Sd4oLffmEkhpa94tapT9h7ljaCM/CSPooWhll6ZvtvK2Yxgqz6TsHBE4gr9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyexNb1e; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyexNb1e"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0b944f6edso51263605ad.2
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968700; x=1781573500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMCzgBaJYvdtNejaaNJmpNBT14tIkvDZ23jeMItsrVQ=;
        b=HyexNb1eOFLLdh0as21+T+4U69QcWURlFFY/wlb+ydzS0TOklHujAh6dGa+h47cevQ
         ajdblSXIx1w8Xt70jvwFHvRdU6pPl+pzWkNiye/aO78yr+r4vxOZZmqTh0KbgalKUZss
         50QfCqBZDZ8uAX7M6G+9KdsEGw7mKKuLXEI02zBpwFJlddL08YgkVaXZPA9KRYB0xlC/
         x5wodow4Hy/+gY79N2vrFcvvWJeakRhwQe/e4inm2h8MO6yTcanxpg4GQRwNMSvF72CF
         C4G7mJo9IEBqeY30FhsZtqRUAnI2gEeCd0V2YpEae87iT6lCkIFSEO3poXhYIesBARkE
         4usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968700; x=1781573500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMCzgBaJYvdtNejaaNJmpNBT14tIkvDZ23jeMItsrVQ=;
        b=SeaHUpXJyDkZSW1qVGQRhedwA4h4Xg25o6j1lcura/FW5KPmvxJ/3477vTPDxytXV5
         6xfLgekt4S8Fro1UkJGf+DJW3AWZedZ3E658rytL5iECTxKLGrWvzD9mMIm3wqHL7H3j
         63Fv2c9XxYZ3Gpj8/eHvRiA65L+0CZPgA7JSDa5DZDrrq1Hu5KHMDJiYUvHqBcVK1En7
         A25E0IT9Qso2t4F2RoGI9QPAw9baC3PoTjSMrUZpW0tsS2hjqqHIIetXqHMyXDI6atI3
         MKMBbrrrbumV4scgGfFrQdEHWNw4v4eVtsY0o3Z09tgrxpkouDxukkZ4z9iYQSTi3qmX
         VJmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PsrcO1Tpl33jiX7keo7LRr783q3daNU+8pYgcU4Lsqv3Bkupnail/UthkNXH01emJEvP/gBWnh5fwtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZanPYpyWuHbEkHYoJM3CGyLWUADKD9hYNxmsLhOJ5cAIXkfN
	xtnNrMEJoiAvyfgbMzRScbPYHUcX5GtvrDlNXQ1YDb9nV5+Ic2pu+/Ev
X-Gm-Gg: Acq92OEXL467gNmKY0z4AgBx5/+s/AEDE8NVMRIunAdfHqhckJWcKYlwgKOib7OtlEh
	Yh0tWbmOBrQ/Ctg4MmutbsI1gROZj7vPoYtg+v5LkkxcUDd3N3eYNCeNn+t0XrXh2e0pVhuDHvb
	GiX+6FllZJYNy3shqstLJ59x5s4elEioVPVtDcxWTN+qo+vmwl+yKJyK8+cpf3/3CbZ3x8PCSeJ
	2IQnN4hLQVAjUWVWXawwsPeEJz9qVPOE59xv5VEnG+K1/d9JjPvMvaeEa/AQLooo3mGQZvSaWiG
	/NHZMG1FMDAhXey7v4hd++kRlzzzRVssaLBE/wbcF2Hy10NjAB2vAUF/diMN62Kw1IZLA7VfPx2
	y8UYj/mU/QAPEduwboWQvchpwYtXkzHgBhlruQnXXd4EWK5xqBsPAt1JrB73a1wxNB+ZQjOZMSm
	cGRMQ98kbdncAtNXGPZmuCMLEysaCBL0FasbQRng/3cz0ZlIMEW8q0YrebdcTRoEvyO5AewRETz
	K/TKGM=
X-Received: by 2002:a17:902:fc4c:b0:2c2:1982:527a with SMTP id d9443c01a7336-2c2198254f0mr143994245ad.16.1780968700102;
        Mon, 08 Jun 2026 18:31:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:39 -0700 (PDT)
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
Subject: [PATCH v5 03/11] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Tue,  9 Jun 2026 08:30:59 +0700
Message-ID: <20260609013107.5995-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
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

