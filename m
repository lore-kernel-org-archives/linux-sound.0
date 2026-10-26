Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013739;
	b=QvERV13cEWM0aoGk7NJiwufqd/d+J3HDHVFPzX1z+SusonJ6tfTjF3Ge809NvPFgZjzw
	 a1VHGcgEVwb6YOBkbU8m61ucPhJGq24sei427MV24qDhLJzMTlnnXtc+MrmkMP26IJGy9
	 60lQyXSHn2zR5jueFeUE/VMdVAlf4uSudP0qXxiE0uMrrGiSK/1H47lcPsZLXBOlWvoQD
	 KIzc+nQ7FOzCOpVHi1Kzq9V68zVTEwFYE8IDGAXHUbyLnwqHpriG2k8kQpPXi7uheNNnn
	 Zy38ANwy/1K6kHErBEd18xLgHvBWMz0qTPkflm6nCvZ2cwtGME1hFEYb4AUa4ys9mhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s4qQ/bFBK5eaOJIStGYxhCTOPxN89dq+twzU6uM3Z7c=;
	b=ULp7Y3gLWgIAFOtCrTudeWRy2ZdkTwJtbAq46pkW8hG78xZFjXXGDEQwpKTsJuPrZGUr
	 oDNsLGi7j3jjxvO/thjNDCVg6GwcGFbbx4xzvt+CVPqlChbBSqRhaC3o+7QscjEQqGt4U
	 a0qRIPgDrMVv/Y0iDyxjLuvBwMj38rIZDu7k7T8VXi7UBXu11b6EJfUUfoGrFW88gyzSG
	 cmdynhE0eMtQiJkOts5aps77XoKtfwZAlE0q5wRiJ46gzX9ILoyoXPjjenN7VCega33AP
	 gHKdC2TqEwTaSJU3F+8H+lGe1/G8waY/87T3r0Ku5vmLvKyoc/4l1VXzO9TX3QU30rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MoyEVzA4;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4360A3812
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 11:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD4360A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MoyEVzA4
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so20114995e9.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013738; x=1793618538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4qQ/bFBK5eaOJIStGYxhCTOPxN89dq+twzU6uM3Z7c=;
        b=MoyEVzA4BlfgrZmr/+xem5km/GDXPU4lmttZ/MbD1CCdRKwUQ6cUTdkFM0JJwIuQ/e
         fi0dECa5qaYr58c1v9ebxC9HUXtLgrX9gQOGOBgJm6IO71s1GRREbVuNEZloj8HoDj4F
         5fseC0ckMgoARaJfjYociSVZpwAz2kxIhT0p7S+trrjPbS8kEpjGDWZ/VBBSRfoZLb01
         AgXRmYO7JGaZG5xy0jfV2rH39aRBLq6j/vcV9ETaGxTafXEp2uOjE5hCURUPJC1iQci3
         0aPlWA3zqm3+o4Rz3MlCyMzmPnJ9SB31zbDKIy+UPqW4rlpuNWlXTqCssRoa+uHeIb3r
         jJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013738; x=1793618538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4qQ/bFBK5eaOJIStGYxhCTOPxN89dq+twzU6uM3Z7c=;
        b=lrhZk6gnOH7TwvWmyy+COIHAo5sdUooC7juXedpbjkBYpTqSQBwY0//Cxl2tBbrKxW
         +1RYIdbkgHrmixsezoltBtizUT5B0SALPmIKzIBsAPAfIaVfazjNoHWOLEOsXWXuLTvV
         LseRDUd+zw4DeUU1CDz2qWo9KLIPc9rNTbmEUVEIae2NvDdrp9yqPs9eH9A/1YakzcCV
         zNkCK+wjrh4wETTXVcaXciGtA7vBNZC3fZBCbKtfBglKCJe6lgLZpW5TLUiqjZVUgklC
         yEE8M2xdqtAv2HZVp/8wkyc2QueeRlPB0AUCz1w5qwAi0YqjTyBADy2vH6J8PAE6WuAQ
         /IzA==
X-Forwarded-Encrypted: i=1; AKwUvByIY0MQvzcGvkP6RlsX116pqK0D3a1KywDv0YneN484icCi6K3ESrjCwwg+A3/Qxw5Egvuqg/86FFyHNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9nQIsaqQYZw3BBYGjAb0SSeJg4GjA5Pvd0kvX2HotFGH/ic/q
	FcL6ubLkKUE4RJ/Ra8/gBomily/a9rJCO3Oid0VAJ5AvyHpXbLxCzD8=
X-Gm-Gg: AYBFou1VCc3Qm1Y64D7dX73i6d3LMzUTK9WzuLdcAJDchfZ7lcoSLOxoDxkAfaUw0Sv
	b0meJ43rXE0QTDtoLDTpzET3CUtVE8vPnGYCdqxBavrl/Oasqd+H6mzUaMMGuCiK2WnjPWFaQXu
	rAxSYkv7+wb6sYcepp+l60mxOgVdU2c9AhWWW4u+PdQyRt2e55qX2b6tgz4+4ocvOGLbBId2jSy
	VKCxKMz3aZEjmHYLqKzTG2oFMEXAFlyItMM2T/WrHTEmkQxik1DOCeBqj1T7oYb8z5UfqNLvAMk
	ezGHDjuPxDkh6HGZ/DF/CiIcDpfvg9F9ZUbI7IE/Q/1URJ6F8Bw/5thC84ZqdbbcLHVrccdhfwy
	Hs6lTmsg7aqkSgdMfFzbZOjHTl7c3w++rtP8WAQ2IF02YBnr39DwvpCCaKFdcb2ol+mM8+bbuOm
	YmEr2YuUB0HVsi2eU67JjHpSwUw2Wpfk561ijCoxMcBUh2Rolb8QjXEraHsaiGV06EyI5KTmwtc
	zxOzrSFFV1zTTilJp8/ZRyucz4H5CCZK7c/6fzsnnCloQ==
X-Received: by 2002:a05:600c:4f05:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a35ae71b30mr134739435e9.5.1793013737744;
        Mon, 26 Oct 2026 04:22:17 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:17 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 3/4] ASoC: twl6040: cancel headset jack work on component remove
Date: Mon, 26 Oct 2026 11:22:11 +0000
Message-ID: <20261026112212.2519775-4-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112212.2519775-1-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
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

twl6040_remove() frees the plug detect IRQ but does not cancel the
delayed work that the IRQ handler schedules.  If the work is still
pending after free_irq() returns, it fires on freed memory.

Add cancel_delayed_work_sync() after free_irq() to drain any residual
work.  The IRQ is freed first to stop the producer, then the work is
drained.

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

