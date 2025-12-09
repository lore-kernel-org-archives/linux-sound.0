Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833432E135
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283969; cv=none; b=WD7YXYNsj630qyNSTvkTXqVCyOYxKwEXxzAMlVhbZperHav8PpcLiQhH2sdro7uFA5sPi1+sJFHkoHm5JYWXd8hXL/MWdKck2NXQei6RJDWMydhDFgirGq/4k3LyuRcAcvIWmhRA1QHxFcBwpJ5qjqRIsSOsQn54YsyIm+5T5Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283969; c=relaxed/simple;
	bh=QkraC+X2lkgEkNGEqCKAQHtwicRn26DOvJpsHqN/dxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tsc6NRTQQus2phxn0/CRsbqKCzqHClneqgJFrL7jU4SyfZSGpXBvAmgX0KVN+DvmVaCiDx/QeU065riRLAB+59q15kF1iD9gdr59PVk2RmMBH7B4Bqo7hs5075GcFiT4Iw7LqkzivWiFhvEwfo6gU37MlL9qLR53bj5otl0ABA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LT8DzyK4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LT8DzyK4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so6785116a12.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283966; x=1765888766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byvv0Fx7WfAhzg766746uSMspl1k3/KkZki0PXNoFsI=;
        b=LT8DzyK4EdaQ1G1aeEuTSGNKxWRkTXTo2Fz5t9jFBbHQUF9xa4aoVoqJUimXRsmS8j
         adPv3+zhjZVKl/2yWbzxdgEJX/095EqJMaD2zuttsQqb52f2PtgS9J0Fn9Wm2UKwu+yR
         k+9sOTHAO8rnYXvO0AD6t0GF+a9GLppo26rvgW2a9z357tnepUfh3myvLu8VNhkeMng2
         24Zcq4ZhMTguL4oOzYY5LY/0vpVfCeAvYSLs6+FzxLWsGlSYg429sYVhw8chBWSSSXNV
         SiZ2UvyVGKWfn+Wi5IW0HTvHtzMQdpZ/NoOrGRpPnSH+aRWKW34vvEkPdgqOTvIxtWVN
         XRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283966; x=1765888766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byvv0Fx7WfAhzg766746uSMspl1k3/KkZki0PXNoFsI=;
        b=ALdyz2gxFZXXIIUNbuTVNqs/7CWfxiKc/ffuQX5XrvoIw0TWXZM4mMBgh4+G5e15To
         2xJnBywdrRiafR32GcUnw/Y4rbxSQ8J5cR02sG3LCPDQ4aBUnUUI3fAdJq/uSgpotv67
         agvlsA6fBhnT68f8Wvv3tJF40NcohHOuSlio2PiERayuMvYACh08ASYjyhzAwcJP26AR
         cI6YSiSz1eRmZfDR17PRW91Wc/5qzVh6RFpnW4Qwpycq2O5VBiGCEyMU9TLTr/Nir9Xu
         R5o4fN3fO1+UCZNVSWkfoXhB9zhnfhySg1sMdymgApcHcXzZ0QjOE8W4d2rtt1RhUFdi
         LPuA==
X-Forwarded-Encrypted: i=1; AJvYcCX7BgZjEqJuFJv5YKFOC5H+MUw4Z3w0jhFG+Q8+QDnEuLG/RiBqYt/P7I/kDbyYXjphCR+nKiPxa/Vfrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nMtrYT0/M1pZYhD6AM2I4x70rPw6qoohkpPL+A6fk+ZrITig
	HqZeAIbOf6i3q5hsw3vJEFbRvYsIqQ4LkTB7y69Qeyn+8yMTXWKJ3sLx5VYYvattCqo=
X-Gm-Gg: ASbGncvDUnCPgpWTCrRJa3DlbbDSBbfrN5Zr/U1/TX9n+OhWCEoO3TVhemwQc5MaSYw
	/e0FUyg6OVPykR9xWTHN5dzcRLJ9Cx/Eak/IHlY6Vds7LLa0Kmr+p3l7bf4bWkwKxz2X/TkROPN
	nfQEl609sPysPEDIgujm/R60Z3D8nJbdWxcugErtoGsTlmO+7H4aqwaNccYKCH9M/zrdC8W4Jr6
	gicgGTSDj3C6rt47qN0zOYqc040i6UHbX0SP5XeuABRSVYgoYxKr5dnxUBEfPnDmozT6wghPaAX
	tfiyc84nF1Xsmc71Ar33MC6J8iUoNp+eSf8Yxj8c25K+SyBZcUDgYDEsyEVppa+793joOlBxlHG
	J/6cAIx9gupPxNkNsDGMFOJJdIFP4LffLXIjb0L4U0IInPNHsYsvt6RjGnosiLdaULr10Hejiy0
	PoD/mwy+eJneElA5Icd3uyjvUnJLS7i1ancBhwMmNiAe6dgVHcmLh3HNmihrNHFbK/m2c29gwKy
	84=
X-Google-Smtp-Source: AGHT+IFg84m3Fws3O4a+im1Pf7WGeEJkm8tMrDCtFwR7jxf+beYhedRIjaqPIUJn34du8XJHi/EgtA==
X-Received: by 2002:a05:6402:5354:10b0:649:62e1:10ca with SMTP id 4fb4d7f45d1cf-64962e11b87mr1108554a12.27.1765283966141;
        Tue, 09 Dec 2025 04:39:26 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-647b368dc2asm13233180a12.20.2025.12.09.04.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:25 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 4/9] ALSA: opl3: Convert to snd_seq bus probe mechanism
Date: Tue,  9 Dec 2025 13:38:46 +0100
Message-ID:  <fb5e44d995cf93b8feae22c4558598859712bc07.1765283601.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
References: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=QkraC+X2lkgEkNGEqCKAQHtwicRn26DOvJpsHqN/dxE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhfgYyLIHQ7/c62Eqzg2jwZhv+bgNTXUTf5Z U6Nyped25uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYXwAKCRCPgPtYfRL+ TrqXB/4qQleag7LdJyTM3tEhjJK2/R4jUkNwN0YjTZRB3GRYyWMg9LM/84KqQIQx+/ynu/65i9D qX4ROCuUs7Q0TLZG+uuty4QeJ7tM5srqEGl7f1DcaofTdNvBc7fhSj4ER8U7lSdZLW0RLPxnhrJ yDDzfmIxoxEpVfpRI4SDG0TcJple8/G8iDC94REnf83Rlx6M1FsWZY4STOZxUPO3Qaj2/tHrbxN 8xnWGFvSpG8gz0YOZQeYGSYrjemTZLdI4gy+uIbIHGL3MddqWftHYlSAZNRHU6wX28EEdjgjKUR +60hZLPcNOv5fDp9njbW+tOVIWNnpK5AkABEB2kpDJBVbCqC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Note that the remove callback returns void now. The actual return value
was ignored before (see device_remove() in drivers/base/dd.c), so there
is no problem introduced by converting `return -EINVAL` to `return`.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/drivers/opl3/opl3_seq.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index d3278428d360..b77d8e8f12fb 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -201,9 +201,8 @@ static int snd_opl3_synth_create_port(struct snd_opl3 * opl3)
 
 /* ------------------------------ */
 
-static int snd_opl3_seq_probe(struct device *_dev)
+static int snd_opl3_seq_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_opl3 *opl3;
 	int client, err;
 	char name[32];
@@ -244,14 +243,13 @@ static int snd_opl3_seq_probe(struct device *_dev)
 	return 0;
 }
 
-static int snd_opl3_seq_remove(struct device *_dev)
+static void snd_opl3_seq_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_opl3 *opl3;
 
 	opl3 = *(struct snd_opl3 **)SNDRV_SEQ_DEVICE_ARGPTR(dev);
 	if (opl3 == NULL)
-		return -EINVAL;
+		return;
 
 #if IS_ENABLED(CONFIG_SND_SEQUENCER_OSS)
 	snd_opl3_free_seq_oss(opl3);
@@ -260,14 +258,13 @@ static int snd_opl3_seq_remove(struct device *_dev)
 		snd_seq_delete_kernel_client(opl3->seq_client);
 		opl3->seq_client = -1;
 	}
-	return 0;
 }
 
 static struct snd_seq_driver opl3_seq_driver = {
+	.probe = snd_opl3_seq_probe,
+	.remove = snd_opl3_seq_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_opl3_seq_probe,
-		.remove = snd_opl3_seq_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_OPL3,
 	.argsize = sizeof(struct snd_opl3 *),
-- 
2.47.3

