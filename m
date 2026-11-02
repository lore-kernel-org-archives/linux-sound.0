Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638433;
	b=bLLu1FgOohdEX05HbSp0kqWzizqnTU7DediEIseeKhWdd97T0r1WquADnCEWOko6zHTd
	 CSlqdEZMbJb4DhiJeWsHTDp9b7Htxbi5lHPFxFUUvSszktEshZoCnjHqn+Sht6M6v72eq
	 w5msohtTwG9VE7cW77bNtZicS7O2zV1+uXueW4Akm9Ts6AC1Fkbj/1pqTFHLxB48+FkfS
	 zatWxv8uHOoeslEaQsUS0itsE3dJ2S0XfGYYpOdKNZKSsTrLmOkmkcJStrbzDT/Y15oxB
	 JqUY8HIxLP2gb+TUTEJXVoGiFA4pmW4nYKry5SAvmoJvx7GMWrG98z/x9LHW752dYUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DK7v6wYvjpWGWACA8NpEPyZSTxrM2x1ZCEappFkN6jE=;
	b=GaHalpk1SBVJnBDpaqzK8HluU1/noAoiXnmLyboUsRFKta9Jks3QICLGD2/7RgHx2AWR
	 Y2+zDQcvulSLGkZx1wYYxBKA/QioZNnJVKlmjR1R/aEZQn/SJ3KJVNUbJC9tadkLwyISp
	 NPljmFptH5HfJ9KWV5+QdnypxfYnkXvN0M68XVFP1yO4MMhr3c3KWK6iLDRSAdX0rm7TN
	 lMbib8H2lbcf62SfkmUDAgx9FulAIjCC5dAR9n5+uwnHbfvLQYCQC/dVIhEzWtxGQSw+K
	 sVSx8Vv6/0YbBnnZPhDihimb5n7Femrq2xMeumyVfRRTrvaoSdyao0fYIR9B2Vqn3kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWGSDNLL;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C2607991F
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 16:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 107C2607991F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWGSDNLL
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d885929so2671452f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 08:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638430; x=1794243230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DK7v6wYvjpWGWACA8NpEPyZSTxrM2x1ZCEappFkN6jE=;
        b=NWGSDNLLPH+2cxYHnjacGqyQ2u8p5nMXfGILetA9gvSqfFXJVOIuVfB0WLP7qg567z
         ZK6WfmQ6c4giLDzbEFKOsAX3ZfZfXQ0uG7JFqklr5F85wOi+G4YXUrwzA7ij2/US6TWM
         PQknLieXayUVHYyTtjIN5RwuO2iqB3dQF0wyAjtXqKvz94EA7Avg6pO1wG69RsZFnI1l
         Z+tFOgU0UEHZFep040jTC5Fo33ePSGa2kqi714wQYOzJM1924OENq0Ew3vGM8d5WtYB2
         bGzDOGBJ6aJYWEdUHhupISXNA8jlUV+JeEH7RIrud3dMFPry1OB0AVeDbiFDfVNMN8tY
         gIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638430; x=1794243230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DK7v6wYvjpWGWACA8NpEPyZSTxrM2x1ZCEappFkN6jE=;
        b=xc158DqwRgHQyRDhMhLsdQvhMysEpHH4BzGne5LjRvirM+9VCugfckvkwaJ1uTMtFg
         umRYNLfvBRRp+AM8kpS4Gz05RUCHm+FsH+xOk/QBoo9/2Y1f6lw4APv0ZCatWhb8GKbq
         QjEe9wFOlZ6rmPIs9RUMa/Hr3FzniE/N54E/N22PDfAJUQXOfrZJlux6AFK+cNJQeHHL
         psBV575V9ndDSDE5wfGI596Con6jspcM8BPI4xlDAlrh1Byuloxb1ale8THQnLmDQsqO
         qxGj2DgvNV5aYDZcBKUCWJn4n26z3nTyW+Qf+NXBV6ZMN3RmijWYaad8BZk3ddhrAM3w
         QXBA==
X-Forwarded-Encrypted: i=1; AKwUvByINQdr1nTux6LWlq2uMdJNoTK9nAuRl/8/8Pd0+ZWs6tD9IQr/PmiXsFzkg2p4jZqChIAg2zCyAhp89w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7CDqoR2t1l12j9xm4YC2K3lzY757U8ftXy0RyWMsXrYPewh/n
	AY7FG/Q4axyesy9iO2FRdYVO3s5+/jmZKHV6NW6z5s9tRyqk1wNM5QY=
X-Gm-Gg: AYBFou0HiUb4saR9p1Q3fr0vKO8PHdC7pDxKF1X9/74YNaiVHTxpNXda0s4M1WgppMd
	oU2z314QkyA/mdON6w4VSnQIBLzW9tt/vYdBomy3tUvI6dpXZq0Da8lY3iFTDHRMEhqiyAwhs2n
	q7OQiuAoaqFxbZ8dL8+k0zEhroCnc1o9O4uoTdFv7RgeTPhVGmDpb1IqfkDNHPLB+OgPNDR+O8H
	dYUR6mvQJsVjudBaYFZyq2n9U6mKGPW412XifQmjbRR4ksX/jhtDm5IB/dFEtMCigahCENyv7bq
	mAAvQ/PVR6O9EsVtTV65VTmXRzkMU1ZNyL4CrY/3geNvLIQDLGk9Vdwl0L5BFINi7HV8r5akMkR
	MLaoN04REw9X9wykCABFLmnLOZtpEUfTtZXBOibK06TGu0p+R3iB8mdCsI6M6KYTQUEC6IWjD1b
	b819j+DyHqDEs6OEJfh91WARVsVxGwuR1DLJvDs0Q63T68mVuI1WZHn6p/C2IDi59AVkVo9yj1S
	0nAHsfjGP45ZjI5Cw4dW8nB0T/6oytzxiTN1nDopV/RYwPx0BHPRCG6fTFiZ4aaekmN5zQDIw==
X-Received: by 2002:a05:6000:4202:b0:48e:6159:8274 with SMTP id ffacd0b85a97d-48e6e4f500cmr23446011f8f.27.1793638430339;
        Mon, 02 Nov 2026 08:53:50 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm21479385f8f.40.2026.11.02.08.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:53:49 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	Margarita Olaya Cabrera <magi.olaya@ti.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v6 3/4] ASoC: twl6040: cancel headset jack work on component removal
Date: Mon,  2 Nov 2026 16:53:39 +0000
Message-ID: <20261102165340.1558853-4-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102165340.1558853-1-tristmd@gmail.com>
References: <20261102165340.1558853-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The twl6040 codec driver initializes a delayed work for headset jack
detection (hs_jack.work) but the component remove callback only frees
the plug IRQ without cancelling the pending work.

Free the IRQ first so that the threaded handler cannot schedule new
work, then cancel any residual queued work synchronously.  This
ordering prevents the race where the handler fires between a cancel
and the free_irq, re-arming the work after it was drained.

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f9615fb..826bde1a9ba46 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1136,6 +1136,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	free_irq(priv->plug_irq, component);
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
-- 
2.47.3

