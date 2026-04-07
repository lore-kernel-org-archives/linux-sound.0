Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93FA3B6376
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576160; cv=none; b=pXjn0TgQDzolNENjCxee3cYbGOO9IRR6QvK+o6hJ6rFr13t0dd6pCO5Y7COy0rqPydWGNjSVCGUOzhODN8+l1EO63z7u7lBRvxGszQid3DI4ny1wb6XjHSpPnJAEwLiI7IKAB18nXzPn3ZPq99IF8hSlVkm1SqNnqKC5iux/BN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576160; c=relaxed/simple;
	bh=dB7P+hW2P2i24SpsF7yvWCHcLNtwvsI1lS/8EmcxB48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgAcv4/qBHyaI9hyLMr0hk/S/n5DV01baMhM/y0sCwE2gc5bOf0v6qWLKPESAkesxEntO9ctUPtv85R2NW621r7+gxSiwnpzIriIdpNCqE5xoAtc78soeea6yttRTZtjcvx8UWnWs/e7opYIroRROcdHBpoqLDX69DskIyqsU2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTGuVCe7; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTGuVCe7"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c15849aa2cso6928466eec.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775576153; x=1776180953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xrYsGshoqQIuVHI2ZhqhKCWB+xMWS+Wc13rrkqN5sw=;
        b=bTGuVCe7EtqSdDy+HICYc/lYgIaTdVn/MANLlAITPZUZB9XtFmX+0B9bnhLHUJe3c/
         BuxawuhFGnjLQN45I01mQ4gp6K0sLt0ryP2mOw/Wb78Hew/wrGsRKLueY4Pw+D/TBb5R
         T/cCp4xULGi6KDj0J60rFCXTE3FrF9/VlwGX/rgTc+0eXfbFnaGo6bSO+7vn7Pyi5I+Y
         cSFJWYrSFHMNF8gvrDsSsv9Hr3EHncnGnZRm8vjVhQq24E5wf5L3FsOD7HDEGdlkJm/O
         DVHCXEEeCs+Ba5abBzwvfJYLvI+WaMIB0Kl9VSGiXJafOadU8TmY4WlVCziq/mN1+Dk7
         /kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576153; x=1776180953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xrYsGshoqQIuVHI2ZhqhKCWB+xMWS+Wc13rrkqN5sw=;
        b=pWmqCdF1qibraekNr9/A5Xtm7gqjXrZcuXXcNuIrFzKeKvy8gg5WwWx0hWJWyG9zqs
         KEj47U1u6x4yewl7uKqVJMeVai7NdzIan2jRWvuQqP5yRdbPxCweZz1heR0zsnpERcnq
         xj6FHiSCaJzQi3/zBayWdCsQTnBxOugodHNUB35L/fS0sSEPTH9qu42kKRskq78upkRr
         sA6fPIdVDfAzoMhbTdB7AaZRxryVDcUzAV1Korkv02dwHEhoUj2bDXplTtxDbae0vFAb
         K1uWkhGnTf00TISE1BikTmjnZXFQ8J6+pKz3ybSsiyEpNe2qdWdvsMTAmWn8L1Y7bq+/
         reGQ==
X-Gm-Message-State: AOJu0YweYbx4IzxRLyYhAPokavMajtrW+l7kG3KWkp5rQhKNlkCTzXKe
	rikpJann5EbHa7pXzKRbHSM0IRK1mZEDWDK2Eh8v6BiHy5m0DBRgoNqU
X-Gm-Gg: AeBDievTExtIrfFWlRDgstvuP77xqx5T3nxoCbCE0A22aXtrTnrid6cAHJ/S78XgkFD
	1rtFZ0ghETL9H2Co4pItdQFtXblAk2x0bYLWb4/Goeles4dtRCqadOQkNXoDL3LnTyD+C1JBIP+
	bHUuGmDeSj/2WCelSjJVFhKed7+iQZ+wHavtUE14dxuii0bYttRmoHs58hkNLyHP1OIDuiOTLcJ
	HBPD3MXNc5VaUFkfw8AgfygCsXw7ArkE75VSMrayoHBNyDZ90qAU6PXyTON2xgY8d+TaHKdRlz6
	neha2nnDMArErQWhTEgCWRAWc236hGKUZhQn5S6kZMuZrx4Hz5G0undPtohPw67FjlbZ+xFr/Tu
	j8EowkOJSm1yN7KoesUWnm7wZyxuwKqU7odJzCJ4tXLZyiAp2SgdL5iiKAIe7u/l3txYbeq2RVQ
	ZIhmhN57+y6CQ0ecRSaHvPgKuW3fsHojIcx5Ba8VGlbJWSrkbqjx0itvEuPb4vprwnr1D5DLBiI
	VpCJAICD1CLM70=
X-Received: by 2002:a05:7300:5725:b0:2c5:60d0:703b with SMTP id 5a478bee46e88-2cbfa5be05emr10028670eec.14.1775576152862;
        Tue, 07 Apr 2026 08:35:52 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d1b152f3adsm2918397eec.20.2026.04.07.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:35:52 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 07 Apr 2026 12:35:41 -0300
Subject: [PATCH v2 1/3] ALSA: tea6330t: move snd_tea6330t_detect()
 EXPORT_SYMBOL
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-alsa-interwave-pm-v2-1-8dd96c6129e9@gmail.com>
References: <20260407-alsa-interwave-pm-v2-0-8dd96c6129e9@gmail.com>
In-Reply-To: <20260407-alsa-interwave-pm-v2-0-8dd96c6129e9@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=dB7P+hW2P2i24SpsF7yvWCHcLNtwvsI1lS/8EmcxB48=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXVYIkb9VKBF8Sf7KE93JkkPskC2HZgyl5C1fz/Hnhq
 8Q5cemzjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjI9FcMf/g62+uU1dZVTj1S
 wsu3pM/4Shn/g3v7Q1k3mW/YPuHVHwGG/7F2D+QVoy001vlccG6Yra2+fpp3k1pDw/qK+m3rKn7
 95AYA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Move the remaining standalone snd_tea6330t_detect() EXPORT_SYMBOL()
declaration next to its function definition so tea6330t.c follows the
usual layout.

No functional change intended.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/i2c/tea6330t.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
index e8c50a036bea..5341907b85d1 100644
--- a/sound/i2c/tea6330t.c
+++ b/sound/i2c/tea6330t.c
@@ -51,6 +51,7 @@ int snd_tea6330t_detect(struct snd_i2c_bus *bus, int equalizer)
 	snd_i2c_unlock(bus);
 	return res;
 }
+EXPORT_SYMBOL(snd_tea6330t_detect);
 
 #if 0
 static void snd_tea6330t_set(struct tea6330t *tea,
@@ -356,5 +357,4 @@ int snd_tea6330t_update_mixer(struct snd_card *card,
       	return err;
 }
 
-EXPORT_SYMBOL(snd_tea6330t_detect);
 EXPORT_SYMBOL(snd_tea6330t_update_mixer);

-- 
2.53.0

