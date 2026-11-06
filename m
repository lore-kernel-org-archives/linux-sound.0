Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982759;
	b=Vz/eC/yJlhzS+TO0f0BiG6CUAhJZ1oSa0fnEGgYofY+B0c4e/nniUfCwyTF0HC5rdzG9
	 4Q/lsvKxnlGzsMwavM1PkyFZDhxh7bVf79GRX65L5K6PfMkNbLWMfTWqS+sDpH5n0DOrl
	 swm80XZxKgigo4j8jgM604FgTBcAmlMqwMy9xR5UzvPe9HXwlOXJRX6sEQV4hpo4+hQty
	 6GHsovzFIGFoxJM7ZeMoJYSSwP0yCjoGlly7V4FebXWon5gjiLyzd5ru0bbc2TsJKo5BU
	 +6p9R4+aNRPSoIXMhbWxv4VahInahcU27HBdK/fuma77B21ONP79+qb6oKlyyXKxItQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W6wDRrKYlvSdFdo/6Pq43f2CydF0lOpQke8PFneBF7k=;
	b=zhODn27QxBBnsUp65e4c7gkYqibm9HnnSeb4GQEuTZ2Va7q8M/S+uO2bNZPDl5/J7KGL
	 XG3SmkeW40HlraVIaUw5K8T8TcFCQxHMx/tqLF7PHKYx04p4GKCxZhIxfx5q5AftBVDgA
	 A4FBh2hUITvepXg2UV7ytxPMQXQxO+o573B2yCFp5+LPpqVMcLx9s3LXKsfDaZQixCgzw
	 fRvyWVU4l7J1Zw4V/w85+atlA+QS2OzK4AQdYcHnKzZzaMXX1v9+km4IIxdByrGgOtXS1
	 coAs6G3CWQwJk92QyOgE4BHNFGDt6dldNXWoK0aGdOs5uZHaCtuaanjPZm854QISbxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zdk7R/cd";
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280A6082BD7
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E280A6082BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdk7R/cd
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-847ac7ccd85so525520a34.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982758; x=1794587558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6wDRrKYlvSdFdo/6Pq43f2CydF0lOpQke8PFneBF7k=;
        b=zdk7R/cdAi3Tcf5TOPoUk1ckl7XL60ET29u7HpBrVCosyQdnjKUFOxrn/k1FAdIuX2
         XPf0KkoZeL4IpSOb7v6d5eiwCDHWuH969J597BoUnIsES5KYQgAds0bvO7wJMgNQi3BS
         QYSypnhldRMTo0fjFwuImFH8XpxWhx3VYxaonUqGzXEKZtpVWwIiScjwmr8bMemOSDXA
         BpM5MZP+EZZWTVQ4WdOpeWNH82Am/9yjubWqluM08hbZfkUMMXK0uF459NV2aYvHdFhv
         mJWySTHFe/gDXSr4pAlti/Dyb3XrugjgUJk5Ru+U5Hxypc/qbicg0kBsoJMrhJaQGDL7
         E4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982758; x=1794587558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W6wDRrKYlvSdFdo/6Pq43f2CydF0lOpQke8PFneBF7k=;
        b=DJaercJCFaBlJjfdbVkc7np4xg09O4CmRYg3TPMe2UBZH3wScgv1F2B4fi/Yt1CSU2
         AfVVcM+/IIizCbrLM7nsd3z+gOHl+l3u+gJP1c23DM3HsDrnK3rsBJQzU9ySGwo3YX4N
         l/Z/98B8T4ypHgN49fR3aMh8mN8LiWs4XIlpMOdvuKZIEKTQcnVF4UiQcjieAk1Wd10j
         OdAt71wIC92Z49CnIGl+pX08PgP1T4qiLDRaymlvlhavU6Cs463T7A5WaW8RCi7a/C5e
         r93FvbqqA49c70s3XBHKXu4ov6zmPooPkUVnIHfTLBuPjUiljnNkW+qXkrigezWWjDlk
         w7RA==
X-Forwarded-Encrypted: i=1; AKwUvBx3tvP9CAlXV1D4tgrVCNsstsjQqNqIrVfvSdlBY4OK0QWPLTZAkPGTPGo9dygv0pGU2CgAT+AM8pz0gQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/V67Vym5RGaezzMzM4BN3XzjssI/qdPsb/sMBpDV741lnOShnR
	47jkid10iAOZVKMN7Y3oIFKfJKT++fGDaiSZkSO/QmzUjk5rCwhdFyT3
X-Gm-Gg: AYBFou1MuLckyobedFNr4ETwFRchA6xjAot7BLzbZFgEep/vhHJ/yq6ubyYvo1G81E/
	spOXpNl8f/DIuwcFwVMaFXma+njR5O0R0wPa5eLW0t1ZIpbcaKooQBEv4Qug0q9NpnL3V+bwBHv
	0Nf9pPiF0A9k1wdBAedWyczB4D+x5vQcUWct+UNJ9EfF8n8GllKBrCfAGQGeswnCzLk/OGL5G+2
	dSP09L91xb3c1aZYvCjMZbjv2thJMapKw+wtOE8oLtZdc52AzlZ6oB6LvGTOSgy0CtCiEEmSAkO
	+r4k3CLvyKC0lKS8fPNGnZ+PATF2iZfF3PGWmbpMopjByMbrr11lSP2+1qBajewOsGL3FPsrkvq
	07ZiKMuIIIM2xt+ODdCjf2UCiGgSuvIh6m8YsP4CEbFp3VvCY8hWch8OymvipOw9X7ZNnx75HuC
	+xDVI1HbgNSfPc/KU6G5vx8ffibZpo9YFjd3IeQqBcr3SYRdZyecH4GMt19zH/W4/POG4zF0Bbc
	8dHI/c3gVwMuhGhXkjewJEa2ENb39X4Q3MaoTrlay1L6gdhxIZa2H4y/Vu7Gcr0oDem5l8jEk3L
	UkPuMWJ5MWUj8cWwliGs4K43U077SLbsPLC+xJq1KYAXxQ==
X-Received: by 2002:a05:6830:2315:b0:843:cc20:9d07 with SMTP id 46e09a7af769-85f1d03b0d5mr3147810a34.16.1793982757769;
        Fri, 06 Nov 2026 08:32:37 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:37 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 14/16] ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
Date: Fri,  6 Nov 2026 10:31:27 -0600
Message-ID: <20261106163129.1006907-15-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

The iD14 MkI (2708:0002) and MkII (2708:0008) share audient_id14_map.
Later commits add MkI vendor controls that replace some of the generic
MkI controls. The MkII keeps the generic controls. Give the MkI its own
copy of the map.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_maps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 98b4146216ae..7795a5fbe382 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -526,6 +526,12 @@ static const struct usbmix_name_map audient_id14_map[] = {
 	{}
 };
 
+/* Audient iD14 MkI: model-specific control map. */
+static const struct usbmix_name_map audient_id14_mk1_map[] = {
+	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{}
+};
+
 /*
  * Audient iD24: feature unit 12 ("Speaker Playback Volume") sits in the
  * monitor-mixer branch and does not apply volume to all of its channels;
@@ -638,7 +644,7 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	{
 		/* Audient iD14 MkI */
 		.id = USB_ID(0x2708, 0x0002),
-		.map = audient_id14_map,
+		.map = audient_id14_mk1_map,
 	},
 	{
 		/* Audient EVO4 MkI */
-- 
2.47.3

