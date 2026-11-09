Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244925;
	b=x6CT1mGC84Lo59aM4Gnf5KbIqx91EKgUsS5wiYECKR9gx8kPTXTWwBQU7n2K/xBtj6eN
	 9SRc0CV0u3fvJnWBRn1NjDhuB4HS5DHBYSqmiEyPD2hwTyVHj5hl4JCFTDYL4PmL7NVjP
	 qWpHGytoE1eNnNKpFwpq6X0MoMbKX2PtZww5zu+wQrCzAeNEbRvdxfonj0eMpwMiy8MV1
	 FYjNEzFJDel+wLgvdnmERtDrhzjEBJ4/WCuKL/wgBmVq9Rd5p+1VH27jQdI0zF8FKdA0i
	 xKwan42+P3bn6x0Rw2XiF8c+lJbTfdJpG7z5NUbeip6ke9zJTncShJdTPHfLiUd3p5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5LpgpL2Vm/swkS7qZWB8wOpeYfhvv54g4ZTTBda+f2A=;
	b=FCGQmw8EhaJcPsBtI6kAJmzNSRGK29deGYPSsZP6RlM/AAHNVRUE8Wrxszx9kEvxZKf5
	 j6kYttLKp7OKnyZmNLIqIGMLbUo9xRHRsg/TxChL0SWpwwYua41ymYG9gCLWZ1A/hS6NI
	 OPApdIevvIalgnjsr1UjjrIVKZDkSx5uZrQ5GLrLZTd7UzHi3OGEqrEtnOhSk09jUHHAo
	 VgS8vccbatgVWgmWxFBNGa/GvhJrb+XvHftqK3A7tu9OQrbnw/3XdvMX8fDek/3IjX3IC
	 dLgyHhnA1uH7+Wua43M7U+xMXo1hAuOE18Ypy9UrltncwKOqq2tEIdWl24NcmvfQM/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnCtOysC;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA50606A330
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA50606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnCtOysC
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3ada81853so869629c88.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 09:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244924; x=1794849724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5LpgpL2Vm/swkS7qZWB8wOpeYfhvv54g4ZTTBda+f2A=;
        b=qnCtOysCu33I0l52a/q/vUnN8e5/1zgL//hKB8axZuVQzgUN6DsejxbLfEXNQAOcRf
         fFp77Lrtvx75fLUGAYXKOnOd8/5FUoavr3Gb+V/c1B+kAjIwfDYrtB2uZVX6fbW4+2+A
         4ObxNM3cl9ALgwQBTkKPvu9gbWiLjPzt7hvi6aO3/ePOgLQZaSu7ZxII4TLTiPY5OtCf
         nhnGmWGJf3a9twzDffAFrnxwwi5/e0k8VltJ0PqVL7+jNRirikmb7XInS2G+s0R1j145
         Ny65dFX0Qrzr0LKmKlKoOAAok5m5GXnQjPJ09GgHMQjKDMZDAVntkZWM4DkLVZ4ciWZZ
         X55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244924; x=1794849724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LpgpL2Vm/swkS7qZWB8wOpeYfhvv54g4ZTTBda+f2A=;
        b=QEaFiZrc+0k/PMBSq2Qj2Iw4fBtLqN1hbaZgb34E9u3gsPPW+Qe6/kaoATcPokoJto
         gCn9bQxc0mjQIe2b+rVUBwFllSXmxAarVwoE6j128mKVq+QAtjeBHYpvxDHi+Wq48GUo
         +ozyUyEPywB9jIaegseanEirH7VDMxscdc3wa/GfPhjoCwuJYH7SIjWw1cj//F28Y1lZ
         QkMehUiNZcYZVipBql7GbZ8MWqjWZEpfQ5AbgS+10pPAImBeYnZrUutLoQTZVGeJcD/C
         t8ln5XrtX/xQHUiXIPE+PNwZ1Pgh3Q9hZ/RhRmSl8PJrFmiLPEz8BUXJywEsE4XY53i0
         BsUg==
X-Forwarded-Encrypted: i=1; AL+hErHM+FIOOlKwZCpEWrKFI7+qeOf3KIa4cCoEHUNM3CUwUZmUvlOX/eJM50Ed4Ol2QSevIP2kDlZgJzy/bw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+gl8itZWgJY8jrv4yHfbos0EmKuD5rOpRxmoG7eENH1BUzIGZX
	2Es0apRXvJCvg1ZY8LUzws8r3SvvtE8Y7j4jB/v6etP3FG1jJnjAr8mG
X-Gm-Gg: AYBFou3d00DAqUdv8BEOebVBamce7ff19N25VVNpklPqGolR+ddXD9seB/UXEHQjtCv
	Pr6wZMkmY6TsCmjrQIu7Ri5kC68Hyy8MLwTfR3k6078ZPnXbrajZiMilrSQyBe8Qf/gBYHCoLgM
	Z7dG7cz1pu003/gOzrHtlF++ETangyDYUAWmWoCVsI7Hv9Mb23cwAKgIRybdXuTkwbIL8WmlVJg
	HnK+fUJkE1fBE2qqkzNTmK7aMpdnyV4UoKWkh9/aMuyiWJoPDBeHeCBHGYPL9VtDRWQrmmhgDir
	DfkJmGgrbhW7bA4+oMY7BMsmUz4tEOh6t7/VuMiMg+Oe003tLL3I190qU51ZCX6vQ9z1QuRcjkR
	CMS/fcjTy29IlhsXhuTHQF+F0FEG3aZMKVNkPXWSTcbbcbl3HFgo8wLUEGKr9N4T1wGe8s1LGbP
	P7NqU1hWR7swYBf7Z/vV45LwlMyXWFfTrPWy4I/u7qVkenkgelHpZvV+4RgNcivnw6hmFcbv+1m
	3WqTaa4edaMNjH6rC0Y0+/Xn0cspqU1mtT8fPzAvlCou4leLmw5MWlpYTmMBU2JyAQFYYM1UvH2
	Sx5sBEp9BJiZgP3I0kEzl9/rBXV3+IfyrahtWLFRMapbyoSu
X-Received: by 2002:a05:7022:b047:20b0:1b2:6855:997b with SMTP id a92af1059eb24-1b3b5ff8c21mr129142c88.25.1794244924205;
        Mon, 09 Nov 2026 09:22:04 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b54431sm285869c88.17.2026.11.09.09.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:22:03 -0800 (PST)
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
Subject: [PATCH] ASoC: rt5659: cancel jack detect work on removal to avoid use-after-free
Date: Tue, 10 Nov 2026 02:21:55 +0900
Message-ID: <20261109172155.1851386-1-hj351016@gmail.com>
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

rt5659_jack_detect_work() runs from the delayed work jack_detect_work,
which is queued from the jack IRQ handler and from the jack-detect setup,
and dereferences the driver data via container_of().

struct rt5659_priv and the jack IRQ are both allocated with devm against
the i2c device. The i2c driver has no .remove callback, and the component
.remove and the .shutdown callback only reset the chip; neither disables
the IRQ nor cancels the delayed work. On unbind devres frees the IRQ and
rt5659_priv while jack_detect_work can still be queued, so the pending
work then runs against freed memory (use-after-free).

Disable the IRQ and cancel the delayed work before the chip reset, and
wire that teardown into a new i2c .remove callback so it runs on unbind,
mirroring the sibling rt5682 driver.

Found by static analysis and code review; not runtime-reproduced (needs
RT5658/RT5659 hardware).

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/rt5659.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 0000000..0000000 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4319,9 +4319,18 @@ static void rt5659_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5659_priv *rt5659 = i2c_get_clientdata(client);

+	if (client->irq)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5659->jack_detect_work);
+
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }

+static void rt5659_i2c_remove(struct i2c_client *client)
+{
+	rt5659_i2c_shutdown(client);
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id rt5659_of_match[] = {
 	{ .compatible = "realtek,rt5658", },
@@ -4347,6 +4356,7 @@ static struct i2c_driver rt5659_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(rt5659_acpi_match),
 	},
 	.probe = rt5659_i2c_probe,
+	.remove = rt5659_i2c_remove,
 	.shutdown = rt5659_i2c_shutdown,
 	.id_table = rt5659_i2c_id,
 };
--
2.43.0
