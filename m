Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244918;
	b=uxLkNBVsmlTstfKtvrgY/Ug628jUgcYalvqu/bWEuw0vzbHL/ge2o2r+/J22eNWdXPMW
	 zuo1ActGv0K59EgxFNRwvoM6/kc4wNk5oRCxsQBLWucflkBSbY+N4/ZS7jpbqhUrzvPNz
	 I7voCgB8VgsyYVKoXKvWirPMQPgz46ZgMkS1Pp+GifgJbc5ocuQFtuCaBeH/Gz68eg7Om
	 O7BtjhFrEyERo71VJaRPd2iSImNPh+OMrDcqdbdjQ1YBeoMxHmPrkkfLSiy8yhCeGCP/f
	 UbeRWFAnE6DXISjAXnQJPFlMd3Bvnqpn5qmeEJmWaYRgyTO37EezujZg0EhWjhm7k0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FylPiDKpV6Uqon3wL6seZPAK0gj8Jy6XAVftoBAaEmA=;
	b=rBM9IyhkgJYALch5Y39GXHYxLPdYiCeGLOhrEy8bOOJSs7j1Cia21qv3IS4EAATQ/DwX
	 6Vc30EExVbat4ETz7ftE/54GL+5AhVXV2J+aFMDrFK0CvE+Aqa6iK8slf1F0wqLvb36ai
	 ID3+H/V0Vf4+zdDv3e8Vjhd+ArrRNTo6P5IbwhTS/B3lXhpjK219U0rom00XMnIOycYLu
	 wLJ7zM4Dcq9BBzCV+SMzSGGhgvmgashygOlONu/d+ZswmIu9MaBHcUCFB+AkWi1z68lw1
	 0eROGS53VXogHa8LAM3HsSKrV7aZlkmAvGjziRt5xgusKGxWux+FhD1AYmTRbRMfUtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7yNEmtk;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8009606A321
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8009606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7yNEmtk
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so891380c88.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244917; x=1794849717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FylPiDKpV6Uqon3wL6seZPAK0gj8Jy6XAVftoBAaEmA=;
        b=n7yNEmtk8n5vxuOaeRSbJVx6lI/CuO5X5XDdQmZZliEOordOtFH2x6FOluS6ijSLqL
         pf5NUII/6sv8KwZq1oCs7gTwm8dl2e9Ng3MR89cpOJ2eQGLe0vC3LkNtfM7oDJo9i3wr
         hg58QGCEtJxlEIHOJrV917HR5gtoqIR6ZCTvGQk/qaTaqVQwK7wttRzY7q22nrn3Qz+0
         kMkk7hyDktGEwKY+fiMOMwEpg9QW/iYwuNgRlaVc5R545lBkGQoT4pcsKwXFKDiFoJ/8
         AZacfpzRQBvrOfR3oYC69mz3YjZnjrYQwial2gizh5iM1iy3YsQSnl6QTTMsETj7sKPF
         ZfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244917; x=1794849717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FylPiDKpV6Uqon3wL6seZPAK0gj8Jy6XAVftoBAaEmA=;
        b=n8mfbEhSGCEHO1810DADSpOqYYltNz6FsyLM6JNCJhqvc6wpg2XeCcQ1G5ClJXWoJY
         JSXrF9ZXW7iRuuBFbjatU/E4Ma5q/nqklIwLra2j5D19gDxXUpCjme+8En2cM+AdHHNN
         6crc6Tnf2FeJlzwhIUIyGI8An4Dhy2y7wcjot9k4oy3QbPuLNSGqkHZjMOBtrfW5TE9Y
         dwSBql99Os13mNmWFD3p1SY9N4aU2D/b+xQZon91jlca3jV5pDLf5uq4v9d8VN74tjQ2
         2+4VHfZQr1CSBsN+BXy+Lw16xUND71W3a7vQ1F/0bWG4nOBHCps/U/73icS053spW8or
         oplQ==
X-Forwarded-Encrypted: i=1; AL+hErGzFxfWgNGDT53XGmkaEeh0TFFUZFcNcJYpxP8eY3E6Bu5WxqD6am5BqSphEVRPUKj1I82GwXYfm04zyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8B+k5FU9+X01RzIJXv8ZmFEHVqT7sRu2TQqiRMCr1qR+EeH9/0
	5M+mo6qQReS3uQuRh9CU2qX/cl9R0u4j3qRP43LSprA0GpV9pleb+loL
X-Gm-Gg: AYBFou1mYWR7OFHxtAyVvImuuaZePAqceYMxGdks7psWdJqlHcDYMuNPmvcowhnsPAI
	+vvYIimfTmgbxU1vXsZHrBlNTNa634Yeub1VwW0jhO4LulKuqv2n3LhbCVCkQhy4+gkMy5Ss6gj
	3V0cxtDTwtepq9Md5TM/KHMjqISEoPQMSVrvEtjnGzNFX+me+HiW5iOdOyLzgomB7vadsC7iDHa
	vSXIefXXwuzpp8dgSE+X7OhZSpzT5XJ1svotm5hwXa3u1ixbnu1GoKd+TWRS8+9B+rMPhdMh7fs
	cHLkNrYEvIny6vH7K1aK/HUNagCr5PfNQcyUTjvrK/GfW4afk0zaUmcxvustFZLFkPJ74qvfJJG
	k1CecOSoZQ3iMgdK+gKiv1Cxh9NUE6g5fPF54P7hAMZ45GNgrkex80ML7NzPD1AIZURHOAPbNHx
	K3NJf/1FAw026WRZL08KSbTggdHT3gBgOZquqgj1YsFe4wRoYYpwuzUy+2g6CI0AUdU8w9aPJKW
	Kf5jtnf3zYaJzH22kpM0+++2jiyvzTTi4f3cCnq4G5nBv/V79Pd8+DFwfJ8BQI0s3wTkmFHi6Nw
	/NKgJEDqoYDe+sZ43gJhhURW7xek78mIW2cMSBRUluFHlJsQ
X-Received: by 2002:a05:7022:3f0e:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1b3b6054c2amr123720c88.13.1794244915328;
        Mon, 09 Nov 2026 09:21:55 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm364288c88.7.2026.11.09.09.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:21:54 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free
Date: Tue, 10 Nov 2026 02:21:44 +0900
Message-ID: <20261109172144.1851173-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

rt5665_jack_detect_work() runs from the delayed work jack_detect_work,
which is queued from the jack IRQ handler and from the jack-detect setup,
and the jd_check_work polls button state; both dereference the driver
data via container_of().

struct rt5665_priv and the jack IRQ are both allocated with devm against
the i2c device. The i2c driver has no .remove callback, and the component
.remove and the .shutdown callback only reset the chip; neither disables
the IRQ nor cancels the delayed work. On unbind devres frees the IRQ and
rt5665_priv while jack_detect_work (or jd_check_work) can still be queued,
so the pending work then runs against freed memory (use-after-free).

Disable the IRQ and cancel both delayed works before the chip reset, and
wire that teardown into a new i2c .remove callback so it runs on unbind,
mirroring the sibling rt5682 driver.

Found by static analysis and code review; not runtime-reproduced (needs
RT5665 hardware).

Fixes: 33ada14a26c8 ("ASoC: add rt5665 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/rt5665.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 0000000..0000000 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4837,9 +4837,19 @@ static void rt5665_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5665_priv *rt5665 = i2c_get_clientdata(client);

+	if (client->irq)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5665->jack_detect_work);
+	cancel_delayed_work_sync(&rt5665->jd_check_work);
+
 	regmap_write(rt5665->regmap, RT5665_RESET, 0);
 }

+static void rt5665_i2c_remove(struct i2c_client *client)
+{
+	rt5665_i2c_shutdown(client);
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id rt5665_of_match[] = {
 	{.compatible = "realtek,rt5665"},
@@ -4865,6 +4875,7 @@ static struct i2c_driver rt5665_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(rt5665_acpi_match),
 	},
 	.probe = rt5665_i2c_probe,
+	.remove = rt5665_i2c_remove,
 	.shutdown = rt5665_i2c_shutdown,
 	.id_table = rt5665_i2c_id,
 };
--
2.43.0
