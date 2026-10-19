Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450939;
	b=M7J5kAd+Ty9tNPcesffEDUJKVA9KP8hofIUYety1jS6Y/BPl37kDw8qAnFit75lnUZsC
	 B3+oGjBtkmiNRqTGaXru0Pn5JlC7UkHWcnOlUQv0nSChH4aUWi6h/wXarVLHaR5jO/TfS
	 Y9shIfCM8xJjd8fB4CEGTzrDN/RYTNqeCAbOAEBmI6XgV1PwXv6BvwkYgbYOevR69PnkN
	 T24vw8I8fZa53HI4qcMKeDB1m5GViDKOIrA9iEB+8dwqhHhaYsQyX7PAimmTa8p/SqzfT
	 DHQBvCBbJC4HcgvUPgbsQzbApNw9SZbp1kVr39r1aK/aYRfDhAVCEBS04nTwx9xmulg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NKrau+m/5d9h8RdCs67qnCHLNnbCAHUHutvRJ47H+Y0=;
	b=JlkV6WWpAMEgm6NkcOjdzGphIV6MGHxwH22DIRNnwEceojPiEolaey/CE5ADcFXdgFwD
	 gZspSbUhLjMprlgDY06Dgow1o5xXN5mHbzEY+2TO2bChI0j+0bq9ToV7u4Y07qh/WiM2I
	 /MZQ1/QGHVFEwsiWID3v6V5TuZ6CfWcweABam/L4mvVZAI0IUSdaMxtm4ne6B0wGKCMH4
	 U3dg/89ttUl9BQTimdgrstsk5kkqZLHd1rkGCUzVuSFWESLGtN6I8/5VoaSndGWYsH1pq
	 UI55KgC/yyAnQsrYugocw5d/gHugvEanZBy5QTNKpzXLqP8gsUvMsSKOoxFTw0CgP/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W0of8x6F;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C794606A31F
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C794606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W0of8x6F
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4877837890fso1297205fac.2
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450937; x=1793055737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKrau+m/5d9h8RdCs67qnCHLNnbCAHUHutvRJ47H+Y0=;
        b=W0of8x6F8u/SNC/BAQb1Z320Wq4Igi2MWnorfjfmBwYL0YTiDpQpBPGwZvrQipoFJH
         FHNfsFoLfiy3UKH2naa9g01bL5+VianZ1v+81r5Lftbtx8CydJO8nyViz34TwbBF4zaG
         +yH2BDdp5k5Q78OcIk2/giDL2eDcePLSKb8aahidpHnDS/MZffjDqZC0CY5cD4mooZ/m
         0JzNgjCe9pd91pDFKSErzg3wOxT9w0nTerBx/XGWLChM6I4dS4Hk3zJ5SREIGMm9TQhy
         ExRYuFA1F9ZlqVrEj8hs3Volh1pt29mobFt91MhpbJ6XTqV9agEHkEqDZrfKhPvlhaFZ
         5Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450937; x=1793055737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKrau+m/5d9h8RdCs67qnCHLNnbCAHUHutvRJ47H+Y0=;
        b=mDhs+Qy3x9aAK0sfpeUZHorOyLnqajXUVeZcox9Vw2Ji7cuSAq6pbF7XuwRxolQyKE
         qpq4Ql0hFafhC9n/Web8huTqoVSRDBC0l6KQMsFb/eoMSc1lXYU/4Ae8gcl0vEMIMuuU
         LG3Ggd3Jy9WIKwHht2y9mAYgraORiKwQUzFXZ74/lQG8AJ0qk0EEDw+Q1c24guH8MCv/
         qAEyu4lxBuWogSUvNBRuJ5fauzIwiqZIWdoQao9EWlwN1PheylfMFdwiIdT4gJpxT6qY
         HhUi/sw4rzYw7oJxytjWq7ShZj7r9cNugqxfxSsG0CJwW9Q5dBjGZ9p1h+zJW1D+tACO
         /M7Q==
X-Gm-Message-State: AFq9FYKSEiUHXfMp6+0wwAKxNgSr9graccJ+HPdEzXzwe5SCfM9NfIi6
	BNsPhGh8igBUm4jVWco0Pt8XrxK/Xf80/Ho09rb7xzNjbJTZERwJgjA/4ZJmy2XY
X-Gm-Gg: AYBFou0O3llOHktiixyHtTpDKwAk/N/HP9QbB6fJIkCKTNt/6IWK+2cICg+FsJA/qvc
	30Z6+m2NoIIWqmgken589LJdBb2MN2BSj8sn4ToQylLvwgs5bjhIlW2dP3veiN1b2c4igOITtCw
	H/8kzHSq2AFCmTAFA/n8oJ1vbIYJEx+FfzFJLhA3KYjr5+vcXNVLuHM7nw1Ya57rHbzhGkjl2JA
	5F7oeQvj2BGcACBE/QVGhsRSZyQrScZL1uXsqFGaEKAFfyqO8CAAiVD9thTcvyercmYeRjFb4tj
	OMrQi6OfhdBuRdw3Wwf1c+TWm3wrZgtQfVdu4ls+5V36F0q4XFzId6tWARpKQZoVzfscW7AETi+
	iKw2MM9df8VsVS6KXEq0F2GlCjmRFJl3M2rbfJQkduX9qet8NHnSXnZWpHfqBaxAL9Nfd/mqlWC
	O/gXRwMLv9awbUXNKYZXUj+A04GFRggOjg61Qq08R1MQAmMu51y4NHTr6NTQum4+2jUzsd9tAJy
	8YIbZIZeUlRm3Y=
X-Received: by 2002:a05:6870:7386:10b0:4a7:6c8a:f47f with SMTP id 586e51a60fabf-4a76c8b0f0emr3569956fac.37.1792450937520;
        Mon, 19 Oct 2026 16:02:17 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:15 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 1/5] ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
Date: Mon, 19 Oct 2026 18:01:55 -0500
Message-ID: <20261019230159.834954-2-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019230159.834954-1-mrwillporter@gmail.com>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
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
index 98b414621..7795a5fbe 100644
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

