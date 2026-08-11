Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58F0418340
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 09:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439192; cv=none; b=Uj4LcwrlOEJSM+b7QDy56KNGsWoio07XVKFLos+JkqxkDihmvlZ8Mtlr3ljsbLYeYZgPOoZCRMN36FEd8Chad+xGsR425OmInGQixg1/cUs5MV1xiyMnVFAfrbCQI6zh5Gnnm6cp0Q7/Pu3/2L8N2NkDKjJbCB6q/xmpivcHz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439192; c=relaxed/simple;
	bh=4mUojggEy1knp1MnY+PfbTcC4djrvXzQSYTre0uaYrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7Efa8YHTQ0THCx8shDopbEUQ/BhaA/CdT/7Mlt5VPuvNpBdKQ6OR5LySegsRdXGpNyqYRQVODr0C8Yr5dgfb85DVZu2YeqvqSIcmz0xS6Bwn2h0MQU0HQwQPJrlfOzDI8fy+Tzx44PSjtFGwf3uh+FmJnA7Zch+iLLhz1vjeXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fipuMWcP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fipuMWcP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccf2360620so25968095ad.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439191; x=1787043991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfzZGWrbIuaZkYm/++FY2BeY8xbOOs6ZKnXqGfLmJ+A=;
        b=fipuMWcPupOK7rrlmtLknwjIBsLUww1pt7q4d+Ku1HDee+3O5AR2bq8qwGUSVzjW0Y
         PjzytUGhxe/xUq1Gc1M8zThbeZzPmnUnsxyOGgzAltmCsfyIs0vdA0sGupM7cQeprZsj
         fTJACEHm/xICm/oGL+Q+4/ORSHciaLKxpN6LVGAKWRIodTYN0Vl+Dqv+Eksz7VKXt3F1
         tU6ZUGQZjibrKrpG9gF6W+h2ylMuaKgGzA8WQfAG/DOc14p0V05Chl4K0zIpFytCA1EB
         ihtPkVwnN6h6o2608BDnHWuWmhvP9kpnMrDRtCDDSkRhKlZbVR3pRVXLpt2ggbBCLmB9
         +BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439191; x=1787043991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfzZGWrbIuaZkYm/++FY2BeY8xbOOs6ZKnXqGfLmJ+A=;
        b=LSze4KqnAJR7vxcetn6zbvM/7qlJgfcBgfyLVmPhGxjZzTILBQJ90IWgyfaMPSF9UV
         4Zmnx4XfhaeAheZnr53eYlgVzjdO/gLAiGxcIfGmY09moIc4D5JKNuX40P5pCIEKmd5m
         2NBBfIeSGKnA2WX+4UnZkmnlJOj+HwUsmRJzDzNP6qpwb/y0ZlPpYt30Wi5Nl819ikRp
         e8VU+6sWkIqiLUKsBw9zugQgJvJyOFG/LZYB/0RYo1A1y9Feop9MqBwuy8YGBzzGolpR
         8puUvlc2IAN+B1GC32Ulw2F7WXMGBBwHlqw2gnj9vJodcpdnAaw5c5ueq0MnBAVCqV1c
         V/9g==
X-Gm-Message-State: AOJu0YwaxYgyD0FB/Ez3ZxxeduWyr7EzhThKX7oIBswFj+HjMq/bykQi
	hpZ7ZH3VT5GnMylkH5uhgbpiJZpcZRL+xGzVFYbWNgp/kAfQdUv4J+Wl
X-Gm-Gg: AR+sD11RTLIQumnM+YKUK0DaRzR7rzRMFDZipBTWIxNLhFhQISJsyz8tQb19x8ulnE1
	vbQyWyd9zNC0t5Cu/xfjuA8NpccSRcytGHNeve85wr6pEOpefC2YPQC152D+gXXKWjjvmjmHndf
	8pZPuqTw0BJdUVWGy4zNbSRPp+5I5rZ2tjHyJajULNll6CNoEieFuC2i2tVzDCWhc4Lz5/l1mZG
	RTYRe1oivlzN57FnOhHO7iD23iGyRtnet82ofn0QWItrKrdnxWoGSlsM7a32mB9pZUHkxVEhUwU
	rzShgMC/vdBKeDCT+50htQYxBNp4kMYY6KA8mpQI23s+pMA5ywrxW2V8bmp3RljG+OGAaqplWDl
	l+XRu0R7cKa2vWGkFFpNnUsbFSXINPeGi9E97mTxjRcV619B8S9VPbnYBgc8XCxc7nvqyCtC+zD
	iwByy5h0xj2m4QOC54C3K5NUNGeIPEcCgLBjJVafUWejfPWhqXBB5S5ShAqikXNuQ13vmYED+qS
	2Kqwz/BJaWfKKKUFJ301CK/UqESCKU4uzgbTojA9X0G/T4tnB34RGHby4MSUlw9HOlZRNlPdmMA
	pzVo
X-Received: by 2002:a17:90b:3d92:b0:38e:59c2:cbc5 with SMTP id 98e67ed59e1d1-392ec73153bmr1690736a91.18.1786439191056;
        Tue, 11 Aug 2026 02:06:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee41936asm1128999a91.14.2026.08.11.02.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:06:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/6] ASoC: samsung: tm2_wm5110: Drop redundant probe error messages
Date: Tue, 11 Aug 2026 16:05:50 +0700
Message-ID: <20260811090550.38930-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811090550.38930-1-phucduc.bui@gmail.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/tm2_wm5110.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index f1f59e059f5d..f4912826dfd4 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -518,19 +518,15 @@ static int tm2_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_of_parse_card_name(card, "model");
-	if (ret < 0) {
-		dev_err(dev, "Card name is not specified\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret < 0) {
 		/* Backwards compatible way */
 		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
-		if (ret < 0) {
-			dev_err(dev, "Audio routing is not specified or invalid\n");
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	card->aux_dev[0].dlc.of_node = of_parse_phandle(dev->of_node,
@@ -609,10 +605,8 @@ static int tm2_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(dev, &tm2_component,
 				tm2_ext_dai, ARRAY_SIZE(tm2_ext_dai));
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component: %d\n", ret);
+	if (ret < 0)
 		goto dai_node_put;
-	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
-- 
2.43.0

