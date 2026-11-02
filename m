Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629062;
	b=glqt6UtVn1NNu5Yy51ZcZf9TyVsMTN00bEjSyAvddo7caUNdEiylk7Eu0goau/rhX09d
	 EYh4aHqcR+wk4eacbU2I/2/Xh0BUpm70n9YLc1+Htx2ldH23OJVVzaTsNfMremdEAzjmT
	 cTs1I94HBoPLVSVx7ZgU9e/nSxFO7ZuSdsy5jbWuiWeXnB9bCZl3FDHpz7rPeuPbZjLyh
	 woUspWf0/V0OSMxz2AzCF5MOIqv6z9dSiEw0HeaWZRTVdnKMbn6JdM4hKdIivRq9uAs0T
	 ln0rZcrHlI+BRkLL5w/tvL5qwxg8jCm1vzF/3ODd/fy443B4zD0LOifpA6CMaWp5Ptg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
	b=pQHB3Tvq/8/GE44brWt//Mz6MSez+6NhglD5HZctzJoy+T4gvQ1tGPBmuD+SK2QZtZLe
	 KJrbr3+e7HFUnva894DVNYe0571epIwSt4NZIEoxPr/9p4BQB6FeaMW01RyrBfti1aNfC
	 qE3+GC2v+BRiVf+ZYHTl6RuFE5FWvGUQEsuas4OG1YzBjBwmBMC7A3VXBzvLLnB4fZMva
	 FpSKNj8G1ehJdBYZOO41x3XyiZe8khWaJH+ZJXEYV59ym+wuYa71rkGKBvtid7ydGeQS1
	 9nKidd8O+1OIGHYDnUo430qpXH2GvVu7zeE1I+25w0pgs444F/lL+y9nOa5fnQAEaSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MB5g2YYf;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D047A606B5D4
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 14:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D047A606B5D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MB5g2YYf
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1477473eec.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629061; x=1794233861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
        b=MB5g2YYfSrBi77VEYXi5srPkalEuUTgwV1Q/qpgAghOWntZTvQf7wQIZjhLlgXuQku
         DOf67WcjSrGY1Lnm1L9WqRcHzOIMnrp00gRgRUwamjAgAOmfVEvBeC0nxU/FxaXTHDi6
         E6T/E3jWEs+1Htu2R3DWuhJYSXfmmxsMNAU20amGHPhjCiNaxCh5MQnc+kdnpBXBY6FP
         NqBvwHQBBsequFj0+QGEtxWtikuXLkiX1nruuV7tTlnvypv/lSzOZvzF8rn5d9/6W1Wp
         sW/hLgKiMleDwGVeb02GwpAECEcJyg0JoA2IvJR6tBRmJ1EO5hAZKBSZTsq7lLDm2my4
         r4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629061; x=1794233861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
        b=qUOxJWKq6Rn1ziEPzaqP1Qn+FF7Odr5gM+orqDSdebQAdswz3KWUBHnSDojF60OOcP
         oji1PX72VS8GWtGV9P9rgI6RUJAJ5QSHYs4RuRKGl5HYHGdvqjkEvS/WyDU3MvUZ2adI
         HYdN3nvP0yvauSmdqB1dxitKUPARyPiGsXh4Cp8VLfmTzu4JFxyinjFyEFAppIMlBdQf
         Tem1tAShziTHNPxmanenjU0b4A/olSW9GdtAhrm5OtDDFxgqDZfkdEYFbL5uqFvZrypm
         wSKYMohtuArxxwacW0p3WBOKFweJJa9u8SSMg+nRSvbUpGU1IcQg0SdLPOZZE9exHGPZ
         Niww==
X-Forwarded-Encrypted: i=1; AKwUvBx3/NCeULYvqqhJF8a0U54vx0a87J5LhXbYC6n/CuFZF1fJpiS03U3HiemFfa+8Xtfgpx4+AfXkNJn2wg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JcrG6yE9+G6Gx56u6of6NWscv/qRc7yOA+LklJuLSrHpRv5/p
	sHCw1rEpsuM1wIXp8iCbIyOPvtK9F4Fk2UZNQvCM8wNDgq39L+8THvhJ
X-Gm-Gg: AYBFou0wPTnGfctChkvhZs660Zf6PfDaYJlCNmYXKMivt2Tftb+w9ITK1FLP3mMUHUy
	cc4/rJYcqJFYSp9kC14J5qqvAw8NhoV1MifVvBB7t9wwp6pWPL99dmNhtIqKFc39YGDY+iJ51Bx
	+hojPhf+D7+VdLMNPlPZoZiSvDMdTBWkRtJfEofM4KH7xkM6Fe3A7Vw8HBYO9CFWtaMQEzZ32b6
	23eUZAKRCgw7N5VAs8CHx5H+DOrRBLYnpF49R9Cb5LWBA1faYfmasUMEhpX3xhi3tHS3u7nDXJj
	08FJ1aQWMxWh8CyyUi7QHhNCuXsysrXNxrdQuuYOYWSxFUcglfCvMLlFsC8wfnitDf2imQIQAKa
	0EtUEDMo4bvSqZu3gTsreZkFRlVguldePs02Dytycxk76jOgcx5kdJcufYr//NEBab6AoyrrD3R
	hZ3x+WrGK2+QzHgLpiQ5w2mBRWhVgVW5cCth/hxxilnIU8RlpxAO0lAzqZtEkR7kj8ogBXdJ3m6
	9yF8RdE5m9ggxfwscKa8RLbi3c1fGHFNvQRIurgA0XRpGlHQjixX+iqMagmjvabnZDhly0RUnQE
	shXp8qXJKZYauw/ZVzO5R7O1CCgHPafUkLV3bxh6IjqXfm7yb48=
X-Received: by 2002:a05:7301:707:b0:36a:eee:bb41 with SMTP id 5a478bee46e88-36a422039b1mr15492683eec.1.1793629060862;
        Mon, 02 Nov 2026 06:17:40 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm39583527eec.9.2026.11.02.06.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:17:40 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: rosen@gmail.com,
	cezary.rojewski@intel.com,
	tim.bird@sony.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Mon,  2 Nov 2026 14:16:47 +0000
Message-ID: <20261102141647.3133-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Pass the updated frame count to the "src_frames()" callback.

When the next plugin handles fewer frames than requested, use the
actual frame count instead of the original requested count.

This ensures the correct number of source frames is calculated.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/oss/pcm_plugin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index acf5ca663ba8..3de713779993 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -604,7 +604,7 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
 			if (err != frames1) {
 				frames = err;
 				if (plugin->src_frames) {
-					frames = plugin->src_frames(plugin, frames1);
+					frames = plugin->src_frames(plugin, err);
 					if (frames <= 0)
 						return frames;
 				}
-- 
2.55.0

