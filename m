Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013740;
	b=tw9ceKaNpiguPQP8HEeWQEDBXuHKJGyTVH6vXkOArJGi2nSvFnvw7vecV+vr7zKJcugl
	 2vAq33wefOxfccX4W+DBlM90jzHWc/IcEtuO4O14XvBb5Gxb211YKnw23/YclPfk19PV2
	 26h3Ci6Z9Y/AW1Y3PU/0RohqV8o7GZ9wo5nZnMyf9jcHuB7g5V1zC71maqaL0YeEqiUOZ
	 O50PuHgxNr8lLvJ6eo/+l1UeSBydSDxgXX12rtiNtLebxibf+Gv0/3N5F96dUExvzKF3s
	 r9YLml2E28UHPXTyHBhWr+eKheGAkgI5kuKZpAT5S/oim1P0cSJsg0qJuCq/72UgfAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CshcBQHuBaiwBblArFZhJHX0pEvJjKnI4lGTEeUq7uE=;
	b=mXdusRBAAvJiywaqQKlKhPlL6nQhL3lQOle1o3dFfuj/F3T8YJtdaeqAqMVulRLxkN1B
	 4l5va38LIO2f2p1BU9RO5dfo7/aV5iEiF82HMN3FW6vZnQxKB8hE2zMQFkiVTAqeHYTQW
	 joP76D4fDmRN4dLSBFUCkTqFuwDRQzjM8t32O3TT+DBuhQrKWvKUtPeC0t9m5nbR4vo37
	 oSLIL2OsmAu9EPpBUf72KW9bEgaxXsba2NbAn2FeKhwzTsiujjNC5Ph1d3inDD12ZppZB
	 fQDTS7UoBq96d+wyEWAk2UPAiizFCic+A6TiTpHOhLfgMQ215PINpYSr4ThjKFoDhXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFdenwJg;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ACF60A3827
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 11:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57ACF60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFdenwJg
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so12418645e9.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013739; x=1793618539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CshcBQHuBaiwBblArFZhJHX0pEvJjKnI4lGTEeUq7uE=;
        b=TFdenwJglwNv78LJK9io46mIH7dcJiPtAvl2c5mS+6t5BMhQWD+/S3rvX+JHd65u9U
         vvJjqUasRgLO1SpwM6/z6hp+r1JEwribYZ3Qp0tubHcS90ocoANwbjuynh0W+H5ph9uF
         cXVX7DPYaA0VmMkZHwiDqudBVhDOSRxbb5QH2VYsGD4WHCXuYkL3gPxO4VGpJtK0YMsZ
         XQmlXzoQBwTCGi47a0VdF4bFHmUFmyeri82JyCdSx8ts7TeDK85BEBSyjPlLXa25AG8Z
         G59qbHMMWgPMG9n0bzJSkC1kUgQDuMnPbnPRAADAlAPUOi4YzhCIiYZKBmzuLtrnqBIm
         ftkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013739; x=1793618539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CshcBQHuBaiwBblArFZhJHX0pEvJjKnI4lGTEeUq7uE=;
        b=uw+j8j4jBcPuDCk8QmbOhG4QHcZCZvLXA/hYGZWjwEdZmbB86d5EkzEShECMfhftpE
         /IlOHMnrTauz9T2ElzTOn4dSQdm/VIkXxQtobIkLzTwSdYWDckTTHHeT7XjZ6YCeXY9j
         4Mp8MwcYOCpMFhKXLywYYg/iG8gTzFuzmsNrPFLSRU8GC1gYu7s0AyTQZeJjAstKdgzg
         F95SfTF295pd8uY9el/wkyE+TMwqM7vtuYpiiHWQCzCnT5Xp/bVMNlpJTsNm44GWiVmF
         euvQpLw2Fc9KNJn7RfHYd/tikeLxkaC0vTvXV+IwJ2Lr/GUhxUvhDg/VAwscKRvaXPQ7
         0zZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwA5FtQQCWEcrlcrQ0EKMsEAzMKnHISY6tVqIqAw9u04RuDYPjsYdjVrwNJdtS3JSEQIaMGhZABJ5i0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLnbJkQnIvF12cm8sPSLJFn2HMI383S0eXomIB5rbSahcvTcVFy
	EWgLjbIT94ZW2IMKKAe85d5yWBlBEq90jqwMcm3TXzAm0iOZLo1IINmpwIkPcn8=
X-Gm-Gg: AYBFou0xFpTB/5TAxB5pcpbZIISDISHd6vVcOavtBN7P8qOUhkCicUMaXMJk4bp+7xH
	ttSrAaC7+7qZdk0aohg7oNQV3vHhluLsElqXXeJnpPK9Gtlx1+gCgmL0ZPZhoRAS0SG0l8+0CmC
	yTHhSWkZrTOFDGARliJMUswgbjV4Ew0Jw/6y9reAi33Ex7p5ga8sH49eAlHUxqzeMaQ48o/t+vu
	Ys/D9Wsf9fxs2j4p8pLhbKEeLYB4dqzg+mfdviPDPn0zMR1aMqfwBqBlMgQNBwy1cEvdZK/WqO5
	M20lfHnNGxQPzOvMe0TabdcxeLm1aCxqmPwsuFBL6f8aBh8/G1CfPIdkDuxk9LsbhS9ob4ZhfKo
	1oK1yO1i4GdYOPCOQQ2TM6Yf0DN8X2QMVsDVd7nEeA4DJ+sUoaI4KMazBtbLsiYUG0wcuoy69hA
	d43tw1SCyQLBBcguhNvE01y9odOnP2CY9ILTGfS0rgvSSNS/2zMgb/rjXWv4oFaK4UFf43Wm1sT
	IQCZiRsjxvd52IcrCi/MNOv
X-Received: by 2002:a05:600c:1c06:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4a35ac407fdmr160741305e9.2.1793013738712;
        Mon, 26 Oct 2026 04:22:18 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:18 -0700 (PDT)
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
Subject: [PATCH 4/4] ASoC: wm8994: drain all delayed works on component remove
Date: Mon, 26 Oct 2026 11:22:12 +0000
Message-ID: <20261026112212.2519775-5-tristmd@gmail.com>
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

wm8994_component_remove() frees IRQs and firmware but does not cancel
any of the delayed works that IRQ handlers and DAPM events schedule.
jackdet_bootstrap can spawn mic_work (via wm1811_jackdet_irq), and
wm8958_mic_irq can queue mic_complete_work, whose callback may in turn
queue open_circuit_work.  If any of these works are pending when the
component is unbound, they fire after DAPM widgets are freed.

After freeing all IRQ producers and before releasing firmware, drain
the full work graph in producer-to-child order: jackdet_bootstrap,
mic_complete_work, mic_work, then open_circuit_work.

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/wm8994.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8bf58a6a8af7c..32c1786bd48ef 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4592,6 +4592,10 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3

