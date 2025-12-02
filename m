Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C03115BD
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678995; cv=none; b=EyBu3S2E3rrmVF57TxDpz2Xj0AfjkwMpjfAYWAfEIJLiYy9qYa5d5xlOvhhe0hh7cWlchIM3zRf224Qj1B94IwBMEB+LtIOLfVbykoQ8f0GkqrM/jJ11LtIh207mTYV43NiVAbm0MZ7J3JbSS+UfweJTOZywkDJvcK9pVZDdW0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678995; c=relaxed/simple;
	bh=ij9R11PyDi5QFI7rqK08JwGropXGV/n9W6IHY6U1Ewo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RqaNSiLx7k/YGDxQrniHZoajogZIOT9MzAUlo//SPKt6tq+32hidT7kBa0azkwbJaE5yPpo2Pg+pZAqt1EbpOsdjHDGfcIHccsApHd3tXhaYp9kk7sHonvu51pRVOA02bXSdO3wqv+ekyrCPnh6AIcMjMbQP4+a9NNJbhw/FqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AHBpO1b7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AHBpO1b7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7380f66a8bso824359766b.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678990; x=1765283790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YexG6idkXG8kHaXjEGXkuQmv9bZY6cfMxNi5jJLFw4s=;
        b=AHBpO1b7tSH14Jq32ASjcP5DLUhoWb1S6ePR4w/tOyZorhrmMf1or7rggPRpcK+4z4
         UzL3KHuA72v5enon4P6udniEj1iCxBzLCblD8L5/WH2vAW/4f0forrNTU9O4AXThgxKM
         Dm3eweVrvZRgMqg5mLk1Xz8LN/3JxpHCfyqY/SN0FFpPi4iqaas8f4mIoVaaQB/rgWq0
         WDGFSbPJGB6uEJHuTwPDlHozPI7/e2XBRSO7hMJEfMCZp9wJfPd9S1L8uHOJsZgmMUuz
         9I6ppkpMSzmAgmOZE3CxEOiR5jCttYo5jBqIlgEYMaBehQFI2/njbtCBTMwfR4Ot7GE+
         OMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678990; x=1765283790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YexG6idkXG8kHaXjEGXkuQmv9bZY6cfMxNi5jJLFw4s=;
        b=dL6SZdhggItqMRnbDp1Pv/G+2Q27WIwmXm2YMgt8W+rZb0n1W1vEjVDV+0+O8D7UrZ
         VFlwWZS+wlFQpF3qiPs1kiiCWqpAeifHQC+a3d6ow9Ji/wfNl69H1h3PJ3xV06a6VyhZ
         Cw+fhR89jkq7ojAq8KnuethBDVA7mi8MpDgQRHqpSegpnL/Un6JzuZ/YaxC1jS6EZZ+M
         WNmS/XcUI9bCeqzju4XTorKSG6hVO0/gtQiv8WSZBymfZp93XZMZ8ah365MSLFkCPbrU
         RYXhHuon350iEv+oN6sAmw9JAEsYh5rGPnhej2rI21/pvS8xPeaABTJX5pMKXuRT21wz
         zBTg==
X-Forwarded-Encrypted: i=1; AJvYcCWJFhffNZ6oudd08vMLHVD+7uG0iM5gBe09DDuEE7WRhCIz/0DdcGaUSJkaFJW85RLrvAYa8jX7vaCQNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEo+T1Pfa6Fi8dltqfB0wZHOkKgNFaaa90RPQ3wwsHEjlanJgr
	IFbb7XNelo4ZmXAKrbw2RmZWTdYsaowzQiIl2LOXtYkZkTRdfhbHkJ2sFCIV+WnlCoI=
X-Gm-Gg: ASbGncsSKqDER0aIngsgksK7eZMF/KuCXYu2+7XWL0cQnGc0H3PU+xHIBp82VkRhEyj
	/TZ7BxAo9fZydBx79/llO94UGJZl0k2ReY32mDmK+v5Hk2ri3agJ6ijcRoH88WL2GJkjgSrCCwn
	r229ttakLLaxcfpHcAfiWOF7VrNWuTCicZfFdql8P5dKYfRX8LM3nsljuzqvq9mSmM9dDxCSNwC
	SeVhnhJO1SOiP+Y2YaX4DcOh+6pxa2dgpu16t89PxNTMvVm/A+HjAJfKpFcxUjAlnf5PhdsBTf0
	JQmGWwGon/MRuQXn0pzLCI6t65kOR9pWCrFi8QqM6X07JY4+hgPB5/HPEchd/d/Cgf+vUn4wKRC
	KWLULZl8WV3MYsJgjIDmb0BEStFmny0ibJrXl6PeSWCkx9FC53M3NzytR2TyMGCHSPJORlKnXmv
	3dw0spid0Vf0P4mfm6nrp2pcT4Y3j0S3F5MWFFXqljFK3c6aWXPzlQHBNmQe+5OxDbLRXvPf4EY
	cs=
X-Google-Smtp-Source: AGHT+IE5L5RWEk4OjqW55V3cMlqNqFVNXxUwNR9WdThhGLi+K0YOgq8Pq+xucgx2j/bvMl4jcc2AOA==
X-Received: by 2002:a17:906:b10f:b0:b76:7e90:713f with SMTP id a640c23a62f3a-b767e907350mr3519081466b.10.1764678990600;
        Tue, 02 Dec 2025 04:36:30 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a3a4ebsm1504841666b.62.2025.12.02.04.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:30 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 6/9] ALSA: sb: Convert to snd_seq bus probe mechanism
Date: Tue,  2 Dec 2025 13:35:55 +0100
Message-ID:  <efb1cb525b27ca60b66c97206e8096be81ff33f0.1764677854.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ij9R11PyDi5QFI7rqK08JwGropXGV/n9W6IHY6U1Ewo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLt01FfaGnF8I1WxOcifcYyeGKb/w5OeaFG4fa WknMsyi+XqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7dNQAKCRCPgPtYfRL+ TnUcCAC52Z8pO6hTQs2o581K1lHG8AulMt1GpO6RSjeBj3nWz0HS2c4cII25LK6okWrpc8dCFjS 9C3EamqDr6fI/OrGiwPfRn8kDrAxEZzWE/lokQxuo5Ss9MZBAsQZHIGiGxJEC0z5u8TZpLJaG5d hnZYjLqxU+oTXwsDKMbCM2qfJJutEIKhixgwXlrrQ589W4Lh9bKpN+G9xxXsrry/OQZy0OdtFe6 gm5qZ+psYm3MsczX7MNyS4Ivpqoau4nRt12lsNaOFf2nGm9wvSDKix/MIOKXKA/CZ+vJCkROjeu WtyNtg9cAdc08QRozLWgsIPef0Q3TiUt/ZhpvI6RGhtVXyNA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/isa/sb/emu8000_synth.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/isa/sb/emu8000_synth.c b/sound/isa/sb/emu8000_synth.c
index 9bec85ec55b4..3414c6d0695f 100644
--- a/sound/isa/sb/emu8000_synth.c
+++ b/sound/isa/sb/emu8000_synth.c
@@ -21,9 +21,8 @@ MODULE_LICENSE("GPL");
 /*
  * create a new hardware dependent device for Emu8000
  */
-static int snd_emu8000_probe(struct device *_dev)
+static int snd_emu8000_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emu8000 *hw;
 	struct snd_emux *emu;
 
@@ -81,13 +80,12 @@ static int snd_emu8000_probe(struct device *_dev)
 /*
  * free all resources
  */
-static int snd_emu8000_remove(struct device *_dev)
+static void snd_emu8000_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emu8000 *hw;
 
 	if (dev->driver_data == NULL)
-		return 0; /* no synth was allocated actually */
+		return; /* no synth was allocated actually */
 
 	hw = dev->driver_data;
 	if (hw->pcm)
@@ -96,7 +94,6 @@ static int snd_emu8000_remove(struct device *_dev)
 	snd_util_memhdr_free(hw->memhdr);
 	hw->emu = NULL;
 	hw->memhdr = NULL;
-	return 0;
 }
 
 /*
@@ -104,10 +101,10 @@ static int snd_emu8000_remove(struct device *_dev)
  */
 
 static struct snd_seq_driver emu8000_driver = {
+	.probe = snd_emu8000_probe,
+	.remove = snd_emu8000_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_emu8000_probe,
-		.remove = snd_emu8000_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_EMU8000,
 	.argsize = sizeof(struct snd_emu8000 *),
-- 
2.47.3

