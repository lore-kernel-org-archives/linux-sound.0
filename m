Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6854723D7E3
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134682; cv=none; b=t9Rzf4M9OdCngEH9UTS9548gTU5oVR4ebceGSR9K4bmSzdQMsUI+UIuwgBqm/l5mh6e2i63kx4L40IQ/uuSMSzOdz0urDs5Lomqwt64C2qob35w8l445fWpKFYCKubSKsuu9Z10OjCg9fn4koJb7U2Eu/GW6rGlCkctiVS3bLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134682; c=relaxed/simple;
	bh=6aWYKlqmLmN65SZrSdpzfteiFn/NWrcOVSYzCVaVo8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkUXGRDzYpLNpHks6IELJ+6khlBqnVIc0U290wvPVoUQawzw6nltsU5HsfotGrFaypznSdjGc8WGt25StRHyYQjiU4vTJ/7/CP1YrRD0cEazt/qq3popYqHMMhA9RqKPPidCckg5ljXJOrxWCJ8MuQG2CnQlPcnOJvIRBICPEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KYLoyNCk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KYLoyNCk"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so4277371b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756134681; x=1756739481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYv1SFw8KHRTBAs11RxrIjSXI0+Dq/l8nNXuXGxjK1Y=;
        b=KYLoyNCkbbNHWe05MTlksYWH/jJao9Nks6d8wYamyAvmlfXiZKeb1Og7Uasz0EbFdO
         rVq9q9K/MYiaRA+J31+sHtqEA8NaRlkc4UdSudsvJ3Hl+9BGLCZGoSBEbuQNEs+pc+iM
         MQl/x2ugqT98WbVX8DBqdiDRxyv2AGuQD87J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134681; x=1756739481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYv1SFw8KHRTBAs11RxrIjSXI0+Dq/l8nNXuXGxjK1Y=;
        b=FbeZwvIocellt+z/83MSh0UI7Wf5+kgd6x0Ulogj6d2hxfBPd4s2oI1dHjf06EVNil
         cs/b12azRSaAcdBWXBb4tTxA0Moi3+u99FsRXwAR+IfODAW3+PFz1tobqi6Lg1GKLhUC
         5lm6NQp6PvNeFx84uhJejC3HPgNfmfFDsnL1j4oY2d0ZO0Obr1TWL1x6vlYlA65XnBbK
         ulC2ozHgObIbPfG8G2lHRLKwGGgxD9mrRrspSI09mhQyJAAczWPIQZjVr4a+9roOjGol
         ruqeaGoRSk6ucs+Yqm6DCCOeZXSpjeJ91ktBO4wggTAM2Dlz0lwNo5WbS1lQ6/zzA/+z
         EHYg==
X-Forwarded-Encrypted: i=1; AJvYcCUWNr6PwP4IEz2cLg5vziR1/ABktuSuU4XBPN72S+sBgkI5SVmZCctuQH9HO7/JzRVrHS/dEifB290kaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3jzlheBT7hMqYFEHYGaTN4S2GABxqX6TbwIX8PNtoBecFKTLh
	oEOw2MswiTJ/KCFjNedcL99wyFhem0ZV1Oc64GXE8S5BXrud9hKbmi3l+tHXDHqZV09hq67HdWw
	5D3CrzCdq
X-Gm-Gg: ASbGncsefJDQziALcfsiCOjFolDNZf03d8dGizxuZiPbP22XZLzzOKLjBwBTW0ieKNR
	ntf4u+w9uAemfZHWGbvfIQL/SI58TQKm1qL4jtZn0YFe8L4SZQRM6iTMtk+D9cL1Yz0jcGnCVmA
	6+SNWmQONfn+El8piEMKJA2lx2G0cajbLikNc3onvwwGy6jR63K3nrqEGGjOKDAU4rmOCQvxaOL
	KgdJ++M0SG1QpFG98XzP2PHjfpaMV6llFAy8ZcZ+bsdY1dic11j18tI15b4zZIMD984yOqQ4gIp
	bb7ifPJRBgOQHDKG0glT9MV9yZf2IPzdqLCK5SInwm/1MLlYJHnNTOoTH+w6Puyco0fAhgxKOe+
	yAy9SzuHclvZX/G7zDLbEU+oh38Wc+CkmIbhb4lug
X-Google-Smtp-Source: AGHT+IEdQuMc4qvfjOIBTCp/6aJwd6EcXET57GS+m3OZRdtWe1hoQXNFWqvIycN2W/2OBfSyp1B9yg==
X-Received: by 2002:a05:6a20:7f85:b0:240:30c:273e with SMTP id adf61e73a8af0-24340c42b16mr19202183637.15.1756134680661;
        Mon, 25 Aug 2025 08:11:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d5a9:711e:13f5:e60f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb88fac4sm6956517a12.9.2025.08.25.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 08:11:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()
Date: Mon, 25 Aug 2025 23:11:09 +0800
Message-ID: <20250825151111.3696404-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using for_each_available_child_of_node_scoped() allows us to get rid of
of_node_put() calls from early returns or breaks in the loop. It also
fixes issues with missing of_node_put() calls.

Switch to for_each_available_child_of_node_scoped() in parse_dai_link_info().
Also drop the braces around if blocks now that the inner block is just
one statement.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Dropped unused variable
---
 .../mediatek/common/mtk-soundcard-driver.c    | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 95a083939f3e..a2a30a87a359 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -89,40 +89,31 @@ static int set_dailink_daifmt(struct snd_soc_card *card,
 int parse_dai_link_info(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
-	struct device_node *sub_node;
 	struct snd_soc_dai_link *dai_link;
 	const char *dai_link_name;
 	int ret, i;
 
 	/* Loop over all the dai link sub nodes */
-	for_each_available_child_of_node(dev->of_node, sub_node) {
+	for_each_available_child_of_node_scoped(dev->of_node, sub_node) {
 		if (of_property_read_string(sub_node, "link-name",
-					    &dai_link_name)) {
-			of_node_put(sub_node);
+					    &dai_link_name))
 			return -EINVAL;
-		}
 
 		for_each_card_prelinks(card, i, dai_link) {
 			if (!strcmp(dai_link_name, dai_link->name))
 				break;
 		}
 
-		if (i >= card->num_links) {
-			of_node_put(sub_node);
+		if (i >= card->num_links)
 			return -EINVAL;
-		}
 
 		ret = set_card_codec_info(card, sub_node, dai_link);
-		if (ret < 0) {
-			of_node_put(sub_node);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = set_dailink_daifmt(card, sub_node, dai_link);
-		if (ret < 0) {
-			of_node_put(sub_node);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.51.0.261.g7ce5a0a67e-goog

