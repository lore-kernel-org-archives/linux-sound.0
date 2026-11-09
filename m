Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244905;
	b=Uvz6+nHLvlRqnXatMnzMa01zEyA3L3ohcV1RWgoXH57HE5icHMKNAedn7FV5hBacMsE8
	 AjLjoGlXTA1RQHb2Tty/wwDsS8rQd8q2t3F1z8pbocTC2xg1S3ApWAqHKDqGd6H67XkIi
	 bdjoimdFlO7woJL/PK0ki5MkArhwUlMT+qH/WR1OEvVaLLh5aGByTb6qZJZll1nxs8YQW
	 6D3b51blU5J9bYDqK7be7NVDC3XteMtzLFjKl/3cKr8E43RT4z1BtM5zUEQcXAAk5JYX8
	 kgElWxfpKrRk9VZF67dow15rNMi7woePIEbQPXsqqFmrtZlUAPR+HfyuqRrk/y1JATA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EYatP+6kphd4sDxDGzxqCkF4Bitbwr9mDBucDIlhFks=;
	b=tnjAaAa7NGRTrQJ6FQNPIoZ/4myl1npEGivEhv1x55fUrRq2/4Sx98/rEduWNqOcOgjQ
	 g+etNBwUsysVUblkwKtaE6ADat7CDqtLybCUXhEWpSFhxebRHYoKs4FrkO1iIrN3YEVEC
	 DVJbMMkkNPtChEQs7eX7UbjEICWRyeYYS+1/aXmzWsZLP/8hwGYfQQSKefY9Bb2jNb7GL
	 DuP7XRldiaHqilOgFnSocQ+PQB7CYM9veJnELQEN96U/Kxw1F9EX3H3G/GnhxWE62C4DM
	 6f67IlbV715K9adi7anzP/mLHA+tNpJAEU94lQrmjK5eUrIukFADLXUhuKqpxzq+p1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlUjpfwF;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA9606A333
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBA9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlUjpfwF
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2217036eec.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244904; x=1794849704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYatP+6kphd4sDxDGzxqCkF4Bitbwr9mDBucDIlhFks=;
        b=VlUjpfwFh7SM9knIKPWquQkjWd4L0VGLqKxIuu29C5PXA8aus5Er5PaTadj54NB3KX
         JRQKh7kKzcFc8NMkgL+yz6tjt5vD7rQSewpK3D/mcZ2RVDbFxxG9ILW1ohvgF/zcumGe
         34RBYBy6ZDuplsxD7JZBNyhXRtL/SnR3LQkEe7UnMVTfLTck27ow+POHGdmhcgX3G9Er
         r/rtmHeXiLH1EB/hO1ZFl0PPbnqa5e+wqxnxRZTz1FnRhNq4j4A/rQKczew8tskUFI41
         PPQsZQCJFOiS4dKpyo+5MMishhxhUwEBx62B9WseyOguFbV+CRSXXpH5cG65zK5ezp7R
         ReEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244904; x=1794849704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYatP+6kphd4sDxDGzxqCkF4Bitbwr9mDBucDIlhFks=;
        b=EFJ63B9wCk4RaVoiN6K/N5iAgJOY9qnzPBBEIacWLiIBc1EveISexMhMFYqImkwmSX
         uxQHITACVloouOwzvPQE/4aEkuhd4ACp+xG1++RaFNCiEJZZUnYPHk3lDyaEdTIi0wvv
         8bgiw3XkSjCzttqTFreJcmm2ciVtNH1tbPlepud3Je7JFWN9CHVz5ReA0XzezwnyeM24
         +UseSN/3VCpBwDF2CWUqnDXtsrUmYOrnYb6NPygBJNSmz+w9gVo196m6W+yj0Ewqit06
         C8uKqFMvJopEqq1VEg8gzGkvpLCV8lrfcH1iQnDgVunmTk7nYJBRc9RXHAmhOV4idIRu
         X4zw==
X-Forwarded-Encrypted: i=1; AL+hErHQEjJcZNAVuX+75lprpuTEE6LLr7ANKiwjI6/mNbMrB9pdkG5tWKOAuOsXnZ/+wlP1xSYIatYEDzu7Fg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ydHC/GwAcB3iKw052Lbrxn9BkRX4em5djESl0a8oYCFY1tIQW
	I2Tsr3jXHfvwjed3jkOZzrMTozH2+fZuBACUmR66IqemwdXlkW1Rdq80
X-Gm-Gg: AYBFou3nl0AAYZ0JDt37U1Odxms0vSxv38aYeEeQJWYvbMbj2TX7LurzjKFjp8A0ETf
	YZUw6IRWSW/lVhcRLxx2MIaxREWcyfamwiS/FAbF8duUjeIPY7fgEjb78gyC3nzJFDrRYpXHnFl
	vTlFlYW3fPknCLhmUMB7leyGDmlU+P99aXfTbdaoicgR+TTU9FlPgnpvGur/BsPtBKHrNuaLYri
	twOGGBhoyxOukmmMr04WG4BR/20B9gxxbm0TWqkouk4Ai6FNp8gAdPBAIkL4KLL24y+ZQCldlD+
	2SuP13RwVdbdkmI+dWenuekkHAJr1AofKwoZ2T4sIC7yARkzdxilxkwYl579XOw2Ly0iYIQBsZt
	DoWmhxXwnk1kuMJ6c0kHJrK1ePsbF+T7/YUXywau7rDeM93/sFH5mfZeW3g27c/SGedLqJWfxK9
	RPKIHH/dTPJX7rL9wTxJSUOLhT99y3pPwJZUyQcah5U6uTUPGNLBbLbl14qfKuOTTCrYg3wkPdS
	l5nTZp7IPxjCrb++hhTA8bRPlhgmXsW0a3ChSxfcwWr0vbk33IGoEHufohH/qaI2Uc/9dNmoVIY
	dI2xe1Yrg7uv0LnSlkJQFhg7XdWz8ajJ0/KbWhL62funbw2t
X-Received: by 2002:a05:693c:87c9:10b0:369:ef92:bd7b with SMTP id 5a478bee46e88-37257c94c98mr8368198eec.41.1794244904244;
        Mon, 09 Nov 2026 09:21:44 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db8bbsm13069322eec.22.2026.11.09.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:21:43 -0800 (PST)
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
Subject: [PATCH] ASoC: rt5668: cancel jack detect work on removal to avoid use-after-free
Date: Tue, 10 Nov 2026 02:21:34 +0900
Message-ID: <20261109172134.1850973-1-hj351016@gmail.com>
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

rt5668_jack_detect_handler() runs from the delayed work jack_detect_work,
which is queued from the jack IRQ handler rt5668_irq() and from
rt5668_set_jack_detect(), and re-arms itself while a button is held. The
handler and the delayed work jd_check_work dereference the driver data
via container_of().

struct rt5668_priv and the jack IRQ are both allocated with devm against
the i2c device. The i2c driver has no .remove callback, and the component
.remove and the .shutdown callback only reset the chip; neither disables
the IRQ nor cancels the delayed work. On unbind devres frees the IRQ and
rt5668_priv while jack_detect_work (or jd_check_work) can still be queued,
so the pending work then runs against freed memory (use-after-free).

Disable the IRQ and cancel both delayed works before the chip reset, and
wire that teardown into a new i2c .remove callback so it runs on unbind,
mirroring the sibling rt5682 driver.

Found by static analysis and code review; not runtime-reproduced (needs
RT5668B hardware).

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/rt5668.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 0000000..0000000 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2566,9 +2566,19 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5668_priv *rt5668 = i2c_get_clientdata(client);

+	if (client->irq)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
+
 	rt5668_reset(rt5668->regmap);
 }

+static void rt5668_i2c_remove(struct i2c_client *client)
+{
+	rt5668_i2c_shutdown(client);
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id rt5668_of_match[] = {
 	{.compatible = "realtek,rt5668b"},
@@ -2592,6 +2602,7 @@ static struct i2c_driver rt5668_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(rt5668_acpi_match),
 	},
 	.probe = rt5668_i2c_probe,
+	.remove = rt5668_i2c_remove,
 	.shutdown = rt5668_i2c_shutdown,
 	.id_table = rt5668_i2c_id,
 };
--
2.43.0
